class AbilityTooltip{
    private abilityName: LabelPanel;
    private typeField: LabelPanel;
    private worksOnField: LabelPanel;
    private damageTypeField: LabelPanel;
    private piercesMagicImmunityField: LabelPanel;
    private purgeableField: LabelPanel;
    private descriptionField: LabelPanel;
    private specialFields: LabelPanel[];
    private CDField: LabelPanel;
    private MCField: LabelPanel;
    constructor(root: Panel){
        this.abilityName = $("#title") as LabelPanel;
        this.typeField = $("#TypeField") as LabelPanel;
        //this.worksOnField = root.FindChild("#WorksOnField") as LabelPanel;
        this.worksOnField = $("#WorksOnField") as LabelPanel;
        this.damageTypeField = $("#damageTypeField") as LabelPanel;
        this.piercesMagicImmunityField = $("#piercesMagicImmunityField") as LabelPanel;
        this.purgeableField = $("#purgeableField") as LabelPanel;
        this.descriptionField = $("#description") as LabelPanel;
        this.CDField = $("#CDField") as LabelPanel;
        this.MCField = $("#MCField") as LabelPanel;
        this.specialFields = [];
    }

    updateAbilityInfo(data: any) {
        $.Msg(data);
        this.abilityName.text = data['abilityName'];
        this.typeField.text = data['abilityBehavior'];

    }
}
let tooltip = new AbilityTooltip($.GetContextPanel());

function tooltipSetup(){
    var params:any = {};
    params["abilityName"] = $.GetContextPanel().GetAttributeString( "abilityName", "" );
    params["playerID"] = Players.GetLocalPlayer()

    //GameEvents.SendCustomGameEventToServer("show_ability_stats", params as never);
}

function updateAbilityInfo(data:any){
    tooltip.updateAbilityInfo(data);
}

//GameEvents.Subscribe("load_ability_stats", updateAbilityInfo)
