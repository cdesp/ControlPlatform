unit unCtrlPlatMain;


interface

uses  Vcl.Dialogs, CPort, System.Classes,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Buttons,Winapi.Windows,unBlock,Winapi.Messages,System.SysUtils, System.Variants,
  unContainerBlock,Vcl.Graphics, Vcl.TabNotBk, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.jpeg, VCLTee.TeCanvas, Vcl.ToolWin, Vcl.Samples.Spin,
  Vcl.OleCtrls, SHDocVw;


Const ProjectStart='10/10/2017';
Const Version='0.61 (Άλφα έκδοση 6/11/2017)  - ';
Const Programmer='© 2017 Despoinidis Christos';
Const Progname='Έλεγχος συσκευών Arduino';
Const Onlybluetooth=FALSE;
const WM_REFRESH_MSG = WM_USER + 1;
const WM_REFVARS_MSG = WM_USER + 252;



type


  TRoboCmd=record
    ComndID:Integer;
    Param1:Integer;
    Param2:Integer;
  end;


  RoboCommands=Array of TRoboCmd;

  TfrmRoboLang = class(TForm)
    ListBox1: TListBox;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ImageList1: TImageList;
    FlowPanel2: TFlowPanel;
    SpeedButton1: TSpeedButton;
    ActionList1: TActionList;
    acopen: TAction;
    acsave: TAction;
    acsaveas: TAction;
    acexit: TAction;
    SpeedButton2: TSpeedButton;
    acSerialport: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    acConnect: TAction;
    SpeedButton3: TSpeedButton;
    ComPort1: TComPort;
    Splitter1: TSplitter;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SBar: TStatusBar;
    acSndLeft: TAction;
    acSndRight: TAction;
    SpeedButton6: TSpeedButton;
    acStop: TAction;
    SpeedButton7: TSpeedButton;
    acNew: TAction;
    SpeedButton8: TSpeedButton;
    N10: TMenuItem;
    acSetServer: TAction;
    Timer1: TTimer;
    TNBook: TTabbedNotebook;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    pnlLCD: TPanel;
    Image1: TImage;
    Label1: TLabel;
    LCDadd: TBitBtn;
    lblLCD: TLabel;
    BalloonHint1: TBalloonHint;
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    lblLaser: TLabel;
    LaserAdd: TBitBtn;
    DevBook: TTabbedNotebook;
    RadioGroup1: TRadioGroup;
    pnlSound: TPanel;
    Image4: TImage;
    Label3: TLabel;
    lblSound: TLabel;
    SoundAdd: TBitBtn;
    pnlUSonic: TPanel;
    Image5: TImage;
    Label4: TLabel;
    lblUSonic: TLabel;
    USonicAdd: TBitBtn;
    pnlServo: TPanel;
    Image6: TImage;
    Label5: TLabel;
    lblServo: TLabel;
    ServoAdd: TBitBtn;
    pnlSwitch: TPanel;
    Image7: TImage;
    Label6: TLabel;
    lblSwitch: TLabel;
    SwitchAdd: TBitBtn;
    pnlTemp: TPanel;
    Image8: TImage;
    Label7: TLabel;
    lblTemp: TLabel;
    TempAdd: TBitBtn;
    CategoryPanelGroup1: TCategoryPanelGroup;
    MovPanel: TCategoryPanel;
    variousPanel: TCategoryPanel;
    CtrlPanel: TCategoryPanel;
    LoopPanel: TCategoryPanel;
    strtPanel: TCategoryPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    CategoryPanelGroup2: TCategoryPanelGroup;
    LCDpanel: TCategoryPanel;
    LaserPanel: TCategoryPanel;
    SoundPanel: TCategoryPanel;
    USonicPanel: TCategoryPanel;
    ServoPanel: TCategoryPanel;
    SwitchPanel: TCategoryPanel;
    TempPanel: TCategoryPanel;
    TabSheet3: TTabSheet;
    CategoryPanelGroup3: TCategoryPanelGroup;
    VarPanel: TCategoryPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Splitter3: TSplitter;
    TreeView1: TTreeView;
    Label8: TLabel;
    Panel2: TPanel;
    WebBrowser1: TWebBrowser;
    ScrollBox3: TScrollBox;
    ArduPinout: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acexitExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acConnectExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CategoryPanelGroup1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure acsaveExecute(Sender: TObject);
    procedure acopenExecute(Sender: TObject);
    procedure acsaveasExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure CategoryPanelGroup1MouseEnter(Sender: TObject);
    procedure ScrollBox1MouseEnter(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
    procedure acStopExecute(Sender: TObject);
    procedure acNewExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SBarDblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LCDaddClick(Sender: TObject);
    procedure DevBookChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ScrollBox2MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure TNBookChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
  private
    NewVarName:String;
    ComIdle:boolean;
    ChkByte:Byte;
    srvCodeRec:boolean;
    frmLoadPos:Boolean;
    procedure OnRefVarRequest(var Msg: TMessage); message WM_REFVARS_MSG;
    function GetStartBlock: TDspBlock;
    function BTgetChar: Char;
    procedure BTPutChar(c: Char;dochk:boolean=true);
    function BTOpen:boolean;
    function BTCharReady: Boolean;
    procedure SendCommands(blck: TDspBlock);
    procedure CreateMoveCommands;
    procedure CreateStartCommands;
    procedure CreateLoopCommands;
    procedure CreateControlCommands;
    procedure CreateCommands;
    procedure CreateVariousCommands;
    procedure BTSendInteger(k: integer);
    procedure splitInteger(k: integer; var b1, b2: char);
    procedure emptycomps;
    procedure SendcmdsTest(blck: TDspBlock);
    procedure DoCheckByte(c: Char);
    procedure DoNewDoc;
    function Hasblocks: Boolean;
    procedure MySetCaption;
    procedure MyMessage(var Msg: TWMMove); message WM_MOVE;
    procedure SaveFormPos;
    function LoadFormPos:boolean;
    procedure SelectNextPort;
    procedure LoadBTPort;
    procedure SaveBTPort;
    function GetBTPortFromFile: string;
    procedure CreateLCDCommands;
    procedure addDevClick(Sender: TObject);
    procedure DeviceChanged;
    procedure CreateLaserCommands;
    procedure CreateSoundCommands;
    procedure CreateUltraSonicCommands;
    function GetActiveDeviceParam(DevNo, PrmNo: Integer): Integer;
    procedure CreateServoCommands;
    procedure ResetArduino;
    procedure CreateSwitchCommands;
    procedure CreateTempCommands;
    procedure CreateBlocksFromVars;
    procedure CreateVarCommands;
    function MakeInt(v1, v2: byte): integer;
    procedure DeleteVarBlocks;
    procedure CompReadError(Reader: TReader; const Message: string;
      var Handled: Boolean);
    procedure LoadNode(Node: TTreeNode);
    procedure LoadNodeName(NodeName: String);
    procedure NewMaxPins;
    procedure Refname(Reader: TReader; var name: string);
    procedure CreateComp(Reader: TReader; ComponentClass: TComponentClass;
      var Component: TComponent);
    { Private declarations }
  public
    { Public declarations }
    function GetActiveDevicePins(DevTp:integer=-1): tStrings;
    procedure AddDebug(s: String);
    function getFullCaption: String;
    procedure addDevices;
    function getPanelCountLabel(pnl: TPanel): TLabel;
    function getPanelAddButton(pnl: TPanel): TBitBtn;
    procedure CommandsByType(typeid: Integer; Enable: Boolean=True);
  end;

  Procedure AddDebug(s:String);




var
  frmRoboLang: TfrmRoboLang;
  blck:TDspBlock;
  IsServer:boolean=false; //false;
  ipAddr:String='';
  BTComList:TStringList;
  BTIndex:integer=-1;
  MainPath:String;


implementation
uses Registry, system.ioutils,unAbout, inifiles,setupapi,math,  unDevices, unHelpForms,unUtils,unVariables,unBlockVar,
      fserialLcd,fLaser,fSound,fUSonic,fServo,fSwitch,fTemp
    ;


{$R *.dfm}

function GetComputerName: string;
var
  buffer: array[0..MAX_COMPUTERNAME_LENGTH + 1] of Char;
  Size: Cardinal;
begin

  Size := MAX_COMPUTERNAME_LENGTH + 1;
  Winapi.Windows.GetComputerName(buffer, Size);
  Result := StrPas(buffer);
end;

Procedure SetupEnumAvailableComPorts(res:TstringList);
// Enumerates all serial communications ports that are available and ready to
// be used.

// For the setupapi unit see
// http://homepages.borland.com/jedi/cms/modules/apilib/visit.php?cid=4&lid=3

var
  RequiredSize:             Cardinal;
  Guid:                     TGUID;
  DevInfoHandle:            HDEVINFO;
  DeviceInfoData:           TSPDevInfoData;
  MemberIndex:              Cardinal;
  PropertyRegDataType:      DWord;
  RegProperty:              Cardinal;
  RegTyp:                   Cardinal;
  Key:                      Hkey;
  Info:                     TRegKeyInfo;
  S1,S2:                    string;
  hc:                       THandle;
  GUIDSize :                DWord;
begin
//If we cannot access the setupapi.dll then we return a nil pointer.
  if not LoadsetupAPI then exit;
  try
    GUIDSize := 1;
// get 'Ports' class guid from name
    if SetupDiClassGuidsFromName('Ports',@Guid,GUIDSize,RequiredSize) then begin
//get object handle of 'Ports' class to interate all devices
       DevInfoHandle:=SetupDiGetClassDevs(@Guid,Nil,0,DIGCF_PRESENT);
       if Cardinal(DevInfoHandle)<>Invalid_Handle_Value then begin
         try
           MemberIndex:=0;
//iterate device list
           repeat
             FillChar(DeviceInfoData,SizeOf(DeviceInfoData),0);
             DeviceInfoData.cbSize:=SizeOf(DeviceInfoData);
//get device info that corresponds to the next memberindex
             if Not SetupDiEnumDeviceInfo(DevInfoHandle,MemberIndex,DeviceInfoData) then
               break;
//query friendly device name LIKE 'BlueTooth Communication Port (COM8)' etc
             RegProperty:=SPDRP_FriendlyName;{SPDRP_Driver, SPDRP_SERVICE, SPDRP_ENUMERATOR_NAME,SPDRP_PHYSICAL_DEVICE_OBJECT_NAME,SPDRP_FRIENDLYNAME,}
             SetupDiGetDeviceRegistryProperty(DevInfoHandle,DeviceInfoData,
                                                   RegProperty,
                                                   PropertyRegDataType,
                                                   NIL,0,RequiredSize);
             SetLength(S1,RequiredSize);
             if SetupDiGetDeviceRegistryProperty(DevInfoHandle,DeviceInfoData,
                                                 RegProperty,
                                                 PropertyRegDataType,
                                                 @S1[1],RequiredSize,RequiredSize) then begin
               KEY:=SetupDiOpenDevRegKey(DevInfoHandle,DeviceInfoData,DICS_FLAG_GLOBAL,0,DIREG_DEV,KEY_READ);
               if key<> INValid_Handle_Value then begin
                 FillChar(Info, SizeOf(Info), 0);
//query the real port name from the registry value 'PortName'
                 if RegQueryInfoKey(Key, nil, nil, nil, @Info.NumSubKeys,@Info.MaxSubKeyLen, nil, @Info.NumValues, @Info.MaxValueLen,
                                                        @Info.MaxDataLen, nil, @Info.FileTime) = ERROR_SUCCESS then begin
                   RequiredSize:= Info.MaxValueLen + 1;
                   SetLength(S2,RequiredSize);
                   if RegQueryValueEx(KEY,'PortName',Nil,@Regtyp,@s2[1],@RequiredSize)=Error_Success then begin
                     If (Pos('COM',S2)=1) then begin
//Test if the device can be used
           //            hc:=CreateFile(pchar('\\.\'+S2+#0),
           //                           GENERIC_READ or GENERIC_WRITE,
           //                           0,
           //                           nil,
           //                           OPEN_EXISTING,
           //                           FILE_ATTRIBUTE_NORMAL,
           //                           0);
           //            if hc <>INVALID_HANDLE_VALUE then begin
                         Res.Add(Strpas(PChar(S2))+': = '+StrPas(PChar(S1)));
           //              CloseHandle(hc);
           //            end;
                     end;
                   end;
                 end;
                 RegCloseKey(key);
               end;
             end;
             Inc(MemberIndex);
           until False;
//If we did not found any free com. port we return a NIL pointer.


         finally
           SetupDiDestroyDeviceInfoList(DevInfoHandle);
         end;
       end;
    end;
  finally
    UnloadSetupApi;
  end;
end;

procedure getComPortList(retst:TStrings);
var
  reg: TRegistry;
  st: Tstrings;
  i: Integer;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('hardware\devicemap\serialcomm', False);
    st := TstringList.Create;
    try
      reg.GetValueNames(st);
      for i := 0 to st.Count - 1 do
        if (Onlybluetooth and (pos('bt',Lowercase(st.strings[i]))>0)) or not Onlybluetooth  then
          retst.Add(reg.Readstring(st.strings[i]));
    finally
      st.Free;
    end;
    reg.CloseKey;
  finally
    reg.Free;
  end;
end;

procedure LoadComponentFromFile(parent: TComponent; const FileName: TFileName; MyStream:TMemoryStream=Nil);forward;

Procedure AddDebug(s:String);
Begin
 frmRoboLang.addDebug(s);

End;


function GetBlutoothComPort(BTComList:TStrings): String;
var        S, S1: String;
           Item,Item2: Integer;
           Reg: TRegistry;
           KeyList1, KeyList2: TStringList;

begin
  result :='';

  Reg := TRegistry.Create;
  if Reg = nil then begin
    AddDebug( 'Error creating Reg ' );
    exit; end;
  KeyList1 := TStringList.Create;
  if KeyList1 = nil then begin
    AddDebug( 'Error creating KeyList1 ' );
    exit; end;
  KeyList2 := TStringList.Create;
  if KeyList2 = nil then begin
    AddDebug( 'Error creating KeyList2 ' );
    exit; end;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    S := '\SYSTEM\CurrentControlSet\Enum\BTHENUM\';
    AddDebug( 'Key: ' + S );
    try
      Reg.OpenKeyReadOnly(S);
      Reg.GetKeyNames(KeyList1);
      For Item := 0 to KeyList1.Count-1 do
      begin
        S1 := KeyList1.Strings[Item];
        Reg.OpenKeyReadOnly(S + S1);
        Reg.GetKeyNames(KeyList2);
        For Item2 := 0 to KeyList2.Count-1 do
        begin
           S1 := S + KeyList1.Strings[Item] + '\' + KeyList2.Strings[Item2] + '\Device Parameters';
           Reg.OpenKeyReadOnly(S1);
           If Reg.ValueExists('PortName') then
           begin
             S1 := Reg.ReadString('PortName');
             if S1<>'' then
             Begin
               BTComList.Add(S1);
               AddDebug( 'Bluetooth Port Added: ' + S1 );
             End;
           end else
             AddDebug( 'Bluetooth Port NOT Added: ' + S1 );
        end;
      end;
    except
        AddDebug( 'Error finding Bluetooth' );
    end;
  finally
    Reg.Free;
    KeyList1.Free;
    KeyList2.Free;
  end;
  if BTComList.Count>0 then
  Begin
   BTIndex:=0;
   Result:=BTComList[0];
  End;
end;

procedure TfrmRoboLang.DevBookChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
// allowchange:= NewTab>0;

end;

procedure TfrmRoboLang.DoCheckByte(c:Char);
Begin
  ChkByte :=  ChkByte xor byte(c);
End;

procedure TfrmRoboLang.BTPutChar(c:Char;dochk:boolean=true);
begin
  if dochk then
    DoCheckByte(c);
  Comport1.Write(c,1)
End;

function TfrmRoboLang.BTgetChar:Char;
var n:integer;
Begin

 n:=   ComPort1.Read(Result,1);
 if n=0 then
  result:=' ';
End;

procedure TfrmRoboLang.SendcmdsTest(blck:TDspBlock);
var nxtblock:TDspBlock;
Begin
  NxtBlock:=blck;
  while Assigned(nxtblock) do
  Begin
    Adddebug('Sending '+inttostr(NxtBlock.CommndID)
     +' '+inttostr(NxtBlock.Param1)
     +' '+inttostr(NxtBlock.Param2)
    );

    if NxtBlock is TDspContainerBlock then
      SendcmdsTest(nxtblock.FirstBlock);

    NxtBlock:=NxtBlock.LinkTo;
  End;

End;

procedure TfrmRoboLang.BitBtn1Click(Sender: TObject);
begin
 ScrollBox1.VertScrollBar.Range:=2000;
 ScrollBox1.HorzScrollBar.Range:=2000;
end;

procedure TfrmRoboLang.BitBtn2Click(Sender: TObject);
var
  AHeight, AWidth: Integer;
begin
  AHeight := Max(ScrollBox1.VertScrollBar.Range, ScrollBox1.Height);
  AWidth := Max(ScrollBox1.HorzScrollBar.Range, ScrollBox1.Width);
  AddDebug(inttostr(AHeight));
  AddDebug(inttostr(AWidth));

end;


function TfrmRoboLang.BTCharReady:Boolean;
var c:char;
Begin
 result:= ComPort1.InputCount > 0 ;   //doesnot work
 Comport1.Read(c,1);
 adddebug('Char:'+c);
End;


function TfrmRoboLang.BTOpen:boolean;
Var cp:String;
begin
  result:=true;
  if comport1.connected or (BTIndex=-1) then exit;
  try
    cp:=BTComList[BTIndex];
    Comport1.Port:= cp;
  except

  end;
  adddebug( cp);



  try
    comport1.Open;
  except
   on e:exception do
   Begin
    AddDebug(e.Message);
    result:=false;
    exit;
   End;
  end;
  if comport1.connected then
   adddebug('Success');

End;

procedure TfrmRoboLang.ScrollBox1MouseEnter(Sender: TObject);
begin
  // scrollbox1.SetFocus;
end;

procedure TfrmRoboLang.ScrollBox1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  I: Integer;
begin
    for I := 1 to Mouse.WheelScrollLines do
    try
      if WheelDelta > 0 then
        ScrollBox1.Perform(WM_VSCROLL, SB_LINEUP, 0)
      else
        ScrollBox1.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
    finally
      ScrollBox1.Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
    end;
end;

procedure TfrmRoboLang.ScrollBox2MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  I: Integer;
begin
    for I := 1 to Mouse.WheelScrollLines do
    try
      if WheelDelta > 0 then
        TWinControl(Sender).Perform(WM_VSCROLL, SB_LINEUP, 0)
      else
        TWinControl(Sender).Perform(WM_VSCROLL, SB_LINEDOWN, 0);
    finally
      TWinControl(Sender).Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
    end;

end;

procedure TfrmRoboLang.splitInteger(k:integer;var b1:char;var b2:char);
Begin
   b2:=char(trunc(k/256)); //high byte
   b1:=char((k-(byte(b2)*256))); //low byte
End;

procedure TfrmRoboLang.Timer1Timer(Sender: TObject);
var CodeStream:TMemoryStream;
begin
  timer1.Enabled:=false;
  CodeStream:=TMemoryStream(timer1.tag);
  timer1.tag:=0;
  LoadComponentFromFile(Scrollbox1,'',CodeStream);
  CodeStream.Free;
end;


procedure TfrmRoboLang.TNBookChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
 if newtab=2 then
    TreeView1.FullExpand;
end;

procedure TfrmRoboLang.ToolButton1Click(Sender: TObject);
var t:TDspVarBlock;
    varcolor:TColor;
    cmdName:String;
    avar:TArduVar;

    function getLastBlockBottom:Integer;
    var i,mx:integer;
        wc:TWinControl;
    Begin
      mx:=40;
      wc:=TWinControl(VarPanel.Controls[0]);
      for i := 0 to wc.controlCount-1 do
       if wc.Controls[i] is TDspBlock then
        mx:=Max(mx,TDspBlock(wc.Controls[i]).Top+TDspBlock(wc.Controls[i]).Height);

      Result:=mx+10;

    End;

begin

 // VarColor:=StringtoColor('$008A4B08');
 VarColor:=HTMLtoColor('#084B8A');
//Create new Variable

  t:= TDspVarBlock.create(Self);
  t.Visible:=false;
  t.parent:=VarPanel;
  t.Color:=varcolor;
  if assigned(sender) then
    cmdName:=InputBox('Δώσε όνομα μεταβλητής','Όνομα','Μεταβλητή')
  else
    cmdName:=NewVarName;
  t.CommandText:=cmdName;
  t.param1question:=cmdName;
  if assigned(sender) then
    avar:=ArduVars.Newvar(cmdName)
  else
    avar:=ArduVars.GetVarByName(cmdName);
  t.CommndID:=avar.VarID;
  t.CommandColor:=clWhite;
  t.TotalParams:=1;
  t.Left:=10;
  t.Top:=getLastBlockBottom;
  t.Visible:=True;
end;

procedure TfrmRoboLang.ToolButton2Click(Sender: TObject);
 //Διαγραφή Μεταβλητής
var i:integer;
    wc:TWinControl;
    bpos:Integer;

    procedure repositionBlocks;
    var i:integer;
    Begin
       for I := 0 to wc.controlCount-1 do
         if wc.Controls[i] is TDspVarBlock then
            if TDspVarBlock(wc.Controls[i]).Top> bpos then
             TDspVarBlock(wc.Controls[i]).Top:=TDspVarBlock(wc.Controls[i]).Top-TDspVarBlock(wc.Controls[i]).Height-10;

    End;

    procedure KillCloneVarByName(nm:String);
    Var i:Integer;
        Container:TWinControl;
        tb:TDspBlock;
    Begin
       Container:=Scrollbox1;
       for I := Container.ControlCount-1 downto 0 do
         if Container.Controls[i] is TDspVarBlock then
         Begin
          if sametext(nm,TDspVarBlock(Container.Controls[i]).param1question) then
           TDspVarBlock(Container.Controls[i]).Free;// destroy only this
         End
         else if Container.Controls[i] is TDspblock Then
         Begin
          if assigned(TDspblock(Container.Controls[i]).VarParam1) and  sametext(nm,TDspblock(Container.Controls[i]).VarParam1.param1question)  then
          Begin
            tb:=TDspblock(Container.Controls[i]).VarParam1;
            TDspblock(Container.Controls[i]).VarParam1:=nil;
            tb.Free;
          End;
          if assigned(TDspblock(Container.Controls[i]).VarParam2) and  sametext(nm,TDspblock(Container.Controls[i]).VarParam2.param2question)  then
          Begin
            tb:=TDspblock(Container.Controls[i]).VarParam2;
            TDspblock(Container.Controls[i]).VarParam2:=nil;
            tb.Free;
          End;

         End;

    End;
Begin
      wc:=TWinControl(VarPanel.Controls[0]);
      for i := wc.controlCount-1 downto  0 do
       if wc.Controls[i] is TDspVarBlock then
         if TDspVarBlock(wc.Controls[i]).ToDelete then
           Begin
             ArduVars.DeleteVar(TDspVarBlock(wc.Controls[i]).param1question);
             bpos:=TDspVarBlock(wc.Controls[i]).Top;
             KillCloneVarByName(TDspVarBlock(wc.Controls[i]).param1question);
             TDspVarBlock(wc.Controls[i]).Free;
             RepositionBlocks;

           End;

end;



procedure TfrmRoboLang.LoadNodeName(NodeName: String);
var pth:String;
Begin
  NodeName:=NodeName+'.htm';
  pth:=extractfilepath(NodeName);
  if not fileexists(pth) then
    CreateDir(pth);

  Label8.Caption:=NodeName;
  if not fileexists(NodeName) then
   NodeName:=Changefileext(NodeName,'.html');
  if not fileexists(NodeName) then
   NodeName:=Changefileext(NodeName,'.mht');
  if not fileexists(NodeName) then
   NodeName:=Changefileext(NodeName,'.mhtml');

  if  fileexists(NodeName) then
   WebBrowser1.Navigate(NodeName)
  else
  Begin
   pth:=TDirectory.GetParent(ExcludeTrailingPathDelimiter(pth));
   WebBrowser1.Navigate(pth+'\Error.mht');
  End;

  
End;

procedure TfrmRoboLang.LoadNode(Node: TTreeNode);
Var nm,pth:String;
Begin
  pth:='';
  if assigned(Node.Parent) then
  Begin
   pth:=Node.Parent.Text;
   nm:=Node.Text;
   LoadNodeName(Mainpath+'Lessons\'+pth+'\'+nm);
  End;
End;


procedure TfrmRoboLang.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
   LoadNode(Node);
end;

procedure TfrmRoboLang.BTSendInteger(k:integer);
var b1,b2:char;
Begin
  splitInteger(k,b1,b2);
  BTPutChar(b1);
  BTPutChar(b2);
  sleep(20);
End;

procedure TfrmRoboLang.SendCommands(blck:TDspBlock);
var nxtblock:TDspBlock;
     i,vid,vid2:Integer;
     myvar:TArduVar;
Begin
  NxtBlock:=blck;
  while Assigned(nxtblock) do
  Begin
    BTSendInteger( NxtBlock.CommndID);
    BTSendInteger( NxtBlock.PDevice);//device id -1 for no device
    BTSendInteger( NxtBlock.Param1);
    vid:=-1;vid2:=-1;
    if assigned(NxtBlock.VarParam1) then
    Begin
       if NxtBlock.VarParam1.CommndID>=75 then //fix variable resolve in Arduino
         vid:=NxtBlock.VarParam1.CommndID
       else
       Begin
         myvar:=ArduVars.GetVarByName(NxtBlock.VarParam1.param1question);
         vid:=myvar.VarID;
       End;
    End;
    if assigned(NxtBlock.VarParam2) then
    Begin
       if NxtBlock.VarParam1.CommndID>=75 then //fix variable resolve in Arduino
         vid2:=NxtBlock.VarParam1.CommndID
       else
       Begin
          myvar:=ArduVars.GetVarByName(NxtBlock.VarParam2.param1question);
          vid2:=myvar.VarID;
       End;
    End;

    BTSendInteger(vid);
    BTSendInteger(vid2);  //TODO:Make varparam2
    Adddebug('Sending CMD='+inttostr(NxtBlock.CommndID)
     +' Dev= '+inttostr(NxtBlock.pDevice)
     +' p_1='+inttostr(NxtBlock.Param1)
     +' v_1='+inttostr(vid)
     +' v_1='+inttostr(vid2)
     +' p_2='+inttostr(NxtBlock.Param2)

    );

    if NxtBlock.paramstr<>'' then
    Begin
       NxtBlock.Param2:=Length(NxtBlock.paramstr);
       BTSendInteger( NxtBlock.Param2+1);
       for i := 1 to NxtBlock.Param2 do
       Begin
          Adddebug('Sending ch:'+NxtBlock.paramstr[i]);
           BTPutChar(NxtBlock.paramstr[i]);
       End;
        BTPutChar(#0);
    end
    else
      BTSendInteger( NxtBlock.Param2);

    {c:=Char(NxtBlock.CommndID);
    BTPutChar(c);
    p1:=Char(NxtBlock.Param1);
    BTPutChar(p1);
    p2:=Char(NxtBlock.Param2);
    BTPutChar(p2);}


    if NxtBlock is TDspContainerBlock then  //send container commands
      SendCommands(nxtblock.FirstBlock);
    if NxtBlock is TDspControlElseBlock and TDspControlElseBlock(NxtBlock).elsevisible then //send else container commands
      SendCommands(TDspControlElseBlock(nxtblock).ElseBlock);
    NxtBlock:=NxtBlock.LinkTo;
  End;

End;

procedure TfrmRoboLang.ResetArduino;
Begin
 if comport1.connected then //reset arduino to clear memory
 begin
   comport1.SetDTR(true);
   comport1.SetDTR(false);
   sleep(2000);
 end;

End;

function TfrmRoboLang.MakeInt(v1,v2:byte):integer;
Begin
      Result:=v1 and (v1 shl 8);  //no vars on setup devices
End;

procedure TfrmRoboLang.acConnectExecute(Sender: TObject);
Var strt:TDspBlock;
    t:cardinal;
    roboready:Boolean;

    cnt:Integer;
    I,k: Integer;
    CommndID,param1,param2:integer;
begin

  ResetArduino;
  strt:=GetStartBlock;
  if strt=nil then
  Begin
    ShowMessage('Δεν βρέθηκε το block "Έναρξη Προγράμματος" !!!');
    exit;
  End;

  Speedbutton3.Repaint;
  if not BTOpen then
  Begin
    Showmessage('Σφάλμα Σύνδεσης με Bluetooth Port: '+comport1.Port+#13'Πατήστε διπλό κλικ στο όνομα της πόρτας κάτω αριστερά για επιλογή άλλης και ξαναπροσπαθήστε.');
    exit;
  End;

  comIdle:=false;

  BTPutChar('1');//send code for programming
  t:=GetTickCount;
//  roboready:=false;
  repeat
     roboready:= BTGetChar='R';
  until RoboReady or ((gettickcount-t)>5000); //2 secs
  if not roboready then
  Begin
    ShowMEssage('Το Arduino δεν ανταποκρίνετε!!!. Ξαναδοκιμάστε.');
    comport1.Connected:=false;
    Exit;

  End;



  strt.getDspBlockListSize(strt,cnt);
  adddebug('Blocks:'+inttostr(cnt));
  //14/10/2017 add devices setup commands
  cnt:=cnt+ActDevsCount+1; //for 0 add 1

  //---
  BTPutChar(char(cnt));     //commands size

  ChkByte:=0;
  //14/10/2017 Send SETUP Device commands
  for I := 0 to ActDevsCount do
  Begin
    k:=0;
    repeat //always send 2 params for more just send again the same command with the next 2 params
     CommndID:=ArduinoDevices[ActDevs[i].DeviceTypeID].DeviceCmdId;
     Param1:=ActDevs[i].ActDevParams[k];
     Param2:=ActDevs[i].ActDevParams[k+1];
     adddebug('------------------------');
     adddebug('Setup Cmd:'+inttostr(CommndID));
     adddebug('Device ID:'+inttostr(i));
     adddebug('Param 1  :'+inttostr(Param1));
     adddebug('Vars 1   :'+inttostr(-1));
     adddebug('Vars 2   :'+inttostr(-1));
     adddebug('Param 2  :'+inttostr(Param2));
     adddebug('------------------------');
     BTSendInteger(CommndID);
     BTSendInteger(i); //device id
     BTSendInteger(Param1);
     BTSendInteger(-1); BTSendInteger(-1); //No Vars
     BTSendInteger(Param2);//param2 always last because of string vars

     k:=k+2;
    until k>=ActDevs[i].ActDevParamCount;
  End;
  //------------
  SendCommands(strt);
  repeat
     BTPutChar(chr(253),false); //Execute Code transfered
     sleep(150);
     roboready:= BTGetChar='R';
  until RoboReady or ((gettickcount-t)>5000); //2 secs

  //send check byte
  if chkbyte=253 then chkbyte:=254;

  BTPutChar(chr(ChkByte),false);
  AddDebug(inttostr(ChkByte));

  adddebug('PROGRAM TRANSFERED');
  comIdle:=true;
end;

procedure TfrmRoboLang.AddDebug(s:String);
Begin
   Listbox1.items.add(s);
   sendmessage( listbox1.handle, WM_VSCROLL,
               SB_LINEDOWN, 0);
End;

procedure TfrmRoboLang.Button1Click(Sender: TObject);
begin
BTOpen;
 BTPutChar('X'); //Execute Code transfered
end;

procedure TfrmRoboLang.acexitExecute(Sender: TObject);
begin
  Close;
end;


procedure TfrmRoboLang.DoNewDoc;
var
  i: Integer;
Begin
   for i := 0 to componentcount-1 do
     if components[i] is TDSPBlock and not TDSPBlock(components[i]).prototype then
     begin
        components[i].Free;
        DoNewDoc;
        break;
     End;
End;

function TfrmRoboLang.Hasblocks:Boolean;
Var
    i:integer;
begin
    result:=false;
    for i := 0 to ScrollBox1.ControlCount-1 do
    Begin
      result:=scrollbox1.Controls[i] is TDSPBlock;
      if result then break;
    End;

End;


procedure TfrmRoboLang.acNewExecute(Sender: TObject);
begin

    if  (MessageDlg('Επιβεβαίωση', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
    Begin
      DeleteVarBlocks;
      arduvars.EmptyVars;
      ClearActiveDevices;
      DoNewDoc;
      SaveDialog1.FileName:='';
      OpenDialog1.FileName:='';
    End;
end;

Procedure MyWriteComponent(Stream:TStream;Instance:TComponent);
var
  Writer: TWriter;
begin
  Writer := TWriter.Create(Stream, 4096);
  try
    Writer.IgnoreChildren:=true;
    Writer.WriteDescendent(Instance, nil);
  finally
    Writer.Free;
  end;
End;

procedure SaveComponentToFile(Component: TComponent; const FileStream: TFileStream);
var
  MemStream : TMemoryStream;
begin
  MemStream := nil;

  if not Assigned(Component) then
    raise Exception.Create('Component is not assigned');

  try
    MemStream := TMemoryStream.Create;
    MyWriteComponent(MemStream,Component);
//    MemStream.WriteComponent(Component);
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, FileStream);
  finally
    MemStream.Free;
  end;
end;

procedure SaveComponentToStream(Component: TComponent; const MyStream: TMemoryStream);
var
  MemStream : TMemoryStream;
begin
  MemStream := nil;

  if not Assigned(Component) then
    raise Exception.Create('Component is not assigned');

  try
    MemStream := TMemoryStream.Create;
    MyWriteComponent(MemStream,Component);
//    MemStream.WriteComponent(Component);
    MemStream.Position := 0;
    ObjectBinaryToText(MemStream, MyStream);
  finally
    MemStream.Free;
  end;
end;


procedure TfrmRoboLang.CompReadError(Reader: TReader; const Message: string; var Handled: Boolean);
Begin
   AddDebug(Message);
   Handled:=True;
End;

procedure TfrmRoboLang.Refname(Reader: TReader;Var name:string);
Begin
  AddDebug(Name);
  //if reader.owner.owner=nil then
   //InsertComponent(Reader.owner);
End;

procedure TfrmRoboLang.CreateComp(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
begin
  AddDebug(ComponentClass.ClassName);
end;

procedure LoadComponentFromFile(parent: TComponent; const FileName: TFileName; MyStream:TMemoryStream=Nil);
var
  FileStream : TFileStream;
  MemStream : TMemoryStream;
  i: Integer;
  component,owner:TComponent;
  fl,fr:boolean;

  function ReadComponent(ms:TMemoryStream):TComponent;
  var
   Reader: TReader;
  begin
    Reader := TReader.Create(ms, 4096);
    Reader.OnError:=frmRoboLang.CompReadError;
    Reader.OnReferenceName:=frmRoboLang.Refname;
    Reader.OnCreateComponent:=frmRoboLang.CreateComp;
    try
      Result := Reader.ReadRootComponent(nil);
    finally
      Reader.Free;
    end;
  end;


begin
  MemStream := nil;
  owner:=parent.Owner;
  if not Assigned(parent) then
    raise Exception.Create('parent is not assigned');


  if FileExists(FileName) or (MyStream<>Nil) then
  begin
    if Mystream=nil then
      FileStream := TFileStream.Create(FileName,fmOpenRead)
    else MyStream.Position:=0;
    try
      //free existing comps
     frmRoboLang.DoNewDoc;
     application.ProcessMessages;
    repeat
     try
      MemStream := TMemoryStream.Create;
      if MyStream=nil then
        ObjectTextToBinary(FileStream, MemStream)
      else
        ObjectTextToBinary(MyStream, MemStream);
      MemStream.Position := 0;

      component:=ReadComponent(MemStream);
//      component:=MemStream.ReadComponent(nil);
      frmRoboLang.InsertComponent(Component);
      TDspBlock(component).parent:=TWinControl(parent);
    finally
      MemStream.Free;
    end;
      if mystream=nil then
       fl:=FileStream.Position=FileStream.Size
      else
      fl:= Mystream.Position=Mystream.Size;
    until fl;

    finally
     if Mystream=nil then
        FileStream.Free;
    end;

    for i := owner.ComponentCount - 1 downto 0 do
    begin
        if owner.Components[i] is TDspBlock and not TdspBlock(owner.Components[i]).prototype then
        Begin
            TDspBlock(owner.Components[i]).LinkToName:=TDspBlock(owner.Components[i]).fLinkToName;
            TDspBlock(owner.Components[i]).LinkFromName:=TDspBlock(owner.Components[i]).fLinkFromName;
            TDspBlock(owner.Components[i]).VarParam1Name:=TDspBlock(owner.Components[i]).fVarParam1Name;
            TDspBlock(owner.Components[i]).VarParam2Name:=TDspBlock(owner.Components[i]).fVarParam2Name;
        End;
        if owner.Components[i] is TDspContainerBlockEnd then
            TDspContainerBlockEnd(owner.Components[i]).FContainerBlock.EndBlock:=TDspContainerBlockEnd(owner.Components[i]);
        if owner.Components[i] is TDspControlBlockElse then
           TDspControlElseBlock( TDspControlBlockElse(owner.Components[i]).FContainerBlock).ElseBlock:=TDspControlBlockElse(owner.Components[i]);

    end;
  end;
end;


procedure TfrmRoboLang.CreateBlocksFromVars;
Var i:integer;
    av:TArduvar;
Begin
  for i := 0 to arduvars.Count-1 do
  Begin
    av:=arduvars.GetArduVar(i);
    if assigned(av) then
    Begin
      NewVarName:=av.VarName;
      ToolButton1Click(nil);
    End;
  End;
End;

procedure TfrmRoboLang.DeleteVarBlocks;
Var i:integer;
    wc:TWincontrol;
Begin
  wc:=TWinControl(VarPanel.Controls[0]);
  for i := 0 to wc.ControlCount-1 do
  Begin
     if wc.Controls[i] is TDspVarBlock then
       TDspVarBlock(wc.Controls[i]).todelete:=true;
  End;

  Toolbutton2click(nil);
End;


procedure TfrmRoboLang.acopenExecute(Sender: TObject);
Var k:integer;
begin

  if opendialog1.Execute then
  Begin
    k:=TNBook.PageIndex;
    DeleteVarBlocks;
    ArduVars.LoadVars(opendialog1.FileName);
    CreateBlocksFromVars;
    LoadActiveDevices(opendialog1.FileName);
    Application.ProcessMessages;

    LoadComponentFromFile(Scrollbox1,opendialog1.FileName);
    TNBook.PageIndex:=1;//Devices
    Application.ProcessMessages;
    TNBook.PageIndex:=0;//Program
    Application.ProcessMessages;
    SaveDialog1.FileName:=opendialog1.FileName;
    sbar.Panels[1].Text:=    opendialog1.FileName;
    TNBook.PageIndex:=k;
  End;
end;



procedure TfrmRoboLang.acsaveasExecute(Sender: TObject);
begin
   SaveDialog1.FileName:='';
   acsave.Execute;
end;

procedure TfrmRoboLang.acsaveExecute(Sender: TObject);
var i:integer;
    t:TDspBlock;
    FileStream : TFileStream;
    fname:string;
begin
   if not hasblocks then exit;
   
   fname:=SaveDialog1.FileName;
   if fname='' then
     if SaveDialog1.Execute then
       fname:=SaveDialog1.FileName;
   if fname='' then exit;

   FileStream := TFileStream.Create(fname,fmCreate);
   try
     for i := 0 to Pred(ComponentCount) do
      if Components[i] is TDspBlock and not TDspBlock(Components[i]).prototype then
      Begin
        t:=TDspBlock(Components[i]);

        SaveComponentToFile(t,FileStream);
      End;
   finally
      FileStream.Free;

   end;
   SaveActiveDevices(fname);
   ArduVars.SaveVars(fname);
   OpenDialog1.FileName:=Savedialog1.FileName;
   sbar.Panels[1].Text:=    opendialog1.FileName;


end;

procedure TfrmRoboLang.acStopExecute(Sender: TObject);
begin
 //comport1.connected:=false;
 try
  BTPutChar('0');
 except

 end;
end;

procedure TfrmRoboLang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    comport1.Close;
  except

  end;
  emptycomps;

end;

procedure TfrmRoboLang.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   ResetArduino;
end;

procedure TfrmRoboLang.CreateStartCommands;
Var col:Tcolor;
 tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=clGreen;
    pnl:=strtPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.topNose:=false;
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clAqua;
    blck.CommandColor:=clWhite;
    blck.CommndID:=1;
    blck.Commandtext:='Έναρξη προγράμματος';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;



    blck:=TDspBlock.Create(Self);
    blck.botNose:=false;
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clAqua;
    blck.CommandColor:=clWhite;
    blck.CommndID:=2;
    blck.Commandtext:='Τερματισμός προγράμματος';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;


    pnl.Height:=blck.Top+blck.Height+40;
End;

procedure TfrmRoboLang.CreateMoveCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=clBlue;
    pnl:=Movpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=5;
    blck.Commandtext:='Όρισε βήμα σε %p1 εκατοστά';
    blck.Param1:=10;
    blck.TotalParams:=1;
    blck.MyHint:='Η απόσταση μετακίνησης σε εκατοστά (>10 και <100)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=10;
    blck.Commandtext:='Μπροστά 1 βήμα';
    blck.MyHint:='Μετακίνηση προς τα εμπρός 1 βήματος (περίπου 10 εκατοστά)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=20;
    blck.Commandtext:='Πίσω 1 βήμα';
    blck.MyHint:='Μετακίνηση προς τα πίσω 1 βήματος (περίπου 10 εκατοστά)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=30;
    blck.Commandtext:='Στρίψε Δεξιά %p1 μοίρες';
    blck.TotalParams:=1;
    blck.MyHint:='Στροφή προς τα δεξιά (σε μοίρες)';
    blck.Param1:=90;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=40;
    blck.Commandtext:='Στρίψε Αριστερά %p1 μοίρες';
    blck.TotalParams:=1;
    blck.MyHint:='Στροφή προς τα αριστερά (σε μοίρες)';
    blck.Param1:=90;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=50;
    blck.Commandtext:='Σταμάτησε';
    blck.MyHint:='Σταματάει το ρομπότ';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLoopCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=clMaroon;
    pnl:=looppanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspLoopBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=70;
    blck.Commandtext:='Επανάλαβε %p1 φορές';
    TDspLoopBlock(blck).EndBlockText:='Τέλος Επανάληψης';
    blck.TotalParams:=1;
    blck.MyHint:='Επαναλαμβάνει τις εντολές που περιέχονται όσες φορές θέλουμε';
    blck.Param1:=5;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspLoopBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=72;
    blck.Commandtext:='Επανάλαβε συνεχώς';
    TDspLoopBlock(blck).EndBlockText:='Τέλος Επανάληψης';
    blck.TotalParams:=0;
    blck.MyHint:='Επαναλαμβάνει τις εντολές που περιέχονται για πάντα';
    blck.Param1:=0;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateControlCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=StringToColor('$00008282');
    pnl:=ctrlPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);
    //p2 is the value to check, p1 is positive or negative control

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=93;
    blck.Commandtext:='Εάν %p1 επαφή προφυλακτήρα';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=94;
    blck.Commandtext:='Εάν το pin %p2 %p1 είναι 1 (high=5 Volt)';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.param2question:='Δώσε το pin του Arduino ';
    blck.param2prompt:='pin';
    blck.param1prompt:='δεν';
    blck.TotalParams:=2;
    blck.param1:=55;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='for MEGA:A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=95;
    blck.Commandtext:='Εάν το pin %p2 %p1 είναι 0 (low=0 Volt)';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.param2question:='Δώσε το pin του Arduino ';
    blck.param2prompt:='pin';
    blck.param1prompt:='δεν';
    blck.TotalParams:=2;
    blck.param1:=55;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='for MEGA:A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;


    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateVariousCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor($00FF0080);
    pnl:=variousPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=250;
    blck.Commandtext:='Περίμενε %p1 χιλιοστά δευτερολέπτου';
    blck.param1question:='Δώσε τα χιλιοστά δευτερολέπτου (1000=1 δευτ) ';
    blck.param1prompt:='Χιλιοστά';
    blck.TotalParams:=1;
    blck.param1:=1000;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=200;
    blck.Commandtext:='Διαμόρφωσε το pin %p1 για έξοδο';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=201;
    blck.Commandtext:='Διαμόρφωσε το pin %p1 για είσοδο';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=202;
    blck.Commandtext:='Θέσε το pin %p1 σε 1 (high=5 Volt)';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=203;
    blck.Commandtext:='Θέσε το pin %p1 σε 0 (low=0 Volt)';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLCDCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:= HTMLtocolor('#0080ff');
    pnl:=LCDpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

//    blck:=TDspBlock.Create(Self);//to be deleted
//    blck.Parent:=LCDpanel;
//    blck.Color:=col;
//    blck.BorderColor:=clGreen;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=120;  //LCDprint
//    blck.Commandtext:='setup LCD';
//    blck.MyHint:='setup LCD';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;


    blck:=TDspBlock.Create(Self);
    blck.Parent:=LCDpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=122;
    blck.Commandtext:='Καθάρισε την LCD';
    blck.MyHint:='Καθαρίζει την LCD';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LCD);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=LCDpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=123;
    blck.Commandtext:='Θέσε τον δείκτη LCD [ %p1 , %p2 ]';
    blck.Param1:=0; //χ
    blck.Param2:=0; //ψ
    blck.TotalParams:=2;
    blck.MyHint:='Θέτει τον δείκτη της LCD στην θέση (χ,ψ)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LCD);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=LCDpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=121;  //LCDprint   text
    blck.Commandtext:='Τύπωσε στην LCD κείμενο %ps ';
    blck.Param1:=0;
    blck.ParamStr:='MESG';//should make an inline editor fro this
    blck.Param2:=length(blck.ParamStr); //string length
    blck.TotalParams:=2;
    blck.MyHint:='Τυπώνει κείμενο στην LCD';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LCD);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=LCDpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=124;  //LCDprint number
    blck.Commandtext:='Τύπωσε στην LCD αριθμό %p1 ';
    blck.Param1:=0;
    blck.ParamStr:='';//should make an inline editor fro this
    blck.Param2:=0; //string length
    blck.TotalParams:=1;
    blck.MyHint:='Τυπώνει αριθμό στην LCD';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LCD);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=LCDpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=125;  //LCDprint  text and number
    blck.Commandtext:='Τύπωσε στην LCD κείμενο και αριθμό %ps %p1';
    blck.Param1:=0;
    blck.ParamStr:='MESG';//should make an inline editor fro this
    blck.Param2:=length(blck.ParamStr); //string length
    blck.TotalParams:=2;
    blck.MyHint:='Τυπώνει κείμενο και αριθμό στην LCD';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LCD);

    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLaserCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor($007500CC);
    pnl:=Laserpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=131;  //Laser On
    blck.Commandtext:='%pd → Ενεργοποίησε το Laser/LED ';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=0;
    blck.MyHint:='Ενεργοποιεί το Laser/LED';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LASER); //Device id 1


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=132;  //Laser Off
    blck.Commandtext:='%pd → Απενεργοποίησε το Laser/LED ';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=0;
    blck.MyHint:='Απενεργοποιεί το Laser/LED';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LASER); //Device id 1


    pnl.Height:=blck.Top+blck.Height+40;

