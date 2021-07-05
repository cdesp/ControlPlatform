unit unCtrlPlatMain;


interface

uses  Vcl.Dialogs, CPort, System.Classes,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Buttons,Winapi.Windows,unBlock,Winapi.Messages,System.SysUtils, System.Variants,
  unContainerBlock,Vcl.Graphics, Vcl.TabNotBk, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.jpeg,  Vcl.ToolWin, Vcl.Samples.Spin,
  Vcl.OleCtrls, SHDocVw;


Const ProjectStart='10/10/2017';
Const Version='0.95 (Βήτα έκδοση 22/06/2021)  - ';
Const Programmer='© 2017-2021 Despoinidis Christos';
Const Progname='Έλεγχος συσκευών Arduino';
Const Onlybluetooth=FALSE;
const WM_REFRESH_MSG = WM_USER + 1;
const WM_REFVARS_MSG = WM_USER + 252;
Const DevBckColor=TColor($00003333);
Const StartBckColor=clGreen;
Const MoveBckColor=clBlue;
Const LoopBckColor=clMaroon;
Const CtrlBckColor=TColor($00008282);
Const VarbckColor=TColor($00FF0080);



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
    pnlBMP: TPanel;
    Image9: TImage;
    Label9: TLabel;
    lblBMP: TLabel;
    BMPAdd: TBitBtn;
    BMPPanel: TCategoryPanel;
    AnalogInPanel: TCategoryPanel;
    pnlAnalogIn: TPanel;
    Image10: TImage;
    Label10: TLabel;
    lblAnalogIn: TLabel;
    AnalogInAdd: TBitBtn;
    Panel1: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    pnlDcMotor: TPanel;
    Image11: TImage;
    Label11: TLabel;
    lblDcMotor: TLabel;
    DcMotorAdd: TBitBtn;
    DcMotorPanel: TCategoryPanel;
    pnlRobot: TPanel;
    Image12: TImage;
    Label12: TLabel;
    LblRobot: TLabel;
    RobotAdd: TBitBtn;
    DcRobotPanel: TCategoryPanel;
    ArduMemo: TMemo;
    acgetcode: TAction;
    Timer2: TTimer;
    acOptions: TAction;
    N11: TMenuItem;
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
    procedure ComPort1Exception(Sender: TObject; TComException: TComExceptions;
        ComportMessage: string; WinError: Int64; WinMessage: string);
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
    procedure acgetcodeExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure acOptionsExecute(Sender: TObject);
  private
    cmb:TComboBox;
    firstopen:boolean;
    NewVarName:String;
    ComIdle:boolean;
    ChkByte:Byte;
    srvCodeRec:boolean;
    frmLoadPos:Boolean;
    FMotors: Integer;
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
    procedure CreateBMP180Commands;
    procedure CreateAnalogInCommands;
    procedure BurnArduino;
    function GetArduType: String;
    procedure ComPortChanged(Sender: tobject);
    procedure CreateDcMotorCommands;
    procedure CreateRobotCommands;
    function getDeviceInclude(ComID:integer;DevId: integer): String;
    procedure AddIncludeForDev(hd: Tstrings;ComID, DevId: Integer);
    procedure AddDefinitionForDev(hd: Tstrings;ComID:Integer; DevId: Integer;devnm:string);
    procedure AddSetupForDev(hd: Tstrings;ComID:Integer; DevId: Integer;devnm:string);
    procedure GetCodeFromCommands(hd:Tstrings;blck: TDspBlock;ident:integer=1);
    procedure AddFunctionsForDev(hd: Tstrings;ComID:Integer; DevId: Integer; devnm: string);
    function fix(s: string;Devid:Integer): String;
    procedure getVars(hd: TStrings);
    procedure GetComPorts;
    procedure showMyHint;
    { Private declarations }
  public
    { Public declarations }
    function GetActiveDevicePins(DevTp:integer=-1): tStrings;
    procedure AddDebug(s: String);
    function getFullCaption: String;
    procedure addDevices;
    function getPanelCountLabel(pnl: TPanel): TLabel;
    function getPanelAddButton(pnl: TPanel): TBitBtn;
    /// <summary>TfrmRoboLang.CommandsByType
    /// Enables or Disables Commands based on typeID
    /// </summary>
    /// <param name="typeid"> (Integer) </param>
    /// <param name="Enable"> (Boolean) </param>
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
uses Registry, system.ioutils,unAbout, inifiles,setupapi,math,  unDevices, unHelpForms,DspUtils,unVariables,unBlockVar,
      uUpdate,fserialLcd,fLaser,fSound,fUSonic,fServo,fSwitch,fTemp,fBMP180,fAnalogIn,fDcMotor,fRobot
    , fOptions;


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
    comport1.Connected:=true;
  except
   on e:exception do
   Begin
    AddDebug(e.Message);
    if firstopen then   //bypass the bug 1st time open throws an exception
    Begin
      application.ProcessMessages;
      firstopen:=false;
      Result:=BTOpen;
      exit;
    End;


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


procedure TfrmRoboLang.Timer2Timer(Sender: TObject);
begin
 ArduMemo.Lines[ardumemo.Lines.Count-1]:= ArduMemo.Lines[ardumemo.Lines.Count-1]+'.';
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
  t.ArduCmd:=cmdName;
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
  try
   comport1.SetDTR(true);
  except
   try
    comport1.connected:=false;
   except
     exit;
   end;
    if BTOpen then ResetArduino;
    Exit;

  end;
  try
   comport1.SetDTR(false);
  except

  end;
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
 BurnArduino;
end;

procedure TfrmRoboLang.acexitExecute(Sender: TObject);
begin
  Close;
end;

function TfrmRoboLang.getDeviceInclude(ComID:integer;DevId:integer):String;
Begin
   result:='';
   case ComID of
      50:Begin
          // if actdevs[DevId].ActDevParams[5]=1 then
            result:='helper_3dmath.h,MPU6050_6Axis_MotionApps20.h,DspGyro.h,CPRobot.h'
          // else
          //  result:='CPRobot.h';
         End;
      60:result:='DspMotor.h';
      110:result:='Speaker.h';
      120:result:='I2Cdev.h,Wire.h,LiquidCrystal_I2C.h';
      130:result:='';//Laser or Led
      140:result:='CPSonicSensor.h';
      145:result:='';//Switch
      150:result:='DspServo.h';//Servo
      170:result:='DHT.h';   //temperature
      176:result:='DspBMP.h'; //barometer
   end;

