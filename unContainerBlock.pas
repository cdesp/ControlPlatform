unit unContainerBlock;

interface
uses

  Vcl.ExtCtrls,Vcl.Controls,System.Classes,Winapi.Windows,Winapi.Messages,Vcl.Graphics,
  Vcl.ComCtrls,Vcl.StdCtrls,unBlock;


Type



  TDspContainerBlock=class(TDspBlock)
      FEndBlock:TDspBlock;
  private
      FEndBlockName:String;
      procedure SetEndBlockName(const Value: string);
      function GetEndBlockName: string;
    procedure SetEndBlock(const Value: TDspBlock);
  protected
      procedure AssignTo(Dest:TPersistent);override;
      function createNewBlock: TDspBlock;override;
      procedure Reattach(Sender: TDspBlock);override;
      procedure SetParent(AParent: TWinControl); override;
      procedure CreateLBE;virtual;
      procedure setNewlyCreated(v:boolean);override;
      procedure checkloopblock;override;
      function getLinkTo: TDspBlock;override;
      function getblocksize: integer;override;
  public
      EndBlockText:String;
      procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;
      constructor Create(AOwner: TComponent); override;
      destructor destroy;override;
      function getLastDspBlock(caller:TDspBlock):TDspBlock;override;
      function getContainersize:integer;

  published
      property EndBlock:TDspBlock read FEndBlock write SetEndBlock;
      property EndBlockName:string read GetEndBlockName write SetEndBlockName;
  end;

  TDspContainerBlockEnd=class(TDspBlock)
     FContainerBlock:TDspContainerBlock;
  private
    FContainerBlockName: String;
    procedure SetContainerBlock(const Value: TDspContainerBlock);
    procedure SetContainerBlockName(const Value: String);
    function GetContainerBlockName: String;
  protected

      procedure Reattach(Sender: TDspBlock);override;
  public
      constructor Create(AOwner: TComponent); override;
      procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

  published
      property ContainerBlock:TDspContainerBlock read FContainerBlock write SetContainerBlock;
      property ContainerBlockName:String read GetContainerBlockName write SetContainerBlockName;
  end;


  TDspLoopBlock=Class(TDspContainerBlock)
  protected
        function createNewBlock: TDspBlock;override;
        function getParam2: Integer;override;
  End;

  TDspControlBlock=Class(TDspContainerBlock)
  private

    procedure CBClick(Sender: TObject);
  protected
      function createNewBlock: TDspBlock;override;
      procedure RecalcWidth;override;
      procedure CreateCtrl1;override;
      procedure CreateCtrl2;override;
      function getParam1Control(x, y: integer): integer;override;
      function getParam2Control(x, y: integer): integer;override;
      procedure edit2Change(Sender: TObject);override;
      procedure edit1Change(Sender: TObject);override;
      procedure loaded;override;
      function GetParam1Rect: TRect;override;
  public
    constructor Create(AOwner: TComponent);override;
  end;

  TDspControlBlockELSE=class;

  TDspControlElseBlock=Class(TDspControlBlock)
      fElseBlock:TDspBlock;
      Elsebut:Tcheckbox;
  private
    FElseBlockName : string;
    procedure elseclick(Sender: Tobject);
    function GetElseBlockName: string;
    procedure SetElseBlockName(const Value: string);
    function getElsebutchecked: boolean;
    procedure setElsebutchecked(const Value: boolean);
    procedure SetElseBlock(const Value: TDspBlock);
  protected
      procedure CreateLBE;override;
      procedure SetParent(AParent: TWinControl); override;
      function getLastDspBlock(caller:TDspBlock):TDspBlock;override;
      procedure Reattach(Sender: TDspBlock);override;
      procedure checkloopblock;override;
      procedure AssignTo(Dest:TPersistent);override;
      procedure loaded;override;
  public
      function elsevisible:boolean;
      function createNewBlock: TDspBlock;override;
      constructor Create(AOwner: TComponent);override;
      destructor destroy;override;
      procedure Paint; override;
      procedure SetNewWidth(nw: Integer);override;
      procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;


  published
      property ElseBlock:TDspBlock read FElseBlock write SetElseBlock;
      property ElseBlockName:string read GetElseBlockName write SetElseBlockName;
      property Elsebutchecked:boolean read getElsebutchecked write setElsebutchecked;
  End;

  TDspControlBlockELSE=class(TDspBlock)
     FContainerBlock:TDspContainerBlock;
  private
    FContainerBlockName: String;
    procedure SetContainerBlock(const Value: TDspContainerBlock);
    procedure SetContainerBlockName(const Value: String);
    function GetContainerBlockName: String;
  protected
      procedure Reattach(Sender: TDspBlock);override;
  public
      constructor Create(AOwner: TComponent); override;
      procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: Integer); override;

  published
      property ContainerBlock:TDspContainerBlock read FContainerBlock write SetContainerBlock;
      property ContainerBlockName:String read GetContainerBlockName write SetContainerBlockName;
  end;


