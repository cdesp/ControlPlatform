unit unBlock;

interface
uses

  Vcl.ExtCtrls,Vcl.Controls,System.Classes,Winapi.Windows,Winapi.Messages,Vcl.Graphics,Vcl.StdCtrls,
  Vcl.ComCtrls;

const WM_REFRESH_MSG = WM_USER + 1;

Type

  TPointArray= array of TPoint;

 TDspBlock=Class(TCustomControl)
  private
    loading:boolean;
    enblColor:TColor;
    cancelMouseDn:boolean;
    a: TPointArray;
    borderUp:TPointArray;
    borderDn:TPointArray;
    fLinkTo:TDspBlock;
    sameattach:boolean;
    FtopNose: boolean;
    FBorderColor: TColor;
    Fparam1question: String;
    FId: integer;
    FTotalParams: integer;
    Fparam1prompt: string;
    FLinkFrom: TDspBlock;
    FCommandColor: TColor;
    FbotNose: boolean;
    Fparam2question: String;
    Fparam2prompt: string;
    FMyhint: string;
    Fprototype: boolean;
    FDeviceOnlyCommandID: integer;
    FVarParam1: TDspBlock;
    FVarParam2: TDspBlock;
    FParam1Attaching: Boolean;
    FParam2Attaching: Boolean;
    FArduCmd:String;
    FArduCheck:String;
    procedure CalcArea;
    function InCircle(p, Cp: Tpoint): boolean;
    procedure MakeBorderDn;
    procedure MakeBorderUp;
    procedure makenose(var a: TPointArray; nx, ny: integer; isUP: boolean=True);
    procedure ConnectBorders;
    function getFirstBlock: TDspBlock;
    procedure SettopNose(const Value: boolean);
    procedure SetBorderColor(const Value: TColor);
    procedure SetCommandColor(const Value: TColor);
    procedure SetId(const Value: integer);
    procedure SetLinkFrom(const Value: TDspBlock);
    procedure Setparam1prompt(const Value: string);
    procedure Setparam1question(const Value: String);
    procedure SetbotNose(const Value: boolean);
    procedure SetLinkFromName(const Value: String);
    procedure SetLinkToName(const Value: String);
    function GetLinkFromName: String;
    function GetLinkToName: String;
    procedure requestParam1;
    procedure requestParam2;
    procedure Setparam2prompt(const Value: string);
    procedure Setparam2question(const Value: String);
    procedure SetMyhint(const Value: string);
    function getFixedCommandText: String;
    function getParentControl: TWincontrol;
    function IndexInOwner(VControl: Tcontrol): integer;
    procedure SetParamStr(const Value: string);
    function getParamStrControl(x, y: integer): integer;
    procedure SetDeviceOnlyCommandID(const Value: integer);
    function IsParamDev: Boolean;
    procedure SetParamD(const Value: String);
    procedure SetComboBoxValue;
    procedure OnRefreshRequest(var Msg: TMessage); message WM_REFRESH_MSG;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure SetPDevice(const Value: Integer);
    function getParamDControl(x, y: integer): integer;
    procedure ComboChange(Sender: TObject);
    function GetVarParam1Name: String;
    procedure SetVarParam1(const Value: TDspBlock);
    procedure SetVarParam1Name(const Value: String);
    procedure SetParam1Attaching(const Value: Boolean);
    procedure SubFromRect(Var R:tRect;n: Integer);
    function GetVarParam2Name: String;
    procedure SetVarParam2(const Value: TDspBlock);
    procedure SetVarParam2Name(const Value: String);
    procedure SetParam2Attaching(const Value: Boolean);
    procedure PaintChildren;
    procedure InformClientControls;
    function getDeviceParam(pn: integer): Integer;

  protected
    FCommandText:String;
    move:boolean;
    P1:TPoint;
    lnw:integer; //border line width
    nospadUp,nospadDn:Integer;
    nosw,nosh:Integer;
    fNewlyCreated:boolean;
    ActivePointUp:TPoint;
    ActivePointDn:TPoint;
    CtrltoAttach:TDspBlock;
    FCtrlAttachUp:boolean;
    FCtrlAttachDn:boolean;
    Param1toAttach:TDspBlock;
    Param2toAttach:TDspBlock;
    ctrl1:TWinControl;
    ctrl2:TWinControl;
    ctrlS:TWinControl;
    ctrlD:TWinControl;
    fArduinoCommand:String;
   // updn1:tupdown;
   // updn2:tupdown;
    procedure setfParam1(const Value: Integer);virtual;
    procedure setfParam2(const Value: Integer);virtual;
    function getParam1Text: String;virtual;
    procedure CheckAttach;virtual;
    procedure Setprototype(const Value: boolean);Virtual;
    procedure SetParent(AParent: TWinControl); override;
    procedure CreateCtrl1;virtual;
    procedure CreateCtrl2;virtual;
    procedure CreateCtrlS;virtual;
    procedure CreateCtrlD;virtual;
    function getParam1Control(x, y: integer): integer;virtual;
    function getParam2Control(x, y: integer): integer;virtual;
    procedure edit2Change(Sender: TObject);virtual;
    procedure edit1Change(Sender: TObject);virtual;
    procedure edit3Change(Sender: TObject);virtual;
    procedure setCommandStyle;
    procedure SetTotalParams(const Value: integer);virtual;
    procedure paintCmd;  Virtual;
    procedure PaintAttach;Virtual;
    procedure paintborderDn;Virtual;
    procedure paintborderUp;Virtual;
    procedure paintDbg;Virtual;
    procedure RecalcWidth;virtual;
    procedure checkloopblock;virtual;
    function createNewBlock: TDspBlock;virtual;
    procedure Paint; override;
    procedure Resize; override;
    procedure Reattach(Sender: TDspBlock);virtual;
    Procedure AttachTo(Blk:TDspBlock;Up:Boolean);
    Procedure DettachFrom(Blk:TDspBlock);
    procedure AssignTo(Dest:TPersistent);override;
    procedure setCommandText(cmdtxt:String);
    function getCommandText:String;
    procedure setCtrlAttachUp(vl:boolean);
    procedure setCtrlAttachDn(vl:boolean);
    function getAttachposUp: integer;virtual;
    function getAttachposDn: integer;virtual;
    procedure setNewlyCreated(v:boolean);virtual;
    procedure setLinkTo(const Value: TDspBlock);virtual;
    function getLinkTo: TDspBlock;virtual;
    function getblocksize: integer;virtual;
    function getParam2: Integer;virtual;
    function getParam1: Integer;virtual;
    procedure loaded;override;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetNewWidth(nw: Integer);virtual;
  public
    fCommndID:Integer;  //Command ID
    fParam1:integer;    //1st Parameter
    fParam2:integer;    //2nd Parameter
    FParamStr: string;  //String Parameter
    FParamD: String;    //Device Name
    FPDevice: Integer;  //Device Pin formerly in param1 // or Device ID if we keep track on arduino
    FLinkToName: String;
    FLinkFromName: String;
    FVarParam1Name:String;
    FVarParam2Name:String;
    ctrlcolor1:TColor;
    ctrlcolor2:TColor;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    Function IndexInParent(VControl:Tcontrol):integer;
    procedure getDspBlockListSize(db: TDspBlock; var res: integer;
      recurs: boolean=false);
    procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;
    procedure DblClick; override;
    function getLastDspBlock(caller:TDspBlock):TDspBlock;virtual;
    constructor CreateFloat(AOwner: TComponent);
    procedure FillComboBox;
    function GetParam1Rect: TRect;virtual;
    function GetParam2Rect: TRect;virtual;
    function Param1Visible: Boolean;virtual;
    function Param2Visible: Boolean;virtual;
    function GetArduinoCommand(idnt:integer=1):String;Virtual;
    function getDeviceName:string;virtual;
    property Height;
  Published
    property Color;
    property Param1Attaching:Boolean read FParam1Attaching write SetParam1Attaching;
    property Param2Attaching:Boolean read FParam2Attaching write SetParam2Attaching;
    property CtrlAttachUp:boolean read FCtrlAttachUp write setCtrlAttachUp;
    property CtrlAttachDn:boolean read FCtrlAttachDn write setCtrlAttachDn;
    property CommandText: String read getCommandText write setCommandText;
    property NewlyCreated:boolean read fNewlyCreated write setNewlyCreated;
    property blocksize:integer read getblocksize;
    property firstBlock:TDspBlock read getFirstBlock;
    property CommndID:Integer read fCommndID write fCommndID;
    property Param1:Integer read getParam1 write setfParam1;
    property Param2:Integer read getParam2 write setfParam2;
    property ParamStr:string read FParamStr write SetParamStr;
    Property ParamD:String read FParamD write SetParamD;
    property PDevice:Integer read FPDevice write SetPDevice;
    property topNose:boolean read FtopNose write SettopNose;
    property botNose:boolean read FbotNose write SetbotNose;
    property LinkTo:TDspBlock read getLinkTo write setLinkTo;
    property LinkFrom:TDspBlock read FLinkFrom write SetLinkFrom;
    property TotalParams:integer read FTotalParams write SetTotalParams;
    property param1question:String read Fparam1question write Setparam1question;
    property param1prompt:string read Fparam1prompt write Setparam1prompt;
    property param2question:String read Fparam2question write Setparam2question;
    property param2prompt:string read Fparam2prompt write Setparam2prompt;
    property Id:integer read FId write SetId;
    property BorderColor:TColor read FBorderColor write SetBorderColor;
    property CommandColor:TColor read FCommandColor write SetCommandColor;
    property LinkToName:String read GetLinkToName write SetLinkToName;
    property LinkFromName:String  read GetLinkFromName write SetLinkFromName;
    property MyHint:string read FMyhint write SetMyhint;
    property prototype:boolean read Fprototype write Setprototype;
    property DeviceOnlyCommandID:integer read FDeviceOnlyCommandID write SetDeviceOnlyCommandID;
    property VarParam1:TDspBlock read FVarParam1 write SetVarParam1;
    Property VarParam1Name:String read GetVarParam1Name write SetVarParam1Name;
    property VarParam2:TDspBlock read FVarParam2 write SetVarParam2;
    Property VarParam2Name:String read GetVarParam2Name write SetVarParam2Name;
    property ArduCmd:String read FArduCmd write FArduCmd;
    property ArduCheck:string read fArduCheck write FArduCheck;
  End;

  tComboHack=Class(TComboBox)
  protected
    procedure WMPaint(var Msg: TMessage); message WM_Paint;
  End;

