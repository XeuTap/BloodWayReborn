"use strict";
class TopMenu {
    constructor(panel) {
        this.panel = panel.FindChild("ButtonsBar");
        this.switchButton = this.panel.FindChild("SaveLoadButton");
        //this.switchButton.SetImage("file://{images}/custom_game/saveLogo.png")
        this.switchButton.SetPanelEvent("onactivate", () => {
            loadSaveMenu.SwitchVisibility();
        });
    }
}
let topMenu = new TopMenu($.GetContextPanel());