implementation
uses sysutils,forms,dialogs;

{ TDspContainerBlock }

procedure TDspContainerBlock.AssignTo(Dest: TPersistent);
var blck:TDspContainerBlock;
Begin
  inherited Assignto(Dest);
  if Dest is TDspContainerBlock then
  Begin
     blck:=TDspContainerBlock(Dest);
     blck.EndBlockText:=EndBlockText;
  End;

end;

procedure TDspContainerBlock.checkloopblock;
begin
  inherited;
  if assigned(FEndblock) then
    Fendblock.Top:=FEndBlock.Top;
end;

constructor TDspContainerBlock.Create(AOwner: TComponent);
begin
  inherited;
  nospadDn:=40;
  EndBlockText:='Τέλος';
  fParam1:=5;
end;

procedure TDspContainerBlock.CreateLBE;
begin
    if csloading in Componentstate then exit;  //do not create on loading
    FEndBlock:=TDspContainerBlockEnd.CreateFloat(Owner);
    FEndblock.Parent:=parent;
    FEndblock.CommndID:=99;//container end for all
    FEndblock.CommandText:=EndBlockText;
    FEndblock.Color:=Color;
    FEndblock.CommandColor:=CommandColor;
    TDspContainerBlockEnd(FEndblock).ContainerBlock:=Self;
    FEndblock.Left:=Left;
    FEndblock.Top:=top+height+10;
    FEndblock.prototype:=false;
end;

function TDspContainerBlock.createNewBlock: TDspBlock;
begin
  result:= TDspContainerBlock.CreateFloat(Owner);
end;


destructor TDspContainerBlock.destroy;
begin
 if assigned(FEndBlock) then
 Begin
  try
   Freeandnil(fendblock);
  except
    FEndBlock:=nil;
  end;
 End;
  inherited;
end;


function TDspContainerBlock.getblocksize: integer;
begin
 result:=getContainersize;
end;

function TDspContainerBlock.getLastDspBlock(caller:TDspBlock): TDspBlock;
begin
 result:= inherited  getLastDspBlock(Caller);
 if caller<>FEndBlock then
  if assigned(FEndBlock) and (FEndBlock.linkto<>nil) then
    Result:=FEndBlock.linkto.getLastDspBlock(caller)
   else
    result:=FEndBlock;

end;

function TDspContainerBlock.getLinkTo: TDspBlock;
begin
  if assigned(FEndBlock) then
    result:=FEndBlock
  else result:=nil;
end;

function TDspContainerBlock.getContainersize: integer;
var res:integer;
begin
  if assigned(FirstBlock) then
    getDspBlockListSize(FirstBlock,res)
  else res:=0;
  result:=res+1;//plus self
end;



function TDspContainerBlock.GetEndBlockName: string;
begin
  if assigned(EndBlock) then
   result:=EndBlock.name
  else
    result:='';

end;

procedure TDspContainerBlock.Reattach(Sender: TDspBlock);
begin
  inherited;
  if assigned(FendBlock) then
    FEndBlock.Top:=FEndBlock.Top;
 // repaint;
end;

procedure TDspContainerBlock.SetBounds(pLeft, pTop, pWidth, pHeight: integer);
begin
  inherited;
  if assigned(FEndBlock) then
  Begin
     if Left<>FEndBlock.Left then
       FEndBlock.Left:=Left;
     FEndBlock.Top:=FEndBlock.Top;
  End;

end;

procedure TDspContainerBlock.SetEndBlock(const Value: TDspBlock);
begin
  FEndBlock := Value;
end;

procedure TDspContainerBlock.SetEndBlockName(const Value: string);
var f:TDspBlock;
begin
  FEndBlockName := Value;
  if assigned(owner) and not assigned(EndBlock) then
  Begin
     f:=TDspBlock(owner.FindComponent(FEndBlockName));
     if assigned(f) then
       EndBlock:=f;
  End;