var  debugging:boolean=false;

implementation
uses Vcl.Forms,sysutils,dialogs,types,math,
DspEdit,DspCombo,
DspUtils,unCtrlPlatMain,unDevices,unVariables;

var idcnt:integer=1;

Function GetActiveDevicePins(DevTp:integer=-1):TStrings;
Begin
  Result:=frmRoboLang.GetActiveDevicePins(Devtp);
End;

Procedure AddDebug(s:String);
Begin
  frmRoboLang.adddebug(s);
End;

Procedure  setUniqueComponentName(Comp:TDspBlock;nm:string);
var newname:string;
    k:integer;
Begin
  if not assigned(comp.owner) then exit;
  if Comp.prototype then
        nm:='Prot_'+nm;
  k:=0;
  Repeat
    inc(k);
    newname:=nm+'_'+inttostr(k);
  Until comp.Owner.FindComponent(newname)=nil ;
  Comp.Id:=k;
  comp.Name:=newname;
End;

Function TDspBlock.IndexInParent(VControl:Tcontrol):integer;
var
  ParentControl: TWinControl;
begin
  ParentControl:=TForm(VControl.Parent);
  if (ParentControl<>nil) then
    for Result:=0 to ParentControl.ControlCount-1 do
      if (ParentControl.Controls[Result]=VControl) then
        Exit;
  Result:=-1;

end;


Function TDspBlock.IndexInOwner(VControl:Tcontrol):integer;
var
  OwnerControl: TForm;
begin
  OwnerControl:=TForm(VControl.Owner);
  if (OwnerControl<>nil) then
    for Result:=0 to OwnerControl.ComponentCount-1 do
      if (OwnerControl.Components[Result]=VControl) then
        Exit;
  Result:=-1;

end;


constructor TDspBlock.CreateFloat(AOwner: TComponent);
Begin
  Create(AOwner);
  Prototype:=false;
  setUniqueComponentName(Self,'dspBlock_');
End;

constructor TDspBlock.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle:=ControlStyle+[ csAcceptsControls, csCaptureMouse, csClickEvents];
  Param1Attaching:=false;
  Param2Attaching:=false;
 // ControlStyle := ControlStyle - [csOpaque];
  FDeviceOnlyCommandID:=-1;
  ctrlcolor1:=clYellow;//htmltocolor('#FFD900') ;
  ctrlcolor2:=clYellow;//htmltocolor('#003300');
  Font.Size:=10;
  Font.Style:=[fsBold];
  enabled:=true;
  Prototype:=true;
  setUniqueComponentName(Self,'dspBlock_');

  cancelMouseDn:=false;
  width:=150;
  height:=44;
  dragMode:=dmManual;
  move:=false;
//  InterceptMouse:=true;
  Doublebuffered:=true;
  lnw:=2;
  nospadUp:=20;
  nospadDn:=20;
  nosw:=14;
  nosh:=6;
  topnose:=true;
  botnose:=true;
  fNewlyCreated:=true;
  Color:=clRed;
  enblColor:=-1;
  BorderColor:=clRed;
  FCommandText:='Command';
  CommndID:=-1;
  FPDevice:=-1;//default Device none
  fParam1:=0;
  fParam2:=0;
  TotalParams:=0;
 // param1question:='Δώσε την παράμετρο1';
 // param1prompt:='Παράμετρος';
 // param2question:='Δώσε την παράμετρο2';
 // param2prompt:='Παράμετρος';
  RecalcWidth;
  CalcArea;
  createctrl1;
  createctrl2;
  CreateCtrlS;
  CreateCtrlD;
  FVarParam1:=nil;
  FVarParam1Name:='';
  FVarParam2:=nil;
  FVarParam2Name:='';

 // ID:=IndexInowner(self);
end;

procedure TDspBlock.requestParam1;
Begin
End;

procedure TDspBlock.requestParam2;
Begin
End;

procedure TDspBlock.DblClick;
begin
  exit;
  cancelMouseDn:=true;
  inherited;
  if TotalParams>0 then
   requestParam1;
  if TotalParams>1 then
   requestParam2;
end;

destructor TDspBlock.Destroy;
begin

  if assigned(flinkto) then
  begin
   try
     Freeandnil(flinkto);
   except
      Flinkto:=nil;
   end;
  end;
  inherited;
end;

function TDspBlock.getDeviceParam(pn:integer):Integer;
Begin
  result:=-1;
  if PDevice<>-1 then
  Begin
    result:=ActDevs[PDevice].ActDevParams[pn];
  End;
End;

function TDspBlock.getDeviceName: string;
var dvi:Integer;
begin
    result:=Paramd;//%pd has the device id  param1
    if (result='') and (DeviceOnlyCommandID<>-1) then
    Begin
      //get 1st device
      dvi:=getFirstDeviceOfType(DeviceOnlyCommandID);
      result:=ActDevs[dvi].ActDevForm.Caption;
    End;
end;

procedure TDspBlock.getDspBlockListSize(db:TDspBlock;var res:integer;recurs:boolean=false);
Begin
  if db=nil then
   db:=self;
  if not recurs then
   res:=0;
  inc(res,db.blocksize);   //get containers total blocks
  if Assigned(db.LinkTo) then //linkto skips containers
    getDspBlockListSize(db.LinkTo,Res,true);

End;


function TDspBlock.getFirstBlock: TDspBlock;
begin
  result:=fLinkto;
end;

procedure TDspBlock.SetBorderColor(const Value: TColor);
begin
  FBorderColor := Value;
end;

procedure TDspBlock.SetbotNose(const Value: boolean);
begin
  FbotNose := Value;
end;

procedure TDspBlock.SetBounds( pLeft , pTop , pWidth , pHeight:integer );
var
  lMoved : BOolean;
  ktop,kleft:integer;
begin

  if not prototype then
  begin
   if assigned(parent) and not (parent is TDspBlock) then
   Begin
     if assigned(parent) and assigned(tscrollbox(parent).VertScrollBar) then
      ktop:=tscrollbox(parent).VertScrollBar.ScrollPos;

     if assigned(parent) and assigned(tscrollbox(parent).HorzScrollBar) then
      kleft:=tscrollbox(parent).HorzScrollBar.ScrollPos;
   End;
  end
  else
  Begin
    ktop:=0;kleft:=0;
  End;

  if assigned(parent) and  not (parent is TDspBlock) then
  Begin
    if ktop+ptop<5 then
      ptop:=5;

    if kleft+pleft<5 then
     pLeft:=5;
  End;


  lMoved := ( pLeft <> Left ) or ( pTop <> Top );

  inherited SetBounds( pLeft , pTop , pWidth , pHeight );
  if ( lMoved )  then
  begin
   if (linkfrom=flinkto) and (linkfrom<>nil) then     //bug shouldnot happen
   Begin
    flinkto:=nil;
    adddebug('Bug-->>'+inttostr(id)+' is linked up dn to'+inttostr(linkfrom.id));
   End;
   if fLinkTo<>nil then
   Begin
     fLinkTo.Reattach(Self);
     repaint;
   End;
  end;
end;


procedure TDspBlock.SetCommandColor(const Value: TColor);
begin
  FCommandColor := Value;
  font.Color:=Value;
  if assigned(ctrld) then
    TComboBox(ctrlD).font.Color:=Value;
end;

procedure TDspBlock.setCommandText(cmdtxt: String);
begin
  fCommandText:=cmdtxt;
  if not (csLoading in componentstate) then
  begin
    setCommandStyle;
    RecalcWidth;
  end;
