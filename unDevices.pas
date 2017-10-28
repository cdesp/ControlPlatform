unit unDevices;

interface
uses Vcl.Forms,Vcl.ExtCtrls,Vcl.Buttons;

Type

  TDeviceTypes=(LCD,LASER,SOUND,USONIC,SERVO,SWITCH,TEMP);

  TDevice=record
    DeviceName:String;
    DeviceFormClass:TFormClass;
    DevicePanel:TPanel;
    DeviceCmdId:Integer;
    DeviceParamCount:Integer;
    DeviceMax:Integer;
  end;

  TArduino=record
      Id:integer;
      MaxPins:Integer;
  end;

  TActiveDevice=Record
    DeviceTypeID:Integer; //IDX from TDevices
    ActDevForm:TForm;
    ActDevParams:array[0..4] of integer;
    ActDevParamCount:Integer;
  End;

  TDevices=array[0..20] of TDevice; //Up to 20  Devices
  TActiveDevices=array[0..50] of TActiveDevice;

var ArduinoDevices:TDevices;
    ActDevs:TActiveDevices;
    ActDevsCount:Integer=-1;
    Arduino:TArduino;

Procedure SaveActiveDevices(nm:String);
Procedure LoadActiveDevices(nm:String);
procedure ClearActiveDevices;
Procedure DeleteActiveDevice(ActDevId:integer);

implementation
uses sysutils,classes,inifiles,unCtrlPlatMain,unHelpForms;

Procedure DeleteActiveDevice(ActDevId:integer);
Var i,j:Integer;
Begin
   if ActDevId=-1 then exit;

   for I := ActDevId+1 to ActDevsCount do
   Begin
     ActDevs[i-1].DeviceTypeID:=ActDevs[i].DeviceTypeID;
     ActDevs[i-1].ActDevForm:=ActDevs[i].ActDevForm;
     for j := 0 to 4 do
       ActDevs[i-1].ActDevParams[j]:=ActDevs[i].ActDevParams[j];
     ActDevs[i-1].ActDevParamCount:=ActDevs[i].ActDevParamCount;
   End;
   ActDevsCount:=ActDevsCount-1;
End;


Procedure SaveActiveDevices(nm:String);
Var Newnm:String;
    inif:TIniFile;
    i,j:Integer;
Begin
  Newnm:=ChangeFileExt(nm,'.adv');
  inif:=TIniFile.create(Newnm);
  try
    inif.WriteInteger('ArduinoDevice','TypeId',Arduino.ID);
    inif.WriteInteger('ActiveDevices','Count',ActDevsCount);
    for i := 0 to ActDevsCount do
    Begin
      inif.WriteInteger('ADev_'+inttostr(i),'DeviceTypeID',ActDevs[i].DeviceTypeID);
      inif.WriteInteger('ADev_'+inttostr(i),'ActDevParamCount',ActDevs[i].ActDevParamCount);
      for j := 0 to 4 do
        inif.WriteInteger('ADev_'+inttostr(i),'ActDevParam'+inttostr(J+1),ActDevs[i].ActDevParams[j]);
    End;
  finally
    inif.Free;
  end;
End;

Procedure ClearActiveDevices;
Var i,j:integer;
Begin
    for i := ActDevsCount downto 0 do
    Begin
       TDefDevForm(ActDevs[i].ActDevForm).KillDevice;
       ActDevs[i].DeviceTypeID:=0;
       ActDevs[i].ActDevParamCount:=0;
       for j := 0 to 4 do
         ActDevs[i].ActDevParams[j]:=0;
       ActDevs[i].ActDevForm:=nil;
    End;

    ActDevsCount:=-1;
End;

function getPanelFromDeviceTypeId(DevTypeid:Integer):TPanel;
var i:Integer;
    p:TPanel;
Begin
  p:=nil;
  for i:=0 to frmRoboLang.ScrollBox2.ControlCount-1 do
   if frmRoboLang.ScrollBox2.Controls[i] is TPanel then
   Begin
    p:=frmRoboLang.ScrollBox2.Controls[i] as TPanel;
    if p.Tag=DevTypeid then Break
    else p:=nil;
   End;

   result:=p;
End;

Procedure LoadActiveDevices(nm:String);
Var Newnm:String;
    inif:TIniFile;
    i,j:Integer;
    p:TPanel;
    b:TBitBtn;
    Adevcnt:Integer;
Begin
  ClearActiveDevices;
  Newnm:=ChangeFileExt(nm,'.adv');
  inif:=TIniFile.create(Newnm);
  try
    Arduino.ID:=inif.ReadInteger('ArduinoDevice','TypeId',0);
    //Set Arduino  type
    frmRoboLang.RadioGroup1.ItemIndex:=Arduino.ID;
    frmRoboLang.RadioGroup1Click(frmRoboLang.RadioGroup1);
    Adevcnt:=inif.ReadInteger('ActiveDevices','Count',-1);  //ActDevsCount it will increase when we add a page form
    for i := 0 to Adevcnt do
    Begin
      ActDevs[i].DeviceTypeID:=inif.ReadInteger('ADev_'+inttostr(i),'DeviceTypeID',-1);
      ActDevs[i].ActDevParamCount:=inif.ReadInteger('ADev_'+inttostr(i),'ActDevParamCount',0);
      for j := 0 to 4 do
        ActDevs[i].ActDevParams[j]:=inif.ReadInteger('ADev_'+inttostr(i),'ActDevParam'+inttostr(J+1),0);
      //Create Page
      p:=getPanelFromDeviceTypeId(ActDevs[i].DeviceTypeID);
      if p<>nil then
      Begin
        b:=frmRoboLang.getPanelAddButton(p);
        b.Click; //Add a new page increase ActDevsCount
      End;
    End;
  finally
    inif.Free;
  end;
End;


end.
