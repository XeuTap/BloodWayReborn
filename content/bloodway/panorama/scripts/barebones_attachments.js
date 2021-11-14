class AttachmentPanel{
  constructor(pan){
    this.lastMousePos = GameUI.GetCursorPosition();

    this.lastUnit = null;
    this.activated = false;
    this.showing = false;
    this.pmscale = 1;
    this.IsMouseControlledAngles = false;
    this.IsMouseControlledOffsets = false;
    this.lastMousePos;
    this.mouseUpdateInterval = 2.0;
    this.g_MouseYaw = 0;

    this.panel = $("#AttachmentsPanel");
    this.attachmentsHeader = $("#AttachmentsHeader");
    this.cosmeticsPanel = $("#CosmeticsPanel");
    this.attachmentsHeader.toDragId = "AttachmentsPanel";
    this.cosmeticsHeader = $("#CosmeticsHeader");
    this.cosmeticsHeader.toDragId = "CosmeticsPanel";
    this.attachCheckbox = $("#AttachCheckbox");
    this.attachCheckbox.checked = true; 
    this.sphereCheckbox = $("#SphereCheckbox");
    this.sphereCheckbox.checked = true;
    var rootPanel = $.GetContextPanel();
    var barPanel = rootPanel.FindChild("#PopupPanel");

    this.panel.visible = false;
    this.cosmeticsPanel.visible = false;
    //var startButton = barPanel.FindChild("#PlayButton");
//  
    //startButton.SetPanelEvent("onactivate", () => {
    //  ActivateAttachmentConfiguration();
    //});

    GameEvents.Subscribe( "activate_attachment_configuration", this.ActivateAttachmentConfiguration );
    
    //$.Msg(panel.firstLoadDone);
    this.BindEvents();
    if (this.panel.firstLoadDone)
      return;
    this.panel.firstLoadDone = true;

    var options = [.1,.5,1,5,10,25]; 
    var dropdown = $("#PlusMinusScale");
    for (var i=0; i<options.length; i++){ 
    var label = $.CreatePanel('Label', dropdown, 'DD' + i);
    label.text = options[i];
      dropdown.AddOption(label); 
    } 

    dropdown.SetSelected("DD2");

    options = [2, 5, 10, 15, 20, 25, 30]; 
    dropdown = $("#MouseUpdateScale");
    for (var i=0; i<options.length; i++){ 
      var label = $.CreatePanel('Label', dropdown, 'mDD' + i);
      label.text = Math.ceil(options[i] * 100) / 100;
      dropdown.AddOption(label); 
    } 

    dropdown.SetSelected("mDD3");

    $.RegisterEventHandler( 'DragStart', this.attachmentsHeader, this.OnDragStart );
    $.RegisterEventHandler( 'DragEnd', this.attachmentsHeader, this.OnDragEnd );

    $.RegisterEventHandler( 'DragStart', this.cosmeticsHeader, this.OnDragStart );
    $.RegisterEventHandler( 'DragEnd', this.cosmeticsHeader, this.OnDragEnd );

}

BindEvents(){
  $.Msg("Binding Events");
  var freezeButton = $("#Freeze");

  freezeButton.SetPanelEvent("onactivate", () => {
    this.Freeze();
  });
  var attachCheckbox = $("#AttachCheckbox");

  attachCheckbox.SetPanelEvent("onactivate", () => {
    this.AttachCheckbox();
  });
  var sphereCheckbox = $("#SphereCheckbox");

  sphereCheckbox.SetPanelEvent("onactivate", () => {
    this.SphereCheckbox();
  });

  var topCamera = $("#Top");

  topCamera.SetPanelEvent("onactivate", () => {
    this.TopCamera();
  });

  var sideXCamera = $("#SideX");

  sideXCamera.SetPanelEvent("onactivate", () => {
    this.SideXCamera();
  });

  var sideYCamera = $("#SideY");

  sideYCamera.SetPanelEvent("onactivate", () => {
    this.SideYCamera();
  });

  var normalCamera = $("#Normal");

  normalCamera.SetPanelEvent("onactivate", () => {
    this.NormalCamera();
  });


  var attach = $("#Attach");

  attach.SetPanelEvent("onblur", () => {
    this.UpdateAttachment();
  });
  attach.SetPanelEvent("oninputsubmit", () => {
    this.UpdateAttachment();
  });

  var model = $("#Model");

  model.SetPanelEvent("onblur", () => {
    this.UpdateAttachment();
  });
  model.SetPanelEvent("oninputsubmit", () => {
    this.UpdateAttachment();
  });

  var scale = $("#Scale");

  scale.SetPanelEvent("onblur", () => {
    this.UpdateAttachment();
  });
  scale.SetPanelEvent("oninputsubmit", () => {
    this.UpdateAttachment();
  });

  var splashButtonPlus = $("#SplashButtonPlus");

  splashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange(scale, 0.1);
  });

  var splashButtonMinus = $("#SplashButtonMinus");

  splashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange(scale, -0.1);
  });

  var xPosSplashButtonPlus = $("#XPosSplashButtonPlus");

  xPosSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#XPos"), 1);
  });

  var xPosSplashButtonMinus = $("#XPosSplashButtonMinus");
  xPosSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#XPos"), -1);
  });

  var yPosSplashButtonPlus = $("#YPosSplashButtonPlus");
  yPosSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#YPos"), 1);
  });

  var yPosSplashButtonMinus = $("#YPosSplashButtonMinus");
  yPosSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#YPos"), -1);
  });

  var zPosSplashButtonPlus = $("#ZPosSplashButtonPlus");
  zPosSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#ZPos"), 1);
  });

  var zPosSplashButtonMinus = $("#ZPosSplashButtonMinus");
  zPosSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#ZPos"), -1);
  });

  var pitchSplashButtonPlus = $("#PitchSplashButtonPlus");
  pitchSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Pitch"), 1);
  });

  var pitchSplashButtonMinus = $("#PitchSplashButtonMinus");
  pitchSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Pitch"), -1);
  });

  var yawSplashButtonPlus = $("#YawSplashButtonPlus");
  yawSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Yaw"), 1);
  });

  var yawSplashButtonMinus = $("#YawSplashButtonMinus");
  yawSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Yaw"), -1);
  });

  var rollSplashButtonPlus = $("#RollSplashButtonPlus");
  rollSplashButtonPlus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Roll"), 1);
  });

  var rollSplashButtonMinus = $("#RollSplashButtonMinus");
  rollSplashButtonMinus.SetPanelEvent("onactivate", () => {
    this.ValueChange($("#Roll"), -1);
  });

  var load = $("#Load");
  load.SetPanelEvent("onactivate", () => {
    this.Load();
  });

  var hide = $("#Hide");
  hide.SetPanelEvent("onactivate", () => {
    this.Hide();
  });

  var save = $("#Save");
  save.SetPanelEvent("onactivate", () => {
    this.Save();
  });


}