End;


procedure TfrmRoboLang.CreateSoundCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=htmltocolor('#d194a8');
    pnl:=SoundPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    //Command 110 just sets pin for output

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=111;
    blck.Commandtext:='%pd → Παίξε ήχο beep';
    blck.TotalParams:=0;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SOUND);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=112;
    blck.Commandtext:='%pd → Παίξε ήχο με συχνότητα %p1 και διάρκεια %p2';
    blck.TotalParams:=2;
//    blck.param1question:='Δώσε την συχνότητα σε hz (π.χ. 2000) ';
//    blck.param1prompt:='Τόνος';
//    blck.param2question:='Δώσε την διάρκεια σε χιλ. δευτερολέπτου ';
//    blck.param2prompt:='Διάρκεια';
    blck.param1:=2500;
    blck.param2:=1000;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.MyHint:='συχνότητα σε hz (π.χ. 2000), διάρκεια σε χιλ. δευτερολέπτου';
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SOUND);

    pnl.Height:=blck.Top+blck.Height+40;
End;

procedure TfrmRoboLang.CreateUltraSonicCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=htmltocolor('#2e6b2e');
    pnl:=USonicPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);


   //Command 140  sets 2 pins needed for ultrasonic (trig,Echo)

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=141;
    blck.Commandtext:='%pd → Εάν απόσταση %p1 μεγαλύτερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν υπάρχει αντικείμενο μπροστά σε απόσταση μεγαλύτερη από τον αριθμό σε εκατοστά';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(USONIC);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=142;
    blck.Commandtext:='%pd →  Εάν απόσταση %p1 μικρότερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.param2question:='Δώσε την απόσταση σε εκατοστά';
    blck.param2prompt:='Απόσταση (εκ.)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(USONIC);


    pnl.Height:=blck.Top+blck.Height+40;
