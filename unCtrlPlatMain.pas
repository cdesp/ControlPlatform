unit unCtrlPlatMain;


interface

uses  Vcl.Dialogs, CPort, System.Classes,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.Controls,
  Vcl.Menus, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Forms, Vcl.StdCtrls,
  Vcl.Buttons,Winapi.Windows,unBlock,Winapi.Messages,System.SysUtils, System.Variants,
  unContainerBlock,Vcl.Graphics, Vcl.TabNotBk, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.Imaging.jpeg;


Const Version='0.3 (’λφα έκδοση 10/10/2017)  - ';
Const Programmer='© 2017 Despoinidis Christos';
Const Progname='Έλεγχος συσκευών Arduino';
Const Onlybluetooth=FALSE;
const WM_REFRESH_MSG = WM_USER + 1;


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
    SetServer1: TMenuItem;
    Timer1: TTimer;
    TNBook: TTabbedNotebook;
    ScrollBox1: TScrollBox;
    Image2: TImage;
    CategoryPanelGroup1: TCategoryPanelGroup;
    variousPanel: TCategoryPanel;
    CtrlPanel: TCategoryPanel;
    LoopPanel: TCategoryPanel;
    MovPanel: TCategoryPanel;
    strtPanel: TCategoryPanel;
    Splitter2: TSplitter;
    ScrollBox2: TScrollBox;
    pnlLCD: TPanel;
    Image1: TImage;
    Label1: TLabel;
    LCDadd: TBitBtn;
    lblLCD: TLabel;
    LCDpanel: TCategoryPanel;
    BalloonHint1: TBalloonHint;
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    lblLaser: TLabel;
    LaserAdd: TBitBtn;
    DevBook: TTabbedNotebook;
    RadioGroup1: TRadioGroup;
    Panel1: TPanel;
    ArduImage: TImage;
    ArduPinout: TImage;
    LaserPanel: TCategoryPanel;
    SoundPanel: TCategoryPanel;
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
    USonicPanel: TCategoryPanel;
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
    procedure acSndLeftExecute(Sender: TObject);
    procedure acSndRightExecute(Sender: TObject);
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
  private
    ComIdle:boolean;
    ChkByte:Byte;
    srvCodeRec:boolean;
    frmLoadPos:Boolean;
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


implementation
uses Registry, unAbout, inifiles,setupapi,math,  unDevices, unHelpForms,unUtils,
      fserialLcd,fLaser,fSound,fUSonic
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


function   GetBlutoothComPort(BTComList:TStrings): String;
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
     i:Integer;
Begin
  NxtBlock:=blck;
  while Assigned(nxtblock) do
  Begin
    Adddebug('Sending CMD='+inttostr(NxtBlock.CommndID)
     +'Dev= '+inttostr(NxtBlock.FpDevice)
     +'p_1='+inttostr(NxtBlock.Param1)
     +'P_2='+inttostr(NxtBlock.Param2)
    );
    BTSendInteger( NxtBlock.CommndID);
    BTSendInteger( NxtBlock.PDevice);//device id -1 for no device
    BTSendInteger( NxtBlock.Param1);
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

procedure TfrmRoboLang.acConnectExecute(Sender: TObject);
Var strt:TDspBlock;
    t:cardinal;
    roboready:Boolean;

    cnt:Integer;
    I,k: Integer;
    CommndID,param1,param2:integer;
begin

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
    ShowMEssage('Το Robot δεν ανταποκρίνετε!!!. Ξαναδοκιμάστε.');
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
//     adddebug('------------------------');
//     adddebug('Setup Cmd:'+inttostr(CommndID));
//     adddebug('Device ID:'+inttostr(i));
//     adddebug('Param 1  :'+inttostr(Param1));
//     adddebug('Param 2  :'+inttostr(Param2));
//     adddebug('------------------------');
     BTSendInteger(CommndID);
     BTSendInteger(i); //device id
     BTSendInteger(Param1);
     BTSendInteger(Param2);
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

    if hasblocks and (MessageDlg('Επιβεβαίωση', mtConfirmation, [mbYes, mbNo], 0) = mrYes)  then
    Begin
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


