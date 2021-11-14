"use strict";
class ReincarnationMenu {
    constructor(panel) {
        this.panel = panel;
        this.reincarnationMenu = this.panel.FindChild("ReincarnationMenu");
        this.reincarnationButton = $("#ReincarnationButton");
        this.reincarnationCloseButton = $("#ReincarnationCloseButton");
        this.reincarnateButton = $("#Reincarnate");
        this.reincarnateButton.enabled = false;
        this.sceneButton = [];
        this.scenePanel = [];
        this.BindEvents();
        this.SwitchVisible();
    }
    BindEvents() {
        this.reincarnationButton.SetPanelEvent("onactivate", () => {
            this.SwitchVisible();
        });
        this.reincarnationCloseButton.SetPanelEvent("onactivate", () => {
            this.SwitchVisible();
        });
        this.reincarnateButton.SetPanelEvent("onactivate", () => {
            this.SendReincarnateRequest();
            this.DeactivateReincarnation();
        });
    }
    SendReincarnateRequest() {
        let context = this;
        context.sceneButton.forEach(function (checkedButton, index, array) {
            if (checkedButton && checkedButton.checked) {
                var heroScene = $("#DotaScenePanel" + (index + 1));
                var heroName = heroScene.GetAttributeString("hero", "none");
                var playerID = Game.GetLocalPlayerID();
                if (heroName !== "none") {
                    GameEvents.SendCustomGameEventToServer("reincarnate", { "newHero": heroName, "playerID": playerID });
                    context.SwitchVisible();
                }
            }
        });
    }
    ActivateReincarnation() {
        this.SwitchVisible();
        this.reincarnateButton.enabled = true;
    }
    DeactivateReincarnation() {
        this.reincarnateButton.enabled = false;
    }
    SwitchVisible() {
        if (this.reincarnationMenu.visible) {
            this.reincarnationMenu.visible = false;
        }
        else {
            this.reincarnationMenu.visible = true;
        }
    }
    WipePortraits() {
        this.scenePanel.forEach(function (dotaScenePanel, index, array) {
            if (dotaScenePanel !== null) {
                var portraitScene = dotaScenePanel.GetParent();
                //var portraitScene = $("#PortraitContainer" + index);
                //heroScene.visibility = "collapse";
                //heroScene.enabled = false;
                portraitScene.RemoveAndDeleteChildren();
                for (var i = 1; i < 4; i++) {
                    var sceneContainer = $("#PortraitContainer" + i);
                    sceneContainer.visible = false;
                }
            }
        });
    }
    DrawPortraits(heroTable) {
        //heroList.forEach((heroName: String) => {$.Msg(heroName)});
        this.WipePortraits();
        this.sceneButton = [];
        this.scenePanel = [];
        for (var index in heroTable) {
            var hero = heroTable[index];
            var heroName = hero["heroName"];
            var heroAttribute = hero["heroAttribute"];
            //var camera = heroName + "_camera";
            //var light = heroName + "_light";
            //var style = "width:600px;height:600px;";
            //var properties = {
            //    style: style,
            //    map: 'reincarnation_scene',
            //    particleonly: 'false',
            //    light: light,
            //    camera: camera,
            //    hittest: false,
            //}
            //var root = $("#ReincarnationMenu");
            var sceneContainer = $("#PortraitContainer" + index);
            sceneContainer.visible = true;
            //var sceneContainer = $.CreatePanelWithProperties("Panel", root, "PortraitContainer" + index, {class: "PortraitContainer"});
            //var radioButton = $.CreatePanelWithProperties("RadioButton", sceneContainer, "PortraitButton" + index, {class: "PortraitButton", group:"PortraitButton", id:"PortraitButton3"});
            //var heroScene = $.CreatePanelWithProperties("DOTAScenePanel", sceneContainer, "DotaScenePanel" + index, properties);
            //heroScene.SetAttributeString("hero", heroName);
            var scene = new ReincarnationHeropanel(sceneContainer, heroName, heroAttribute);
            var radioButton = scene.getSelectButton();
            var heroScene = scene.getHeroScene();
            var heroAbilities = hero["heroAbilities"];
            for (var index in heroAbilities) {
                var ability = heroAbilities[index];
                var abilityName = ability["AbilityName"];
                scene.addHeroAbility(abilityName, ability);
            }
            this.sceneButton.push(radioButton);
            this.scenePanel.push(heroScene);
        }
    }
}
class ReincarnationHeropanel {
    constructor(rootContainer, heroName, heroAttribute) {
        this.abilityStyles = [
            "",
            "width:64px;height:64px;margin-left:10px;margin-top:500px;",
            "width:64px;height:64px;margin-left:90px;margin-top:500px;",
            "width:64px;height:64px;margin-left:170px;margin-top:500px;",
            "width:64px;height:64px;margin-left:250px;margin-top:500px;",
            "width:64px;height:64px;margin-left:330px;margin-top:500px;",
        ];
        this.abilityIndex = 1;
        this.rootContainer = rootContainer;
        this.heroName = heroName;
        var camera = heroName + "_camera";
        var light = heroName + "_light";
        var style = "width:600px;height:600px;";
        var properties = {
            style: style,
            map: 'reincarnation_scene',
            particleonly: 'false',
            light: light,
            camera: camera,
            hittest: false,
        };
        var heroAttributeIcon = "";
        if (heroAttribute == "DOTA_ATTRIBUTE_AGILITY") {
            heroAttributeIcon = "file://{images}/custom_game/attributeAgi.png";
        }
        this.heroSelectButton = $.CreatePanelWithProperties("RadioButton", this.rootContainer, "PortraitButton" + ReincarnationHeropanel.index, { class: "PortraitButton", group: "PortraitButton", id: "PortraitButton3" });
        this.heroScene = $.CreatePanelWithProperties("DOTAScenePanel", rootContainer, "DotaScenePanel" + ReincarnationHeropanel.index, properties);
        this.heroScene.SetAttributeString("hero", heroName);
        this.heroAttribute = $.CreatePanelWithProperties("Image", this.rootContainer, "AttributeImage" + ReincarnationHeropanel.index, { class: "AttributeImage" });
        this.heroAttribute.SetImage(heroAttributeIcon);
        ReincarnationHeropanel.index += 1;
    }
    getSelectButton() {
        return this.heroSelectButton;
    }
    getHeroScene() {
        return this.heroScene;
    }
    addHeroAbility(abilityName, ability) {
        var style = this.abilityStyles[this.abilityIndex];
        var abilityImage = $.CreatePanelWithProperties("DOTAAbilityImage", this.rootContainer, "Ability" + ReincarnationHeropanel.index + "Image" + this.abilityIndex, { class: "AbilityImage", style: style });
        abilityImage.abilityname = abilityName;
        this.abilityIndex += 1;
        abilityImage.SetPanelEvent("onmouseover", function () {
            ShowTooltip(abilityImage, ability["AbilityName"]);
        });
        abilityImage.SetPanelEvent("onmouseout", function () {
            HideTooltip(abilityImage);
        });
        //$.CreatePanelWithProperties("Panel", root, "PortraitContainer" + index, {class: "PortraitContainer"});
    }
}
ReincarnationHeropanel.index = 1;
function ShowTooltip(panel, abilityName) {
    //$.DispatchEvent("UIShowCustomLayoutTooltip", panel, "Info", "file://{resources}/layout/custom_game/abilTooltip.xml");
    $.DispatchEvent("DOTAShowAbilityTooltip", panel, abilityName);
    //$.DispatchEvent("DOTAShowAbilityTooltip", "paladin_holy_buff");
    //$.DispatchEvent("TooltipUpdateInfo", panel, "123");
}
function HideTooltip(panel) {
    $.DispatchEvent("DOTAHideAbilityTooltip");
}
let reincarnationMenu = new ReincarnationMenu($.GetContextPanel());
let context = reincarnationMenu;
var loadPortraits = function (heroTable) {
    reincarnationMenu.DrawPortraits(heroTable);
};
loadPortraits.bind(context);
var activateReincarnation = function () {
    reincarnationMenu.ActivateReincarnation();
};
activateReincarnation.bind(context);
GameEvents.Subscribe("load_reincarnation_portraits", loadPortraits);
GameEvents.Subscribe("activate_reincarnation_menu", activateReincarnation);
