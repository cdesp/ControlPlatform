unit unClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,IdContext,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls;

type
  TMyPanel=class(TPanel)

  public
    img:TImage;
    lbl:TLabel;
    Acont:TIdContext;
    PCName:String;
  end;

  TfrmClients = class(TForm)
    Image1: TImage;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private

    { Private declarations }
      imgclicked:boolean;
      p1:TPoint;
      selImage:tImage;
      frmLoadPos:Boolean;
      ClientsToAdd:TStringlist;
      ClientsToDel:TStringlist;
      PCNames:TStringlist;
    procedure RestorePositions;
    procedure SavePositions;
    procedure SavePosition(pnl: TMyPanel);
    procedure ReadPosition(pnl: TMyPanel);
    procedure LoadFormPos;
    procedure SaveFormPos;
    function getNewPic: TMyPanel;
    procedure VisibleAddClient;

    function findPanelByContext(Acont: TIdContext): TMypanel;
    procedure changePcName;
    function findPanelByIP(ip: string): TMypanel;
    procedure VisibleDelCient;
  public
    { Public declarations }
        procedure setNewposition;
        procedure addClient(Acont:TIdContext);
        procedure DelClient(AContext: TIdContext);
        procedure OnMove(var Msg: TWMMove); message WM_MOVE;
        procedure setPcName(Acont: TIdContext; s: String);
  end;



var
  frmClients: TfrmClients;

implementation

{$R *.dfm}

uses unRoboMain,registry;

function TfrmClients.findPanelByContext(Acont: TIdContext):TMypanel;
var
  I: Integer;
Begin
   result:=nil;
   for I := 0 to componentcount-1 do
     if components[i] is TMyPanel then
       if TMyPanel(components[i]).Acont.Connection.Socket.Binding.PeerIP=Acont.Connection.Socket.Binding.PeerIP then
        Begin
           result:=TMyPanel(components[i]);
           break;
        End;
End;

function TfrmClients.findPanelByIP(ip: string):TMypanel;
var
  I: Integer;
Begin
   result:=nil;
   for I := 0 to componentcount-1 do
     if components[i] is TMyPanel then
       if (TMyPanel(components[i]).Acont.Connection=nil) or (TMyPanel(components[i]).Acont.Connection.Socket.Binding.PeerIP=ip) then
        Begin
           result:=TMyPanel(components[i]);
           break;
        End;
End;


procedure TfrmClients.setPcName(Acont: TIdContext;s:String);
var k:Integer;
Begin
  k:=pos(':',s);
  if k=0 then EXIT;
  s:=copy(s,k+1,maxint);
  PCNames.Values[Acont.Connection.Socket.Binding.PeerIP]:=s;
End;

procedure TfrmClients.setNewposition;
Begin
  if csDestroying in componentstate then exit;

  height:=frmRoboLang.height;
  left:=frmRoboLang.Left+frmRoboLang.Width+1;
  top:=frmRoboLang.Top;

End;

procedure tfrmClients.changePcName;
var     pnl:TMyPanel;
    ip,pcname:String;
Begin
  ip:= PCNames.Names[0];
  pcname:=PCNames.values[ip];
  PCnames.Delete(0);
  pnl:=findPanelByIP(IP);
  if pnl<>nil then
  Begin
    pnl.lbl.Caption:=pcname;
    pnl.PCName:=PCname;
  End;

End;

procedure TfrmClients.VisibleDelCient;
var ip:String;
    pnl:tMyPanel;
Begin
  ip:=ClientsToDel[0];
  clientstodel.Delete(0);
  pnl:=findPanelByIP(ip);
  if pnl<>nil then
   pnl.Free;
End;

procedure TfrmClients.Timer1Timer(Sender: TObject);
begin
 timer1.Enabled:=false;
 try
  if ClientsToAdd.Count>0 then
    VisibleAddClient;
  if PCNames.Count>0 then
     changePcName;
  if ClientsToDel.Count>0 then
    VisibleDelCient;
 finally
   timer1.Enabled:=true;
 end;
