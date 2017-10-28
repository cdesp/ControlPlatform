unit fTemp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ComCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,unHelpForms;

type
  TfrmTemp = class(TDefDevForm)
    pnlSound: TPanel;
    Image3: TImage;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    ComboBox1: TComboBox;
    SpinEdit2: TSpinEdit;
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SetComboFromValue(val: integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTemp: TfrmTemp;

implementation
uses unDevices;

{$R *.dfm}

procedure TfrmTemp.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.itemindex of
    0: spinedit2.Value:=11;
    1: spinedit2.Value:=22;
    2: spinedit2.Value:=21;
    3: spinedit2.Value:=21;
  else spinedit2.Value:=22;
  end;

  if fileexists('DHT'+inttostr(spinedit2.Value)+'.jpg')  then
  Begin
    image3.Picture.LoadFromFile('DHT'+inttostr(spinedit2.Value)+'.jpg');
  End;

end;

procedure TfrmTemp.SetComboFromValue(val:integer);
Begin
   case val of
     11:Combobox1.ItemIndex:=0;
     22:Combobox1.ItemIndex:=1;
     21:Combobox1.ItemIndex:=2;
     else Combobox1.ItemIndex:=1;
   end;
   ComboBox1Change(nil);
End;

procedure TfrmTemp.FormCreate(Sender: TObject);
begin
  // ComboBox1.ItemIndex:=1;
end;

procedure TfrmTemp.FormShow(Sender: TObject);
begin
  Param1SE:=SpinEdit1;
  SpinEdit1.MaxValue:=arduino.MaxPins;
  Param2SE:=SpinEdit2;
  SetComboFromValue(SpinEdit2.Value);
end;

procedure TfrmTemp.SpinEdit1Change(Sender: TObject);
begin
   SetParam(1,TSpinEdit(Sender));
end;

procedure TfrmTemp.SpinEdit2Change(Sender: TObject);
begin
  if SpinEdit2.Value=0 then
    SetComboFromValue(0)
  else
   SetParam(2,TSpinEdit(Sender));
end;

end.
