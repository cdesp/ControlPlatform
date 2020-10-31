unit fOptions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmOptions = class(TForm)
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);

  private
    function ReadApath: String;
    procedure WriteAPath(const Value: String);

    { Private declarations }

  public
    { Public declarations }
    DirName:String;
    fArduinoPath:String;
    procedure chkArduinoPathValid;
    Procedure ReadOptions;
    Procedure WriteOptions;


    property Arduinopath:String read ReadApath write WriteAPath;
  end;

var
  frmOptions: TfrmOptions;



implementation
uses iniFiles;

{$R *.dfm}

{ TForm1 }

procedure TfrmOptions.Button1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then
 Begin
   ArduinoPath:= extractfilepath(opendialog1.FileName);
 End;
end;

procedure TfrmOptions.chkArduinoPathValid;
var fn:string;
begin
  fn:=edit1.Text+'\arduino.exe';
  if not fileexists(fn) then raise Exception.Create('Δεν υπάρχει το Arduino.exe σε αυτό τον κατάλογο.');

end;

procedure TfrmOptions.Edit1Exit(Sender: TObject);
begin
 try
  chkArduinoPathValid;
  ArduinoPath:=edit1.Text;
 except
   on e:exception do
   Begin
    ShowMessage(e.Message);
    edit1.Text:=arduinoPath;
   End;
 end;
end;

procedure TfrmOptions.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if modalresult=mrOk then 
 try
  chkArduinoPathValid;
  ArduinoPath:=edit1.Text;
  Writeoptions;
 except
  on e:exception do
   Begin
    ShowMessage(e.Message);
    edit1.Text:=arduinoPath;
    Action:=caNone;
   End;
 end;

end;

procedure TfrmOptions.FormShow(Sender: TObject);
begin
   dirname:= extractfilepath(Application.ExeName);
   OpenDialog1.InitialDir:=dirname;
   ReadOptions;
end;

function TfrmOptions.ReadApath: String;
begin
 Result:=fArduinoPath;
end;

procedure TfrmOptions.ReadOptions;
var IniFile:TInifile;
begin
    IniFile:=TInifile.Create(DirName+'\Options.ini');
    ArduinoPath:=IniFile.ReadString('Arduino','Path',extractfilepath(Application.ExeName)+'Arduino');
    IniFile.Free;
    opendialog1.InitialDir:=ArduinoPath;
end;

procedure TfrmOptions.WriteAPath(const Value: String);
begin
  fArduinoPath:=Value;
  edit1.Text:=fArduinopath;
end;

procedure TfrmOptions.WriteOptions;
var IniFile:TInifile;
begin
    IniFile:=TInifile.Create(DirName+'\Options.ini');
    IniFile.WriteString('Arduino','Path',ArduinoPath);
    IniFile.Free;

end;

end.