end;


procedure TDspBlock.RecalcWidth;
var w:integer;
begin
  if parent=nil then exit;

  w:=canvas.TextWidth(getFixedCommandText)+20;
  width:=w;
end;



procedure TDspBlock.setCtrlAttachDn(vl: boolean);
begin
     fCtrlAttachDn:=vl;
     Repaint;
end;

procedure TDspBlock.setCtrlAttachUp(vl: boolean);
begin
     fCtrlAttachUp:=vl;
     Repaint;
end;

procedure TDspBlock.SetDeviceOnlyCommandID(const Value: integer);
begin
  FDeviceOnlyCommandID := Value;
  if prototype then enabled:=false;//only at create

end;

procedure TDspBlock.setfParam1(const Value: Integer);
begin
  fParam1 := Value;
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;
  end;
  if assigned(ctrl1) and (ctrl1 is TdspEdit) then
    TDspedit(ctrl1).Text:=inttostr(fparam1);
    MyHint:=fMyhint;
end;

procedure TDspBlock.setfParam2(const Value: Integer);
begin
  fParam2 := Value;
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;
  end;
  if assigned(ctrl2) and (ctrl2 is TdspEdit) then
   Tdspedit(ctrl2).Text:=inttostr(fparam2);
end;

function TDspBlock.getParam1Text:String;
Begin
 try
  Result:=inttostr(param1);
 except
   Result:='';
 end;
End;


procedure TDspBlock.SetMyhint(const Value: string);
var s,t:string;
begin
  if fparamstr<>'' then
    s:=#13' ['+fparamstr+']';
  hint := Value+s;
  fMyhint:=value;
  t:=StringReplace(Hint,'%p1',getParam1Text,[]);
  hint:=t;
  ShowHint:=true;
end;

procedure TDspBlock.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TDspBlock.SetLinkFrom(const Value: TDspBlock);
begin
  FLinkFrom := Value;
end;

procedure TDspBlock.SetLinkFromName(const Value: String);
var f:TDspBlock;
begin
  FLinkFromName := Value;
  if assigned(owner) and not assigned(Linkfrom) then
  Begin
     f:=TDspBlock(owner.FindComponent(FLinkFromName));
     if assigned(f) then
       linkfrom:=f;
  End;

end;

procedure TDspBlock.setLinkTo(const Value: TDspBlock);
begin
  fLinkTo := Value;

end;

procedure TDspBlock.SetLinkToName(const Value: String);
var f:TDspBlock;
begin
  FLinkToName := Value;
  if assigned(owner) and not assigned(fLinkto) then
  Begin
     f:=TDspBlock(owner.FindComponent(FLinkToName));
     if assigned(f) then
       fLinkto:=f;
  End;

end;

procedure TDspBlock.setNewlyCreated(v: boolean);
begin
  fNewlyCreated:=v;
end;

procedure TDspBlock.Setparam1prompt(const Value: string);
begin
  Fparam1prompt := Value;
end;

procedure TDspBlock.Setparam1question(const Value: String);
begin
  Fparam1question := Value;
end;

procedure TDspBlock.SetParam2Attaching(const Value: Boolean);
begin
  FParam2Attaching := Value;
  Repaint;

end;

procedure TDspBlock.Setparam2prompt(const Value: string);
begin
  Fparam2prompt := Value;
end;

procedure TDspBlock.Setparam2question(const Value: String);
begin
  Fparam2question := Value;
end;

procedure TDspBlock.SetParamD(const Value: String);
begin
  FParamD := Value;
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;
    if assigned(ctrlS) then
     FillComboBox;
  end;
end;

procedure TDspBlock.SetParamStr(const Value: string);
begin
  FParamStr := Value;
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;
  end;
  if assigned(ctrlS) then
   Tdspedit(ctrlS).Text:=FParamStr;

end;

procedure TDspBlock.SetParent(AParent: TWinControl);
begin
  if assigned(parent) and ((Parent is TDspBlock) or (assigned(AParent) and (Aparent is TDspBlock) and TDspBlock(AParent).loading))then    //remove from this parent
  Begin
   Width:=Width+2*lnw;
   Height:=Height+2*lnw+8;
   Margins.Top:=0;
  End;
  inherited;
  if IsParamDev and (AParent<>nil) then
    FillComboBox;
  if assigned(Aparent) and (AParent is TDspBlock) then
  Begin
    //smaller rect
   Width:=Width-2*lnw;
   Height:=Height-2*lnw-8;
   Margins.Top:=2;
  End;

  InformClientControls;
end;

procedure TDspBlock.InformClientControls;
Var i:integer;
Begin
  for i := 0 to Pred(controlcount) do
   if controls[i] is TDSpEdit then
     TDSpEdit(Controls[i]).ParentSet;

End;

procedure TDspBlock.SetPDevice(const Value: Integer);
begin
  FPDevice := Value;
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;
  end;
  if assigned(ctrlD) then
  Begin
   SeTComboBoxValue;
  End;
end;

procedure TDspBlock.Setprototype(const Value: boolean);
begin
  Fprototype := Value;
  if value then
   setUniqueComponentName(Self,'dspBlock_')
  else
   Recalcwidth;
end;

procedure TDspBlock.SettopNose(const Value: boolean);
begin
  FtopNose := Value;
end;

procedure TDspBlock.SetTotalParams(const Value: integer);
begin
  FTotalParams := Value;
end;


procedure TDspBlock.SetVarParam1(const Value: TDspBlock);
begin
  if assigned(Value) then  //New Var Param
  Begin
   Value.Parent:=Self;
   Value.left:=ctrl1.Left;
   value.Top:=ctrl1.Top-lnw*2;
   ctrl1.Visible:=false;
   if value.CommndID>74 then //fix var from a device
   Begin   //todo:don't allow this no fix vars on device blocks
    if (PDevice<>-1) and (PDevice<>Value.PDevice) then raise Exception.Create('Error device has already a device ID');
    FPDevice:=Value.PDevice;
   End;
  End;
  if Assigned(FVarParam1) then   //old Var Param Get it Out of us
  Begin
   FVarParam1.Left:=left+FVarParam1.Left+10;
   FVarParam1.Top:=Top+FVarParam1.Top+10;
   FVarParam1.Parent:=parent;
  // FVarParam1.Height:=FVarParam1.height+2;
   if not assigned(value) then //nil
   Begin
    ctrl1.Visible:=True;
   End;
   if FVarParam1.CommndID>74 then //fix var from a device remove device id
    PDevice:=-1;
  End;


  FVarParam1 := Value;

end;

procedure TDspBlock.SetVarParam1Name(const Value: String);
var f:TDspBlock;
begin
  loading:=(value<>'') and not assigned(FVarParam1);
  FVarParam1Name := Value;
  if assigned(owner) and not assigned(FVarParam1) then  //LinkByName
  Begin
     f:=TDspBlock(owner.FindComponent(FVarParam1Name));
     if assigned(f) then
     Begin
       VarParam1:=f;
       loading:=false;
     End;
  End;

end;

procedure TDspBlock.SetVarParam2(const Value: TDspBlock);
begin
  if assigned(Value) then  //New Var Param
  Begin
   Value.Parent:=Self;
   Value.left:=ctrl2.Left;
   value.Top:=ctrl2.Top-lnw*2;
   ctrl2.Visible:=false;
//   if assigned(updn2) then updn2.Visible:=false;
   if value.CommndID>74 then //fix var from a device
   Begin           //todo:don't allow this no fix vars on device blocks
    if (PDevice<>-1) and (PDevice<>Value.PDevice) then raise Exception.Create('Error device has already a device ID');
    PDevice:=Value.PDevice;
   End;
  End;
  if Assigned(FVarParam2) then   //old Var Param Get it Out of us
  Begin
   FVarParam2.Left:=left+FVarParam2.Left+10;
   FVarParam2.Top:=Top+FVarParam2.Top+10;
   FVarParam2.Parent:=parent;
   if not assigned(value) then //nil
   Begin
    ctrl2.Visible:=True;
   // if assigned(updn2) then updn2.Visible:=True;
    if FVarParam2.CommndID>74 then //fix var from a device remove device id
     PDevice:=-1;
   End;
  End;


  FVarParam2 := Value;
end;

procedure TDspBlock.SetVarParam2Name(const Value: String);
var f:TDspBlock;
begin
  loading:=(value<>'') and not assigned(FVarParam2);
  FVarParam2Name := Value;
  if assigned(owner) and not assigned(FVarParam2) then  //LinkByName
  Begin
     f:=TDspBlock(owner.FindComponent(FVarParam2Name));
     if assigned(f) then
     Begin
       VarParam2:=f;
       loading:=false;
     End;
  End;

end;

procedure TDspBlock.Resize;
begin
  if length(a)>0 then
  Begin
    calcarea;

    SetWindowRgn(Handle, CreatePolygonRgn(a[0],length(a),WINDING), True);
  End;
  inherited; //the inherited implementation just calls the event
end;

function TDspBlock.createNewBlock:TDspBlock;
Begin
   result:=TDspBlock.CreateFloat(Owner);
