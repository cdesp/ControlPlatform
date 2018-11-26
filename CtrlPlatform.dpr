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
  fSound in 'fSound.pas' {frmSound},
  fUSonic in 'fUSonic.pas' {frmUSonic},
  fServo in 'fServo.pas' {frmServo},
  fSwitch in 'fSwitch.pas' {frmSwitch},
  fTemp in 'fTemp.pas' {frmTemp},
  unVariables in 'unVariables.pas',
  unBlockVar in 'unBlockVar.pas',
  DspUtils in 'ComponentPack\DspUtils.pas',
  fDcMotor in 'fDcMotor.pas' {frmDcMotor},
  fRobot in 'fRobot.pas' {frmRobot},
  fLaser in 'fLaser.pas' {frmLaser},
  fserialLcd in 'fserialLcd.pas' {frmSerialLcd},
  uUpdate in 'uUpdate.pas' {frmUpdate};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Έλεγχος συσκευών Arduino';
  Application.CreateForm(TfrmRoboLang, frmRoboLang);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmLaser, frmLaser);
  Application.CreateForm(TfrmSerialLcd, frmSerialLcd);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.Run;
end.
