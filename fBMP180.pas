unit fBMP180;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls,unHelpForms, Vcl.Imaging.jpeg;

type
  TfrmBMP = class(TDefDevForm)
    pnlLCD: TPanel;
    Image1: TImage;
    Label1: TLabel;
    RichEdit1: TRichEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBMP: TfrmBMP;

implementation


{$R *.dfm}


end.