End;

procedure TDspBlock.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var newblock: TDspBlock;
begin
  inherited;
  if (mbLeft = Button) then
  if not prototype then
  Begin
    setfocus;
     if not cancelMouseDn then
     Begin
       move:=true;
       bringtofront;
       P1.X:=X;
       P1.Y:=Y;
     End
     else
       cancelMouseDn:=false;//skipped mouse down after double click
  End
  else
  Begin
    newblock:=createNewBlock;
    newblock.assign(self);
    newblock.Parent:=TWinControl(owner);
    newblock.NewlyCreated:=false;

    Postmessage(newblock.Handle,WM_LBUTTONDOWN,0,MAKELPARAM(X,Y))
  End;
end;

procedure TDspBlock.AssignTo(Dest:TPersistent);
var blck:TDspBlock;
Begin

    if Dest is TDspBlock then
    Begin
     blck:=TDspBlock(Dest);
     blck.parent:=TWinControl(blck.Owner);
     blck.prototype:=false;
     blck.topNose:=topnose;
     blck.botNose:=botNose;
     blck.nospadUp:=nospadUp;
     blck.nospadDn:=nospadDn;
     blck.Left:=Left;
     blck.Top:=Top;
     blck.width:=width;
     blck.Height:=Height;
     blck.Color:=Color;
     blck.BorderColor:=BorderColor;
     blck.CommandColor:=CommandColor;
     blck.fCommandText:=fCommandText;
     blck.CommndID:=CommndID;
     blck.Param1:=Param1;
     blck.Param2:=Param2;
     blck.Paramstr:=Paramstr;
     blck.ParamD:=ParamD;
     if Paramstr<>'' then
      blck.Param2:=Length(blck.Paramstr);
     blck.TotalParams:=TotalParams;
     blck.param1question:=param1question;
     blck.param1prompt:=param1prompt;
     blck.param2question:=param2question;
     blck.param2prompt:=param2prompt;
     blck.MyHint:=myhint;
     blck.DeviceOnlyCommandID:=DeviceOnlyCommandID;
     blck.enblColor:=enblColor;
     blck.ArduCmd:=ArduCmd;
    End;
End;

function TDspBlock.InCircle(p:TPoint;Cp:Tpoint):boolean;
const radius=25;
Begin

 result:= sqr((p.x - Cp.x)) + sqr((p.y - Cp.y)) < sqr(radius);
End;

procedure TDspBlock.loaded;
begin
  inherited;
end;

Const ScrollQuant=100;

Function TDspBlock.Param1Visible:Boolean;
Begin
   Result:=Ctrl1.visible and (totalparams>0);
End;

function TDspBlock.Param2Visible: Boolean;
begin
   Result:=Ctrl2.visible and (totalparams>1);
end;

Function TDspBlock.GetParam1Rect:TRect;
Begin
  if Param1Visible then
  Begin
     Result:=Ctrl1.BoundsRect;
     Result.left:=Result.Left+left;
     Result.Right:=Result.Right+left;
     Result.Top:=Result.Top+Top;
     Result.Bottom:=Result.Bottom+Top;
  End
  Else Result.Empty;

End;

procedure TDspBlock.CheckAttach;
var tmpctrl:TDspBlock;
    otApUp,otApDn,myApUp,myApDn:TPoint;
    i:integer;
Begin
     if CtrltoAttach<>nil then
     Begin
       CtrltoAttach.CtrlAttachUp:=false;
       CtrltoAttach.CtrlAttachDn:=false;
     End;
     CtrltoAttach:=nil;
     sameattach:=false;
     if (parent<>nil) and (parent.Tag=995) then
     Begin
        for i := 0 to  parent.ControlCount-1 do
        Begin
           if parent.Controls[i] is TDspBlock then
           Begin
              tmpctrl:=TDspBlock(parent.Controls[i]);


              otApUp.x:= tmpctrl.ActivePointUp.X+tmpctrl.left;
              otApUp.y:= tmpctrl.ActivePointUp.y+tmpctrl.top;
              //todo:for down get the last down
              otApDn.x:= tmpctrl.ActivePointDn.X+tmpctrl.left;
              otApDn.y:= tmpctrl.ActivePointDn.y+tmpctrl.top;
              myApUp.x:= ActivePointUp.X+left;
              myApUp.y:= ActivePointUp.y+top;
              myApDn.x:= ActivePointDn.X+left;
              myApDn.y:= ActivePointDn.y+top;
              if topnose and tmpctrl.botNose and InCircle( myApUp,otApDn) then
              Begin
               // if (tmpctrl<>linkfrom)then //linkto
                Begin
                 //attach to others dn
                  CtrltoAttach:=  tmpctrl;
                  CtrltoAttach.CtrlAttachDn:=true;
               //   CtrltoAttach.Invalidate;
                  break;
                end;
                sameattach:=tmpctrl=linkfrom;
              End
              else
              if  botNose and tmpctrl.topNose and InCircle( myApDn,otApUp) then
                if (tmpctrl<>flinkto) then  //linkfrom
                Begin
                 //attach to thers up
                  CtrltoAttach:=  tmpctrl;
                  CtrltoAttach.CtrlAttachUp:=True;
                //  CtrltoAttach.Invalidate;
                  break;
                End;
           End; //if parent controls
        End; //for i
     End; //if parent tag

End;

procedure TDspBlock.MouseMove(Shift: TShiftState; X, Y: Integer);
Var otApUp,otApDn,myApUp,myApDn:TPoint;
    tmpctrl:TDspBlock;
    i:integer;
    par:Twincontrol;
begin
   inherited;
   if move then
   Begin
     if (parent.Tag=995) then twincontrol(parent).Repaint;
     if X>P1.X then
        Left:=Left +(X - p1.X);
     if X<P1.X then
        Left:=Left -(P1.X - X);
     if Y>P1.Y then
        Top:=Top +(Y - p1.Y);
     if Y<P1.Y then
        Top:=Top -(p1.Y - Y);

     if not prototype and assigned(parent) and (parent=Owner)  then
     Begin
       par:=getParentControl;
       if (left>=par.Left) and (top>par.Top) then
       Begin
         Parent:=par;
         left:=left-par.Left;
         top:=top-par.Top;
         move:=false;
        // PostMessage(Handle, WM_LBUTTONUP, 0, 0);

         PostMessage(Handle, WM_LBUTTONDOWN, 0, X or (Y shl 16));
         exit;
       End;

     End else   //TODO:Tell the other blocks that are under us that we moved
     if not prototype and assigned(parent) and not (parent is TDspBlock) and assigned(tscrollbox(parent).VertScrollBar) then
     Begin
         FillComboBox;
        //horiz scroll
        if (tscrollbox(parent).HorzScrollBar.Position+left+width)>  Max(tscrollbox(parent).HorzScrollBar.Range,tscrollbox(parent).clientwidth) then
           tscrollbox(parent).HorzScrollBar.Range:=tscrollbox(parent).width+tscrollbox(parent).HorzScrollBar.Range+ScrollQuant*4;
        if (left+width)>  tscrollbox(parent).ClientWidth then
        begin
         tscrollbox(parent).HorzScrollBar.Position:=tscrollbox(parent).HorzScrollBar.Position+ScrollQuant;
         SetCursorPos(Mouse.CursorPos.X-ScrollQuant, Mouse.CursorPos.Y);
        end;
        if (left)<0 then
        begin
         tscrollbox(parent).HorzScrollBar.Position:=tscrollbox(parent).HorzScrollBar.Position-ScrollQuant;
         SetCursorPos(Mouse.CursorPos.X+ScrollQuant, Mouse.CursorPos.Y);
        end;

        //Vert scroll
        if (tscrollbox(parent).VertScrollBar.Position+top+Height)>  Max(tscrollbox(parent).VertScrollBar.Range,tscrollbox(parent).ClientHeight) then
           tscrollbox(parent).VertScrollBar.Range:=tscrollbox(parent).height+tscrollbox(parent).VertScrollBar.Range+ScrollQuant*4;
        if (top+Height)>  tscrollbox(parent).ClientHeight then
        begin
         tscrollbox(parent).VertScrollBar.Position:=tscrollbox(parent).VertScrollBar.Position+ScrollQuant;
         SetCursorPos(Mouse.CursorPos.X, Mouse.CursorPos.Y-ScrollQuant);
        end;
        if (top)<0 then
        begin
         tscrollbox(parent).VertScrollBar.Position:=tscrollbox(parent).VertScrollBar.Position-ScrollQuant;
         SetCursorPos(Mouse.CursorPos.X, Mouse.CursorPos.Y+ScrollQuant);
        end;

     End
     else
      if not prototype and assigned(parent) and (parent is TDspBlock) then//a var block wants to move out
      Begin
        //detach var block
        tmpctrl:= TDspBlock(parent);
        parent:=tmpctrl.Parent;
        left:=left+tmpctrl.Left;
        top:=top+tmpctrl.Top;
        if tmpctrl.VarParam1=self then
          tmpctrl.VarParam1:=nil;
        if tmpctrl.VarParam2=self then
          tmpctrl.VarParam2:=nil;

        tmpctrl.Repaint;
        PostMessage(Handle, WM_LBUTTONDOWN, 0, X or (Y shl 16));
      End;

     CheckAttach;

   End;//if move
   if fLinkTo<>nil then
   Begin
  //   fLinkto.Reattach(nil);
     fLinkTo.repaint;
   End;