procedure LoadComponentFromFile(parent: TComponent; const FileName: TFileName; MyStream:TMemoryStream=Nil);
var
  FileStream : TFileStream;
  MemStream : TMemoryStream;
  i: Integer;
  component,owner:TComponent;
  fl,fr:boolean;
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
      component:=MemStream.ReadComponent(nil);
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
        End;
        if owner.Components[i] is TDspContainerBlockEnd then
            TDspContainerBlockEnd(owner.Components[i]).FContainerBlock.EndBlock:=TDspContainerBlockEnd(owner.Components[i]);
        if owner.Components[i] is TDspControlBlockElse then
           TDspControlElseBlock( TDspControlBlockElse(owner.Components[i]).FContainerBlock).ElseBlock:=TDspControlBlockElse(owner.Components[i]);

    end;
  end;
end;


procedure TfrmRoboLang.acopenExecute(Sender: TObject);
begin

  if opendialog1.Execute then
  Begin
    LoadActiveDevices(opendialog1.FileName);
    LoadComponentFromFile(Scrollbox1,opendialog1.FileName);
    SaveDialog1.FileName:=opendialog1.FileName;
    sbar.Panels[1].Text:=    opendialog1.FileName;
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
   OpenDialog1.FileName:=Savedialog1.FileName;
   sbar.Panels[1].Text:=    opendialog1.FileName;


end;

procedure TfrmRoboLang.acSndLeftExecute(Sender: TObject);
begin
  BTOpen;
  BTPutChar('o');
end;

procedure TfrmRoboLang.acSndRightExecute(Sender: TObject);
begin
  BTOpen;
  BTPutChar('p');
end;

procedure TfrmRoboLang.acStopExecute(Sender: TObject);
begin
  BTPutChar('0');
end;

procedure TfrmRoboLang.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    comport1.Close;
  except

  end;
  emptycomps;

end;

procedure TfrmRoboLang.CreateStartCommands;
Var col:Tcolor;
Begin
    col:=clGreen;

    blck:=TDspBlock.Create(Self);
    blck.topNose:=false;
    blck.Parent:=strtPanel;
    blck.Color:=col;
    blck.BorderColor:=clAqua;
    blck.CommandColor:=clWhite;
    blck.CommndID:=1;
    blck.Commandtext:='Έναρξη προγράμματος';
    blck.Top:=10;
    blck.Left:=10;



    blck:=TDspBlock.Create(Self);
    blck.botNose:=false;
    blck.Parent:=strtPanel;
    blck.Color:=col;
    blck.BorderColor:=clAqua;
    blck.CommandColor:=clWhite;
    blck.CommndID:=2;
    blck.Commandtext:='Τερματισμός προγράμματος';
    blck.Top:=60;
    blck.Left:=10;

    {blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=strtPanel;
    blck.Color:=col;
    blck.BorderColor:=clAqua;
    blck.CommandColor:=clWhite;
    blck.Commandtext:='Εάν %p1 απόσταση μεγαλύτερη του %p2';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.CommndID:=80;
    blck.Top:=110;
    blck.Left:=10; }


    strtPanel.Height:=blck.Top+blck.Height+40;
End;

procedure TfrmRoboLang.CreateMoveCommands;
Var col:Tcolor;
    tp:integer;
Begin
    col:=clBlue;
    tp:=-40;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=Movpanel;
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
    blck.Parent:=Movpanel;
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
    blck.Parent:=Movpanel;
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
    blck.Parent:=Movpanel;
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
    blck.Parent:=Movpanel;
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
    blck.Parent:=Movpanel;
    blck.Color:=col;
    blck.BorderColor:=clGreen;
    blck.CommandColor:=clWhite;
    blck.CommndID:=50;
    blck.Commandtext:='Σταμάτησε';
    blck.MyHint:='Σταματάει το ρομπότ';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;


    Movpanel.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLoopCommands;
Var col:Tcolor;
Begin
    col:=clMaroon;

    blck:=TDspLoopBlock.Create(Self);
    blck.Parent:=looppanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=70;
    blck.Commandtext:='Επανάλαβε %p1 φορές';
    TDspLoopBlock(blck).EndBlockText:='Τέλος Επανάληψης';
    blck.TotalParams:=1;
    blck.MyHint:='Επαναλαμβάνει τις εντολές που περιέχονται όσες φορές θέλουμε';
    blck.Param1:=5;
    blck.Top:=10;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspLoopBlock.Create(Self);
    blck.Parent:=looppanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=72;
    blck.Commandtext:='Επανάλαβε συνεχώς';
    TDspLoopBlock(blck).EndBlockText:='Τέλος Επανάληψης';
    blck.TotalParams:=0;
    blck.MyHint:='Επαναλαμβάνει τις εντολές που περιέχονται για πάντα';
    blck.Param1:=0;
    blck.Top:=60;
    blck.Left:=10;
    blck.Prototype:=true;

    looppanel.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateControlCommands;
