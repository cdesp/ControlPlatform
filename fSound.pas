unit fSound;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,unHelpForms;

type
  TfrmSound = class(TDefDevForm)
    pnlSound: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSound: TfrmSound;

implementation
uses unDevices;

{$R *.dfm}
procedure TfrmSound.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   KillDevice;

end;

procedure TfrmSound.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
end;

procedure TfrmSound.SpinEdit1Change(Sender: TObject);
begin
 SetParam(0,TSpinEdit(Sender));
end;


end.