end;

procedure TDspContainerBlock.setNewlyCreated(v: boolean);
begin
  inherited;
  if not v then
    CreateLBE;
  RecalcWidth;
end;

procedure TDspContainerBlock.SetParent(AParent: TWinControl);
begin
  inherited;
  if assigned(FEndBlock) then
    FEndBlock.Parent:=AParent;
end;

{ TDspLoopBlock }

function TDspLoopBlock.createNewBlock: TDspBlock;
begin
     result:= TDspLoopBlock.CreateFloat(Owner);
end;

function TDspLoopBlock.getParam2: Integer;
begin
     result:=getContainersize;
end;

{ TDspContainerBlockEnd }

constructor TDspContainerBlockEnd.Create(AOwner: TComponent);
begin
  inherited;
  fNewlycreated:=false;
  topNose:=false;
end;

function TDspContainerBlockEnd.GetContainerBlockName: String;
begin
  if assigned(ContainerBlock) then
   result:=ContainerBlock.name
  else
    result:='';

end;

procedure TDspContainerBlockEnd.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
begin
//
end;

procedure TDspContainerBlockEnd.Reattach(Sender: TDspBlock);
begin
  inherited;
  Left:=FContainerBlock.Left;
  if assigned(FContainerBlock) then
    FContainerBlock.Reattach(Sender);
  repaint;
end;

procedure TDspContainerBlockEnd.SetBounds(pLeft, pTop, pWidth, pHeight: integer);
Var bk:TDspBlock;
    t:integer;
begin
  inherited;
  if assigned(FContainerBlock) then
  Begin
   if Left<>FContainerBlock.Left then
    Left:=FContainerBlock.Left;
   bk:=FContainerBlock.getLastDspBlock(Self);
   if not assigned(bk) or (bk=self)  then exit;

   t:=bk.Top+bk.Height+10;
   if top<>t then
    top:=t;
  End;


end;

procedure TDspContainerBlockEnd.SetContainerBlock(const Value: TDspContainerBlock);
begin
  if assigned(FContainerBlock) then
   FContainerBlock.free;
  FContainerBlock := Value;
end;

procedure TDspContainerBlockEnd.SetContainerBlockName(const Value: String);
var f:TDspContainerBlock;
begin
  FContainerBlockName := Value;
  if assigned(owner) and not assigned(ContainerBlock) then
  Begin
     f:=TDspContainerBlock(owner.FindComponent(FContainerBlockName));
     if assigned(f) then
       ContainerBlock:=f;
  End;
end;

{ TDspControlBlock }

constructor TDspControlBlock.Create(AOwner: TComponent);
Begin
  inherited;
  Param1:=0;
  param2:=5;
  totalparams:=1;
End;

procedure TDspControlBlock.CreateCtrl1;
Begin
  ctrl1:=Tcheckbox.create(self);
  ctrl1.parent:=self;
  Tcheckbox(ctrl1).Caption:='';
  ctrl1.Width:=15;
  TCheckBox(ctrl1).Checked:=param1=1;
  Tcheckbox(ctrl1).OnClick:=cbclick;
  param1prompt:='όχι';
  ctrl1.Visible:=false;
End;

procedure TDspControlBlock.CreateCtrl2;
Begin
 inherited;
End;

procedure TDspControlBlock.CBClick(Sender: TObject);
Begin
  param1:=Integer(Tcheckbox(sender).checked);
End;

procedure TDspControlBlock.edit1Change(Sender: TObject);
begin
   inherited;
end;

procedure TDspControlBlock.edit2Change(Sender: TObject);
begin
 inherited;
end;



function TDspControlBlock.createNewBlock: TDspBlock;
begin
  result:= TDspControlBlock.CreateFloat(Owner);
end;

procedure TDspControlBlock.RecalcWidth;
begin
 inherited;
end;


function TDspControlBlock.getParam1Control(x,y:integer):integer;
var  s:string;
    res:integer;
    sv:TColor;
Begin
    if param1=1 then
     s:=param1prompt else s:='';

     res:=x;
    if not prototype then
    Begin
      ctrl1.left:=x; //checkbox position
      ctrl1.top:=y;
      ctrl1.visible:=true;
      res:=res+ctrl1.width;
    End
    else ctrl1.Visible:=false;

    sv:=canvas.Font.Color;
    canvas.Font.Color:=clRed;
    canvas.TextOut(res,y ,s);
    canvas.Font.Color:=sv;
    res:=res+canvas.TextWidth(s);

    result:=res;

