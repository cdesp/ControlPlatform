unit MahUSB;
interface
uses Windows, Messages, SysUtils, Classes, Registry, Masks;

type
  { Event Types }
  TOnDevVolumeEvent = procedure(const bInserted : boolean;
                                const sDrive : string) of object;
  TOnUsbChangeEvent = procedure(const bInserted : boolean;
                                const ADevType,ADriverName,
                                      AFriendlyName : string) of object;

  { USB Class }
  TUsbClass = class(TObject)
  private
    FHandle : HWND;
    FOnUsbChangeEvent : TOnUsbChangeEvent;
    FOnDevVolumeEvent : TOnDevVolumeEvent;
    procedure GetUsbInfo(const ADeviceString : string;
                         out ADevType,ADriverDesc,
                            AFriendlyName : string);
    function DriverLetter(const aUM:Cardinal) : string;
    procedure WinMethod(var AMessage : TMessage);
    procedure RegisterUsbHandler;
    procedure WMDeviceChange(var AMessage : TMessage);
  public
    constructor Create;
    destructor Destroy; override;
    property OnUsbChange : TOnUsbChangeEvent read FOnUsbChangeEvent
                                           write FOnUsbChangeEvent;
    property OnDevVolume : TOnDevVolumeEvent read FOnDevVolumeEvent
                                          write FOnDevVolumeEvent;
  end;



// -----------------------------------------------------------------------------
implementation

type
  // Win API Definitions
  PDevBroadcastDeviceInterface  = ^DEV_BROADCAST_DEVICEINTERFACE;
  DEV_BROADCAST_DEVICEINTERFACE = record
    dbcc_size : DWORD;
    dbcc_devicetype : DWORD;
    dbcc_reserved : DWORD;
    dbcc_classguid : TGUID;
    dbcc_name : char;
  end;

  PDEV_BROADCAST_VOLUME = ^DEV_BROADCAST_VOLUME;
  DEV_BROADCAST_VOLUME = record
    dbcv_size : DWORD;
    dbcv_devicetype : DWORD;
    dbcv_reserved : DWORD;
    dbcv_unitmask : DWORD;
    dbcv_flags : WORD;
  end;
{
dbcv_flags ->

DBTF_MEDIA   0x0001
Change affects media in drive. If not set, change affects physical device or drive.

DBTF_NET   0x0002
Indicated logical volume is a network volume.
}



const
{
http://msdn.microsoft.com/en-us/library/aa363431%28VS.85%29.aspx

RegisterDeviceNotification


http://msdn.microsoft.com/en-us/library/aa363246%28VS.85%29.aspx

DBT_DEVTYP_DEVICEINTERFACE   0x00000005
Class of devices. This structure is a DEV_BROADCAST_DEVICEINTERFACE structure.

DBT_DEVTYP_HANDLE   0x00000006
File system handle. This structure is a DEV_BROADCAST_HANDLE structure.

DBT_DEVTYP_OEM   0x00000000
OEM- or IHV-defined device type. This structure is a DEV_BROADCAST_OEM structure.

DBT_DEVTYP_PORT   0x00000003
Port device (serial or parallel). This structure is a DEV_BROADCAST_PORT structure.

DBT_DEVTYP_VOLUME   0x00000002
Logical volume. This structure is a DEV_BROADCAST_VOLUME structure.
}
  // Miscellaneous
  GUID_DEVINTF_USB_DEVICE : TGUID = '{A5DCBF10-6530-11D2-901F-00C04FB951ED}';
  USB_VOLUME                   = $00000002; // Device interface class
  USB_INTERFACE                = $00000005; // Device interface class
  USB_INSERTION                = $8000;     // System detected a new device
  USB_REMOVAL                  = $8004;     // Device is gone
  DBTF_MEDIA =  $0001;
  DBTF_NET   =  $0002;

  // Registry Keys
  USBKEY  = 'SYSTEM\CurrentControlSet\Enum\USB\%s\%s';
  USBSTORKEY = 'SYSTEM\CurrentControlSet\Enum\USBSTOR';
  SUBKEY1  = USBSTORKEY + '\%s';
  SUBKEY2  = SUBKEY1 + '\%s';


constructor TUsbClass.Create;
begin
  inherited Create;
  FHandle := AllocateHWnd(WinMethod);
  RegisterUsbHandler;
end;


destructor TUsbClass.Destroy;
begin
  DeallocateHWnd(FHandle);
  inherited Destroy;
end;


procedure TUsbClass.GetUsbInfo(const ADeviceString : string;
                               out ADevType,ADriverDesc,
                                   AFriendlyName : string);
var sWork,sKey1,sKey2 : string;
    oKeys,oSubKeys : TStringList;
    oReg : TRegistry;
    i,ii : integer;
    bFound : boolean;