End;


procedure TfrmRoboLang.CreateServoCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor($00003333);//     #333300
    pnl:=Servopanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=151;
    blck.Commandtext:='%pd → Μετακίνησε ΣΕ %p1 μοίρες (0-90) Αριστερά';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Μετακινεί το Servo στις μοίρες που θέλουμε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SERVO); //Device id 1


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=152;
    blck.Commandtext:='%pd → Μετακίνησε ΣΕ %p1 μοίρες (0-90) Δεξιά';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Μετακινεί το Servo στις μοίρες που θέλουμε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SERVO); //Device id 1

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=153;
    blck.Commandtext:='%pd → Μετακίνησε %p1 μοίρες Αριστερά';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Μετακινεί το Servo τόσες μοίρες επιπλέον στα αριστερά';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SERVO); //Device id 1

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=154;
    blck.Commandtext:='%pd → Μετακίνησε %p1 μοίρες Δεξιά';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Μετακινεί το Servo τόσες μοίρες επιπλέον στα δεξιά';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SERVO); //Device id 1


    pnl.Height:=blck.Top+blck.Height+40;

End;


procedure TfrmRoboLang.CreateSwitchCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor($00003333);//     #333300
    pnl:=Switchpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=146;
    blck.Commandtext:='%pd → Εάν %p1 πατήθηκε ο διακόπτης';
    blck.param1prompt:='δεν';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν πατήθηκε/ενεργοποιήθηκε ο διακόπτης';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SWITCH);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=146;
    blck.Commandtext:='%pd → Εάν %p1 ενεργοποιήθηκε η συσκευή';
    blck.param1prompt:='δεν';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν ενεργοποιήθηκε η συσκευή';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(SWITCH);


    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateTempCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor($00003333);//     #333300
    pnl:=Temppanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=75; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Θερμοκρασία';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της θερμοκρασίας της Συσκευής';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=76; //FIX VARS should be 75-90
    blck.Commandtext:='%pd → Υγρασία';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της υγρασίας της Συσκευής';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=171;
    blck.Commandtext:='%pd → Εάν Θερμοκρασία %p1 μεγαλύτερη από %p2 (°C)';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η θερμοκρασία ξεπέρασε τους βαθμούς °Κελσίου';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=172;
    blck.Commandtext:='%pd → Εάν Θερμοκρασία %p1 μικρότερη από %p2 (°C)';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η θερμοκρασία είναι χαμηλότερη από τους βαθμούς °Κελσίου';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=173;
    blck.Commandtext:='%pd → Εάν υγρασία %p1 μεγαλύτερη από %p2 %';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η υγρασία είναι μεγαλύτερη από τον αριθμό τοις εκατό (%)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=174;
    blck.Commandtext:='%pd → Εάν υγρασία %p1 μικρότερη από %p2 %';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η υγρασία είναι μικρότερη από τον αριθμό τοις εκατό (%)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);


    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateVarCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=StringToColor('$004C0B5F');//     #333300
    pnl:=VarPanel;
    tp:=-10;

    pnl.color:=LightenColor(col,30);


    blck:=TDspCommandVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=230;
    blck.Commandtext:='Βάλε τιμή %p1 στην Μεταβλητή %p2';
    blck.TotalParams:=2;
    blck.MyHint:='Θέτει μια τιμή ή μεταβλητή στην μεταβλητή που επιλέγουμε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspCommandVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=231;
    blck.Commandtext:='Άλλαξε κατά %p1 την Μεταβλητή %p2';
    blck.TotalParams:=2;
    blck.MyHint:='Αλλάζει κατά τιμή ή μεταβλητή την μεταβλητή που επιλέγουμε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    pnl.Align:=alClient;
   // pnl.Height:=blck.Top+blck.Height+40;

