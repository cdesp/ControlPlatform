program CtrlPlatform;

uses
  Vcl.Forms,
  unCtrlPlatMain in 'unCtrlPlatMain.pas' {frmRoboLang},
  unBlock in 'unBlock.pas',
  AdXPort {in '..\ADXPORT.PAS'},
  unContainerBlock in 'unContainerBlock.pas',
  unAbout in 'unAbout.pas' {frmAbout},
  Vcl.Themes,
  Vcl.Styles,
  fserialLcd in 'fserialLcd.pas' {frmSerialLcd},
  unDevices in 'unDevices.pas',
  fLaser in 'fLaser.pas' {frmLaser},
  unHelpForms in 'unHelpForms.pas',
  unUtils in 'unUtils.pas',
  fSound in 'fSound.pas' {frmSound},
  fUSonic in 'fUSonic.pas' {frmUSonic},
  fServo in 'fServo.pas' {frmServo},
  fSwitch in 'fSwitch.pas' {frmSwitch},
  fTemp in 'fTemp.pas' {frmTemp},
  unVariables in 'unVariables.pas',
  unBlockVar in 'unBlockVar.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Κέντρο Ελέγχου Ρομποτικού Οχήματος';
  Application.CreateForm(TfrmRoboLang, frmRoboLang);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmUSonic, frmUSonic);
  Application.CreateForm(TfrmServo, frmServo);
  Application.CreateForm(TfrmSwitch, frmSwitch);
  Application.CreateForm(TfrmTemp, frmTemp);
  Application.Run;
end.
