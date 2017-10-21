unit fServo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ComCtrls,unHelpForms;

type
  TfrmServo = class(TDefDevForm)
    RichEdit1: TRichEdit;
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServo: TfrmServo;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmServo.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;

end;

procedure TfrmServo.SpinEdit1Change(Sender: TObject);
begin
 SetParam(1,TSpinEdit(Sender));
end;


end.