End;

procedure TfrmRoboLang.AddIncludeForDev(hd:Tstrings;ComID,DevId:Integer);
Const Incl='#include "%s"';
var   ts:tstringlist;
      i:Integer;
Begin
    ts:=tstringlist.Create;
    ts.Delimiter:=',';
    ts.CommaText:=getDeviceInclude(ComId,DevId);
    for i := 0 to ts.Count-1 do
     hd.add(Stringreplace(Incl,'%s',ts[i],[]));

   ts.Free;
End;


procedure TfrmRoboLang.AddDefinitionForDev(hd:Tstrings;ComID:Integer;DevId:Integer;devnm:string);
Begin

  case ComID of
    50://robot
       hd.Add('CP_Robot '+devnm+';');

    60://dcmotor
       hd.Add('DESP_DCMotor '+devnm+';');
    110://speaker
       hd.Add('Speaker '+devnm+fix('(%dp1);',devid));

    120:Begin   // Defines for LCD Serial
      hd.Add('#define I2C_ADDR          0x27        //Define I2C Address where the PCF8574A is');
      hd.Add('#define BACKLIGHT_PIN      3');
      hd.Add('#define En_pin             2');
      hd.Add('#define Rw_pin             1');
      hd.Add('#define Rs_pin             0');
      hd.Add('#define D4_pin             4');
      hd.Add('#define D5_pin             5');
      hd.Add('#define D6_pin             6');
      hd.Add('#define D7_pin             7');
      hd.Add('LiquidCrystal_I2C '+devnm+'(I2C_ADDR, En_pin,Rw_pin,Rs_pin,D4_pin,D5_pin,D6_pin,D7_pin);  //Serial LCD');
    End;
    140://Ultrasonic sensor
       hd.Add('CP_SonicSensor '+devnm+';');
    150://Servo
       hd.Add('DESP_Servo '+devnm+';');
    170://DHT
       hd.Add('DHT '+devnm+fix('(%dp1,%dp2);',DevId));
    176:  //Barometer
       hd.Add('Dsp_BMP '+devnm+';');


  end;

End;

procedure TfrmRoboLang.AddFunctionsForDev(hd:Tstrings;ComID:Integer;DevId:Integer;devnm:string);
Begin
  case ComID of
    50:Begin //Function for ROBOT
       hd.Add('//AttachInterrupt function for Robot class');
       hd.Add(' void speedencint(){');
      // hd.Add('    if (Robo)');
       hd.Add('       '+devnm+'.handleInterrupt();');
       hd.Add('}');
       hd.Add('');
    End;
  End;

End;

function TfrmRoboLang.fix(s:string;Devid:Integer):String;
var i:integer;
Begin
     Result:=s;
     for i := 0 to MaxDevParams do
       result:=Stringreplace(Result,'%dp'+inttostr(i+1),inttostr(ActDevs[DevId].ActDevParams[i]),[rfReplaceAll]);
End;



procedure TfrmRoboLang.AddSetupForDev(hd:Tstrings;ComID:Integer;DevId:Integer;devnm:string);
Begin
  case Comid of
    50:Begin //defines for ROBOT
       hd.Add(fix('  '+devnm+'.init(%dp1,%dp2,%dp3,%dp4,%dp5,%dp6);',DevId));
       if ActDevs[DevId].ActDevParams[4]>0 then //dp5
       Begin
         hd.Add(fix('    pinMode (%dp5, INPUT) ;',DevId));
         hd.Add(fix('    attachInterrupt(digitalPinToInterrupt(%dp5), speedencint, CHANGE);',DevId));
       end;
    End;
    60:Begin
       hd.Add(fix('  '+devnm+'.init( '+inttostr(FMotors)+' ,%dp1,%dp2);',DevId));
    End;
    120:Begin   // Defines for LCD Serial
      hd.Add('  '+devnm+'.begin(16, 2);');
      hd.Add('  //Switch on the backlight');
      hd.Add('  '+devnm+'.setBacklightPin(BACKLIGHT_PIN,POSITIVE);');
      hd.Add('  '+devnm+'.setBacklight(HIGH);');
      hd.Add('  '+devnm+'.print(F("LCD OK...."));');
    End;
    130:Begin  //Defines for Led Laser
            hd.Add(fix('  pinMode(%dp1,OUTPUT);',DevID));
    End;
    140:Begin
       hd.Add(fix('  '+devnm+'.setSonicParams(5,400,%dp1,%dp2);//min distance 5cm, check every 400ms',DevId));
       hd.Add('   '+devnm+'.init();');
    End;
    150:Begin//Servo
      hd.Add('  '+devnm+fix('.init(%dp1);',devid));
    End;
    165:Begin  //Defines for AnIn Analog In
            hd.Add(fix('  pinMode(%dp1,INPUT);',DevID));
    End;
    170:Begin   //dht
      hd.Add('  '+devnm+'.begin();');
    End;
    176:Begin   //bmp
    //  hd.Add('  '+devnm+'.begin();');
    End;

  end;

End;


procedure TfrmRoboLang.GetCodeFromCommands(hd:Tstrings;blck:TDspBlock;ident:integer=1);
var nxtblock:TDspBlock;
     i,vid,vid2:Integer;
     myvar:TArduVar;
     idns:String;
Begin
  NxtBlock:=blck;
  while Assigned(nxtblock) do
  Begin
//    BTSendInteger( NxtBlock.CommndID);
//    BTSendInteger( NxtBlock.PDevice);//device id -1 for no device
//    BTSendInteger( NxtBlock.Param1);
    idns:='';
    for i := 0 to ident*3-1 do //already 1 extra for the string split
       idns:=idns+' ';

    hd.Add(idns+NxtBlock.GetArduinoCommand(ident));