OnDragStart( panel, dragCallbacks )
{
  var toDragId = panel.toDragId;

  //$.Msg('OnDragStart -- ', toDragId, ' -- ', panelId, ' -- ', dragCallbacks);
  // hook up the display panel, and specify the panel offset from the cursor
  /*$.Msg('#' + panelId);
  var p = $('#' + panelId);
  $.Msg(p);
  $.Msg($.GetContextPanel());

  if (panel === null && $('#' + panelId))
    panel = $('#' + panelId); */

  panel = $('#' + toDragId);

  dragCallbacks.displayPanel = panel;//panel;

  var cursor = GameUI.GetCursorPosition();

  dragCallbacks.offsetX = cursor[0] - panel.actualxoffset;//250;
  dragCallbacks.offsetY = cursor[1] - panel.actualyoffset;//20;
  dragCallbacks.removePositionBeforeDrop = false;
  return false;
} 

OnDragEnd( panel, draggedPanel )
{
  //$.Msg('OnDragEnd -- ', panelId, ' -- ', draggedPanel);
  draggedPanel.SetParent($.GetContextPanel());
  return false;
}

ValueChange(panel, amount)
{
  //$.Msg(panel)
  var defText = panel.GetChild(0);
  if (defText !== null && defText !== undefined){
    defText = defText.text;
    defText = parseFloat(defText);
  }
  else{
    defText = 0.0;
  }

  var text = panel.text;
  if (text === "")
    text = defText;
  else
    text = parseFloat(text);

  if (text === NaN)
    text = defText;

  text += amount * this.pmscale;
  if (panel.id == "Scale")
    panel.text = text.toFixed(2);
  else
    panel.text = text.toFixed(1);

  this.UpdateAttachment();
}