end;

function TDspBlock.getParentControl:TWincontrol;
var i:integer;
Begin
  result:=nil;
  for i := 0 to Pred(TForm(owner).ComponentCount) do
  Begin
    if TForm(owner).Components[i].Tag=995 then
    Begin
      result:=twinControl(TForm(owner).Components[i]);
      Break;
    End;
  End;
End;

function TDspBlock.GetVarParam1Name: String;
begin
  if assigned(FVarParam1 ) then
   result:=FVarParam1.name
  else
    result:='';
end;

function TDspBlock.GetVarParam2Name: String;
begin
  if assigned(FVarParam2 ) then
   result:=FVarParam2.name
  else
    result:='';

end;

procedure TDspBlock.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var targcontrol:twinControl;
   p:Tpoint;
   t1,t2,t3:TDspBlock;
   r1,r2:integer;
   c1:TControl;
begin
  inherited;
  move:=false;
  if button<>mbLeft then exit;

  if parent=owner then Begin free;exit;end;


  if Newlycreated then
  Begin
    p:=Tform(owner).clienttoscreen(Point(left,top));

   targcontrol:=FindVCLWindow (p);
    if (targcontrol<>nil) then
    Begin
     if targcontrol.ClassType =tDSpBlock then
        targcontrol:=targcontrol.parent;
     if (targcontrol.Tag=995) then
     begin
       parent:= targcontrol;
       ID:=idcnt;
       idcnt:=idcnt+1;
       Left:=Left-parent.Left;
       Top:=Top-Parent.Top;
       Newlycreated:=false;
     end
     else if (targcontrol.Tag<>990) then
      free;

    End
    else
      free;

  End //newlycreated
   else
   Begin
     enabled:=false;
     try         //Check if drop to recycle bin and free
//       p:=tform(owner).clienttoscreen(Point(parent.Left+left+x,parent.Top+top+y));
//       p:=tform(owner).clienttoscreen(Point(parent.Left+left,parent.Top+top));
//       targcontrol:=twincontrol(FindDragTarget (p,false));
//       c1:=self;r1:=0;
//       repeat
//          r1:=r1+c1.Top;
//          r2:=r2+c1.Left;
//          c1:=c1.parent;
//       until c1.parent=nil;
//       p.x:=r2;
//       p.Y:=r1;
       p.X:=left;p.y:=top;
       targcontrol:=twincontrol(twincontrol(parent).ControlAtPos(p,false,true,true));
     finally
       enabled:=true;
     end;
     if assigned(targcontrol) and (targcontrol.Tag=-1) then
      free;
   End;


  if (ctrltoattach=fLinkto) or Sameattach then
     ctrltoattach:=nil;

  if (CtrltoAttach<>nil) then

  begin
   if    (CtrltoAttach.CtrlAttachUp<>CtrltoAttach.CtrlAttachDn)then
   Begin
     if CtrltoAttach.CtrlAttachUp and (CtrltoAttach.LinkFrom<>self)then
     Begin
      AddDebug('attach UP '+inttostr(id)+' to '+inttostr(CtrltoAttach.id));
      t1:= CtrltoAttach.LinkFrom;
      t2:=Linkfrom;
      t3:=fLinkto;
      if t1<>nil then
        CtrltoAttach.DettachFrom(t1);
      if t2<>nil then
       DettachFrom(t2);
      if t3<>nil then
       DettachFrom(t3); //todo get the last one down and attach it to ctrltoattach

       AttachTo(CtrltoAttach,True);
       if assigned(t1) and topNose then
         t1.AttachTo(self,True);
      //ToDo : reattach if necessary t1 and t2 and t3
     end;
     if CtrltoAttach.CtrlAttachDn and (CtrltoAttach.fLinkto<>self)then
     Begin
       AddDebug('attach DN '+inttostr(id)+' to '+inttostr(CtrltoAttach.id));
       t1:=CtrltoAttach.fLinkTo;
       t2:=LinkFrom;
       if t1<>nil then
         CtrltoAttach.DettachFrom(t1);
       if t2<>nil then
         DettachFrom(t2);
       AttachTo(CtrltoAttach,false);
      //ToDo : reattach if necessary t1 and t2
       if (t1<>nil) and botNose then //
       Begin
           //attach ourselves DN to t1
           //todo:seek the last attachment and attach it instead of us
         t2:=self;
         while assigned(t2.flinkto) do
          t2:=t2.fLinkTo;
         AddDebug('attach Up '+inttostr(id)+' to '+inttostr(t1.id));
         t2.AttachTo(t1,true);
       End;
     End;


      CtrltoAttach.Reattach(nil);
      Reattach(nil);
   End;
  end
  else //ctrl to attach is nil
  Begin
    if not sameattach and assigned(linkfrom) then //dettach
    Begin
      DettachFrom(linkfrom);
    End;
  End;
  if CtrltoAttach<>nil then
  Begin
    CtrltoAttach.CtrlAttachUp:=false;
    CtrltoAttach.CtrlAttachDn:=false;
  End;

   CtrltoAttach:=nil;
   CtrlAttachUp:=false;
   CtrlAttachDn:=false;
   invalidate;
   if linkfrom<>nil then
    linkfrom.checkloopblock;
end;

procedure TDspBlock.OnRefreshRequest(var Msg: TMessage);
Var DevTypeid:Integer;
    ActDev:integer;
begin
  if csDestroying in ComponentState then exit;
  if not IsParamDev then exit;

  DevTypeID:=msg.WParam;
  ActDev:=msg.LParam;

  if DeviceOnlyCommandID<>DevTypeID  then exit;
  //Something Changed Refresh the device list
  FillComboBox;
  if TComboBox(ctrlD).Items.Count>0 then
  Begin
   if TComboBox(ctrlD).ItemIndex=-1 then
      TComboBox(ctrlD).ItemIndex:=0;
    FPDevice:=Integer(TComboBox(ctrlD).items.objects[TComboBox(ctrlD).ItemIndex]);
    TComboBox(ctrlD).Text:=TComboBox(ctrlD).items[TComboBox(ctrlD).ItemIndex];
    Invalidate;
  End
  Else
  Begin
    TComboBox(ctrlD).Text:='';
    FParam1:=0;
  End;



end;

procedure TDspBlock.checkloopblock;
Begin
  //nothing to do here
  adddebug('clb');
End;


function TDspBlock.getAttachposDn: integer;
begin
  result:=left+nospadDn;
end;

function TDspBlock.getAttachposUp: integer;
begin
  result:=left+nospadUp;
end;

function TDspBlock.getblocksize: integer;
begin
  result:=1;
end;


function TDspBlock.getFixedCommandText: String;
begin
  result:= fCommandText;
  if pos('%p1',result)>0 then
   result:=stringReplace(result,'%p1',inttostr(param1),[]);
  if pos('%p2',result)>0 then
   result:=stringReplace(result,'%p2',inttostr(param2),[]);
  if pos('%ps',result)>0 then
   result:=stringReplace(result,'%ps',paramStr,[]);
  if pos('%pd',result)>0 then
   result:=stringReplace(result,'%pd',inttostr(param1),[]);

end;


function TDspBlock.getCommandText: String;
begin
  result:=fCommandText;
//  result:=stringReplace(fCommandText,'%p1',inttostr(param1),[]);
//  result:=stringReplace(result,'%p2',inttostr(param2),[]);
end;


function TDspBlock.getLastDspBlock(caller:TDspBlock): TDspBlock;
begin
  if flinkto<>nil then
   Result:=flinkto.getLastDspBlock(Caller)
  else
   result:=self;
end;

function TDspBlock.GetLinkFromName: String;
begin
  if assigned(LinkFrom) then
   result:=LinkFrom.name
  else
    result:='';
end;

function TDspBlock.getLinkTo: TDspBlock;
begin
 result:=fLinkTo;
end;

function TDspBlock.GetLinkToName: String;
begin
  if assigned(fLinkto) then
   result:=fLinkto.name
  else
    result:='';

end;

function TDspBlock.getParamStrControl(x, y: integer): integer;
Var sv:TColor;
begin
  if prototype then
  Begin
    sv:=canvas.Font.Color;
    canvas.Font.Color:=ctrlcolor1;
    canvas.TextOut(x,y ,paramStr);
    canvas.Font.Color:=sv;
    result:=x+canvas.TextWidth(paramStr);
  End
  else
  Begin
    ctrls.Visible:=true;
