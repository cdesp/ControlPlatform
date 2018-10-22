unit DspUtils;

interface
uses Vcl.Graphics,stdctrls;

function DarkenColor(Color: TColor; Amount: Integer): TColor;
function LightenColor(Color: TColor; Amount: Integer): TColor;
function HTMLtocolor(htmColor:String):tColor;
procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
procedure ExecuteAndWait(const aCommando: string);

implementation
uses classes,system.types,sysutils,windows,forms;

type
TRGBAColor = packed record
R, G, B, A: Byte;
end;

function HTMLtocolor(htmColor:String):tColor;
var DColor:String;
begin
//  htmColor= #084B8A    Delphi Color='$008A4B08'
  DColor:='$00'+copy(htmColor,6,2)+copy(htmColor,4,2)+copy(htmColor,2,2);
  result:=StringtoColor(DColor)
end;


function DarkenColor(Color: TColor; Amount: Integer): TColor;
var
C: TRGBAColor;
begin
C := TRGBAColor(ColorToRGB(Color));
C.R := C.R * (100 - Amount) div 100;
C.G := C.G * (100 - Amount) div 100;
C.B := C.B * (100 - Amount) div 100;
Result := TColor(C);
end;

function LightenColor(Color: TColor; Amount: Integer): TColor;
var
C: TRGBAColor;
begin
C := TRGBAColor(ColorToRGB(Color));
C.R := 255 - (255 - C.R) * (100 - Amount) div 100;
C.G := 255 - (255 - C.G) * (100 - Amount) div 100;
C.B := 255 - (255 - C.B) * (100 - Amount) div 100;
Result := TColor(C);
end;



procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of AnsiChar;
   dRead: DWord;
   dRunning,dwBytesAvailable: DWord;
 begin

   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning  := WaitForSingleObject(piProcess.hProcess, 100);
          Application.ProcessMessages();
         if PeekNamedPipe(hRead, nil, 0, nil, @dwBytesAvailable, nil) then
         if dwBytesAvailable>0 then
         repeat
           dRead := 0;

           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;

           //OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);


       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
end;

procedure ExecuteAndWait(const aCommando: string);
var
  tmpStartupInfo: TStartupInfo;
  tmpProcessInformation: TProcessInformation;
  tmpProgram: String;
begin
  tmpProgram := trim(aCommando);
  FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
  with tmpStartupInfo do
  begin
    cb := SizeOf(TStartupInfo);
    wShowWindow := SW_HIDE;
  end;

  if CreateProcess(nil, pchar(tmpProgram), nil, nil, true, CREATE_NO_WINDOW,
    nil, nil, tmpStartupInfo, tmpProcessInformation) then
  begin
    // loop every 10 ms
    while WaitForSingleObject(tmpProcessInformation.hProcess, 10) > 0 do
    begin
      Application.ProcessMessages;
    end;
    CloseHandle(tmpProcessInformation.hProcess);
    CloseHandle(tmpProcessInformation.hThread);
  end
  else
  begin
    RaiseLastOSError;
  end;
end;
end.