end;

function TfrmClients.getNewPic:TMyPanel;
Var img:Timage;
    lbl:TLabel;
Begin
  Result:=TMyPanel.Create(self);
  result.DoubleBuffered:=true;
  Result.Parent:=self;
  Result.Width:=Image1.width;
  Result.Height:=Image1.Height+10;
  result.Color:=clBlue;
  result.Left:=20;
  result.Top:=20;
  result.FullRepaint:=false;
  result.BevelOuter:=bvnone;

  img:=TImage.create(Self);
  lbl:=TLabel.Create(self);
  Result.img:=img;
  result.lbl:=lbl;
  lbl.Visible:=true;

  result.Visible:=true;


  img.Left:=0;img.Top:=0;
  img.Stretch:=true;
  img.Picture.Assign(image1.picture.Graphic);
  img.Parent:=Result;
  img.Align:=alClient;

//  img.Height:=image1.Height;
//  img.Width:=image1.Width;
  img.Transparent:=true;
  img.Visible:=true;

  lbl.Parent:=result;
  lbl.Align:=alBottom;
  lbl.Font.Color:=clYellow;
  lbl.Font.Style:=[fsBold];
  lbl.Font.Size:=6;
  lbl.Transparent:=false;
  lbl.Color:=clBlue;
  lbl.Alignment:=taCenter;
End;


procedure TfrmClients.VisibleAddClient;
Var pnl:TMyPanel;
    t:string;
    Acont: TIdContext;
Begin
  if ClientsToAdd.count=0 then
   exit;
  Acont:=TIdContext(ClientsToAdd.Objects[0]);
  ClientsToAdd.Delete(0);
  t:= ACont.Connection.Socket.Binding.PeerIP;
  pnl:=getNewPic;
  pnl.Acont:=Acont;
  pnl.lbl.caption:=t;

  pnl.img.OnMouseDown:= Image1MouseDown;
  pnl.img.OnMouseMove:=Image1MouseMove;
  pnl.img.OnMouseUp:= Image1MouseUp;

  RestorePositions;

End;

procedure TfrmClients.addClient(Acont: TIdContext);
begin
  ClientsToAdd.AddObject('',Acont)
end;

procedure TfrmClients.DelClient(AContext: TIdContext);
Begin
   ClientsToDel.Add(Acontext.Connection.Socket.Binding.PeerIP);
End;

procedure TfrmClients.FormCreate(Sender: TObject);
begin
   ClientsToAdd:=TStringlist.create;
   ClientsToDel:=TStringlist.create;
   PCNames:=TStringlist.create;
   DoubleBuffered:=true;
end;

procedure TfrmClients.FormHide(Sender: TObject);
begin
 Timer1.Enabled:=false;
end;

procedure TfrmClients.FormResize(Sender: TObject);
begin
  SaveFormPos;
end;

procedure TfrmClients.FormShow(Sender: TObject);
begin
  LoadFormPos;
  setNewposition;
  timer1.Enabled:=true;
end;

procedure TfrmClients.Image1Click(Sender: TObject);
var img:timage;
begin
 img:=timage(Sender);
 img.Hint:='1';
 imgclicked:=true;

 adddebug('img clicked');
end;

procedure TfrmClients.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (mbLeft = Button) then
  Begin
       P1.X:=X;
       P1.Y:=Y;
       imgclicked:=true;
  End;
end;

procedure TfrmClients.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var img:timage;
    pnl:TMyPanel;
begin
  img:=timage(Sender);
  pnl:=TMyPanel(img.Parent);
  if imgclicked then
   Begin
     if X>P1.X then
        pnl.Left:=pnl.Left +(X - p1.X);
     if X<P1.X then
        pnl.Left:=pnl.Left -(P1.X - X);
     if Y>P1.Y then
        pnl.Top:=pnl.Top +(Y - p1.Y);
     if Y<P1.Y then
        pnl.Top:=pnl.Top -(p1.Y - Y);
   End;

