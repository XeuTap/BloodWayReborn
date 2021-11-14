"use strict";
class AbilityTooltip {
    constructor(root) {
        this.abilityName = $("#title");
        this.typeField = $("#TypeField");
        //this.worksOnField = root.FindChild("#WorksOnField") as LabelPanel;
        this.worksOnField = $("#WorksOnField");
        this.damageTypeField = $("#damageTypeField");
        this.piercesMagicImmunityField = $("#piercesMagicImmunityField");
        this.purgeableField = $("#purgeableField");
        this.descriptionField = $("#description");
        this.CDField = $("#CDField");
        this.MCField = $("#MCField");
        this.specialFields = [];
    }
    updateAbilityInfo(data) {
        $.Msg(data);
        this.abilityName.text = data['abilityName'];
        this.typeField.text = data['abilityBehavior'];
    }
}
let tooltip = new AbilityTooltip($.GetContextPanel());
function tooltipSetup() {
    var params = {};
    params["abilityName"] = $.GetContextPanel().GetAttributeString("abilityName", "");
    params["playerID"] = Players.GetLocalPlayer();
    //GameEvents.SendCustomGameEventToServer("show_ability_stats", params as never);
}
function updateAbilityInfo(data) {
    tooltip.updateAbilityInfo(data);
}
//GameEvents.Subscribe("load_ability_stats", updateAbilityInfo)
