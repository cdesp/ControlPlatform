unit unHelpForms;

interface
uses Vcl.Forms,Vcl.ExtCtrls,Vcl.StdCtrls,Vcl.Buttons,System.SysUtils, Vcl.TabNotBk,
     Vcl.dialogs,Vcl.Samples.Spin,unDevices;

Type
  TDefDevForm = class(TForm)
  private

    class constructor Create;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    function getmainpath: string;


  protected
    Param1SE:TSpinEdit;
    Param2SE:TSpinEdit;
    Param3SE:TSpinEdit;
    Param4SE:TSpinEdit;
    Param5SE:TSpinEdit;
    Param6SE:TSpinEdit;
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
    procedure SetSEfromParam(Pno: integer; SE: TSpinedit);
    Procedure SetParam(Pno:integer;SE:TSpinedit);
    Function ActDev:TActiveDevice;
    procedure NewMaxPins;
    property AppPath:string read getmainpath;
  end;



implementation
uses unCtrlPlatMain,Messages;


{ TDefDevForm }

procedure TDefDevForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   KillDevice;

end;


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
  OnCloseQuery:=FormCloseQuery;
  Param1SE:=nil;
  Param2SE:=nil;
  Param3SE:=nil;
  Param4SE:=nil;
  Param5SE:=nil;
  Param6SE:=nil;
end;

procedure TDefDevForm.DoShow;
begin
  inherited;
  SetSEfromParam(1,Param1SE);
  SetSEfromParam(2,Param2SE);
  SetSEfromParam(3,Param3SE);
  SetSEfromParam(4,Param4SE);
  SetSEfromParam(5,Param5SE);
  SetSEfromParam(6,Param6SE);
  RefreshBlockControls;
end;

function TDefDevForm.GetDeviceTypeId: Integer;
begin
 Result:=ActDev.DeviceTypeID;
end;

function TDefDevForm.getmainpath: string;
begin
 result:=mainpath;
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
   try
    Parent:=frmRoboLang;
   except

   end;
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

procedure TDefDevForm.NewMaxPins;
begin
  if assigned(param1SE) then
   TSpinEdit(Param1Se).MaxValue:=Arduino.MaxPins;
  if assigned(param2SE) then
   TSpinEdit(Param2Se).MaxValue:=Arduino.MaxPins;
  if assigned(param3SE) then
   TSpinEdit(Param3Se).MaxValue:=Arduino.MaxPins;
  if assigned(param4SE) then
   TSpinEdit(Param4Se).MaxValue:=Arduino.MaxPins;
  if assigned(param5SE) then
   TSpinEdit(Param5Se).MaxValue:=Arduino.MaxPins;
  if assigned(param6SE) then
   TSpinEdit(Param6Se).MaxValue:=Arduino.MaxPins;

end;

procedure TDefDevForm.SetParam(Pno: integer; SE: TSpinedit);
begin
  ActDevs[ActiveDeviceId].ActDevParams[Pno-1]:=Se.Value;
  RefreshBlockControls;
end;

procedure TDefDevForm.SetSEfromParam(Pno: integer; SE: TSpinedit);
Begin
   if assigned(SE) then
   Begin
     Se.Value:=ActDevs[ActiveDeviceId].ActDevParams[Pno-1];
     Se.EditorEnabled:=true;
   End;
End;

end.