end;

procedure TfrmClients.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var pnl:TMyPanel;
begin
   imgclicked:=false;
   if button=mbRight then
   Begin
     selImage:=tImage(Sender);
     pnl:= TMyPanel(selImage.Parent);
     PopupMenu1.Popup(Left+pnl.Left+x,top+pnl.top+y);

   End
   else
    SavePositions;
end;

procedure TfrmClients.N1Click(Sender: TObject);
var Acont: TIdContext;
begin
  //
  acont:=  Tmypanel(selImage.parent).Acont;
  frmRoboLang.getRemoteCode(ACont);
end;


procedure TfrmClients.OnMove(var Msg: TWMMove);
begin
 if left<>(frmRoboLang.Left+frmRoboLang.width+1) then
 begin
  left:=frmRoboLang.Left+frmRoboLang.width+1;
  exit;
 end;
 if top<>frmRoboLang.top then
 begin
  top:=frmRoboLang.top;
  exit;
 end;
 inherited;
end;

procedure TfrmClients.SavePosition(pnl:TMyPanel);
var
   reg:TRegistry;
   Acont: TIdContext;
begin
   acont:=  pnl.Acont;
   reg:=TRegistry.Create;
   with reg do
   begin
     reg.OpenKey('Software\Despsoft\RoboLang\'+ACont.Connection.Socket.Binding.PeerIP,True);
     reg.WriteInteger ( 'Left' , pnl.Left ) ;
     reg.WriteInteger ( 'Top' , pnl.Top ) ;
   end;
   reg.free;
end;

procedure TfrmClients.SavePositions;
Var i:Integer;
    pnl:tMypanel;

Begin
 for I := 0 to Componentcount-1 do
   Begin
    if components[i] is TMyPanel then
    Begin
     pnl:=tMypanel(components[i]);
     if pnl.Acont<>nil then
     Begin
       //save position
       SavePosition(pnl);
     End;
    End;
   End;
End;

procedure TfrmClients.ReadPosition(pnl:TMyPanel);
var
   reg:TRegistry;
   Acont: TIdContext;
begin
   acont:=  pnl.acont;
   reg:=TRegistry.Create;
    try
     reg.OpenKey('Software\Despsoft\RoboLang\'+ACont.Connection.Socket.Binding.PeerIP,True);
     pnl.Left:=reg.ReadInteger( 'Left') ;
     pnl.Top:=reg.Readinteger ( 'Top') ;
    except

    end;
   reg.free;
end;

procedure TfrmClients.RestorePositions;
Var i:Integer;
    pnl:tMyPanel;
Begin
 for I := 0 to Componentcount-1 do
   Begin
    if components[i] is TMyPanel then
    Begin
     pnl:=tMyPanel(components[i]);
     if pnl.Acont<>nil then
     Begin
       //read position
       ReadPosition(pnl);
     End;
    End;
   End;

End;


procedure TfrmClients.SaveFormPos;
var  reg:TRegistry;
Begin
   if frmLoadPos then exit;
   
   reg:=TRegistry.Create;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\Clients\',True);
     reg.WriteInteger('Left',Left);
     reg.WriteInteger('Top',Top);
     reg.WriteInteger('Width',Width);
     reg.WriteInteger('Height',Height);

   finally
     reg.Free;
   end;

End;

procedure TfrmClients.LoadFormPos;
var  reg:TRegistry;
Begin
   reg:=TRegistry.Create;
   frmLoadPos:=true;
   try
     reg.OpenKey('Software\Despsoft\RoboLang\Clients\',True);
    try
     Left:=reg.ReadInteger('Left');
     Top:=reg.ReadInteger('Top');
     Width:=reg.ReadInteger('Width');
     Height:=reg.ReadInteger('Height');
    except
    end;
   finally
     reg.Free;
     frmLoadPos:=false;
   end;

End;



initialization
 Registerclass(TMyPanel);

end.