GetAttachmentTable()
{
  var table = {};
  table['model'] = $('#Model').text;
  table['attach'] =$('#Attach').text;
  table['scale'] = parseFloat($('#Scale').text) || 1.0;
  table['pitch'] = parseFloat($('#Pitch').text) || 0.0;
  table['yaw'] =   parseFloat($('#Yaw').text) || 0.0;
  table['roll'] =  parseFloat($('#Roll').text) || 0.0;
  table['XPos'] =  parseFloat($('#XPos').text) || 0.0;
  table['YPos'] =  parseFloat($('#YPos').text) || 0.0;
  table['ZPos'] =  parseFloat($('#ZPos').text) || 0.0;

  return table;
}

UpdateAttachment(a)
{
  //$.Msg("UpdateAttachment ");
  var table = this.GetAttachmentTable();

  GameEvents.SendCustomGameEventToServer( "Attachment_UpdateAttach", {index: this.lastUnit, properties:table} );
  
}

Freeze()
{
  //$.Msg("Freeze");

  var panel = $('#Freeze');
  var label = panel.GetChild(0);
  var text = label.text;
  if (text === "Freeze")
  {
    label.text = "Unfreeze";
    label.style.color = "#ffaaaa";
    GameEvents.SendCustomGameEventToServer( "Attachment_Freeze", {index: this.lastUnit, freeze:true} );
  }
  else
  {
    label.text = "Freeze";
    label.style.color = "#aaaaff";
    GameEvents.SendCustomGameEventToServer( "Attachment_Freeze", {index: this.lastUnit, freeze:false} )
  }
}

Save()
{
  var table = this.GetAttachmentTable();
  GameEvents.SendCustomGameEventToServer( "Attachment_SaveAttach", {index: this.lastUnit, properties:table} )
}

Load()
{
  var table = this.GetAttachmentTable();
  GameEvents.SendCustomGameEventToServer( "Attachment_LoadAttach", {index: this.lastUnit, properties:table} )
}

Hide()
{
  var table = this.GetAttachmentTable();
  GameEvents.SendCustomGameEventToServer( "Attachment_HideAttach", {index: this.lastUnit, properties:table} )
}

AttachCheckbox()
{
  var panel = $('#AttachCheckbox');
  var table = this.GetAttachmentTable();
  GameEvents.SendCustomGameEventToServer( "Attachment_DoAttach", {index: this.lastUnit, properties:table, doAttach: panel.checked} )
}

SphereCheckbox()
{
  var panel = $('#SphereCheckbox');
  var table = this.GetAttachmentTable();
  GameEvents.SendCustomGameEventToServer( "Attachment_DoSphere", {index: this.lastUnit, properties:table, doSphere: panel.checked} )
}

HideCosmetics()
{
  var panel = $('#CosmeticsPanel');
  if (panel.visible)
    panel.visible = false;
  else
    panel.visible = true;
}

CloseCosmetics()
{
  var panel = $('#CosmeticsPanel');
  panel.visible = false;
}

TopCamera()
{
  GameUI.SetCameraPitchMax( 90 );
  GameUI.SetCameraPitchMin( 90 );
  GameUI.SetCameraYaw( 0 );
}

SideXCamera()
{
  GameUI.SetCameraPitchMax( 1 );
  GameUI.SetCameraPitchMin( 1 );
  GameUI.SetCameraYaw( 0 );
}

SideYCamera()
{
  GameUI.SetCameraPitchMax( 1 );
  GameUI.SetCameraPitchMin( 1 );
  GameUI.SetCameraYaw( 90 );
}

NormalCamera()
{
  GameUI.SetCameraPitchMax( 60 );
  GameUI.SetCameraPitchMin( 38 );
  GameUI.SetCameraYaw( 0 );
}

