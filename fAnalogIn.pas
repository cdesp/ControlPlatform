unit fAnalogIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Samples.Spin,unHelpForms;

type
  TfrmAnalogIn = class(TDefDevForm)
    pnlLaser: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    SpinEdit2: TSpinEdit;
    procedure FormShow(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Setimage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAnalogIn: TfrmAnalogIn;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmAnalogIn.FormCreate(Sender: TObject);
begin
 SetSEfromParam(2,SpinEdit2);

 radiogroup1.ItemIndex:=spinedit2.value;
 Setimage;

end;

procedure TfrmAnalogIn.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  Param2SE:=SpinEdit2;
  SpinEdit1.MaxValue:=arduino.MaxPins;
end;

procedure TfrmAnalogIn.SpinEdit1Change(Sender: TObject);
begin
 SetParam(1,TSpinEdit(Sender));
end;

procedure TfrmAnalogIn.SpinEdit2Change(Sender: TObject);
begin
  if radiogroup1.ItemIndex<>SpinEdit2.Value then
   radiogroup1.ItemIndex:=SpinEdit2.Value;
  Setimage;
end;

procedure TfrmAnalogIn.RadioGroup1Click(Sender: TObject);
begin
  SpinEdit2.Value:=radiogroup1.ItemIndex;
  SetParam(2,SpinEdit2);
end;

procedure TfrmAnalogIn.Setimage;
Var fnm:String;
Begin
   fnm:=apppath+'\images\'+'AnalogIn_'+inttostr(radiogroup1.ItemIndex)+'.jpg';
   if NOT  fileexists(fnm) then
     fnm:=ChangeFileExt(fnm,'.png');
   if fileexists(fnm) then
   Begin
     image3.Picture.LoadFromFile(fnm);
   End
   else
     image3.Picture:=nil;

End;


end.