End;

function TDspControlBlock.GetParam1Rect: TRect;
begin
  Result.Empty;
end;

function TDspControlBlock.getParam2Control(x,y:integer):integer;
Begin
 result := inherited getParam2Control(x,y);
End;

procedure TDspControlBlock.loaded;
begin
  inherited;
  if assigned(ctrl1) then
   TCheckBox(ctrl1).Checked:=param1=1;
end;


{ TDspControlElseBlock }

procedure TDspControlElseBlock.AssignTo(Dest: TPersistent);
var blck:TDspControlElseBlock;
begin
  inherited;
  if Dest is TDspControlElseBlock then
  Begin
     blck:=TDspControlElseBlock(Dest);
     blck.Elsebut.font.Assign(font);
     blck.Elsebut.Visible:=true;

  End;

end;

procedure TDspControlElseBlock.checkloopblock;
begin
  inherited;
  if assigned(FElseblock) and FElseblock.visible  then
    FElseblock.Top:=FElseBlock.Top;

end;

constructor TDspControlElseBlock.Create(AOwner: TComponent);
begin
  inherited;

  Elsebut:=Tcheckbox.create(self);
  Elsebut.parent:=self;
  Tcheckbox(Elsebut).Caption:='';
  Elsebut.Width:=25;
  TCheckBox(Elsebut).Checked:=false;
  Tcheckbox(Elsebut).OnClick:=elseclick;
  elsebut.Top:=10;
  Elsebut.ShowHint:=true;
  Elsebut.Hint:='Ενεργοποίηση "Αλλιώς"';
  elsebut.Visible:=false;
end;

