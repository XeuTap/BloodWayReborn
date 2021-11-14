class ReincarnationMenu {
    private panel: Panel;
    private reincarnationMenu: Panel;
    private reincarnationButton: TextButton;
    private reincarnationCloseButton: TextButton;
    private reincarnateButton: TextButton;
    private sceneButton: Array<RadioButton>;
    private scenePanel: Array<any>;

    constructor(panel: Panel){
        this.panel = panel;
        this.reincarnationMenu = this.panel.FindChild("ReincarnationMenu") as Panel;
        this.reincarnationButton = $("#ReincarnationButton") as TextButton;
        this.reincarnationCloseButton = $("#ReincarnationCloseButton") as TextButton;
        this.reincarnateButton = $("#Reincarnate") as TextButton;
        this.reincarnateButton.enabled = false;
        this.sceneButton = [];
        this.scenePanel = [];


        this.BindEvents();
        this.SwitchVisible();
    }

    private BindEvents()
    {
        this.reincarnationButton.SetPanelEvent("onactivate", () => {
            this.SwitchVisible();
        })
        this.reincarnationCloseButton.SetPanelEvent("onactivate", () => {
            this.SwitchVisible();
        })
        this.reincarnateButton.SetPanelEvent("onactivate", () => {
            this.SendReincarnateRequest();
            this.DeactivateReincarnation();
        })


    }

    private SendReincarnateRequest()
    {       
        let context = this;
        context.sceneButton.forEach(function(checkedButton, index, array) {
            if (checkedButton && checkedButton.checked) {
                var heroScene = $("#DotaScenePanel" + (index+1));
                var heroName = heroScene.GetAttributeString("hero", "none");
                var playerID = Game.GetLocalPlayerID();
                if (heroName !== "none") {
                    GameEvents.SendCustomGameEventToServer("reincarnate", {"newHero" : heroName, "playerID" : playerID} as never);
                    context.SwitchVisible();
                }
            }
        })
    }

    public ActivateReincarnation()
    {   
        this.SwitchVisible();
        this.reincarnateButton.enabled = true;
    }

    private DeactivateReincarnation()
    {
        this.reincarnateButton.enabled = false;
    }

    private SwitchVisible()
    {
        if(this.reincarnationMenu.visible){
            this.reincarnationMenu.visible = false;
        }
        else {
            this.reincarnationMenu.visible = true;
        }
    }

    private WipePortraits(){
        this.scenePanel.forEach(function(dotaScenePanel, index, array) {
            if (dotaScenePanel !== null)
            {   
                var portraitScene = dotaScenePanel.GetParent()
                //var portraitScene = $("#PortraitContainer" + index);
                //heroScene.visibility = "collapse";
                //heroScene.enabled = false;
                portraitScene.RemoveAndDeleteChildren()
                for (var i = 1; i < 4; i++) {
                    var sceneContainer = $("#PortraitContainer" + i);
                    sceneContainer.visible = false;
                }

            }
        })
    }

    public DrawPortraits(heroTable: any){
        //heroList.forEach((heroName: String) => {$.Msg(heroName)});
        this.WipePortraits();
        this.sceneButton = [];
        this.scenePanel = [];
        for (var index in heroTable) {
            var hero = heroTable[index]
            var heroName = hero["heroName"];
            var heroAttribute = hero["heroAttribute"];
            var sceneContainer = $("#PortraitContainer" + index);
            sceneContainer.visible = true;
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
    static index = 1;
    private heroName: string;
    private rootContainer: Panel;
    private heroScene: Panel;
    private heroSelectButton: RadioButton;
    private abilityIndex: number;
    private abilityStyles: any[];
    private heroAttribute: ImagePanel;
    constructor(rootContainer: Panel, heroName: string, heroAttribute: string) {
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
        }
        var heroAttributeIcon = "";
        if (heroAttribute == "DOTA_ATTRIBUTE_AGILITY") {
            heroAttributeIcon = "file://{images}/custom_game/attributeAgi.png";
        }

        this.heroSelectButton = $.CreatePanelWithProperties("RadioButton", this.rootContainer, "PortraitButton" + ReincarnationHeropanel.index, {class: "PortraitButton", group:"PortraitButton", id:"PortraitButton3"});
        this.heroScene = $.CreatePanelWithProperties("DOTAScenePanel", rootContainer, "DotaScenePanel" + ReincarnationHeropanel.index, properties);
        this.heroScene.SetAttributeString("hero", heroName);
        this.heroAttribute = $.CreatePanelWithProperties("Image", this.rootContainer, "AttributeImage" + ReincarnationHeropanel.index, { class: "AttributeImage" }) as ImagePanel;
        this.heroAttribute.SetImage(heroAttributeIcon);

        ReincarnationHeropanel.index += 1;
    }

    getSelectButton() {
        return this.heroSelectButton;
    }

    getHeroScene() {
        return this.heroScene;
    }
    
    addHeroAbility(abilityName: string, ability : any) {
        var style = this.abilityStyles[this.abilityIndex];
        var abilityImage = $.CreatePanelWithProperties("DOTAAbilityImage", this.rootContainer, "Ability" + ReincarnationHeropanel.index + "Image" + this.abilityIndex, {class: "AbilityImage", style: style});
        abilityImage.abilityname = abilityName;
        this.abilityIndex += 1;

        abilityImage.SetPanelEvent("onmouseover", function() {
            ShowTooltip(abilityImage, ability["AbilityName"]);
        })
        abilityImage.SetPanelEvent("onmouseout", function () {
            HideTooltip(abilityImage);
        })

        //$.CreatePanelWithProperties("Panel", root, "PortraitContainer" + index, {class: "PortraitContainer"});
    }

}

function ShowTooltip(panel:Panel, abilityName:any)
{   
    //$.DispatchEvent("UIShowCustomLayoutTooltip", panel, "Info", "file://{resources}/layout/custom_game/abilTooltip.xml");
    $.DispatchEvent("DOTAShowAbilityTooltip", panel,  abilityName );
    //$.DispatchEvent("DOTAShowAbilityTooltip", "paladin_holy_buff");
    //$.DispatchEvent("TooltipUpdateInfo", panel, "123");
}

function HideTooltip(panel: Panel)
{
    $.DispatchEvent("DOTAHideAbilityTooltip");
}

let reincarnationMenu = new ReincarnationMenu($.GetContextPanel());

let context = reincarnationMenu;


var loadPortraits = function(heroTable:object) {
    reincarnationMenu.DrawPortraits(heroTable);
};

loadPortraits.bind(context);

var activateReincarnation = function() {
    reincarnationMenu.ActivateReincarnation();
}

activateReincarnation.bind(context);

GameEvents.Subscribe( "load_reincarnation_portraits", loadPortraits );

GameEvents.Subscribe( "activate_reincarnation_menu", activateReincarnation );