begin
  ADevType := '';
  ADriverDesc := '';
  AFriendlyName := '';

  if ADeviceString <> '' then begin
    bFound := false;
    oReg := TRegistry.Create;
    oReg.RootKey := HKEY_LOCAL_MACHINE;

    // Extract the portions of the string we need for registry. eg.
    // \\?\USB#Vid_4146&Pid_d2b5#0005050400044#{a5dcbf10- ..... -54334fb951ed}
    // We need sKey1='Vid_4146&Pid_d2b5' and sKey2='0005050400044'
    sWork := copy(ADeviceString,pos('#',ADeviceString) + 1,1026);
    sKey1 := copy(sWork,1,pos('#',sWork) - 1);
    sWork := copy(sWork,pos('#',sWork) + 1,1026);
    sKey2 := copy(sWork,1,pos('#',sWork) - 1);

    // Get the Device type description from \USB key
    if oReg.OpenKeyReadOnly(Format(USBKEY,[skey1,sKey2])) then begin
      ADevType := oReg.ReadString('DeviceDesc');
      oReg.CloseKey;
      oKeys := TStringList.Create;
      oSubKeys := TStringList.Create;

      // Get list of keys in \USBSTOR and enumerate each key
      // for a key that matches our sKey2='0005050400044'
      // NOTE : The entry we are looking for normally has '&0'
      // appended to it eg. '0005050400044&0'
      if oReg.OpenKeyReadOnly(USBSTORKEY) then begin
        oReg.GetKeyNames(oKeys);
        oReg.CloseKey;

        // Iterate through list to find our sKey2
        for i := 0 to oKeys.Count - 1 do begin
          if oReg.OpenKeyReadOnly(Format(SUBKEY1,[oKeys[i]])) then begin
            oReg.GetKeyNames(oSubKeys);
            oReg.CloseKey;

            for ii := 0 to oSubKeys.Count - 1 do begin
              if MatchesMask(oSubKeys[ii],sKey2 + '*') then begin
                // Got a match?, get the actual desc and friendly name
                if oReg.OpenKeyReadOnly(Format(SUBKEY2,[oKeys[i],
                                        oSubKeys[ii]])) then begin
                  ADriverDesc := oReg.ReadString('DeviceDesc');
                  AFriendlyName := oReg.ReadString('FriendlyName');
                  oReg.CloseKey;
                end;

                bFound := true;
              end;
            end;
          end;

          if bFound then break;
        end;
      end;

      FreeAndNil(oKeys);
      FreeAndNil(oSubKeys);
    end;

    FreeAndNil(oReg);
  end;
end;


procedure TUsbClass.WMDeviceChange(var AMessage : TMessage);
var iDevType : integer;
    sDevString,sDevType,
    sDriverName,sFriendlyName : string;
    pData : PDevBroadcastDeviceInterface;
    pVol : PDEV_BROADCAST_VOLUME;
begin
  if (AMessage.wParam = USB_INSERTION) or
     (AMessage.wParam = USB_REMOVAL) then begin
    pData := PDevBroadcastDeviceInterface(AMessage.LParam);
    iDevType := pData^.dbcc_devicetype;

    if iDevType = USB_VOLUME then
      if Assigned(FOnDevVolumeEvent) then begin
        pVol := PDEV_BROADCAST_VOLUME(AMessage.LParam);
        FOnDevVolumeEvent((AMessage.wParam = USB_INSERTION),
                          DriverLetter(pVol.dbcv_unitmask));
      end
      else
    else
    // Is it a USB Interface Device ?
    if iDevType = USB_INTERFACE then begin
      sDevString := PChar(@pData^.dbcc_name);
      GetUsbInfo(sDevString,sDevType,sDriverName,sFriendlyName);
      // Trigger Events if assigned
      if Assigned(FOnUsbChangeEvent) then
         FOnUsbChangeEvent((AMessage.wParam = USB_INSERTION),
                           sDevType,sDriverName,sFriendlyName);
    end;
  end;
end;



procedure TUsbClass.WinMethod(var AMessage : TMessage);
begin
  if (AMessage.Msg = WM_DEVICECHANGE) then
    WMDeviceChange(AMessage)
  else
    AMessage.Result := DefWindowProc(FHandle,AMessage.Msg,
                                     AMessage.wParam,AMessage.lParam);
end;


procedure TUsbClass.RegisterUsbHandler;
var rDbi : DEV_BROADCAST_DEVICEINTERFACE;
    iSize : integer;
begin
  iSize := SizeOf(DEV_BROADCAST_DEVICEINTERFACE);
  ZeroMemory(@rDbi,iSize);
  rDbi.dbcc_size := iSize;
  rDbi.dbcc_devicetype := USB_INTERFACE;
  rDbi.dbcc_reserved := 0;
  rDbi.dbcc_classguid  := GUID_DEVINTF_USB_DEVICE;
  rDbi.dbcc_name := #0;
  RegisterDeviceNotification(FHandle,@rDbi,DEVICE_NOTIFY_WINDOW_HANDLE);
end;


function TUsbClass.DriverLetter(const aUM: Cardinal): string;
begin
  case aUM of
          1:  result :=  'A:';
          2:  result :=  'B:';
          4:  result :=  'C:';
          8:  result :=  'D:';
         16:  result :=  'E:';
         32:  result :=  'F:';
         64:  result :=  'G:';
        128:  result :=  'H:';
        256:  result :=  'I:';
        512:  result :=  'J:';
       1024:  result :=  'K:';
       2048:  result :=  'L:';
       4096:  result :=  'M:';
       8192:  result :=  'N:';
      16384:  result :=  'O:';
      32768:  result :=  'P:';
      65536:  result :=  'Q:';
     131072:  result :=  'R:';
     262144:  result :=  'S:';
     524288:  result :=  'T:';
    1048576:  result :=  'U:';
    2097152:  result :=  'V:';
    4194304:  result :=  'W:';
    8388608:  result :=  'X:';
   16777216:  result :=  'Y:';
   33554432:  result :=  'Z:';
  end;
end;

end.