//    vid:=-1;vid2:=-1;
//    if assigned(NxtBlock.VarParam1) then
//    Begin
//       if NxtBlock.VarParam1.CommndID>=75 then //fix variable resolve in Arduino
//         vid:=NxtBlock.VarParam1.CommndID
//       else
//       Begin
//         myvar:=ArduVars.GetVarByName(NxtBlock.VarParam1.param1question);
//         vid:=myvar.VarID;
//       End;
//    End;
//    if assigned(NxtBlock.VarParam2) then
//    Begin
//       if NxtBlock.VarParam1.CommndID>=75 then //fix variable resolve in Arduino
//         vid2:=NxtBlock.VarParam1.CommndID
//       else
//       Begin
//          myvar:=ArduVars.GetVarByName(NxtBlock.VarParam2.param1question);
//          vid2:=myvar.VarID;
//       End;
//    End;

  //  BTSendInteger(vid);
//    BTSendInteger(vid2);  //TODO:Make varparam2
    Adddebug('Sending CMD='+inttostr(NxtBlock.CommndID)
     +' Dev= '+inttostr(NxtBlock.pDevice)
     +' p_1='+inttostr(NxtBlock.Param1)
     +' v_1='+inttostr(vid)
     +' v_1='+inttostr(vid2)
     +' p_2='+inttostr(NxtBlock.Param2)

    );

   // if NxtBlock.paramstr<>'' then
//    Begin
  //     NxtBlock.Param2:=Length(NxtBlock.paramstr);
  //     BTSendInteger( NxtBlock.Param2+1);
    //   for i := 1 to NxtBlock.Param2 do
    //   Begin
    //      Adddebug('Sending ch:'+NxtBlock.paramstr[i]);
    //       BTPutChar(NxtBlock.paramstr[i]);
    //   End;
    //    BTPutChar(#0);
  //  end
   // else
    //  BTSendInteger( NxtBlock.Param2);



    if NxtBlock is TDspContainerBlock then  //set container commands
    Begin
      GetCodeFromCommands(hd,nxtblock.FirstBlock,ident+1);
      hd.Add(idns+'}');
    End;
    if NxtBlock is TDspControlElseBlock and TDspControlElseBlock(NxtBlock).elsevisible then //set else container commands
    Begin
      GetCodeFromCommands(hd,TDspControlElseBlock(nxtblock).ElseBlock,ident);
      hd.Add(idns+'}');
    End;
    NxtBlock:=NxtBlock.LinkTo;
  End;

End;

procedure TfrmRoboLang.getVars(hd:TStrings);
var i:integer;
Begin
   for i := 0 to ArduVars.Count-1 do
   Begin
     hd.Add('int '+ArduVars.GetRealVarName(ArduVars.GetArduVar(i).VarName)+';');
   End;

End;

procedure TfrmRoboLang.acgetcodeExecute(Sender: TObject);
Var Header,Debug,Declaration,Setup,Code,Funcs,Make,Vars:TStringlist;
    strt:TDspBlock;

    cnt:Integer;
    i,k:Integer;
    CommndID,devid,param1,param2,param3,param4,param5,param6:integer;
    devnm:string;
    DirName,NewDir,NewFile:String;
  ArduinoPath: string;
  CommandLine: string;
  BoardType: string;
  ParamS: string;
  IniFile:TInifile;
  dirc:TDirectory;
  btp: string;
begin
 FMotors:=0;
 TNBook.PageIndex:=3;
 //get code for Arduino
 Header:=TStringlist.create;
 Debug:=TStringlist.create;
 Declaration:=TStringlist.create;
 Setup:=TStringlist.create;
 Setup.Add('void setup() {');
 Code:=TStringlist.create;
 Code.Add('void loop() {');
 Funcs:=TStringlist.create;
 Vars:=TStringlist.create;


 Header.Add('#include "Arduino.h"');

 strt:=GetStartBlock;
 if strt=nil then
 Begin
    ShowMessage('Δεν βρέθηκε το block "Έναρξη Προγράμματος" !!!');
    exit;
 End;
  strt.getDspBlockListSize(strt,cnt);
  adddebug('Blocks:'+inttostr(cnt));


  //14/10/2017 Send SETUP Device commands
  for I := 0 to ActDevsCount do
  Begin
    k:=0;
    Debug.Add('============================');
     CommndID:=ArduinoDevices[ActDevs[i].DeviceTypeID].DeviceCmdId;
     devid:=i;
     Param1:=ActDevs[i].ActDevParams[k];
     Param2:=ActDevs[i].ActDevParams[k+1];
     Param3:=ActDevs[i].ActDevParams[k+2];
     Param4:=ActDevs[i].ActDevParams[k+3];
     Param5:=ActDevs[i].ActDevParams[k+4];
     Param6:=ActDevs[i].ActDevParams[k+5];

     adddebug('------------------------');
     adddebug('Setup Cmd:'+inttostr(CommndID));
     adddebug('Device ID:'+inttostr(i));
     adddebug('Param 1  :'+inttostr(Param1));
     adddebug('Param 2  :'+inttostr(Param2));
     adddebug('Param 3  :'+inttostr(Param3));
     adddebug('Param 4  :'+inttostr(Param4));
     adddebug('Param 5  :'+inttostr(Param5));
     adddebug('Param 6  :'+inttostr(Param6));
     adddebug('------------------------');
     devnm:=ActDevs[i].ActDevForm.Caption;
     Debug.Add(devnm);
     AddIncludeForDev(Header,CommndID,devid);
     AddDefinitionForDev(Declaration ,CommndID,devid,devnm);
     AddSetupForDev(Setup,CommndID,devid,devnm);
     AddFunctionsForDev(Funcs,CommndID,devid,devnm);

     Debug.AddPair('Command ID',inttostr(CommndID));
     Debug.AddPair('Dev_Num',inttostr(i));
     Debug.AddPair('Dev_Param1',inttostr(Param1));
     Debug.AddPair('Dev_Param2',inttostr(Param2));

//    until k>=ActDevs[i].ActDevParamCount;


  End;

  GetVars(Vars);
  GetCodeFromCommands(Code,strt);

  Debug.Add('============================');
  Debug.Add('============================');
  //------------