Var col:Tcolor;
Begin
    col:=StringToColor('$00008282');
    //p2 is the value to check, p1 is positive or negative control


    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=82;
    blck.Commandtext:='Εάν απόσταση δεξιά %p1 μεγαλύτερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.param2question:='Δώσε την απόσταση σε εκατοστά';
    blck.param2prompt:='Απόσταση (εκ.)';
    blck.Top:=110;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=83;
    blck.Commandtext:='Εάν απόσταση δεξιά %p1 μικρότερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.param1question:='Δώσε την απόσταση σε εκατοστά';
    blck.param1prompt:='Απόσταση (εκ.)';
    blck.Top:=160;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=84;
    blck.Commandtext:='Εάν απόσταση αριστερά %p1 μεγαλύτερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.param2question:='Δώσε την απόσταση σε εκατοστά';
    blck.param2prompt:='Απόσταση (εκ.)';
    blck.Top:=210;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=85;
    blck.Commandtext:='Εάν απόσταση αριστερά %p1 μικρότερη των %p2 εκατοστών';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.TotalParams:=2;
    blck.param2question:='Δώσε την απόσταση σε εκατοστά';
    blck.param2prompt:='Απόσταση (εκ.)';
    blck.Top:=260;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=86;
    blck.Commandtext:='Εάν %p1 ήχος αριστερά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=310;
    blck.Left:=10;
    blck.enabled:=false;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=87;
    blck.Commandtext:='Εάν %p1 ήχος δεξιά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=360;
    blck.Left:=10;
    blck.enabled:=false;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=88;
    blck.Commandtext:='Εάν %p1 Μαύρο αριστερά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=410;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=89;
    blck.Commandtext:='Εάν %p1 Μαύρο δεξιά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=460;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=90;
    blck.Commandtext:='Εάν %p1 Μαύρο τέρμα αριστερά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=510;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=91;
    blck.Commandtext:='Εάν %p1 Μαύρο τέρμα δεξιά';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=560;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=92;
    blck.Commandtext:='Εάν %p1 Μαύρο στην μέση';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=610;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=ctrlPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=93;
    blck.Commandtext:='Εάν %p1 επαφή προφυλακτήρα';
    TDspControlBlock(blck).EndBlockText:='Τέλος Εάν';
    blck.Top:=660;
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
    blck.Top:=710;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
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
    blck.Top:=760;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;


    ctrlPanel.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateVariousCommands;
Var col:Tcolor;
Begin
    col:=TColor($00FF0080);


    blck:=TDspBlock.Create(Self);
    blck.Parent:=variousPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=250;
    blck.Commandtext:='Περίμενε %p1 χιλιοστά δευτερολέπτου';
    blck.param1question:='Δώσε τα χιλιοστά δευτερολέπτου (1000=1 δευτ) ';
    blck.param1prompt:='Χιλιοστά';
    blck.TotalParams:=1;
    blck.param1:=1000;
    blck.Top:=10;
    blck.Left:=10;
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=variousPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=200;
    blck.Commandtext:='Διαμόρφωσε το pin %p1 για έξοδο';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    blck.Top:=160;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=variousPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=201;
    blck.Commandtext:='Διαμόρφωσε το pin %p1 για είσοδο';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    blck.Top:=210;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=variousPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=202;
    blck.Commandtext:='Θέσε το pin %p1 σε 1 (high=5 Volt)';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    blck.Top:=260;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=variousPanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=203;
    blck.Commandtext:='Θέσε το pin %p1 σε 0 (low=0 Volt)';
    blck.param1question:='Δώσε το pin του Arduino ';
    blck.param1prompt:='pin';
    blck.TotalParams:=1;
    blck.param1:=2;
    blck.Top:=310;
    blck.Left:=10;
    blck.MyHint:='A0=pin54 A1=pin55 ... A15=pin69';
    blck.Prototype:=true;

    variousPanel.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLCDCommands;
Var col:Tcolor;
    tp:integer;
Begin
    col:=TColor( $00CC6600 );
    LCDpanel.color:=LightenColor(col,30);
    tp:=-40;

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
    blck.CommndID:=121;  //LCDprint
    blck.Commandtext:='Τύπωσε στην LCD %ps ';
    blck.Param1:=0;
    blck.ParamStr:='Μήνυμα';//should make an inline editor fro this
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
    blck.CommndID:=122;
    blck.Commandtext:='Καθάρίσε την LCD';
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

    LCDpanel.Height:=blck.Top+blck.Height+40;

