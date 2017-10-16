unit fUSonic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,unHelpForms;

type
  TfrmUSonic = class(TDefDevForm)
    pnlSound: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label3: TLabel;
    SpinEdit2: TSpinEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUSonic: TfrmUSonic;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmUSonic.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   KillDevice;

end;

procedure TfrmUSonic.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
  Param2SE:=SpinEdit2;
  SpinEdit2.MaxValue:=arduino.MaxPins;
end;

procedure TfrmUSonic.SpinEdit1Change(Sender: TObject);
begin
  SetParam(0,TSpinEdit(Sender));
end;

procedure TfrmUSonic.SpinEdit2Change(Sender: TObject);
begin
  SetParam(1,TSpinEdit(Sender));
end;

end.