//  SendCommands(strt);

    Header.Add(''); //end Includes
    Declaration.Add(' ');//End Declaration
    Setup.Add('}');//End Setup
    Setup.Add('');
    Code.Add('}');//End Code
    Code.Add('');
    Vars.Add('');


    Ardumemo.Lines.Assign(header);
    Ardumemo.Lines.AddStrings(Declaration);
    Ardumemo.Lines.AddStrings(Funcs);
    Ardumemo.Lines.AddStrings(Vars);
    Ardumemo.Lines.AddStrings(Setup);
    Ardumemo.Lines.AddStrings(Code);
  //  Ardumemo.Lines.AddStrings(Debug);

    header.free;
    Declaration.free;
    Setup.free;
    Code.free;
    Funcs.Free;
    Debug.free;
    Ardumemo.SelectAll;
    Ardumemo.CopyToClipboard;

    if messagedlg('Να σταλεί στο Arduino;',mtConfirmation, mbYesNo, 0)=mrNo then
     exit;
    DirName:=extractfilepath(Application.ExeName);
    Newdir:=DirName+'\Out';
    if not Directoryexists(Newdir) then
          CreateDir(NewDir)
    else
    Begin //clear dir

       if Directoryexists(Newdir+'\build') then
              dirc.Delete (Newdir+'\build\',True);
   //    if messagedlg('Να σταλεί στο Arduino;',mtConfirmation, mbYesNo, 0)=mrNo then
    //    exit;
    End;


//    for i := 0 to 1000 do
//    Begin
//       NewDir:=DirName+'\Out_'+inttostr(i);
//       if not Directoryexists(Newdir) then
//       Begin
//          CreateDir(NewDir);
//          Break;
//       End;
//    End;
    NewFile:=NewDir+'\Output.ino';
    Ardumemo.Lines.SaveToFile(Newfile);


    IniFile:=TInifile.Create(DirName+'\Options.ini');
    ArduinoPath:=IniFile.ReadString('Arduino','Path','G:\NewApps\Arduino\');
    IniFile.Free;

    case Arduino.Id of
      0:btp:='uno';
      1:btp:='uno';
      2:btp:='mega';
    end;
    BoardType:='arduino:avr:'+btp;
    CommandLine:='"'+ArduinoPath+'\arduino_debug.exe"';
    //ParamS:='  --board '+boardtype+' --port '+BTComList[BTIndex]+' --pref build.path='+NewDir+'\build --upload '+NewFile;
    ParamS:='  --board '+boardtype+' --port '+BTComList[BTIndex]+' --upload "'+NewFile+'"';
    Ardumemo.Lines.Add('');
    Ardumemo.Lines.Add(Commandline+' '+ParamS);
    Ardumemo.Lines.Add('Compiling and uploading... Please Wait!!!');
    Ardumemo.Lines.Add('');
   // Timer2.Enabled:=true;
    try
     CaptureConsoleOutput(CommandLine,ParamS,Ardumemo);
     //winexec(PAnsiChar( commandline+' '+ParamS),0);
     //ExecuteAndWait(commandline+' '+ParamS);

    except

    end;
   // Timer2.Enabled:=False;
    Ardumemo.Lines.Add('Done!!!');
    //CopyFile(Pchar(DirName+'\makefile'),Pchar(NewDir+'\makefile'),false);
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
//  AddDebug(Name);
  //if reader.owner.owner=nil then
   //InsertComponent(Reader.owner);
End;

procedure TfrmRoboLang.CreateComp(Reader: TReader; ComponentClass: TComponentClass; var Component: TComponent);
begin
 // AddDebug(ComponentClass.ClassName);
end;

type tcomphack=class(Tcomponent);

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
      tcomphack(component).loaded;
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



procedure TfrmRoboLang.acOptionsExecute(Sender: TObject);
begin
  frmoptions.ShowModal;
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
 try
   ResetArduino;
 except

 end;
end;

procedure TfrmRoboLang.CreateStartCommands;
Var col:Tcolor;
 tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=StartBckColor;//clGreen;
    pnl:=strtPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.topNose:=false;
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=1;
    blck.Commandtext:='Έναρξη προγράμματος';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;



    blck:=TDspBlock.Create(Self);
    blck.botNose:=false;
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=2;
    blck.Commandtext:='Τερματισμός προγράμματος';
    blck.ArduCmd:='while(1);';  //endless loop doing nothing
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;


    pnl.Height:=blck.Top+blck.Height+40;
End;

procedure TfrmRoboLang.CreateMoveCommands;
//Var col:Tcolor;
//    tp:integer;
//    pnl:TCategoryPanel;
Begin
//    MovPanel.Enabled:=false;
//    MovPanel.Collapsed:=true;
//    col:=MoveBckColor;//clBlue;
//    pnl:=Movpanel;
//    tp:=-40;
//
//    pnl.color:=LightenColor(col,30);
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=5;
//    blck.Commandtext:='Όρισε βήμα σε %p1 εκατοστά';
//    blck.Param1:=10;
//    blck.TotalParams:=1;
//    blck.MyHint:='Η απόσταση μετακίνησης σε εκατοστά (>10 και <100)';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=10;
//    blck.Commandtext:='Μπροστά 1 βήμα';
//    blck.MyHint:='Μετακίνηση προς τα εμπρός 1 βήματος (περίπου 10 εκατοστά)';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=20;
//    blck.Commandtext:='Πίσω 1 βήμα';
//    blck.MyHint:='Μετακίνηση προς τα πίσω 1 βήματος (περίπου 10 εκατοστά)';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=30;
//    blck.Commandtext:='Στρίψε Δεξιά %p1 μοίρες';
//    blck.TotalParams:=1;
//    blck.MyHint:='Στροφή προς τα δεξιά (σε μοίρες)';
//    blck.Param1:=90;
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=40;
//    blck.Commandtext:='Στρίψε Αριστερά %p1 μοίρες';
//    blck.TotalParams:=1;
//    blck.MyHint:='Στροφή προς τα αριστερά (σε μοίρες)';
//    blck.Param1:=90;
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//    blck:=TDspBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=50;
//    blck.Commandtext:='Σταμάτησε';
//    blck.MyHint:='Σταματάει το ρομπότ';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//
//
//    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLoopCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=LoopBckColor;//clMaroon;
    pnl:=looppanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspLoopBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=70;
    blck.Commandtext:='Επανάλαβε %p1 φορές';
    blck.ArduCmd:='for (int %k=0;%k<%p1;%k++){';
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
    blck.ArduCmd:='while (1){';
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
    col:=CtrlBckColor;//StringToColor('$00008282');
    pnl:=ctrlPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);
    //p2 is the value to check, p1 is positive or negative control

//    blck:=TDspControlElseBlock.Create(Self);
//    blck.Parent:=ctrlPanel;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=93;
//    blck.Commandtext:='Εάν %p1 επαφή προφυλακτήρα';
//    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=94;
    blck.Commandtext:='Εάν το pin %p2 %p1 είναι 1 (high=5 Volt)';
    blck.ArduCmd:='if (digitalRead(%p2) %p1 HIGH ){';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.param2question:='Δώσε το pin του Arduino ';
    blck.param2prompt:='pin';
    blck.param1prompt:='δεν';
    blck.TotalParams:=2;
    blck.param2:=55;
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
    blck.ArduCmd:='if (digitalRead(%p2) %p1 LOW ){';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.param2question:='Δώσε το pin του Arduino ';
    blck.param2prompt:='pin';
    blck.param1prompt:='δεν';
    blck.TotalParams:=2;
    blck.param2:=55;
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
    col:=VarBckColor;//TColor($00FF0080);
    pnl:=variousPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=250;
    blck.Commandtext:='Περίμενε %p1 χιλιοστά δευτερολέπτου';
    blck.ArduCmd:='delay(%p1);';
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
    blck.ArduCmd:='pinMode(%p1,OUTPUT);';
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
    blck.ArduCmd:='pinMode(%p1,INPUT);';
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
    blck.ArduCmd:='digitalWrite(%p1,HIGH);';
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
    blck.ArduCmd:='digitalWrite(%p1,LOW);';
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
    col:= DevBckColor;
    pnl:=LCDpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

//    blck:=TDspBlock.Create(Self);//to be deleted
//    blck.Parent:=LCDpanel;
//    blck.Color:=col;
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
    blck.ArduCmd:='%dn.clear();';
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
    blck.ArduCmd:='%dn.setCursor(%p1,%p2);';
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
    blck.ArduCmd:='%dn.print("%ps");';
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
    blck.ArduCmd:='%dn.print(%p1);';
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
    blck.ArduCmd:='%dn.print("%ps");%dn.print(%p1);';
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
    col:=DevBckColor;
    pnl:=Laserpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=131;  //Laser On
    blck.Commandtext:='%pd → Ενεργοποίησε το Laser/LED ';
    blck.ArduCmd:='digitalWrite(%dp1,HIGH);';
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
    blck.ArduCmd:='digitalWrite(%dp1,LOW);';
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
    col:=DevBckColor;
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
    blck.ArduCmd:='%dn.Beep();';
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
    blck.ArduCmd:='%dn.PlayTone(%p1,%p2);';
    blck.TotalParams:=2;
//    blck.param1question:='Δώσε την συχνότητα σε hz (π.χ. 2000) ';
//    blck.param1prompt:='Τόνος';
//    blck.param2question:='Δώσε την διάρκεια σε χιλ. δευτερολέπτου ';
//    blck.param2prompt:='Διάρκεια';
    blck.param1:=1500;
    blck.param2:=500;
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
    col:=DevBckColor;
    pnl:=USonicPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=77; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Απόσταση';
    blck.ArduCmd:='%dn.distanceFront()';
    blck.TotalParams:=0;
    blck.MyHint:='Η απόσταση από το εμπόδιο';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(USONIC);


   //Command 140  sets 2 pins needed for ultrasonic (trig,Echo)

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=141;
    blck.Commandtext:='%pd → Εάν απόσταση %p1 %p2 εκατοστά';
    //blck.ArduCmd:='%dn.checkStatus();%nl if (%dn.distanceFront() %p1 %p2 ) {';
    blck.ArduCmd:='if (%dn.distanceFront() %p1 %p2 ) {';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν υπάρχει αντικείμενο μπροστά σε απόσταση %p1 τον αριθμό σε εκατοστά';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(USONIC);

//    blck:=TDspControlElseBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=142;
//    blck.Commandtext:='%pd →  Εάν απόσταση %p1 μικρότερη των %p2 εκατοστών';
//    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
//    blck.TotalParams:=2;
//    blck.param2question:='Δώσε την απόσταση σε εκατοστά';
//    blck.param2prompt:='Απόσταση (εκ.)';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//    blck.DeviceOnlyCommandID:=Ord(USONIC);


    pnl.Height:=blck.Top+blck.Height+40;
End;


procedure TfrmRoboLang.CreateServoCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=DevBckColor;//     #333300
    pnl:=Servopanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=151;
    blck.Commandtext:='%pd → Μετακίνησε ΣΕ %p1 μοίρες (0-90) Αριστερά';
    blck.ArduCmd:='%dn.servoLeftAt(%p1);';
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
    blck.ArduCmd:='%dn.servoRightAt(%p1);';
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
    blck.ArduCmd:='%dn.servoLeft(%p1);';
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
    blck.ArduCmd:='%dn.servoRight(%p1);';
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
    col:=DevBckColor;//     #333300
    pnl:=Switchpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=146;
    blck.Commandtext:='%pd → Εάν %p1 πατήθηκε ο διακόπτης';
    blck.ArduCmd:='if (%not(digitalRead(%dp1)==HIGH)) {';
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
    blck.ArduCmd:='if (%not(digitalRead(%dp1)==HIGH)) {';
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
    col:=DevBckColor;//     #333300
    pnl:=Temppanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=75; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Θερμοκρασία';
    blck.ArduCmd:='%dn.readTemperature()';
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
    blck.ArduCmd:='%dn.readHumidity()';
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
    blck.Commandtext:='%pd → Εάν Θερμοκρασία είναι %p1 %p2 (°C)';
    blck.ArduCmd:='if (%dn.readTemperature() %p1 %p2) {  ';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η θερμοκρασία είναι %p1 τους βαθμούς °Κελσίου';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

//    blck:=TDspControlElseBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=172;
//    blck.Commandtext:='%pd → Εάν Θερμοκρασία %p1 μικρότερη από %p2 (°C)';
//    blck.param1prompt:='όχι';
//    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
//    blck.TotalParams:=2;
//    blck.MyHint:='Ελέγχει εάν η θερμοκρασία είναι χαμηλότερη από τους βαθμούς °Κελσίου';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//    blck.DeviceOnlyCommandID:=Ord(TEMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=173;
    blck.Commandtext:='%pd → Εάν υγρασία είναι %p1 %p2 %';
    blck.ArduCmd:='if (%dn.readHumidity() %p1 %p2) {  ';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η υγρασία είναι %p1 τον αριθμό τοις εκατό (%)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(TEMP);

//    blck:=TDspControlElseBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=174;
//    blck.Commandtext:='%pd → Εάν υγρασία %p1 μικρότερη από %p2 %';
//    blck.param1prompt:='όχι';
//    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
//    blck.TotalParams:=2;
//    blck.MyHint:='Ελέγχει εάν η υγρασία είναι μικρότερη από τον αριθμό τοις εκατό (%)';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//    blck.DeviceOnlyCommandID:=Ord(TEMP);


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
    blck.ArduCmd:='%v2=%p1;';
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
    blck.ArduCmd:='%v2+=%p1;';
    blck.TotalParams:=2;
    blck.MyHint:='Αλλάζει κατά τιμή ή μεταβλητή την μεταβλητή που επιλέγουμε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;

    pnl.Align:=alClient;
   // pnl.Height:=blck.Top+blck.Height+40;

End;


procedure TfrmRoboLang.CreateBMP180Commands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=DevBckColor;//     #333300
    pnl:=BMPpanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=78; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Πίεση (Απόλυτη)';
    blck.ArduCmd:='%dn.getPressure()';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της Πίεσης στο ύψος που βρισκόμαστε';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=79; //FIX VARS should be 75-90
    blck.Commandtext:='%pd → Πίεση (σχετική)';
    blck.ArduCmd:='%dn.getRelPressure()';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της Πίεσης στο επίπεδο της θάλασσας';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=80; //FIX VARS should be 75-90
    blck.Commandtext:='%pd → Θερμοκρασία';
    blck.ArduCmd:='%dn.getTemperature()';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της θερμοκρασίας στο περιβάλλον';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=177;
    blck.Commandtext:='%pd → Εάν Πίεση (Απόλυτη) είναι %p1  %p2 (mb)';
    blck.ArduCmd:='if (%dn.getPressure() %p1 %p2){';
    blck.param1prompt:='δεν';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η πίεση είναι %p1 την πίεση σε mb';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=178;
    blck.Commandtext:='%pd → Εάν Πίεση (Σχετική) είναι %p1  %p2 (mb)';
    blck.ArduCmd:='if (%dn.getRelPressure() %p1 %p2){';
    blck.param1prompt:='δεν';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η πίεση είναι %p1 την πίεση σε mb';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=179;
    blck.Commandtext:='%pd → Εάν Θερμοκρασία είναι %p1 %p2 (°C)';
    blck.ArduCmd:='if (%dn.getTemperature() %p1 %p2){';
    blck.param1prompt:='όχι';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η θερμοκρασία είναι %p1 τους βαθμούς °Κελσίου';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(BMP);



    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateAnalogInCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=DevBckColor;//     #333300
    pnl:=AnalogInPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=78; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Τιμή Αναλογικής Συσκευής';
    blck.ArduCmd:='analogRead(%dp1)';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή της Αναλογικής Συσκευής (0-1024)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ANIN);


    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=166;
    blck.Commandtext:='%pd → Εάν η τιμή της συσκευής είναι %p1 %p2 ';
    blck.ArduCmd:='if (analogRead(%dp1) %p1 %p2) { ';
    blck.param1prompt:='δεν';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    TDspControlBlock(blck).IsSimple:=false;
    blck.TotalParams:=2;
    blck.MyHint:='Ελέγχει εάν η τιμή της αναλογικής συσκευής είναι %p1 την τιμή ελέγχου';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ANIN);