SelectUnitUpdated()
{
  //$.Msg('SelectUnitUpdated ', lastUnit, ' -- ', Players.GetLocalPlayerPortraitUnit());

  var newUnit = Players.GetLocalPlayerPortraitUnit();
  if (newUnit !== this.lastUnit)
  {
    $.Msg("new");
    GameEvents.SendCustomGameEventToServer( "Attachment_UpdateUnit", {index: newUnit} );
  } 

  this.lastUnit = newUnit;
}

PlusMinusScale()
{
  $.Msg("PlusMinusScale");
  var dropdown = $("#PlusMinusScale");
  this.pmscale = parseFloat(dropdown.GetSelected().text);
}

CosmeticListUpdated(msg)
{
  //$.Msg("CosmeticListUpdated ", msg);

  // Remove old children
  var panel = $('#CosmeticsBody');
  for (var i=0;i<panel.GetChildCount(); i++){
    var lastPanel = panel.GetChild(i);
    lastPanel.DeleteAsync(0);
  }

  for (var key in msg){
    var row = $.CreatePanel('Panel', panel, '');
    row.AddClass('CosmeticRow');

    var label = $.CreatePanel('Label', row, '');
    label.AddClass('CosmeticLabel');
    label.text = msg[key];

    var button = $.CreatePanel('Button', row, '');
    button.AddClass('CosmeticButton');
    button.AddClass('SplashButton');
    button.SetPanelEvent('onactivate', (function(model){
      return function(){
        GameEvents.SendCustomGameEventToServer( "Attachment_HideCosmetic", {index: lastUnit, model: model} );
      };
    })(msg[key]));

    var buttonLabel = $.CreatePanel('Label', button, '');
    buttonLabel.text = "Toggle";
  }
  
}

UpdateFields(msg)
{
  //$.Msg("UpdateFields ", msg);

  $('#Model').text = msg['model'] || "";
  $('#Attach').text = msg['attach'] || "";
  $('#Scale').text = msg['scale'].toFixed(2);
  $('#Pitch').text = msg['pitch'].toFixed(1);//table['pitch'] = parseFloat($('#Pitch').text) || 0.0;
  $('#Yaw').text = msg['yaw'].toFixed(1);//table['yaw'] =   parseFloat($('#Yaw').text) || 0.0;
  $('#Roll').text = msg['roll'].toFixed(1);//table['roll'] =  parseFloat($('#Roll').text) || 0.0;
  $('#XPos').text = msg['XPos'].toFixed(1);//table['XPos'] =  parseFloat($('#XPos').text) || 0.0;
  $('#YPos').text = msg['YPos'].toFixed(1);//table['YPos'] =  parseFloat($('#YPos').text) || 0.0;
  $('#ZPos').text = msg['ZPos'].toFixed(1);//table['ZPos'] =  parseFloat($('#ZPos').text) || 0.0;

  attachmentPanel.UpdateAttachment();
}

ActivateAttachmentConfiguration(msg)
{
  if (attachmentPanel.showing){
    attachmentPanel.attachmentsHeader.visible = false;
    attachmentPanel.cosmeticsHeader.visible = false;
    attachmentPanel.showing = false;
    attachmentPanel.panel.visible = false;
    attachmentPanel.cosmeticsPanel.visible = false;
  }
  else{
    if (!attachmentPanel.activated){
      GameEvents.Subscribe( "dota_player_update_selected_unit", attachmentPanel.SelectUnitUpdated );

      GameEvents.Subscribe( "attachment_cosmetic_list", attachmentPanel.CosmeticListUpdated );
      GameEvents.Subscribe( "attachment_update_fields", attachmentPanel.UpdateFields ); 
      //GameUI.SetMouseCallback(HandleMouseEvent);

      attachmentPanel.activated = true; 
    }

    attachmentPanel.lastUnit = Players.GetLocalPlayerPortraitUnit();
    var plusMinusScale = $("#PlusMinusScale");
    plusMinusScale.SetSelected($("#DD2"));
    if (attachmentPanel.lastUnit){
      GameEvents.SendCustomGameEventToServer( "Attachment_UpdateUnit", {index: attachmentPanel.lastUnit} );
    }
    attachmentPanel.panel.visible = true;
    attachmentPanel.attachmentsHeader.visible = true;
    attachmentPanel.cosmeticsHeader.visible = true;
    attachmentPanel.cosmeticsPanel.visible = true;
    attachmentPanel.showing = true;
  } 
}