End;



procedure TfrmRoboLang.CreateCommands;
Begin
    CreateStartCommands;
    CreateMoveCommands;
    CreateLoopCommands;
    CreateControlCommands;
    CreateVariousCommands;
    CreateLCDCommands;
    CreateLaserCommands;
    CreateSoundCommands;
    CreateUltraSonicCommands;
    CreateServoCommands;
    CreateSwitchCommands;
    CreateTempCommands;
    CreateVarCommands;
End;


procedure TfrmRoboLang.addDevices;
Var i,m:Integer;
begin
  //set counter label tag to -1 for only one device

  i:=0;
  ArduinoDevices[i].DeviceName:='LCD Serial';
  ArduinoDevices[i].DeviceFormClass:=TfrmSerialLcd;
  ArduinoDevices[i].DevicePanel:=pnlLCD;
  ArduinoDevices[i].DeviceCmdId:=120;
  ArduinoDevices[i].DeviceParamCount:=0;
  ArduinoDevices[i].DeviceMax:=1;//only one of these
  i:=i+1;

  ArduinoDevices[i].DeviceName:='Laser';
  ArduinoDevices[i].DeviceFormClass:=TfrmLaser;
  ArduinoDevices[i].DevicePanel:=pnlLaser;
  ArduinoDevices[i].DeviceCmdId:=130;
  ArduinoDevices[i].DeviceParamCount:=1;
  ArduinoDevices[i].DeviceMax:=10;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='Sound';
  ArduinoDevices[i].DeviceFormClass:=TfrmSound;
  ArduinoDevices[i].DevicePanel:=pnlSound;
  ArduinoDevices[i].DeviceCmdId:=110;
  ArduinoDevices[i].DeviceParamCount:=1;
  ArduinoDevices[i].DeviceMax:=10;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='UltraSonic';
  ArduinoDevices[i].DeviceFormClass:=TfrmUSonic;
  ArduinoDevices[i].DevicePanel:=pnlUSonic;
  ArduinoDevices[i].DeviceCmdId:=140;
  ArduinoDevices[i].DeviceParamCount:=2;
  ArduinoDevices[i].DeviceMax:=4;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='Servo';
  ArduinoDevices[i].DeviceFormClass:=TfrmServo;
  ArduinoDevices[i].DevicePanel:=pnlServo;
  ArduinoDevices[i].DeviceCmdId:=150;
  ArduinoDevices[i].DeviceParamCount:=1;
  ArduinoDevices[i].DeviceMax:=4;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='Switch';
  ArduinoDevices[i].DeviceFormClass:=TfrmSwitch;
  ArduinoDevices[i].DevicePanel:=pnlSwitch;
  ArduinoDevices[i].DeviceCmdId:=145;
  ArduinoDevices[i].DeviceParamCount:=1;
  ArduinoDevices[i].DeviceMax:=4;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='Temp';
  ArduinoDevices[i].DeviceFormClass:=TfrmTemp;
  ArduinoDevices[i].DevicePanel:=pnlTemp;
  ArduinoDevices[i].DeviceCmdId:=170;
  ArduinoDevices[i].DeviceParamCount:=2;
  ArduinoDevices[i].DeviceMax:=4;
  i:=i+1;


   m:=i;
  //Set panel tag to device number
  for i := 0 to m-1 do
   if ArduinoDevices[i].DeviceName<>'' then
       ArduinoDevices[i].DevicePanel.Tag:=i;