//    blck:=TDspControlElseBlock.Create(Self);
//    blck.Parent:=pnl;
//    blck.Color:=col;
//    blck.CommandColor:=clWhite;
//    blck.CommndID:=167;
//    blck.Commandtext:='%pd → Εάν η τιμή της  συσκευής %p1 είναι μικρότερη από %p2 ';
//    blck.param1prompt:='δεν';
//    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
//    blck.TotalParams:=2;
//    blck.MyHint:='Ελέγχει εάν η τιμή της αναλογικής συσκευής είναι μικρότερη από την τιμή ελέγχου';
//    inc(tp,50);blck.Top:=tp;
//    blck.Left:=10;
//    blck.Prototype:=true;
//    blck.DeviceOnlyCommandID:=Ord(ANIN);




    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateDcMotorCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=DevBckColor;//     #333300
    pnl:=DcMotorPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=61;
    blck.Commandtext:='%pd → Κινητήρας Μπροστά';
    blck.ArduCmd:='%dn.run(1);//Forward';
    blck.MyHint:='Κίνηση προς τα εμπρός';
    blck.Param1:=1;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(DCMOTOR);


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=61;
    blck.Commandtext:='%pd → Κινητήρας Πίσω';
    blck.ArduCmd:='%dn.run(2);//Backward';
    blck.MyHint:='Κίνηση προς τα πίσω';
    blck.Param1:=2;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(DCMOTOR);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=61;
    blck.Commandtext:='%pd → Διακοπή Κινητήρα';
    blck.ArduCmd:='%dn.run(4);//Stop';
    blck.MyHint:='Χωρίς Κίνηση';
    blck.Param1:=4;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(DCMOTOR);

    pnl.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateRobotCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=DevBckColor;//     #333300
    pnl:=DcRobotPanel;
    tp:=-40;

    pnl.color:=LightenColor(col,30);

    blck:=TDspVarBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=82; //FIX VARS should be 75-90 //signed byte -127..128
    blck.Commandtext:='%pd → Διαδρομή εκ.';
    blck.ArduCmd:='%dn.getDistance()';
    blck.TotalParams:=0;
    blck.MyHint:='Η τιμή σε εκατοστά που διάνυσε το Robot';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.param1question:=blck.Commandtext;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);


    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=51;
    blck.Commandtext:='%pd → Robot Μπροστά';
    blck.ArduCmd:='%dn.run(1);//Forward';
    blck.MyHint:='Κίνηση προς τα εμπρός';
    blck.Param1:=1;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=51;
    blck.Commandtext:='%pd → Robot Πίσω';
    blck.ArduCmd:='%dn.run(2);//Backward';
    blck.MyHint:='Κίνηση προς τα πίσω';
    blck.Param1:=2;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=55;
    blck.Commandtext:='Όρισε βήμα σε %p1 εκατοστά';
    blck.ArduCmd:='%dn.setStepTicks(%p1);';
    blck.Param1:=10;
    blck.TotalParams:=1;
    blck.MyHint:='Η απόσταση μετακίνησης σε εκατοστά (>10 και <100)';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=53;
    blck.Commandtext:='%pd → Robot Βήμα Μπροστά';
    blck.ArduCmd:='%dn.stepForward;//Backward';
    blck.MyHint:='Ένα βήμα προς τα εμπρός';
    blck.Param1:=1;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=53;
    blck.Commandtext:='%pd → Robot Βήμα Πίσω';
    blck.ArduCmd:='%dn.stepBackward;//Backward';
    blck.MyHint:='Ένα Βήμα προς τα πίσω';
    blck.Param1:=2;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=51;
    blck.Commandtext:='%pd → Robot Σταμάτα';
    blck.ArduCmd:='%dn.run(4);//Stop';
    blck.MyHint:='Χωρίς Κίνηση';
    blck.Param1:=4;
    blck.TotalParams:=1;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=52;
    blck.Commandtext:='%pd → Στροφή Δεξιά %p2 μοίρες';
    blck.ArduCmd:='%dn.turnRight(%p2);';
    blck.MyHint:='Στρίβει Δεξιά 90 μοίρες ';
    blck.Param1:=5;
    blck.Param2:=90;
    blck.TotalParams:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=52;
    blck.Commandtext:='%pd → Στροφή Αριστερά %p2 μοίρες';
    blck.ArduCmd:='%dn.turnLeft(%p2);';
    blck.MyHint:='Στρίβει Αριστερά 90 μοίρες ';
    blck.Param1:=6;
    blck.Param2:=90;
    blck.TotalParams:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=54;
    blck.Commandtext:='%pd → Στροφή Δεξιά για %p2 χιλ. δευτερολέπτου';
    blck.ArduCmd:='%dn.goRight();%nl delay(%p2);%nl %dn.run(4);';
    blck.MyHint:='Στρίβει Δεξιά για κάποιο χρόνο σε χιλιοστά του δευτερολέπτου ';
    blck.Param1:=5;
    blck.Param2:=300;
    blck.TotalParams:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=54;
    blck.Commandtext:='%pd → Στροφή Αριστερά για %p2 χιλ. δευτερολέπτου';
    blck.ArduCmd:='%dn.goLeft();%nl delay(%p2);%nl %dn.run(4);';
    blck.MyHint:='Στρίβει Αριστερά για κάποιο χρόνο σε χιλιοστά του δευτερολέπτου';
    blck.Param1:=6;
    blck.Param2:=300;
    blck.TotalParams:=2;
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(ROBOT);

    pnl.Height:=blck.Top+blck.Height+40;

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
    CreateBMP180Commands;
    CreateAnalogInCommands;
    CreateDcMotorCommands;
    CreateRobotCommands;
