unit DspCombo;

interface
uses  system.Classes,Vcl.Controls,messages,windows,Vcl.ComCtrls,Vcl.Menus,DspEdit;

Type
   TDspCombo=Class(TDspEdit)

   Private
    FItems: TStrings;
    FItemindex: Integer;
    mnu:TPopUpMenu;
    DownPt:tpoint;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure SetItems(const Value: TStrings);
    function getItemCount: Integer;
    procedure ShowComboList;
    procedure OnComboSelect(Sender: TObject);
    procedure SetItemindex(const Value: Integer);
//    procedure CM_MenuClosed(var msg: TMessage) ; message CM_MENU_CLOSED;
//    procedure CM_EnterMenuLoop(var msg: TMessage) ; message CM_ENTER_MENU_LOOP;
//    procedure CM_ExitMenuLoop(var msg: TMessage) ; message CM_EXIT_MENU_LOOP;
//     Property Min;
//     Property Max;
//     Property UseUpDn;
//     Property Value;

   Protected
     procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUp;
     procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
     procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
   Public
       constructor Create(AOwner: TComponent); override;
       destructor Destroy; override;
       Property ItemCount:Integer read getItemCount;
       property OnClick;
   Published
       Property Items:TStrings read FItems write SetItems;
       Property Itemindex:Integer read FItemindex write SetItemindex;
   End;

procedure Register;

implementation
uses Vcl.Graphics,System.SysUtils,types,dspUtils,Vcl.StdCtrls,math,forms;



{ TDspCombo }

//procedure TDspCombo.CM_EnterMenuLoop(var msg: TMessage);
//begin
//
//end;
//
//procedure TDspCombo.CM_ExitMenuLoop(var msg: TMessage);
//begin
//
//end;
//
//procedure TDspCombo.CM_MenuClosed(var msg: TMessage);
//begin
//  if assigned(mnu) then
//   Freeandnil(mnu);
//end;

constructor TDspCombo.Create(AOwner: TComponent);
begin
  inherited;
  Editable:=False;
  NumbersOnly:=False;
  FItems:=TStringlist.Create;
  mnu:=nil;
end;

procedure TDspCombo.CreateParams(var Params: TCreateParams);
begin
  inherited;

end;

destructor TDspCombo.Destroy;
begin
  FItems.Free;
  inherited;
end;

function TDspCombo.getItemCount: Integer;
begin
 if assigned(Fitems) then
   Result:=FItems.Count
 Else
   Result:=0;
end;

procedure TDspCombo.SetItemindex(const Value: Integer);
begin
  FItemindex := Math.Min(ItemCount-1,Value);
  if assigned(Fitems) then
    Text:=FItems[FitemIndex];
end;

procedure TDspCombo.SetItems(const Value: TStrings);
begin
 if assigned(FItems) then
   FItems.Assign(Value);
end;

procedure TDspCombo.OnComboSelect(Sender:TObject);
Begin
  Itemindex:=TMenuItem(Sender).Tag;
  if Assigned(OnClick) then OnClick(Self);
  
End;

procedure TDspCombo.ShowComboList;
Var
    m:TMenuItem;
    i: Integer;
    px,py:Integer;
    pt:TPoint;
Begin
  if not assigned(Parent) then exit;
  px:=Left;
  py:=Top;
  pt:=TControl(Parent).ClientToScreen(point(px,py));

  mnu:=TPopupMenu.Create(nil);
  for i := 0 to Itemcount-1 do
  Begin
   m:=TMenuitem.Create(mnu);
   m.Caption:=items[i];
   m.Tag:=i;
   m.OnClick:=OnComboSelect;
   mnu.Items.Insert(0,m);
  End;
  try
   mnu.Popup(pt.X,pt.y+height);
  finally
    Application.processmessages;
    mnu.Free;
  end;
End;

procedure TDspCombo.WMLButtonDown(var Message: TWMLButtonDown);
begin
  inherited;
  if not Editmode then
  Begin
    SetFocus;
    Downpt:=message.Pos;
    OnMove:=true;                                                //
  End;

end;

procedure TDspCombo.WMLButtonUp(var Message: TWMLButtonUp);
begin
 inherited;
 //ToDO:show the list for selection
 ShowComboList;
end;


procedure TDspCombo.WMMouseMove(var Message: TWMMouseMove);
Var x,y:Integer;
begin
 //Inherited;
 x:=left+Message.XPos;y:=top+Message.YPos;
 if OnMove and (Downpt<>Message.pos) then
 Begin
   OnMove:=false;
   PostMessage(Parent.Handle, WM_LBUTTONDOWN, 0, MAKELPARAM(x,y));
 End;

end;

procedure Register;
begin
  RegisterComponents('CDesp', [TDspCombo]);
end;

Initialization
 System.Classes.RegisterClass(TDspCombo);

end.
