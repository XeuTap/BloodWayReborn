"use strict";
class LoadSaveMenu {
    constructor(panel) {
        this.panel = panel.FindChild("SaveLoadMenu");
        this.panel.visible = false;
        this.topBar = this.panel.FindChild("TopBar");
        this.saveButton = this.panel.FindChild("SaveButton");
        this.loadButton = this.panel.FindChild("LoadButton");
        this.closeButton = this.topBar.FindChild("CloseButton");
        this.BindEvents();
    }
    SwitchVisibility() {
        if (this.panel.visible) {
            this.panel.visible = false;
        }
        else {
            this.panel.visible = true;
        }
    }
    BindEvents() {
        //let playerID:never
        let playerID;
        this.closeButton.SetPanelEvent("onactivate", () => {
            this.SwitchVisibility();
        });
        this.saveButton.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("on_save_request", playerID);
            this.SwitchVisibility();
        });
        this.loadButton.SetPanelEvent("onactivate", () => {
            GameEvents.SendCustomGameEventToServer("on_load_request", playerID);
            this.SwitchVisibility();
            this.loadButton.enabled = false;
        });
    }
}
let loadSaveMenu = new LoadSaveMenu($.GetContextPanel());