//    tdspedit(ctrls).Color:=LightenColor(Color,30);
    tdspedit(ctrls).font.Color:= CommandColor; //ctrlcolor1;
    ctrls.Left:=x;
    ctrls.Top:=y;
    TdspEdit(ctrls).text:=paramStr;
    ctrls.Width:=Min(Max(30,Canvas.TextWidth(paramStr)),250);
    result:=ctrls.Left+ctrls.Width;
  End;

end;


function TDspBlock.IsParamDev:Boolean;
Begin
  Result:=Pos('%pd',FCommandText)>0;
End;


procedure TDspBlock.SeTComboBoxValue;      //Sets String value of device
Var k:Integer;
    devwid:Integer;
Begin
   if csLoading in ComponentState then exit;

   if TComboBox(ctrld).Items.Count>0 then
    Begin
     k:=TComboBox(ctrld).Items.IndexOf(Paramd); //Text of Form dev caption
     if TComboBox(ctrld).ItemIndex<>k then
     Begin
      TComboBox(ctrld).ItemIndex:=k;
     End;
     if k=-1 then
        TComboBox(ctrld).text:='';
    End;
    DevWid:=TComboBox(ctrld).Canvas.TextWidth(TComboBox(ctrld).Text);
    DevWid:=Max(30,DevWid);
    TComboBox(ctrld).Width:=DevWid+44;

End;

procedure TDspBlock.FillComboBox;
Var sl:tstringlist;
    i,k:integer;
Begin
   if not IsParamDev then exit;

    sl:=GetActiveDevicePins(DeviceOnlyCommandID) as tstringlist;
    if (parent<>nil) and (parent.parent<>nil) then
     TComboBox(ctrld).items.Assign(sl);


//    TComboBox(ctrld).Items.BeginUpdate;
//    for i := 0 to sl.Count-1 do
//    Begin
//      k:=TComboBox(ctrld).Items.IndexOf(sl.Names[i]);
//      if k=-1 then
//        TComboBox(ctrld).AddItem(sl.Names[i],TObject(Strtoint(sl.ValueFromIndex[i])))
//      Else
//        TComboBox(ctrld).Items.Objects[k]:=TObject(Strtoint(sl.ValueFromIndex[i]));
//    End;
//    TComboBox(ctrld).Items.EndUpdate;
    sl.Free;
    if (parent<>nil) and (parent.parent<>nil) then
      SeTComboBoxValue;
End;

function TDspBlock.GetArduinoCommand(idnt:Integer=1): String;
Var i:integer;
    idnts:string;
