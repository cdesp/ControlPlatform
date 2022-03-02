unit fRobot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,unHelpForms, Vcl.Imaging.pngimage;

type
  TfrmRobot = class(TDefDevForm)
    pnlSound: TPanel;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    Panel1: TPanel;
    Image1: TImage;
    Label4: TLabel;
    SpinEdit3: TSpinEdit;
    Label5: TLabel;
    SpinEdit4: TSpinEdit;
    Label6: TLabel;
    SpinEdit5: TSpinEdit;
    cbGyro: TCheckBox;
    SpinEdit6: TSpinEdit;
    SpinEdit7: TSpinEdit;
    Label7: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure SpinEdit3Change(Sender: TObject);
    procedure SpinEdit4Change(Sender: TObject);
    procedure SpinEdit5Change(Sender: TObject);
    procedure cbGyroExit(Sender: TObject);
    procedure SpinEdit6Change(Sender: TObject);
    procedure SpinEdit7Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRobot: TfrmRobot;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmRobot.cbGyroExit(Sender: TObject);
begin
   Spinedit6.Value:= integer(cbGyro.Checked);
end;

procedure TfrmRobot.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
  Param2SE:=SpinEdit2;
  SpinEdit2.MaxValue:=arduino.MaxPins;
  Param3SE:=SpinEdit3;
  SpinEdit3.MaxValue:=arduino.MaxPins;
  Param4SE:=SpinEdit4;
  SpinEdit4.MaxValue:=arduino.MaxPins;
  Param5SE:=SpinEdit5;
  SpinEdit5.MaxValue:=arduino.MaxPins;
  Param6SE:=SpinEdit6;
  SpinEdit6.MaxValue:=arduino.MaxPins;
  Param7SE:=SpinEdit7;
  SpinEdit7.MaxValue:=arduino.MaxPins;
  cbGyro.Checked := Param6SE.Value >0;
end;

procedure TfrmRobot.SpinEdit1Change(Sender: TObject);
begin
  SetParam(1,TSpinEdit(Sender));
end;

procedure TfrmRobot.SpinEdit2Change(Sender: TObject);
begin
  SetParam(2,TSpinEdit(Sender));
end;

procedure TfrmRobot.SpinEdit3Change(Sender: TObject);
begin
  SetParam(3,TSpinEdit(Sender));
end;

procedure TfrmRobot.SpinEdit4Change(Sender: TObject);
begin
  SetParam(4,TSpinEdit(Sender));
end;

procedure TfrmRobot.SpinEdit5Change(Sender: TObject);
begin
  SetParam(5,TSpinEdit(Sender));
end;

procedure TfrmRobot.SpinEdit6Change(Sender: TObject);
begin
  SetParam(6,TSpinEdit(Sender));
  cbGyro.Checked:=TSpinEdit(Sender).Value>0;
end;

procedure TfrmRobot.SpinEdit7Change(Sender: TObject);
begin
  SetParam(7,TSpinEdit(Sender));
end;

end.