End;


procedure TfrmRoboLang.addDevices;
Var i,m:Integer;
begin
  //set counter label tag to -1 for only one device

  i:=0;
  ArduinoDevices[i].DeviceName:='LCD_Serial';
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

  ArduinoDevices[i].DeviceName:='BMP';
  ArduinoDevices[i].DeviceFormClass:=TfrmBMP;
  ArduinoDevices[i].DevicePanel:=pnlBMP;
  ArduinoDevices[i].DeviceCmdId:=176;
  ArduinoDevices[i].DeviceParamCount:=0;
  ArduinoDevices[i].DeviceMax:=1;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='ANIN';
  ArduinoDevices[i].DeviceFormClass:=TfrmAnalogIn;
  ArduinoDevices[i].DevicePanel:=pnlAnalogIn;
  ArduinoDevices[i].DeviceCmdId:=165;
  ArduinoDevices[i].DeviceParamCount:=1;
  ArduinoDevices[i].DeviceMax:=10;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='DCMOTOR';
  ArduinoDevices[i].DeviceFormClass:=TfrmDcMotor;
  ArduinoDevices[i].DevicePanel:=pnlDcMotor;
  ArduinoDevices[i].DeviceCmdId:=60;
  ArduinoDevices[i].DeviceParamCount:=2;
  ArduinoDevices[i].DeviceMax:=5;
  i:=i+1;

  ArduinoDevices[i].DeviceName:='ROBOT';
  ArduinoDevices[i].DeviceFormClass:=TfrmRobot;
  ArduinoDevices[i].DevicePanel:=pnlRobot;
  ArduinoDevices[i].DeviceCmdId:=50;
  ArduinoDevices[i].DeviceParamCount:=5;
  ArduinoDevices[i].DeviceMax:=1;
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
    cmb:=nil;
    firstopen:=true;
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
     reg.WriteInteger('wstate',Integer(windowstate));
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
  //refresh ports
   GetComPorts;
