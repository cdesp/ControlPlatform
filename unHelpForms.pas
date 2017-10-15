unit unHelpForms;

interface
uses Vcl.Forms,Vcl.ExtCtrls,Vcl.StdCtrls,Vcl.Buttons,System.SysUtils, Vcl.TabNotBk,
     Vcl.dialogs,Vcl.Samples.Spin,unDevices;

Type
  TDefDevForm = class(TForm)
  private
    procedure SetSEfromParam(Pno: integer; SE: TSpinedit);
    class constructor Create;


  protected
    Param1SE:TSpinEdit;
    Param2SE:TSpinEdit;
    Param3SE:TSpinEdit;
    Param4SE:TSpinEdit;
    procedure DoCreate; Override;
    procedure DoShow; Override;
  public
    { Public declarations }
    ActiveDeviceId:Integer;
    procedure RefreshBlockControls;
    Function GetDeviceTypeId:Integer;
    Function LblC:TLabel;
    Function btnC:TBitBtn;
    Procedure KillDevice;
    Procedure SetParam(Pno:integer;SE:TSpinedit);
    Function ActDev:TActiveDevice;
  end;



implementation
uses unCtrlPlatMain,Messages;


{ TDefDevForm }

function TDefDevForm.ActDev: TActiveDevice;
begin
   Result:=ActDevs[ActiveDeviceId];
end;

function TDefDevForm.btnC: TBitBtn;
begin
 Result:= TBitBtn(frmRoboLang.getPanelAddButton(ArduinoDevices[GetDeviceTypeId].DevicePanel));
end;

class constructor TDefDevForm.Create;
begin
  inherited;

end;

procedure TDefDevForm.DoCreate;
begin
  inherited;
  Param1SE:=nil;
  Param2SE:=nil;
  Param3SE:=nil;
  Param4SE:=nil;
end;

procedure TDefDevForm.DoShow;
begin
  inherited;
  SetSEfromParam(0,Param1SE);
  SetSEfromParam(0,Param2SE);
  SetSEfromParam(0,Param3SE);
  SetSEfromParam(0,Param4SE);
  RefreshBlockControls;
end;

function TDefDevForm.GetDeviceTypeId: Integer;
begin
 Result:=ActDev.DeviceTypeID;
end;

procedure TDefDevForm.KillDevice;
Var lbl:TLabel;
    pi:Integer;
Begin
//   lbl:=frmRoboLang.getPanelCountLabel(ArduinoDevices[GetDeviceTypeId].DevicePanel);
//   Sender:=frmRoboLang.getPanelAddButton(ArduinoDevices[GetDeviceTypeId].DevicePanel);
   btnC.Tag:=  btnC.Tag-1;
   btnC.Enabled:= btnC.tag<ArduinoDevices[GetDeviceTypeId].DeviceMax;
   lblC.Caption:=inttostr( btnC.Tag);
   if btnC.tag=0 then
    frmRoboLang.CommandsByType(GetDeviceTypeId,False);
   visible:=false;
   Parent:=frmRoboLang;
   application.processmessages;
   //tabpage must not be active or it crashes when you delete it BUG???
   pi:=frmRoboLang.DevBook.PageIndex;
   frmRoboLang.DevBook.PageIndex:=0;
   application.processmessages;
   frmRoboLang.DevBook.Pages.Delete(pi);
   frmRoboLang.DevBook.PageIndex:=frmRoboLang.DevBook.Pages.Count-1;

   DeleteActiveDevice(ActiveDeviceId);
   RefreshBlockControls;
end;

Procedure TDefDevForm.RefreshBlockControls;
var
 Msg: TMessage;
 i:Integer;
begin
   Msg.Msg := WM_REFRESH_MSG;
   Msg.WParam := GetDeviceTypeId;
   Msg.LParam := ActiveDeviceId;
   Msg.Result := 0;

   for i := 0 to frmRoboLang.ScrollBox1.ControlCount-1 do
   try
     frmRoboLang.ScrollBox1.Controls[i].Perform(msg.Msg,msg.WParam,msg.LParam)
   Except

   end;
//   frmRoboLang.Broadcast(Msg);
End;

function TDefDevForm.LblC: TLabel;
begin
  Result:=frmRoboLang.getPanelCountLabel(ArduinoDevices[GetDeviceTypeId].DevicePanel);
end;

procedure TDefDevForm.SetParam(Pno: integer; SE: TSpinedit);
begin
  ActDevs[ActiveDeviceId].ActDevParams[Pno]:=Se.Value;
  RefreshBlockControls;
end;

procedure TDefDevForm.SetSEfromParam(Pno: integer; SE: TSpinedit);
Begin
   if assigned(SE) then
     Se.Value:=ActDevs[ActiveDeviceId].ActDevParams[Pno];
End;

end.