procedure TDspControlElseBlock.elseclick(Sender:Tobject);
Begin
   if csLoading in componentstate then exit;
   if not assigned(ElseBlock) then exit;


   if not elsebut.Checked and assigned(fElseblock.LinkTo) then
   Begin
      if MessageDlg('Υπάρχουν εντολές στο block "αλλιώς" που θα διαγραφούν.'#10#13' Είσαι σίγουρος;',mtWarning , mbOKCancel, 0)=mrOk then
      Begin
         fElseblock.LinkTo.Free;
         fElseblock.LinkTo:=nil;
      End
      else
       elsebut.Checked:=true;

   End;

   fElseBlock.Visible:=elsebut.Checked;
   invalidate;
   fEndblock.top:=fEndblock.top;
End;

function TDspControlElseBlock.elsevisible: boolean;
begin
  result:=elsebut.checked;
end;

function TDspControlElseBlock.GetElseBlockName: string;
begin
  if assigned(ElseBlock) then
   result:=ElseBlock.name
  else
    result:='';

end;

procedure TDspControlElseBlock.CreateLBE;
begin
    inherited;
    if csloading in Componentstate then exit;  //do not create on loading
    fElseBlock:=TDspControlBlockElse.CreateFloat(Owner);
    fElseBlock.topNose:=false;
    fElseBlock.Parent:=parent;
    fElseBlock.CommndID:=100;//Control Else for all
    fElseBlock.CommandText:='Αλλιώς';
    fElseBlock.Color:=Color;
    fElseBlock.CommandColor:=CommandColor;
    TDspControlBlockElse(fElseBlock).ContainerBlock:=Self;
    fElseBlock.Left:=Left;
    fElseBlock.Top:=top+height+10;
    fElseBlock.prototype:=false;
    fElseblock.Visible:=false;
end;

function TDspControlElseBlock.createNewBlock: TDspBlock;
begin
     result:= TDspControlElseBlock.CreateFloat(Owner);
end;


destructor TDspControlElseBlock.destroy;
begin
 if assigned(FElseBlock) then
 Begin
  try
   Freeandnil(FElseBlock);
  except
    FElseBlock:=nil;
  end;
 End;

  inherited;
end;

function TDspControlElseBlock.getElsebutchecked: boolean;
begin
  result:=elsebut.Checked;
end;

function TDspControlElseBlock.getLastDspBlock(caller: TDspBlock): TDspBlock;
begin
 if caller=FElseblock then
   result:= inherited  getLastDspBlock(FEndblock)
 else
  if (caller=FEndblock) and elsevisible then
  Begin
   if assigned(fElseBlock) and (fElseBlock.linkto<>nil) then
     Result:=fElseBlock.linkto.getLastDspBlock(caller)
    else
     result:=fElseBlock;
  End
  else
    result:= inherited  getLastDspBlock(Caller);

end;

procedure TDspControlElseBlock.loaded;
begin
  inherited;
  Elsebut.Visible:=true;

end;

procedure TDspControlElseBlock.Paint;
begin
  inherited;

end;


procedure TDspControlElseBlock.Reattach(Sender: TDspBlock);
begin
  inherited;
  if assigned(FElseBlock) then
    FElseBlock.Top:=FElseBlock.Top;

end;

procedure TDspControlElseBlock.SetBounds(pLeft, pTop, pWidth, pHeight: integer);
begin
  inherited;
  if assigned(FElseBlock) then
  Begin
     if Left<>FElseBlock.Left then
       FElseBlock.Left:=Left;
     FElseBlock.Top:=FElseBlock.Top;
  End;

end;

procedure TDspControlElseBlock.SetElseBlock(const Value: TDspBlock);
begin
  FElseBlock := Value;
  if assigned(FElseBlock) then
    FElseBlock.visible:=elsevisible;
end;

procedure TDspControlElseBlock.SetElseBlockName(const Value: string);
var f:TDspBlock;
begin
  FElseBlockName := Value;
  if assigned(owner) and not assigned(ElseBlock) then
  Begin
     f:=TDspBlock(owner.FindComponent(FElseBlockName));
     if assigned(f) then
       ElseBlock:=f;
  End;

end;

procedure TDspControlElseBlock.setElsebutchecked(const Value: boolean);
begin
  elsebut.Checked:=value;
end;

procedure TDspControlElseBlock.SetNewWidth(nw: Integer);
begin
  if elsebut.Visible then
  begin
    Elsebut.Left:=nw+3;
    inherited SetNewWidth(elsebut.left+elsebut.Width+8);
  end
  else
    inherited SetNewWidth(nw);
end;

procedure TDspControlElseBlock.SetParent(AParent: TWinControl);
begin
  inherited;
  if assigned(fElseBlock) then
    fElseBlock.Parent:=AParent;

end;

{ TDspControlBlockELSE }

constructor TDspControlBlockELSE.Create(AOwner: TComponent);
begin
  inherited;
  fNewlycreated:=false;
  topNose:=false;
  nospadDn:=40;

end;

function TDspControlBlockELSE.GetContainerBlockName: String;
begin
  if assigned(ContainerBlock) then
   result:=ContainerBlock.name
  else
    result:='';

end;

procedure TDspControlBlockELSE.MouseDown(Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  //
end;

procedure TDspControlBlockELSE.Reattach(Sender: TDspBlock);
begin
  inherited;
  Left:=FContainerBlock.Left;
  if assigned(FContainerBlock) then
    FContainerBlock.Reattach(Sender);
  repaint;
end;

procedure TDspControlBlockELSE.SetBounds(pLeft, pTop, pWidth, pHeight: integer);
Var bk:TDspBlock;
    t:integer;
begin
  inherited;
  if assigned(FContainerBlock) then
  Begin
   if Left<>FContainerBlock.Left then
    Left:=FContainerBlock.Left;
   bk:=FContainerBlock.getLastDspBlock(Self);
   if not assigned(bk) or (bk=self)  then exit;

   t:=bk.Top+bk.Height+10;
   if top<>t then
    top:=t;
  End;

end;

procedure TDspControlBlockELSE.SetContainerBlock(
  const Value: TDspContainerBlock);
begin
    FContainerBlock:=value;
end;

procedure TDspControlBlockELSE.SetContainerBlockName(const Value: String);
var f:TDspContainerBlock;
begin
  FContainerBlockName := Value;
  if assigned(owner) and not assigned(ContainerBlock) then
  Begin
     f:=TDspContainerBlock(owner.FindComponent(FContainerBlockName));
     if assigned(f) then
       ContainerBlock:=f;
  End;

end;

initialization
 System.Classes.RegisterClass(TDspControlBlockELSE);
 System.Classes.RegisterClass(TDspControlElseBlock);
 System.Classes.RegisterClass(TDspControlBlock);
 System.Classes.RegisterClass(TDspLoopBlock);
 System.Classes.Registerclass(TDspContainerBlock);
 System.Classes.Registerclass(TDspContainerBlockEnd);


end.