//  SelectNextPort;
end;

function TfrmRoboLang.LoadFormPos:boolean;
var  reg:TRegistry;
     t:integer;
Begin
   result:=true;
   reg:=TRegistry.Create;
   frmLoadPos:=true;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\MainForm\',True);
    try
     t:=reg.ReadInteger('Left');
     Left:=reg.ReadInteger('Left');
     Top:=reg.ReadInteger('Top');
     Width:=reg.ReadInteger('Width');
     Height:=reg.ReadInteger('Height');
     windowstate:=TWindowState(reg.ReadInteger('wstate'));

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

procedure TfrmRoboLang.ComPortChanged(Sender:tobject);
Begin
  BTIndex:=TComboBox(Sender).ItemIndex;
  SaveBTPort;
End;

procedure TfrmRoboLang.GetComPorts;
var i,n:integer;
    t:string;
    ts:Tstringlist;
Begin
   BTComList:=TStringlist.Create;
   BTComList.Clear;
   BTComList.Sorted := True;
   BTComList.Duplicates := dupIgnore;
   t:=GetBTPortFromFile;
   if t='' then
   Begin
     ts:=Tstringlist.create;
     SetupEnumAvailableComPorts(ts);
     for i := 0 to ts.count-1 do
     Begin
       if (Onlybluetooth and (POS('BLUE',uppercase(ts.values[ts.Names[i]]))>0)) or not Onlybluetooth then
       Begin
          n:=max(5,pos(':',ts.names[i]));
          BTComList.add(copy(ts.names[i],1,n-1));
       End;
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
   LoadBTPort;
   if BTIndex>=BTComList.count then
       BTIndex:=BTComList.count-1;
   if BTIndex=-1 then
    ShowMessage('Δεν βρέθηκαν σειριακές πόρτες επικοινωνίας. Εγκαταστήστε το Arduino.');
   try
    t:=BTComList[BTIndex];
   Except
     t:='None';
   end;

   sbar.Panels[0].Text:='Port: ';
   sbar.Hint:='Επιλέξτε πόρτα επικοινωνίας με το Arduino.'#13#10'Διπλό κλικ για ανανέωση';
   sbar.ShowHint:=true;
   if cmb=nil then
    cmb:=TComboBox.Create(Self);
   cmb.Parent:=sbar;
   cmb.Width:=70;
   cmb.Left:=sbar.canvas.TextWidth(sbar.Panels[0].Text)+7;

   cmb.Items.Assign(BTComList);
   BtComList.Free;
   BTComList:=TStringList(cmb.Items);
   cmb.Text:=t;
   cmb.OnClick:=ComPortChanged;
   addDevices;
   DeviceChanged;