end;

procedure TfrmRoboLang.Edit1Exit(Sender: TObject);
begin
 self.SetFocus;
end;

procedure TfrmRoboLang.CategoryPanelGroup1MouseEnter(Sender: TObject);
begin
// CategoryPanelGroup1.setfocus;
 TWinControl(sender).parent.setfocus;
end;

procedure TfrmRoboLang.CategoryPanelGroup1MouseWheel(Sender: TObject;
  Shift: TShiftState; WheelDelta: Integer; MousePos: TPoint;
  var Handled: Boolean);
var
  I: Integer;
begin
    for I := 1 to Mouse.WheelScrollLines do
    try
      if WheelDelta > 0 then
        TCategoryPanelGroup(Sender).Perform(WM_VSCROLL, SB_LINEUP, 0)
      else
        TCategoryPanelGroup(Sender).Perform(WM_VSCROLL, SB_LINEDOWN, 0);
    finally
      TCategoryPanelGroup(Sender).Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
    end;
end;

Var ln:string='';
procedure TfrmRoboLang.ComPort1RxChar(Sender: TObject; Count: Integer);
var s:string;
begin
 if ComIdle then
 Begin
  comport1.ReadStr(s,count);
  repeat
   if (s[1]=#13) or (s[1]=#10) then
   Begin
    if ln<>'' then
      Adddebug(ln);
    ln:='';
   End
   else   ln:=ln+s[1];
   s:=copy(s,2,maxint);
   count:=count-1;
  Until count=0;
 End;

end;


Function TfrmRoboLang.getFullCaption:String;
Var srv:string;
Begin
//  if isServer then
//    srv:='Καθηγητής'
//  Else
//    srv:='Μαθητής';
  Result:=progname+' '+ Version+' - '+programmer;
End;

procedure TfrmRoboLang.MyMessage(var Msg: TWMMove);
begin
end;

procedure TfrmRoboLang.MySetCaption;
Begin
  Caption:=getFullCaption;
  acConnect.Enabled:=true;
  acStop.Enabled:=True;
  acSndLeft.Enabled:=false;
  acSndRight.Enabled:=false;

//  acConnect.Enabled:=IsServer;
//  acStop.Enabled:=IsServer;
//  acSndLeft.Enabled:=IsServer;
//  acSndRight.Enabled:=IsServer;
End;

procedure TfrmRoboLang.FormCreate(Sender: TObject);
var str:TStringlist;
    reg:TRegistry;
begin
    frmLoadPos:=false;
     srvCodeRec:=false;
    opendialog1.InitialDir:=ExtractFilePath(Application.ExeName);
    savedialog1.InitialDir:=ExtractFilePath(Application.ExeName);
     CreateCommands;
    if not LoadFormPos then
    Begin
     width:=1000;
     height:=750;
    End;
    comIdle:=true;
    MySetCaption;


   reg:=TRegistry.Create;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\',True);
     try
//      isServer:=reg.readbool('IsServer');
     except
     end;
   finally
     reg.Free;
   end;
   MySetCaption ;

end;

procedure TfrmRoboLang.emptycomps;
var i:integer;
    brk:boolean;
begin
    repeat
    brk:=false;
      for i := ComponentCount - 1 downto 0 do
      begin
        if Components[i] is TDspBlock and assigned(TControl(Components[i]).parent) then
        Begin
          TControl(Components[i]).parent := nil;
          try
           Components[i].Free;
          except

          end;
          brk:=true;
          break;
        End;
      end;
    until not brk;

End;


procedure TfrmRoboLang.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := PtInRect(CategoryPanelGroup1.ClientRect, CategoryPanelGroup1.ScreenToClient(MousePos));
  if handled then
       CategoryPanelGroup1MouseWheel(Sender,Shift,WheelDelta,mousepos,Handled)
  else
  Begin
     Handled := PtInRect(ScrollBox1.ClientRect, ScrollBox1.ScreenToClient(MousePos));
     if handled then
        ScrollBox1MouseWheel(Sender,Shift,WheelDelta,mousepos,Handled);
  End;
end;

procedure TfrmRoboLang.FormResize(Sender: TObject);
begin
  SaveFormPos;
end;

procedure TfrmRoboLang.SaveFormPos;
var  reg:TRegistry;
Begin
   if frmLoadPos then exit;
   
   reg:=TRegistry.Create;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\MainForm\',True);
     reg.WriteInteger('Left',Left);
     reg.WriteInteger('Top',Top);
     reg.WriteInteger('Width',Width);
     reg.WriteInteger('Height',Height);

   finally
     reg.Free;
   end;

End;

procedure TfrmRoboLang.SaveBTPort;
var  reg:TRegistry;
Begin

   reg:=TRegistry.Create;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\MainForm\',True);
     reg.WriteInteger('BtIndex',BTIndex);

   finally
     reg.Free;
   end;

End;

procedure TfrmRoboLang.LoadBTPort;
var  reg:TRegistry;
Begin

   reg:=TRegistry.Create;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\MainForm\',True);
     try
      BTIndex:=reg.ReadInteger('BtIndex');
     except //not saved value

     end;
   finally
     reg.Free;
   end;

End;


procedure TfrmRoboLang.SelectNextPort;
Var i:integer;
begin
  if BTComList.Count>0 then
  Begin
    Inc(BTIndex);
    if BTIndex>=BTComList.Count then
      BTIndex:=0;
    SBar.Panels[0].Text:='BT Port: '+BTComList[BTindex];
    SaveBTPort;
  End;
end;

procedure TfrmRoboLang.SBarDblClick(Sender: TObject);
begin
  SelectNextPort;
end;

function TfrmRoboLang.LoadFormPos:boolean;
var  reg:TRegistry;
Begin
   result:=true;
   reg:=TRegistry.Create;
   frmLoadPos:=true;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\MainForm\',True);
    try
     Left:=reg.ReadInteger('Left');
     Top:=reg.ReadInteger('Top');
     Width:=reg.ReadInteger('Width');
     Height:=reg.ReadInteger('Height');
    except
     result:= false;
    end;
   finally
     reg.Free;
     frmLoadPos:=false;
   end;

End;


Function TfrmRoboLang.GetStartBlock:TDspBlock;
Var t:TDspBlock;
    i:integer;
Begin
   result:=nil;
   for i := 0 to Pred(scrollbox1.ControlCount) do
    if scrollbox1.Controls[i] is TDspBlock then
    Begin
      t:=TDspBlock(scrollbox1.Controls[i]);
      if t.CommndID=1 then
      Begin
         Result:=t;
         Break;
      End;
    End;
End;

function TfrmRoboLang.GetBTPortFromFile:string;
Var ini:TIniFile;
    fn:String;
Begin
  fn:=extractfilepath(application.ExeName)+'BTPort.ini';
  ini:=TIniFile.Create(fn);
  try
    result:=ini.ReadString('Bluetooth','ComPort','');
  finally
    ini.Free;
  end;

End;

procedure TfrmRoboLang.FormShow(Sender: TObject);
var i:integer;
    t:string;
    ts:Tstringlist;
begin
   adddebug(GetComputerName);

   BTComList:=TStringlist.Create;
   BTComList.Sorted := True;
   BTComList.Duplicates := dupIgnore;

   for i := 0 to Pred(ControlCount) do
    if Controls[i] is TSpeedButton then
      TSpeedButton(Controls[i]).Caption := '';
   t:=GetBTPortFromFile;
   if t='' then
   Begin
     ts:=Tstringlist.create;
     SetupEnumAvailableComPorts(ts);
     for i := 0 to ts.count-1 do
     Begin
       if (Onlybluetooth and (POS('BLUE',uppercase(ts.values[ts.Names[i]]))>0)) or not Onlybluetooth then
          BTComList.add(copy(ts.names[i],1,4));
     End;
     ts.free;
     getComPortList(BTComList);
     t:=GetBlutoothComPort(BTComList);
   End
   Else
   Begin
     BTComList.Add(t);
     btindex:=0;
   End;
   if (t='') then //and IsServer then
   Begin
     ShowMessage('Δεν βρέθηκε ασύρματη σειριακή θύρα Bluetooth!!!'#13#10'Πρέπει να εγκαταστήσετε έναν Bluetooth adaptor και να κάνετε Pair.'#13#10'Αν γνωρίζετε την σειριακή θύρα προσθέστε την στο αρχείο BTPort.ini {ComPort=COMx}');
     sbar.Panels[0].Text:='BT Port: None';
   End
   else
     LoadBTPort;
     if BTIndex>=BTComList.count then
       BTIndex:=BTComList.count-1;
     t:=BTComList[BTIndex];
     sbar.Panels[0].Text:='BT Port: '+t;
   addDevices;
   DeviceChanged;
   TNBook.PageIndex:=0;
   PageControl1.TabIndex:=0;
end;

function TfrmRoboLang.getPanelAddButton(pnl: TPanel): TBitBtn;
begin
  result:=TBitBtn(FindComponent(copy(pnl.Name,4,maxint)+'Add'));
end;

function TfrmRoboLang.getPanelCountLabel(pnl:TPanel):TLabel;
Begin
    result:=TLabel(FindComponent('lbl'+copy(pnl.Name,4,maxint)));
End;

procedure TfrmRoboLang.addDevClick(Sender:TObject);
Var lbl:TLabel;
    p:TPanel;
    TabPage:TTabPage;
    devidx:Integer;
begin
  p:=TPanel(Tbitbtn(Sender).Parent);
  lbl:=getPanelCountLabel(p);
   if Tbitbtn(Sender).tag>=ArduinoDevices[p.tag].DeviceMax then
   Begin
     ShowMessage('Μόνο μια επιτρέπετε!!!');
     exit;
   End;
  Tbitbtn(Sender).Tag:=  Tbitbtn(Sender).Tag+1;
  lbl.Caption:=inttostr( Tbitbtn(Sender).Tag);

 devidx:=p.Tag;
 Tbitbtn(sender).Enabled:= Tbitbtn(sender).tag<ArduinoDevices[devidx].DeviceMax;
 DevBook.Pages.Add(ArduinoDevices[devidx].DeviceName);
 DevBook.PageIndex:=DevBook.Pages.Count-1;
 TabPage:=TTabPage(DevBook.Pages.Objects[DevBook.PageIndex]);
 inc(ActDevsCount);
 ActDevs[ActDevsCount].DeviceTypeID:=devidx;
 ActDevs[ActDevsCount].ActDevParamCount:=ArduinoDevices[devidx].DeviceParamCount;
 ActDevs[ActDevsCount].ActDevForm:=ArduinoDevices[devidx].DeviceFormClass.Create(self) as TDefDevForm;
 TDefDevForm(ActDevs[ActDevsCount].ActDevForm).ActiveDeviceId:=ActDevsCount;
 ActDevs[ActDevsCount].ActDevForm.Tag:=devidx;
 ActDevs[ActDevsCount].ActDevForm.Parent:=TabPage;
 ActDevs[ActDevsCount].ActDevForm.Align:=alClient;
 ActDevs[ActDevsCount].ActDevForm.Visible:=true;
 ActDevs[ActDevsCount].ActDevForm.BorderStyle:=bsSizeToolWin;
 ActDevs[ActDevsCount].ActDevForm.WindowState:=wsMaximized;
 DevBook.Pages[DevBook.PageIndex]:=ActDevs[ActDevsCount].ActDevForm.Caption+'_'+inttostr(ActDevsCount);
 ActDevs[ActDevsCount].ActDevForm.Caption:= DevBook.Pages[DevBook.PageIndex];
 CommandsByType(devidx);//Enable Commands

 application.ProcessMessages;
 //TDefDevForm(ActDevs[ActDevsCount].ActDevForm).RefreshBlockControls;
End;

Procedure TfrmRoboLang.CommandsByType(typeid:Integer;Enable:Boolean=true);
Var i:integer;

Begin
  for i:=0 to ComponentCount-1 do
    if Components[i] is TDspBlock then
      if TDspBlock(Components[i]).DeviceOnlyCommandID=typeid then
        TDspBlock(Components[i]).Enabled:=Enable;


//  case typeid of
//    ORD(LCD):
//                  Break;
//    ORD(LASER):
//                  Break;
//  end;
End;



procedure TfrmRoboLang.LCDaddClick(Sender: TObject);
Begin
 addDevClick(Sender);
end;

procedure TfrmRoboLang.ListBox1DblClick(Sender: TObject);
begin
 listbox1.Items.Clear;
end;

procedure TfrmRoboLang.N7Click(Sender: TObject);
begin
  frmAbout.showmodal;
end;

procedure TfrmRoboLang.OnRefVarRequest(var Msg: TMessage);
var
  i: Integer;
begin
  for i := 0 to Pred(Componentcount) do
  Begin
    if Components[i] is TDspBlock then
     TDspBlock(Components[i]).Perform(msg.Msg,msg.WParam,msg.LParam);
  End;
end;

procedure TfrmRoboLang.DeviceChanged;
Var k:integer;
    pth:String;
    nm,nmpin:String;
Begin
   //TODO:Take it from the executables dir
  // pth:='G:\_Programming\ControlPlatform';
   pth:=MainPath;
   k:=RadioGroup1.ItemIndex;
   Arduino.Id:=k;
   case k of
       0:Begin
          nm:='Arduino Uno';
          Arduino.MaxPins:=19;
         End;
       1:Begin
          nm:='Arduino Nano';
          Arduino.MaxPins:=19;
         End;
       2:Begin
          nm:='Arduino Mega';
          Arduino.MaxPins:=59;
         End;
   end;
   nmpin:=nm+' Pin.png';
 //  if fileexists(pth+'\images\'+nm+'.png') then
 //    ArduImage.Picture.LoadFromFile(pth+'\images\'+nm+'.png');
   if fileexists(pth+'\images\'+nmpin) then
     ArduPinout.Picture.LoadFromFile(pth+'\images\'+nmpin)
   else ArduPinout.Picture:=nil;
   DevBook.Pages[0]:=nm;
   NewMaxPins;
End;

procedure TfrmRoboLang.NewMaxPins;
Var i:integer;
Begin
  for i := 0 to Componentcount-1 do
     if components[i] is TDefDevForm then
      TDefDevForm(components[i]).NewMaxPins;


End;

procedure TfrmRoboLang.RadioGroup1Click(Sender: TObject);
begin
   DeviceChanged;
end;

//Create a tstringlist with all the Device names and DevNo for a certain type  i.e. Laser1=5
//should be freed by the function user
Function  TfrmRoboLang.GetActiveDevicePins(DevTp:integer=-1):TStrings;
Var i:integer;
    sl:Tstringlist;

Begin
  Result:=nil;
  sl:=TStringlist.Create;
  try
     for i := 0 to ActDevsCount do
      if  (Devtp=-1) or (ActDevs[i].DeviceTypeID=Devtp) then
        sl.AddObject(ActDevs[i].ActDevForm.Caption,TObject(i));//Device Number
//        sl.Values[ActDevs[i].ActDevForm.Caption]:=inttostr(ActDevs[i].ActDevParams[0]);
    Result:=sl;
  Finally
//    sl.Free;
  end;

End;

Function  TfrmRoboLang.GetActiveDeviceParam(DevNo:Integer;PrmNo:Integer):Integer;
Begin
   result:=ActDevs[Devno].ActDevParams[PrmNo];
End;

initialization
mainpath:=Extractfilepath(Application.ExeName);

end.
