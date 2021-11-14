class TopMenu{
	panel: Panel;
	switchButton: ImagePanel;

	constructor(panel: Panel){
		this.panel = panel.FindChild("ButtonsBar") as Panel;
		this.switchButton = this.panel.FindChild("SaveLoadButton") as ImagePanel;

		//this.switchButton.SetImage("file://{images}/custom_game/saveLogo.png")
		this.switchButton.SetPanelEvent("onactivate",  () => {
            loadSaveMenu.SwitchVisibility();
        });
	}
}

let topMenu = new TopMenu($.GetContextPanel());