End;

Procedure TfrmRoboLang.showMyHint;
var t:tpoint;
Begin

balloonhint1.Description:=Sbar.Hint+#13#10'-----------------';
balloonhint1.Title:='ΠΡΟΣΟΧΗ!!!';

t:=ClientToScreen(sbar.BoundsRect.Topleft);
balloonhint1.ShowHint(RECT(60,t.Y ,160,t.y+280));

End;

procedure TfrmRoboLang.FormShow(Sender: TObject);
var i,n:integer;
    t:string;
    ts:Tstringlist;

begin



  try
    frmUpdate:= TfrmUpdate.Create(self);
    frmUpdate.ShowModal;
  except

  end;

   adddebug(GetComputerName);



    GetComPorts;

   for i := 0 to Pred(ControlCount) do
    if Controls[i] is TSpeedButton then
      TSpeedButton(Controls[i]).Caption := '';
//   if (t='') then //and IsServer then
//   Begin
//     ShowMessage('Δεν βρέθηκε ασύρματη σειριακή θύρα Bluetooth!!!'#13#10'Πρέπει να εγκαταστήσετε έναν Bluetooth adaptor και να κάνετε Pair.'#13#10'Αν γνωρίζετε την σειριακή θύρα προσθέστε την στο αρχείο BTPort.ini {ComPort=COMx}');
//     sbar.Panels[0].Text:='BT Port: None';
//   End
//   else

   TNBook.PageIndex:=0;
   PageControl1.TabIndex:=0;
   Application.ProcessMessages;
    frmOptions.FormShow(nil);
   try
    frmOptions.chkArduinoPathValid;
   except
     if frmOptions.ShowModal=mrCancel then
     Begin
      Showmessage('Θα πρέπει να εγκαταστήσετε το Arduino IDE και τις απαραίτητες βιβλιοθήκες'#13#10'Για οδηγίες πηγαίνετε στην ιστοσελίδα users.sch.gr/cdesp.');
      application.Terminate;
     End;
   end;

  showMyHint;
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
 NewActiveDevice;
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

function TfrmRoboLang.GetArduType:String;
Begin
   case RadioGroup1.itemindex of
      0:Result:='Uno';
      1:Result:='Uno';//'Nano';
      2:Result:='Mega';
   end;
End;

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

procedure TfrmRoboLang.BurnArduino;
Var CmdS,ParamS:String;
   pth:String;
   comport:String;
   ArduType:String;
   ts:String;
Begin
 if btindex=-1 then Begin ShowMessage('You must have a Com Port selected!!!');Exit;End;

 memo1.Visible:=true;
 Memo1.Height:=500;
 try
  pth:= mainpath+'Arduino\';
  ComPort:= BTComList[BTindex];
  ArduType:= GetArduType;

 ts:='%p1CtrlPlatform.ino.%p3.hex';
 ts:=StringReplace(ts,'%p1',pth,[rfReplaceAll]);
 ts:=StringReplace(ts,'%p3',ArduType,[rfReplaceAll]);
 if not FileExists(ts) then
  Begin
   ShowMessage('Το αρχείο δεν υπάρχει!!! '#13#10+ts+#13#10'Η διαδικασία ακυρώθηκε.');
   exit;
  End;


//avrdude -Cavrdude.conf -v -patmega328p -carduino -PCOM8 -b57600 -D -Uflash:w:CtrlPlatform.ino.NANO.hex:i
  CmdS:='"%p1avrdude.exe"';
  CmdS:=StringReplace(CmdS,'%p1',pth,[rfReplaceAll]);
  ParamS:='-C"%p1avrdude.conf" -v -patmega328p -cwiring -P%p2 -b115200 -D -Uflash:w:"%p1CtrlPlatform.ino.%p3.hex":i ';
  ParamS:=StringReplace(ParamS,'%p1',pth,[rfReplaceAll]);
  ParamS:=StringReplace(ParamS,'%p2',ComPort,[rfReplaceAll]);
  ParamS:=StringReplace(ParamS,'%p3',ArduType,[rfReplaceAll]);
  Adddebug(CmdS+' '+ParamS);
  memo1.lines.add(CmdS+' '+Params);
  CaptureConsoleOutput(CmdS,ParamS,Memo1);
  Adddebug('Burning Complete!!!');
  ShowMessage('Burning Complete!!!');
 finally
  //Memo1.Visible:=false;
 end;
End;

procedure TfrmRoboLang.ComPort1Exception(Sender: TObject; TComException:
    TComExceptions; ComportMessage: string; WinError: Int64; WinMessage:
    string);
begin
 AddDebug(ComportMessage);
 AddDebug(WinMessage);
end;


initialization
mainpath:=Extractfilepath(Application.ExeName);

end.
