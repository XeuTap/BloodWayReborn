class LoadSaveMenu{
    private panel: Panel;
    private topBar: Panel;
    private saveButton: TextButton;
    private loadButton: TextButton;
    private closeButton: ImagePanel;

    constructor(panel: Panel) {
        this.panel = panel.FindChild("SaveLoadMenu") as Panel;
        this.panel.visible = false;
        this.topBar = this.panel.FindChild("TopBar") as Panel;
        this.saveButton = this.panel.FindChild("SaveButton") as TextButton;
        this.loadButton = this.panel.FindChild("LoadButton") as TextButton;
        this.closeButton = this.topBar.FindChild("CloseButton") as ImagePanel;

        this.BindEvents();
    }

    public SwitchVisibility(){
        if(this.panel.visible) {
            this.panel.visible = false;
        }
        else {
            this.panel.visible = true;
        }
    }

    private BindEvents()
    {
        //let playerID:never
        let playerID : never;

        this.closeButton.SetPanelEvent("onactivate",  () => {
            this.SwitchVisibility();
        });

        this.saveButton.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("on_save_request", playerID);
            this.SwitchVisibility();
        })

        this.loadButton.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("on_load_request", playerID);
            this.SwitchVisibility();
            this.loadButton.enabled = false;
        })
    }
}

let loadSaveMenu = new LoadSaveMenu($.GetContextPanel());