; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ControlPlatform"
#define MyAppVersion "1.0"
#define MyAppPublisher "Christos Despoinidis"
#define MyAppExeName "CtrlPlatform.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{A7FBF72A-C3A4-4A24-91F0-64EDB2F6EC44}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
InfoAfterFile=G:\MyDocuments\Arduino\CtrlPlatform\ArduinoUpload.txt
OutputBaseFilename=CPsetup
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: "G:\_Programming\ControlPlatform\Win32\Debug\CtrlPlatform.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "G:\_Programming\ControlPlatform\Win32\Debug\Images\*"; DestDir: "{app}\Images"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "G:\_Programming\ControlPlatform\Win32\Debug\Lessons\*"; DestDir: "{app}\Lessons"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "G:\MyDocuments\Arduino\CtrlPlatform\CtrlPlatform.ino.NANO.hex"; DestDir: "{app}"; Flags: ignoreversion
Source: "G:\MyDocuments\Arduino\CtrlPlatform\CtrlPlatform.ino.UNO.hex"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
