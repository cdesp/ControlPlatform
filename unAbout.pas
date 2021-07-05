unit unAbout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation
uses unCtrlPlatMain;

{$R *.dfm}

procedure TfrmAbout.FormClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
 label1.Caption:= progname;
 Label2.caption:=  version + programmer;
 Label3.Caption:= ' Σύστημα εκμάθησης προγραμματισμού με την χρήση '#10#13+
                  ' προγραμματιζόμενου Arduino'#10#13+
                  ''#10#13+
                  ' ► Arduino Mega 2560'#10#13+
                  ' ► Arduino Mini '#10#13+
                  ' ► Arduino Uno '#10#13+
                  ' ====== Συσκευές ======='#10#13+
                  ' ► Ασύρματη σύνδεση Bluetooth'#10#13+
                  ' ► Οθόνη LCD 16 χαρακτήρων 2 γραμμών (16x2)'#10#13+
                  ' ► Αισθητήρας απόστασης υπερήχων'#10#13+
                  ' ► Motor για περιστροφή 180 μοίρες'#10#13+
                  ' ► Αισθητήρας μαύρου χρώματος '#10#13+
                  ' ► Αισθητήρας Laser'#10#13+
                  ' ► Αισθητήρας Φωτός'#10#13+
                  ' ► Γυροσκόπιο (6dof)'#10#13+
                  ' ► Laser'#10#13+
                  ' ► Ηχείο (Piezo Buzzer)'#10#13+
                  #10#13+
                  'email: cdesp@sch.gr'
                  ;
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
 Alphablendvalue:=0;
 timer1.Enabled:=true;
end;

procedure TfrmAbout.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled:=false;
  Alphablendvalue:=timer1.Tag;
  timer1.Tag:=timer1.Tag+20;
  timer1.Enabled:=timer1.Tag<255;
  if not timer1.Enabled then
  Begin
    Alphablendvalue:=255;
  End;
end;

end.
