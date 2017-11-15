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
  fBMP180 in 'fBMP180.pas' {frmBMP},
  unDevices in 'unDevices.pas',
  fAnalogIn in 'fAnalogIn.pas' {frmAnalogIn},
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
  Application.Title := 'Έλεγχος συσκευών Arduino';
  Application.CreateForm(TfrmRoboLang, frmRoboLang);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
