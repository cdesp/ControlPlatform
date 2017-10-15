unit fLaser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Samples.Spin,unHelpForms;

type
  TfrmLaser = class(TDefDevForm)
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLaser: TfrmLaser;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmLaser.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   KillDevice;

end;

procedure TfrmLaser.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
end;

procedure TfrmLaser.SpinEdit1Change(Sender: TObject);
begin
 SetParam(0,TSpinEdit(Sender));
end;

end.
