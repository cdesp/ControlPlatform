unit fDcMotor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,unHelpForms, Vcl.Imaging.pngimage;

type
  TfrmDcMotor = class(TDefDevForm)
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
    Image3: TImage;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDcMotor: TfrmDcMotor;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmDcMotor.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
  Param2SE:=SpinEdit2;
  SpinEdit2.MaxValue:=arduino.MaxPins;
end;

procedure TfrmDcMotor.SpinEdit1Change(Sender: TObject);
begin
  SetParam(1,TSpinEdit(Sender));
end;

procedure TfrmDcMotor.SpinEdit2Change(Sender: TObject);
begin
  SetParam(2,TSpinEdit(Sender));
end;

end.