End;

procedure TfrmRoboLang.CreateLaserCommands;
Var col:Tcolor;
    tp:integer;
Begin
    col:=TColor($007500CC);
    Laserpanel.color:=LightenColor(col,30);
    tp:=-40;

    blck:=TDspBlock.Create(Self);
    blck.Parent:=Laserpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=131;  //Laser On
    blck.Commandtext:='%pd -> Ενεργοποίησε το Laser ';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Ενεργοποιεί το Laser';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LASER); //Device id 1


    blck:=TDspBlock.Create(Self);
    blck.Parent:=Laserpanel;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=132;  //Laser Off
    blck.Commandtext:='%pd -> Απενεργοποίησε το Laser ';
    blck.Param1:=0;
    blck.Param2:=0;
    blck.TotalParams:=1;
    blck.MyHint:='Απενεργοποιεί το Laser';
    inc(tp,50);blck.Top:=tp;
    blck.Left:=10;
    blck.Prototype:=true;
    blck.DeviceOnlyCommandID:=Ord(LASER); //Device id 1


    Laserpanel.Height:=blck.Top+blck.Height+40;

End;


procedure TfrmRoboLang.CreateSoundCommands;
Var col:Tcolor;
    tp:integer;
    pnl:TCategoryPanel;
Begin
    col:=TColor( $0000BFFF );
    pnl:=SoundPanel;
    pnl.color:=LightenColor(col,30);
    tp:=-40;


    //Command 110 just sets pin for output

    blck:=TDspBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=111;
    blck.Commandtext:='%pd -> Παίξε ήχο beep';
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
    blck.Commandtext:='%pd -> Παίξε ήχο με συχνότητα %p1 και διάρκεια %p2';
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
    col:=TColor( $0000BFFF );
    pnl:=USonicPanel;
    pnl.color:=LightenColor(col,30);
    tp:=-40;

   //Command 140  sets 2 pins needed for ultrasonic (trig,Echo)

    blck:=TDspControlElseBlock.Create(Self);
    blck.Parent:=pnl;
    blck.Color:=col;
    blck.CommandColor:=clWhite;
    blck.CommndID:=141;
    blck.Commandtext:='%pd -> Εάν απόσταση %p1 μεγαλύτερη των %p2 εκατοστών';
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
    blck.Commandtext:='%pd ->  Εάν απόσταση %p1 μικρότερη των %p2 εκατοστών';
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



procedure TfrmRoboLang.Edit1Exit(Sender: TObject);
begin
 self.SetFocus;
end;

procedure TfrmRoboLang.CategoryPanelGroup1MouseEnter(Sender: TObject);
begin
 CategoryPanelGroup1.setfocus;
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
        CategoryPanelGroup1.Perform(WM_VSCROLL, SB_LINEUP, 0)
      else
        CategoryPanelGroup1.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
    finally
      CategoryPanelGroup1.Perform(WM_VSCROLL, SB_ENDSCROLL, 0);
    end;
end;

Var ln:string='';
procedure TfrmRoboLang.ComPort1RxChar(Sender: TObject; Count: Integer);
var s:string;
begin
 if ComIdle then
 Begin
  comport1.ReadStr(s,count);
  ln:=ln+s;
  if s[count-1]=#13 then
  Begin
   Adddebug(ln);
   ln:='';
  End;
 End;

end;

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
End;

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
          Components[i].Free;
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
  ArduinoDevices[i].DeviceMax:=10;
  i:=i+1;


   m:=i;
  //Set panel tag to device number
  for i := 0 to m-1 do
   if ArduinoDevices[i].DeviceName<>'' then
       ArduinoDevices[i].DevicePanel.Tag:=i;
end;

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

procedure TfrmRoboLang.DeviceChanged;
Var k:integer;
    pth:String;
    nm,nmpin:String;
Begin
   //TODO:Take it from the executables dir
   pth:='G:\_Programming\ControlPlatform';
   k:=RadioGroup1.ItemIndex;
   Arduino.Id:=k;
   case k of
       0:Begin
          nm:='Arduino Uno';
         End;
       1:Begin
          nm:='Arduino Nano';
          nmpin:=nm+' Pin.png';
          Arduino.MaxPins:=19;
         End;
       2:Begin
          nm:='Arduino Mega';
         End;
   end;
   ArduImage.Picture.LoadFromFile(pth+'\images\'+nm+'.png');
   ArduPinout.Picture.LoadFromFile(pth+'\images\'+nmpin);
   DevBook.Pages[0]:=nm;
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


end.