MouseControlAngles()
{
  if(IsMouseControlledAngles == false) {
    IsMouseControlledAngles = true;
    MouseControlAnglesLoop();
  }
  else {
    IsMouseControlledAngles = false;
  }
}

MouseControlOffsets()
{
  if(IsMouseControlledOffsets == false) {
    IsMouseControlledOffsets = true;
    MouseControlOffsetsLoop();
  }
  else {
    IsMouseControlledOffsets = false;
  }
}

MouseControlAnglesLoop()
{
  var mousePos = GameUI.GetCursorPosition();
  var difX = lastMousePos[0] - mousePos[0];
  var difY = lastMousePos[1] - mousePos[1];
  
  if(GameUI.IsMouseDown(0) == false) {
    var yaw = MouseCalc($('#Yaw'), difX, this.pmscale/8);
    var pitch = MouseCalc($('#Pitch'), difY, this.pmscale/8);
    var roll = MouseCalc($("#Roll"), g_MouseYaw, this.pmscale*10);

    $("#Yaw").text = yaw;
    $("#Pitch").text = pitch;
    $("#Roll").text = roll;
    UpdateAttachment();
  }

  g_MouseYaw = 0;
  lastMousePos = mousePos;
  if(IsMouseControlledAngles == true) {
    $.Schedule(1.0/mouseUpdateInterval, MouseControlAnglesLoop);
  }
}

MouseCalc(panel, dif, scale)
{
  var num = parseFloat(panel.text);
  if(isNaN(num)) {
    panel.text = num.toString();
    num = 0;
  }
  var angle = num + (scale * dif);
  angle = Math.round(angle * 100) / 100;
  return angle.toString();
}

MouseControlOffsetsLoop()
{
  var mousePos = GameUI.GetCursorPosition();
  var difX = mousePos[0] - lastMousePos[0];
  var difY = lastMousePos[1] - mousePos[1];
  
  if(GameUI.IsMouseDown(0) == false) {
    var x = MouseCalc($('#XPos'), difX, this.pmscale/8);
    var y = MouseCalc($('#YPos'), difY, this.pmscale/8);
    var z = MouseCalc($("#ZPos"), g_MouseYaw, this.pmscale*10);
    
    $('#XPos').text = x.toString();
    $('#YPos').text = y.toString();
    $('#ZPos').text = z.toString();
    
    if(IsMouseControlledAngles == false)
    {
      this.UpdateAttachment();
    }
  }
  
  if(IsMouseControlledAngles == false) {
    lastMousePos = mousePos;
    g_MouseYaw = 0;
  }
  if(IsMouseControlledOffsets == true)
  {
    $.Schedule(1.0/mouseUpdateInterval, MouseControlOffsetsLoop);
  }
}

MouseUpdateScale()
{
  var dropdown = $("#MouseUpdateScale");
  mouseUpdateInterval = parseFloat(dropdown.GetSelected().text);
}

ShowMouseHelpTooltip()
{
  $.DispatchEvent("DOTAShowTextTooltip", "Holding the left mouse button down disables updating. Scale affects the rate at which items are oriented or moved. Vertical mouse movement affects the Y offset and pitch. Horizontal mouse movement affects the  X offset and yaw. Mouse wheel movement affects the Z offset and roll.");
}

HideMouseHelpTooltip()
{
  $.DispatchEvent("DOTAHideTextTooltip");
}


HandleMouseEvent(eventName, arg)
{
  if ( eventName === "wheeled" ) {
    g_MouseYaw += arg * this.pmscale;
    if(IsMouseControlledAngles == true || IsMouseControlledOffsets == true) {
      return true;
    }
  }
  return false;
}

}

let attachmentPanel = new AttachmentPanel($.GetContextPanel());