begin
  if fArduinoCommand='' then fArduinoCommand:=ArduCmd;


  if pos('%p1',fArduinoCommand)>0 then
   if VarParam1<>nil then
    fArduinoCommand:=stringReplace(fArduinoCommand,'%p1',VarParam1.GetArduinoCommand,[rfReplaceAll])
   else
     fArduinoCommand:=stringReplace(fArduinoCommand,'%p1',inttostr(param1),[rfReplaceAll]);
  if pos('%p2',fArduinoCommand)>0 then
   if VarParam2<>nil then
    fArduinoCommand:=stringReplace(fArduinoCommand,'%p2',VarParam2.GetArduinoCommand,[rfReplaceAll])
   else
    fArduinoCommand:=stringReplace(fArduinoCommand,'%p2',inttostr(param2),[rfReplaceAll]);
  if pos('%ps',fArduinoCommand)>0 then
   fArduinoCommand:=stringReplace(fArduinoCommand,'%ps',paramStr,[rfReplaceAll]);
  if pos('%pd',fArduinoCommand)>0 then
   fArduinoCommand:=stringReplace(fArduinoCommand,'%pd',inttostr(param1),[rfReplaceAll]);
  if pos('%dn',fArduinoCommand)>0 then
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dn',getDeviceName,[rfReplaceAll]);
  if pos('%dp1',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp1',inttostr(getDeviceParam(0)),[rfReplaceAll]);
  if pos('%dp2',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp2',inttostr(getDeviceParam(1)),[rfReplaceAll]);
  if pos('%dp3',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp3',inttostr(getDeviceParam(2)),[rfReplaceAll]);
  if pos('%dp4',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp4',inttostr(getDeviceParam(3)),[rfReplaceAll]);
  if pos('%dp5',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp5',inttostr(getDeviceParam(4)),[rfReplaceAll]);
  if pos('%dp6',fArduinoCommand)>0 then   //Device parameter
   fArduinoCommand:=stringReplace(fArduinoCommand,'%dp6',inttostr(getDeviceParam(5)),[rfReplaceAll]);
  if pos('%k',fArduinoCommand)>0 then
   fArduinoCommand:=stringReplace(fArduinoCommand,'%k','ik'+inttostr(idnt),[rfReplaceAll]);
  if pos('%nl',fArduinoCommand)>0 then
  Begin
   idnts:='';
   for I := 0 to idnt*3 do
     idnts:=idnts+' ';
   fArduinoCommand:=stringReplace(fArduinoCommand,'%nl',#13#10+idnts,[rfReplaceAll]);
  End;
  if pos('%not',fArduinoCommand)>0 then
   if param1=1 then
    fArduinoCommand:=stringReplace(fArduinoCommand,'%not','!',[rfReplaceAll])
   else
     fArduinoCommand:=stringReplace(fArduinoCommand,'%not','',[rfReplaceAll]);

   result:=fArduinoCommand;
   fArduinoCommand:='';
end;

function TDspBlock.getParam1: Integer;
begin
  Result:=fParam1;
end;

function TDspBlock.getParam1Control(x, y: integer): integer;
Var sl:tstringlist;
    i,k:integer;
    sv:tColor;
begin
  if prototype then
  Begin
    sv:=canvas.Font.Color;
    canvas.Font.Color:=ctrlcolor1;
    canvas.TextOut(x,y ,inttostr(param1));
    canvas.Font.Color:=sv;
    result:=x+canvas.TextWidth(inttostr(param1));
  End
  else
  Begin
   if not assigned(VarParam1) then
   Begin
    ctrl1.Visible:=true;
    tDspedit(ctrl1).font.Color:= CommandColor;//ctrlcolor1;
    ctrl1.Left:=x;
    ctrl1.Top:=y;
    TDspEdit(ctrl1).text:=inttostr(param1);
    result:=ctrl1.Left+ctrl1.Width;
   End
   else
   Begin
     VarParam1.Left:=x;
     VarParam1.Top:=y-3;
     result:=VarParam1.Left+VarParam1.Width;
   End;
  End;

end;

function TDspBlock.getParamDControl(x, y: integer): integer;
Var sl:tstringlist;
    i,k:integer;
    sv:TColor;
begin
  if prototype then
  Begin
    sv:=canvas.Font.Color;
    canvas.Font.Color:=ctrlColor1;
    canvas.TextOut(x,y ,ParamD);
    canvas.Font.Color:=sv;
    result:=x+canvas.TextWidth(ParamD);
  End
  else
  Begin
    TComboBox(ctrld).Visible:=True;
    ctrld.Left:=x;
    ctrld.Top:=y-2;
    result:=ctrld.Left+ctrld.Width;
  End;

end;



function TDspBlock.getParam2: Integer;
begin
  Result := fParam2;
end;

function TDspBlock.getParam2Control(x, y: integer): integer;
Var sl:tstringlist;
    i,k:integer;
    sv:tColor;
begin
  if prototype then
  Begin
    sv:=canvas.Font.Color;
    canvas.Font.Color:=ctrlColor2;
    canvas.TextOut(x,y ,inttostr(param2));
    canvas.Font.Color:=sv;
    result:=x+canvas.TextWidth(inttostr(param2));
  End
  else
  Begin
   if not assigned(VarParam2) then
   Begin
    ctrl2.Visible:=true;
    //dn2.Visible:=true;
   // tedit(ctrl2).Color:=LightenColor(Color,30);
    tdspedit(ctrl2).font.Color:=CommandColor;// ctrlcolor2;
    ctrl2.Left:=x;
    ctrl2.Top:=y;
    //updn2.left:=x+ctrl2.Width;
    //updn2.top:=y;
    TdspEdit(ctrl2).text:=inttostr(param2);
    result:=ctrl2.Left+ctrl2.Width//;+updn2.width;
   End
   else
   Begin
     VarParam2.Left:=x;
     VarParam2.Top:=y-3;
     result:=VarParam2.Left+VarParam2.Width;
   End;
  End;

end;


function TDspBlock.GetParam2Rect: TRect;
begin
  if Param2Visible then
  Begin
     Result:=Ctrl2.BoundsRect;
     Result.left:=Result.Left+left;
     Result.Right:=Result.Right+left;
     Result.Top:=Result.Top+Top;
     Result.Bottom:=Result.Bottom+Top;
  End
  Else Result.Empty;
end;

procedure TDspBlock.Reattach(Sender:TDspBlock);   //follow upper block
Begin
  //if not assigned(sender) then exit;


  if (linkfrom<>nil) and not sameattach then
  Begin
  if left<>linkfrom.getAttachposDn-nospadup then
    Left:=linkfrom.getAttachposDn-nospadup;
  if top<> linkfrom.Top+linkfrom.Height-linkfrom.nosh then
    Top:=linkfrom.Top+linkfrom.Height-linkfrom.nosh-3;   //added -3 pnt1
   if (linkfrom<>sender)  then
     linkfrom.Reattach(Sender);

  End;
 // repaint;
End;

procedure TDspBlock.setCommandStyle;
Begin
    canvas.Font.Style:=[fsBold];
    canvas.Font.Color:=CommandColor;
    canvas.Font.Size:=10;
End;


procedure TDspBlock.SetNewWidth(nw:Integer);
Begin
     if width<>nw then
      width:=nw;
End;




procedure TDspBlock.SetParam1Attaching(const Value: Boolean);
begin
  FParam1Attaching := Value;
  Repaint;
end;

procedure TDspBlock.paintCmd;
var cmds:String;
     txth,txtw:integer;
     w,h,x,y:integer;
     s1pos,s2pos,s3pos,s4pos:integer;
     str1:string;
     str2:string;
     str3:string;
     p:integer;
     prm:array[0..3] of integer;
     prmmax:integer;
     i,cuti,newcut: Integer;
     s,sp:String;

     function GetPosbyId(prmid:Integer):Integer;
     Begin
       case prmid of
         1:result := s1pos;
         2:result := s2pos;
         3:result := s3pos;
         4:result := s4pos;
       end;
     End;

     procedure SortTable;
     Var i,t:Integer;
         redo:Boolean;
     Begin
       if prmmax<=0 then Exit;

       redo:=false;
       for i := 1 to prmmax do
       Begin
        if GetPosbyId(prm[i])<GetPosbyId(prm[i-1]) then //swap
        Begin
          t:=prm[i-1];
          prm[i-1]:=prm[i];
          prm[i]:=t;
          redo:=true;
        End;
       End;
       if redo then SortTable;       
     End;

     function GetParamControlById(prmid,x,y:integer):Integer;
     Begin
       case prmid of
         1:result :=getparam1control(x,y);   //1st param integer TSpinEdit
         2:result :=getparam2control(x,y);   //2nd param Integer TSpinEdit
         3:result :=getParamStrControl(x,y); //3rd param String  TEdit
         4:result :=getParamDControl(x,y);   //4th param Device  TComboBox
       end;
     End;

begin
    canvas.Brush.Style := bsClear;
     W := Width - lnw-1;
     H := Height - lnw-1 ;

    setCommandStyle;

    if Assigned(Parent) and (Parent is TDspBlock) then
    Begin
      x:=margins.Left+2;y:=Margins.top+2;
    End
    Else
    Begin
      x:=lnw+Max(margins.Left,10);y:=lnw+2+nosh+Margins.top;
    End;

    if debugging then
     y:=y+10;

    if (totalparams=0) and not IsParamDev then
    Begin
     canvas.TextOut(x,y ,CommandText);
     txtw:=canvas.TextWidth(CommandText)+8;
     SetNewWidth(x+txtw);
     exit;
    End;


    s1pos:=pos('%p1',fCommandText);
    s2pos:=pos('%p2',fCommandText);
    s3pos:=pos('%ps',fCommandText);
    s4pos:=pos('%pd',fCommandText);
    //if (s1pos=0) and (s2pos=0) then  TotalParams:=0;
    prmmax:=-1;
    if s1pos>0 then
    Begin
     inc(prmmax);
     prm[prmmax]:=1;
    End;
    if s2pos>0 then
    Begin
     inc(prmmax);
     prm[prmmax]:=2;
    End;
    if s3pos>0 then
    Begin
     inc(prmmax);
     prm[prmmax]:=3;
    End;
    if s4pos>0 then
    Begin
     inc(prmmax);
     prm[prmmax]:=4;
    End;
    SortTable;


    canvas.Font.Color:=commandcolor;
    s:=fCommandText;
    txtw:=0;cuti:=0;
    for i := 0 to prmmax do
    Begin
      cuti:=GetPosbyId(prm[i])-cuti;
      sp:=copy(s,1,cuti-1);//up to previous char
      s:=copy(s,cuti+3,maxint);//skip 3 chars %p1
      cuti:=GetPosbyId(prm[i])-1+3;
      canvas.TextOut(x+txtw,y ,sp);
      txtw:=txtw+canvas.TextWidth(sp);
      txtw:=GetParamControlById(prm[i],x+txtw,y)-x;
    End;
    canvas.Font.Color:=commandcolor;
    //Rest
    canvas.TextOut(x+txtw,y ,s);
    txtw:=txtw+canvas.TextWidth(s);


    SetNewWidth(x+txtw+8);

End;


procedure TDspBlock.paintDbg;
var cmds:String;
     txth,txtw:integer;
     w,h:integer;

begin
    canvas.Brush.Style := bsClear;
     W := Width - lnw-1;
     H := Height - lnw-1 ;
     if linkfrom<>nil then
      cmds:=inttostr(linkfrom.id);
     cmds:=cmds+'-->'+inttostr(id)+'-->';
     if flinkto<>nil then
       cmds:=cmds+inttostr(flinkto.id);
    canvas.Font.Style:=[fsBold];
    canvas.Font.Color:=clyellow;
    canvas.Font.Size:=8;
    canvas.TextOut(3 ,8,cmds);
//     canvas.TextOut(lnw+w div 2-txtw,lnw+h div 2-txth-nosh div 2,cmds);
end;

procedure TDspBlock.SubFromRect(Var R:tRect;n:Integer);
Begin
  R.Left:=R.Left-n;
  R.Top:=R.Top-n;
  R.Right:=R.Right+n;
  R.Bottom:=R.Bottom+n;
End;

procedure TDspBlock.PaintAttach;
 var k:array of tpoint;
     i:integer;
     r:tRect;
Begin
  with Canvas do
  begin

   pen.Color:=clWhite;
   pen.Width:=3*lnw;

   if CtrlAttachUp then
   Begin
     Setlength(k,length(borderUp)-1);
     for i := 1 to length(borderUp)-1 do
      k[i-1]:=borderup[i];
     polyline(k);
   end;
   if CtrlAttachDn then
   Begin
     Setlength(k,length(borderDn)-1);
     for i := 1 to length(borderDn)-1 do
      k[i-1]:=borderDn[i];
     polyline(k);
   end;
   if Param1Attaching and assigned(ctrl1) then
   Begin
     R:=ctrl1.BoundsRect;
     Rectangle(R);
   End;
   if Param2Attaching and assigned(ctrl2) then
   Begin
     R:=ctrl2.BoundsRect;
     Rectangle(R);
   End;

  end;

End;

procedure TDspBlock.paintborderUp;
var lightColor:TColor;
Begin
  if assigned(parent) and (parent is TDspBlock) then exit;
  lightColor:=LightenColor(Color,40);
  with Canvas do
  begin
   pen.Color:=lightColor;
   pen.Width:=3*lnw;
   Polyline(borderUp);
  End;

End;

procedure TDspBlock.paintborderDn;
var darkColor:TColor;
Begin
  if assigned(parent) and (parent is TDspBlock) then exit;

  darkColor:=DarkenColor(Color,40);
  with Canvas do
  begin
   pen.Color:=darkColor;
   pen.Width:=3*lnw;
   Polyline(borderDn);
  end;
End;


procedure TDspBlock.Paint;
Begin
  inherited;


  if not enabled then
  Begin
   if color<>clGray then
   Begin
     enblColor:=Color;
    Color := clGray;
  // Brush.Style:= bsFDiagonal;
   End;
  End
  else if enblColor<>-1 then
  Begin
    if color<>enblColor then
      Color:=enblColor;
  End;



  canvas.Brush.Style := bsClear;

  paintCmd;
  if debugging then
  Begin
   if height<>50 then
    height:=50;
   paintdbg;
  End;

  paintborderDn;
  paintborderUp;
  PaintAttach;
  PaintChildren;
End;

procedure TDspBlock.PaintChildren;
var
  i: Integer;
Begin
  for i := 0 to Pred(controlcount) do
   if controls[i].visible and (controls[i] is TDspEdit) then
     Controls[i].Invalidate;
End;

procedure TDspBlock.AttachTo(Blk: TDspBlock; Up: Boolean);
begin
  if up then
  Begin
    if blk.LinkFrom<>nil then
      blk.DettachFrom(blk.LinkFrom);
    Blk.LinkFrom:=Self;
    if fLinkto<>nil then
     Dettachfrom(fLinkto);
    fLinkTo:=Blk; //4
    AddDebug('attached UP '+inttostr(id)+' to '+inttostr(Blk.id));
  End
  else
  Begin
    if blk.fLinkto<>nil then
      blk.DettachFrom(blk.fLinkto);
    Blk.fLinkTo:=Self;
    LinkFrom:=Blk;
    AddDebug('attached DN '+inttostr(id)+' to '+inttostr(Blk.id));
  End;
end;

procedure TDspBlock.CalcArea;
begin
    MakeBorderUp;
    MakeBorderDn;
    ConnectBorders;
end;

procedure TDspBlock.DettachFrom(Blk: TDspBlock);
begin
   if Blk.LinkFrom=self then
    blk.LinkFrom:=nil;
   if Blk.fLinkTo=self then
    blk.fLinkto:=nil;//4
   if linkfrom=blk then
   Begin
    linkfrom.Reattach(nil);
    Linkfrom:=nil;
   End;
   if flinkTo=blk then
    fLinkTo:=nil;//
   AddDebug('Dettached '+inttostr(id)+' from '+inttostr(Blk.id));

end;


procedure TDspBlock.CreateCtrl1;
Begin
  Ctrl1:=TDspEdit.Create(Self);
  ctrl1.Parent:=self;
  ctrl1.Visible:=false;
  TDspEdit(Ctrl1).UseUpDn:=true;
  TDspEdit(Ctrl1).Font.Assign(font);
  TDspEdit(Ctrl1).Font.Color:=CtrlColor1;
  TDspEdit(Ctrl1).onchange:=Edit1Change;
  TDspEdit(Ctrl1).Height:=16;
  TDspEdit(Ctrl1).AutoSize:=true;
  TDspEdit(Ctrl1).Min:=-32767;
  TDspEdit(Ctrl1).Max:=32768;
End;

procedure TDspBlock.CreateCtrl2;
Begin
  Ctrl2:=TDspEdit.Create(Self);
  ctrl2.Parent:=self;
  ctrl2.Visible:=false;
  TDspEdit(Ctrl2).Font.Assign(font);
  TDspEdit(Ctrl2).Font.Color:=CtrlColor2;
  TDspEdit(Ctrl2).onchange:=Edit2Change;
  TDspEdit(Ctrl2).Height:=16;
  TDspEdit(Ctrl2).AutoSize:=true;
  TDspEdit(Ctrl2).Min:=-32767;
  TDspEdit(Ctrl2).Max:=32768;

End;

procedure TDspBlock.CreateCtrlS;
begin
  ctrlS:=Tdspedit.create(self);
  ctrlS.Parent:=self;
  tdspedit(ctrlS).font.Assign(font);
  tdspedit(ctrlS).Font.Size:=10;
  tdspedit(ctrlS).Font.Color:=ctrlcolor2;
  tdspedit(ctrlS).Font.Style:=[fsbold];
  tdspedit(ctrlS).Visible:=false;
  tdspedit(ctrlS).Width:=40;
  tdspedit(ctrlS).onchange:=edit3Change;
  tdspedit(ctrlS).height:=16;
  tdspedit(ctrlS).AutoSize:=true;
  tdspedit(ctrlS).NumbersOnly:=false;


end;

procedure TDspBlock.CreateCtrlD;
begin
  ctrlD:=tComboHack.create(self);
  ctrlD.Parent:=self;
  TComboBox(ctrlD).Font.Size:=8;
  TComboBox(ctrlD).Font.Color:=ctrlcolor2;
  TComboBox(ctrlD).Font.Style:=[fsbold];
  TComboBox(ctrlD).Visible:=false;
  TComboBox(ctrlD).Width:=80;
  TComboBox(ctrlD).onchange:=ComboChange;

  TComboHack(ctrlD).BevelWidth:=1;
  TComboBox(ctrlD).BevelInner:=bvnone;
//  TComboBox(ctrlD).BevelKind:=bkFlat;
  TComboBox(ctrlD).BevelOuter:=bvspace;
  TComboBox(ctrlD).BevelEdges:=[];
  TComboBox(ctrlD).Style:=csDropDown;
  TComboBox(ctrlD).Ctl3D:=true;
  //TComboBox(ctrlD).Style:=csOwnerDrawFixed;


  TComboBox(ctrlD).AutoComplete:=true;
  TComboBox(ctrlD).AutoCompleteDelay:=1000;
  TComboBox(ctrlD).height:=16;
end;

procedure TDspBlock.ComboChange(Sender: TObject);
Var sl:TStringlist;
Begin
   sl:=TStringlist(TComboBox(ctrld).Items);
   try
    if TComboBox(ctrld).ItemIndex>-1 then
    Begin
      Paramd:=sl[TComboBox(ctrld).ItemIndex];
      FPDevice:=Integer(sl.Objects[TComboBox(ctrld).ItemIndex]);
      //TComboBox(ctrld).ClearSelection;
    End;
   except
    fParam1:=0;
   end;
End;

procedure TDspBlock.edit1Change(Sender: TObject);
begin
  if tdspedit(ctrl1).Text<>'' then  Begin
   fParam1:=strtoint(tdspedit(ctrl1).Text);
    //updn1.Position:=fParam1;
  End;
end;

procedure TDspBlock.edit2Change(Sender: TObject);
begin
  if tdspedit(ctrl2).Text<>'' then begin
    fParam2:=strtoint(tdspedit(ctrl2).Text);
//    updn2.Position:=fParam2;
  end;
end;

procedure TDspBlock.edit3Change(Sender: TObject);
begin
  fParamStr:=tdspedit(ctrlS).Text;
  MyHint:=fMyhint;
  RecalcWidth;
end;


procedure TDspBlock.MakeBorderUp;
var
  X, Y, W, H: Integer;
  k:integer;
Begin
  X := lnw;
  Y := X;
  W := Width - lnw-1;
  H := Height - lnw-1 ;

  k:=1;                   //skip one for connect

  Setlength(borderUp, 2);
  borderUp[k] := point(X, Y);
  if topnose then
  Begin
    makenose(borderUp,X+nospadUp,Y);
  End;
  k:=length(borderUp);
  Setlength(borderUp, k+1);
  borderUp[k] := point(X+W,Y);

End;

procedure TDspBlock.MakeBorderDn;
var
  X, Y, W, H: Integer;
  k:integer;
Begin
  X := lnw;
  Y := X;
  W := Width - lnw-1;
  H := Height - lnw-1 ;
  k:=1;  //skip 1st point for connect

  Setlength(borderDn, 2);
  borderDn[k] := point(X+W,Y+H-nosh);
  if botnose then
  Begin
    makenose(borderDn,X+nospadDn,Y+H-nosh,false);
  End;
  k:=length(borderDn);
  Setlength(borderDn, k+1);
  borderDn[k] := point(X,Y+H-nosh);

End;

procedure TDspBlock.CMColorChanged(var Message: TMessage);
begin
 inherited;
 if assigned(ctrlD) then
   TComboBox(ctrlD).Color:=LightenColor(Color,30);
end;

procedure TDspBlock.CMMouseEnter(var Message: TMessage);
begin
// if not (ctrl1.Focused or ctrl2.Focused or ctrlD.Focused or ctrlS.Focused) then
//  SetFocus;
end;

procedure TDspBlock.CMMouseLeave(var Message: TMessage);
begin


end;

procedure TDspBlock.ConnectBorders;
Var siz:integer;
    i:integer;
Begin
   borderUp[0]:=borderDn[length(borderDn)-1];//start with the last of border dn
   borderDn[0]:=borderUp[length(borderUp)-1];
   borderUp[0].Y:=borderUp[0].Y-2*lnw;
   borderUp[length(borderUp)-1].X:=borderUp[length(borderUp)-1].X-2*lnw;
   siz:=length(borderup)+length(borderDn);
   Setlength(a,siz);
   for i:= 0 to length(borderUp)-1 do
     a[i]:=borderup[i];
   for i:= 0 to length(borderDn)-1 do
     a[length(borderUp)+i]:=borderdn[i];

End;

procedure TDspBlock.makenose(var a:TPointArray;nx,ny:integer;isUP:boolean=true);
 var noshw:integer;
     k:Integer;
 begin
    //t:=nosw div 4;
    noshw:=nosw div 4;
    k:=length(a);
    Setlength(a, k+4);
    if isUP then     //start from left side
    begin
     a[k] := point(nx,ny);
     a[k+1] := point(nx+noshw ,ny+nosh);
     a[k+2] := point(nx+3*noshw ,ny+nosh);
     a[k+3] := point(nx+4*noshw,ny);
     ActivePointUp.X:=nx+2*noshw;
     ActivePointUp.Y:=ny;
    end
    else
    Begin
     a[k+3] := point(nx,ny);
     a[k+2] := point(nx+noshw ,ny+nosh);
     a[k+1] := point(nx+3*noshw ,ny+nosh);
     a[k] := point(nx+4*noshw,ny);
     ActivePointDn.X:=nx+2*noshw;
     ActivePointDn.Y:=ny;

    End;
 end;




{ tComboHack }

procedure tComboHack.WMPaint(var Msg: TMessage);
var
  C: TControlCanvas;
  R: TRect;
begin
  inherited;
  C := TControlCanvas.Create;
  try
  C.Control := Self;
  with C do
  begin
    Brush.Color := TDspBlock(parent).color;
    R := ClientRect;
    FrameRect(R);
    InflateRect(R, - 1, - 1);
    FrameRect(R);
    end;
  finally
    C.Free;
  end;end;

initialization
 System.Classes.Registerclass(TDspBlock);


end.
