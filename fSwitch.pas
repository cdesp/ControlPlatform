unit fSwitch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,unhelpforms;

type
  TfrmSwitch = class(TDefDevForm)
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSwitch: TfrmSwitch;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmSwitch.FormShow(Sender: TObject);
begin
 Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
end;

procedure TfrmSwitch.SpinEdit1Change(Sender: TObject);
begin
SetParam(1,TSpinEdit(Sender));
end;

end.
