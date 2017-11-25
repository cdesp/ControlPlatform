unit DspEdit;

interface
uses system.Classes,Vcl.Controls,messages,windows,Vcl.ComCtrls,Vcl.Menus;

Type

   TDspEdit=Class(TCustomControl)
  private
    FMyParams: TCreateParams;
    FUpDnChanging:Boolean;
    Fupdn:TUpDown;
    FUseParentProps: Boolean;
    FAutoSize: Boolean;
    FMyfocused: boolean;
    FEditMode: Boolean;
    FAlignment: TAlignment;
    FCreating: Boolean;
    FMaxLength: Integer;
    FModified:Boolean;
    FOldSelStart:integer;
    FOldSelLength:Integer;
    FNumbersOnly: Boolean;
    FUseUpDn: boolean;
    FMax: integer;
    FMin: Integer;
    FOnChange: TNotifyEvent;
    procedure SetUseParentProps(const Value: Boolean);
    procedure CMTextChanged(var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMParentColorChanged(var Message: TMessage); message CM_PARENTCOLORCHANGED;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure WndProc(var Message: TMessage); override;
    procedure DefaultHandler(var Message); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWindowHandle(const Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure SetSelText(const Value: string);
    procedure SelectAll;
    procedure SetAutoSize(const Value: Boolean);
    procedure UpdateHeight;
    procedure AdjustHeight;
    procedure UpdateWidth;
    procedure AdjustWidth;
    procedure SetMyfocused(const Value: boolean);
    procedure SetEditMode(const Value: Boolean);
    procedure SetAlignment(const Value: TAlignment);
    procedure DoSetMaxLength(Value: Integer);
    procedure SetMaxLength(const Value: Integer);
    function GetModified: Boolean;
    procedure SetModified(const Value: Boolean);
    function GetSelStart: Integer;
    function GetSelText: string;
    procedure SetSelStart(const Value: Integer);
    function GetSelLength: Integer;
    procedure SetSelLength(const Value: Integer);
    procedure SetNumbersOnly(const Value: Boolean);
    function GetValue: Integer;
    procedure SetValue(const Value: Integer);
    procedure SetUseUpDn(const Value: boolean);
    procedure SetUpDnPos;
    procedure UpDnChange(Sender:TObject;var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
    procedure SetMax(const Value: integer);
    procedure SetMin(const Value: Integer);
    function GetRealWidth: Integer;
    function GetTotalWidth: Integer;
    procedure SetOnChange(const Value: TNotifyEvent);


   protected
       Onmove:Boolean;
       editable:Boolean;
       procedure Resize; override;
       procedure Change; Dynamic;
      function Focused: Boolean; override;
      procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
      procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUp;
      procedure WMMouseMove(var Message: TWMMouseMove); message WM_MOUSEMOVE;
      procedure MouseEnter (var Msg: TMessage); message cm_mouseEnter;
      procedure MouseLeave (var Msg: TMessage); message cm_mouseLeave;
      procedure Paint; Override;
      procedure KeyPress(var Key: Char); Override;
   public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure ParentSet;
      property SelStart: Integer read GetSelStart write SetSelStart;
      property SelText: string read GetSelText write SetSelText;
      property MaxLength: Integer read FMaxLength write SetMaxLength default 0;
      property Modified: Boolean read GetModified write SetModified;
      property Myfocused:boolean read FMyfocused write SetMyfocused;
      property SelLength: Integer read GetSelLength write SetSelLength;
      Property EditMode:Boolean read FEditMode write SetEditMode;
   published
      property Color;
      Property Text;
      Property Font;
      Property AutoSize:Boolean read FAutoSize Write SetAutoSize;
      property UseParentProps:Boolean read FUseParentProps write SetUseParentProps;
      property Alignment: TAlignment read FAlignment write SetAlignment default taLeftJustify;
      property NumbersOnly: Boolean read FNumbersOnly write SetNumbersOnly default True;
      property Value:Integer read GetValue write SetValue;
      property UseUpDn:boolean read FUseUpDn write SetUseUpDn;
      Property Min:Integer read FMin write SetMin;
      Property Max:integer read FMax write SetMax;
      property OnKeyPress;
      property OnChange:TNotifyEvent read FOnChange write SetOnChange;
   End;


procedure Register;

implementation
uses Vcl.Graphics,System.SysUtils,types,dspUtils,Vcl.StdCtrls,math;

{ TDspEdit }


procedure TDspEdit.Change;
begin
  inherited Changed;
  Perform(CM_TEXTCHANGED, 0, 0);
  if assigned(FOnChange) then FonChange(Self);

end;

procedure TDspEdit.CMParentColorChanged(var Message: TMessage);
begin
  inherited;
  UseParentProps:=FUseParentProps;
  Invalidate;
end;

Procedure TDspEdit.ParentSet;//For our parent
Begin
  //Recalc width and height
  AdjustHeight;
  AdjustWidth;
End;

procedure TDspEdit.CMTextChanged(var Message: TMessage);
begin
  inherited;

 if Fautosize then
 Begin
  SetAutoSize(False);
  SetAutoSize(True);
 End;
 if NumbersOnly and assigned(FUpDn) then
  if (FUpdn.Position<>Value) and Not FUpDnChanging then
    FUpdn.Position:=Value;
  invalidate;
end;

procedure TDspEdit.CNCommand(var Message: TWMCommand);
begin
  Inherited;
  if (Message.NotifyCode = EN_CHANGE) and not FCreating then Change;
end;

constructor TDspEdit.Create(AOwner: TComponent);
begin
  inherited;
  Fupdn:=nil;
  ControlStyle := [csCaptureMouse, csOpaque, csAcceptsControls];
  UseParentProps:=true;
  NumbersOnly:=true;
  UseUpDn:=true;
  FMax:=100;
  DoubleBuffered:=true;
  Editable:=true;
//  BorderWidth:=0;
//  BevelInner:=bvNone;
//  BevelOuter:=bvNone;
//  BevelKind:=bkNone;
//  BevelWidth:=1;
end;

destructor TDspEdit.Destroy;
begin

  inherited;
end;

procedure TDspEdit.MouseEnter(var Msg: TMessage);
begin
  MyFocused:=True;
end;

procedure TDspEdit.MouseLeave(var Msg: TMessage);
begin
  MyFocused:=false;
end;

procedure TDspEdit.Paint;
var
  R: TRect;
  I: Integer;
  S: String;
  oldc:TColor;
begin

  R := ClientRect;
  R.Width:=GetRealWidth;
//  Inc(R.Left, 0);   //2
//  Dec(R.Top, 0);    //2
  Canvas.Brush.Assign(Self.Brush);
  Canvas.Font.Assign(Self.Font);
 if not focused then
 Begin

  if Myfocused then
    canvas.Brush.color:=LightenColor(Color,50)
  else
    canvas.Brush.color:=Color;



  Canvas.Pen.Color:=canvas.Brush.color;
  canvas.Brush.Style:=bsSolid;
  canvas.FillRect(R);
 End;
  oldc:=canvas.Brush.color;

  for I := 1 to Length(Text) do
  begin
    if (Text[I] in ['0'..'9']) and not NumbersOnly then
      Canvas.Font.Color := clRed
    else
      Canvas.Font.Color := Font.Color;
    if SelLength>0 then
     if  (i>SelStart) and (i<=SelStart+SelLength) then
      Begin
       if i=SelStart+1 then
       Begin
        Oldc:=canvas.Brush.color;
        canvas.Brush.color:=clHighLight;
       End;
      End
      Else
        canvas.Brush.color:=Oldc;


    S := Text[I];
    DrawText(Canvas.Handle, PChar(S), -1, R, DT_LEFT or DT_NOPREFIX or
      DT_WORDBREAK or DrawTextBiDiModeFlagsReadingOnly);
    Inc(R.Left,Canvas.TextWidth(S));
  end;

  canvas.Brush.Style:=bsSolid;

  canvas.Brush.color:=DarkenColor(Color,40);
  if fupdn.Visible then
   fupdn.Invalidate;
end;


procedure TDspEdit.Resize;
begin
  inherited;
  SetUpDnPos;
  if assigned(Parent) then
   TWinControl(Parent).Invalidate;
end;

procedure TDspEdit.AdjustHeight;
Begin
 if assigned(parent) and Assigned(Parent.parent) then
 Begin
  Canvas.font.assign(font);
  Height:=Math.Max(Canvas.TextHeight('0'),Canvas.TextHeight(Text));
 End;

End;

procedure TDspEdit.AdjustWidth;
Begin
  Width:=GetTotalWidth;
  SetUpDnPos;
End;

Function TDspEdit.GetRealWidth:Integer;
begin
 if assigned(parent) and Assigned(Parent.parent) then
 Begin
  Canvas.font.assign(font);
  Result:=Math.Max(Canvas.TextWidth('0'),Canvas.TextWidth(Text))+8;
 End
 else
   result:=Width;
end;


Function TDspEdit.GetTotalWidth:Integer;
Begin
  Result:=GetRealWidth;
  if Assigned(FUpdn) And FUpDn.Visible then
      Result:=Result+Fupdn.Width;
End;

procedure TDspEdit.UpdateHeight;
begin
  if FAutoSize then
  begin
    AdjustHeight;
  end;
end;

procedure TDspEdit.UpdateWidth;
begin
  if FAutoSize then
  begin
    AdjustWidth;
  end;
end;

function TDspEdit.Focused: Boolean;
Begin
  Result:=inherited Focused;
  if Not Result and editmode then
    EditMode:=false;

End;

procedure TDspEdit.SelectAll;
begin

end;

procedure TDspEdit.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
end;

procedure TDspEdit.SetAutoSize(const Value: Boolean);
begin
  if FAutoSize <> Value then
  begin
    FAutoSize := Value;
    UpdateHeight;
    UpdateWidth;
  end;
end;

procedure TDspEdit.SetEditMode(const Value: Boolean);
Var lparam:integer;
begin
  FEditMode := Value;
  Lparam:=0;
  SendMessage(Handle,WS_VISIBLE,Integer(Value),Lparam);
  if FNumbersOnly and not value then
  Begin
     SendMessage(Handle, EM_SETSEL, 0, 0);
     Self.Value:=Self.Value;//for checking
  End;
  if FNumbersOnly and assigned(FupDn) then
  Begin
    FUpDn.Visible:=Value;
  End;
  AdjustWidth;
  Invalidate;
end;

procedure TDspEdit.SetMyfocused(const Value: boolean);
begin
  FMyfocused := Value;
end;

procedure TDspEdit.SetNumbersOnly(const Value: Boolean);
begin
  if FNumbersOnly <> Value then
  begin
    FNumbersOnly := Value;
//    if HandleAllocated then
//    begin
//      if FNumbersOnly then
//        SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) or ES_NUMBER)
//      else
//        SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not ES_NUMBER);
//    end;
  end;
end;

procedure TDspEdit.SetOnChange(const Value: TNotifyEvent);
begin
  FOnChange := Value;
end;

procedure TDspEdit.SetMax(const Value: integer);
begin
  FMax := Value;
  if assigned(FUpDn) then
   fupdn.Max:=FMax;
end;

procedure TDspEdit.SetMaxLength(const Value: Integer);
begin
  if FMaxLength <> Value then
  begin
    FMaxLength := Value;
    if HandleAllocated then DoSetMaxLength(Value);
  end;
end;

procedure TDspEdit.SetMin(const Value: Integer);
begin
  FMin := Value;
  if assigned(FUpDn) then
   fupdn.Min:=FMin;

end;

procedure TDspEdit.SetModified(const Value: Boolean);
begin
  if HandleAllocated then
    SendMessage(Handle, EM_SETMODIFY, Byte(Value), 0) else
    FModified := Value;
end;

Type TWinCtrlHack=Class(TwinControl);

procedure TDspEdit.SetUseParentProps(const Value: Boolean);
begin
  FUseParentProps := Value;
  if assigned(Parent) then
  Begin
    //Set parent color properties
    ParentColor:=not Value;
    Color:= LightenColor(TWinCtrlHack(Parent).color,30);
    ParentFont:=Value;
    ParentShowHint:=Value;
    Hint:=TControl(Parent).Hint;
  End;
end;

procedure TDspEdit.SetUpDnPos;
Begin
  if Assigned(FUpdn) then
  Begin
   Fupdn.Height:=height;
   FUpdn.Left:=GetRealWidth;
  End;
End;

procedure TDspEdit.UpDnChange(Sender:TObject;var AllowChange: Boolean; NewValue: Integer; Direction: TUpDownDirection);
Begin
  if Assigned(FUpDn) then
  Begin
   FUpDnChanging:=true;
   try
    Value:=NewValue;
   finally
     FUpDnChanging:=False;
   end;
  End;
  AllowChange:=true;
End;


procedure TDspEdit.SetUseUpDn(const Value: boolean);
begin
  if not NumbersOnly then exit;
  FUseUpDn := Value;
  if Value then
  Begin
    FUpDn:=TUpDown.Create(Self);
    FUpdn.Parent:=Self;
    FUpDn.OnChangingEx:=UpDnChange;

    FUpDn.Min:=Min;
    FUpDn.Max:=Max;
    FUpDn.Visible:=False;
    Fupdn.Position:=Self.Value;
    fupdn.Associate:=self;

    SetUpDnPos;
  End
  Else
    FreeAndNil(FUpDn);
end;

procedure TDspEdit.SetValue(const Value: Integer);
Var v:integer;
begin
  v:=Value;
  try
   if NumbersOnly then
   Begin
     V:=Math.Min(V,Self.max);
     V:=Math.Max(V,Self.min);
   End;
   text:=inttostr(V);
  Except
   Text:='0';
  end;
end;


procedure TDspEdit.WMLButtonDown(var Message: TWMLButtonDown);
Var x,y:Integer;
begin
  inherited;
  if not Editmode then
  Begin
   Parent.SetFocus;
//   x:=left+Message.XPos;y:=top+Message.YPos;
//   PostMessage(Parent.Handle, WM_LBUTTONDOWN, 0, MAKELPARAM(x,y));
    OnMove:=true;                                                //

  End;
end;

procedure TDspEdit.WMLButtonUp(var Message: TWMLButtonUp);
begin
 inherited;
 EditMode:=true;
 OnMove:=false;
 SetFocus;
 Invalidate;
end;

procedure TDspEdit.WMMouseMove(var Message: TWMMouseMove);
Var x,y:Integer;
begin
 Inherited;
 if OnMove then
 Begin
   OnMove:=false;
   x:=left+Message.XPos;y:=top+Message.YPos;
   PostMessage(Parent.Handle, WM_LBUTTONDOWN, 0, MAKELPARAM(x,y));
 End;
end;

procedure TDspEdit.WndProc(var Message: TMessage);
begin
  inherited WndProc(Message);
  with Message do
    case Msg of
      CM_MOUSEENTER, CM_MOUSELEAVE, WM_LBUTTONUP, WM_LBUTTONDOWN,WM_MOUSEMOVE,
      WM_KEYDOWN, WM_KEYUP,
      WM_SETFOCUS, WM_KILLFOCUS,
      CM_FONTCHANGED, CM_TEXTCHANGED:
      begin
        Invalidate;
      end;
   end;
end;

procedure TDspEdit.DefaultHandler(var Message);
{$IF DEFINED(CLR)}
var
  FocusMsg: TWMSetFocus;
  Msg: TMessage;
{$ENDIF}
begin
{$IF DEFINED(CLR)}
  Msg := UnwrapMessage(TObject(Message));
  case Msg.Msg of
{$ELSE}
  case TMessage(Message).Msg of
{$ENDIF}
    WM_SETFOCUS:
      if editmode then
      if Win32Platform = VER_PLATFORM_WIN32_WINDOWS then
      begin
{$IF DEFINED(CLR)}
        FocusMsg := TWMSetFocus.Create(Msg);
        if not IsWindow(FocusMsg.FocusedWnd) then
          FocusMsg.FocusedWnd := 0;
{$ELSE}
        if not IsWindow(TWMSetFocus(Message).FocusedWnd) then
          TWMSetFocus(Message).FocusedWnd := 0;
{$ENDIF}
      end;
  end;
  inherited;
end;

procedure TDspEdit.SetSelStart(const Value: Integer);
begin
  SendMessage(Handle, EM_SETSEL, Value, Value);
end;

procedure TDspEdit.SetSelText(const Value: string);
begin
{$IF DEFINED(CLR)}
  if not Assigned(Value) then
    SendTextMessage(Handle, EM_REPLACESEL, 0, '')
  else
{$ENDIF}
    SendTextMessage(Handle, EM_REPLACESEL, 0, Value);
end;

procedure TDspEdit.CreateParams(var Params: TCreateParams);
const
  Alignments: array[Boolean, TAlignment] of DWORD =
    ((ES_LEFT, ES_RIGHT, ES_CENTER),(ES_RIGHT, ES_LEFT, ES_CENTER));
  Passwords: array[Boolean] of DWORD = (0, ES_PASSWORD);
  ReadOnlys: array[Boolean] of DWORD = (0, ES_READONLY);
  CharCases: array[TEditCharCase] of DWORD = (0, ES_UPPERCASE, ES_LOWERCASE);
  HideSelections: array[Boolean] of DWORD = (ES_NOHIDESEL, 0);
  OEMConverts: array[Boolean] of DWORD = (0, ES_OEMCONVERT);
  NumbersOnlyStyle: array[Boolean] of DWORD = (0, ES_NUMBER);
begin
  inherited CreateParams(Params);
  if editable then
   CreateSubClass(Params, 'EDIT');

  with Params do
  begin
    Style := Style or (ES_AUTOHSCROLL or ES_AUTOVSCROLL) or
    // NumbersOnlyStyle[FNumbersOnly] or
      Alignments[UseRightToLeftAlignment, fAlignment] ;
    if NewStyleControls and Ctl3D then
    begin
      Style := Style and not WS_BORDER;
      //ExStyle := ExStyle or WS_EX_CLIENTEDGE;
       ExStyle := ExStyle or WS_EX_TRANSPARENT
    end;
  end;
  FMyParams:=Params;
end;

[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TDspEdit.CreateWindowHandle(const Params: TCreateParams);
var
  P: TCreateParams;
begin
  if SysLocale.FarEast and (Win32Platform <> VER_PLATFORM_WIN32_NT) and
    ((Params.Style and ES_READONLY) <> 0) then
  begin
    // Work around Far East Win95 API/IME bug.
    P := Params;
    P.Style := P.Style and (not ES_READONLY);
    inherited CreateWindowHandle(P);
    if WindowHandle <> 0 then
      SendMessage(WindowHandle, EM_SETREADONLY, Ord(True), 0);
  end
  else
    inherited CreateWindowHandle(Params);
end;


[UIPermission(SecurityAction.LinkDemand, Window=UIPermissionWindow.AllWindows)]
procedure TDspEdit.CreateWnd;
begin
  FCreating := True;
  try
    inherited CreateWnd;
  finally
    FCreating := False;
  end;
  DoSetMaxLength(FMaxLength);
  Modified := FModified;
  if FOldSelStart <> -1 then
  begin
    SelStart := FOldSelStart;
    FOldSelStart := -1;
  end;
  if FOldSelLength <> -1 then
    SelLength := FOldSelLength;
  UpdateHeight;
  //DoSetTextHint(FTextHint);
end;

procedure TDspEdit.DestroyWnd;
begin
  FModified := Modified;
  FOldSelLength := SelLength;
  FOldSelStart := SelStart;
  inherited DestroyWnd;
end;

procedure TDspEdit.DoSetMaxLength(Value: Integer);
begin
  SendMessage(Handle, EM_LIMITTEXT, Value, 0)
end;


function TDspEdit.GetModified: Boolean;
begin
  Result := FModified;
  if HandleAllocated then Result := SendMessage(Handle, EM_GETMODIFY, 0, 0) <> 0;
end;

function TDspEdit.GetSelStart: Integer;
{$IF DEFINED(CLR)}
var
  Temp: Integer;
begin
  SendGetSel(Result, Temp);
{$ELSE}
begin
  SendMessage(Handle, EM_GETSEL, WPARAM(@Result), 0);
{$ENDIF}
end;

function TDspEdit.GetSelText: string;
{$IF DEFINED(CLR)}
var
  SelStart, SelEnd: Integer;
begin
  SendGetSel(SelStart, SelEnd);
  Result := Copy(Text, SelStart + 1, SelEnd - SelStart);
{$ELSE}
var
  P: PChar;
  SelStart, Len: Integer;
begin
  SelStart := GetSelStart;
  Len := GetSelLength;
  SetString(Result, PChar(nil), Len);
  if Len <> 0 then
  begin
    P := StrAlloc(GetTextLen + 1);
    try
      GetTextBuf(P, StrBufSize(P));
      Move(P[SelStart], Pointer(Result)^, Len * SizeOf(Char));
    finally
      StrDispose(P);
    end;
  end;
{$ENDIF}
end;

function TDspEdit.GetValue: Integer;
begin
 try
   Result:=Strtoint(Text);
 Except
   Result:=0;
 end;
end;

procedure TDspEdit.KeyPress(var Key: Char);
begin
 if NOT FNumbersOnly then exit;
 
 if not (Key in [#8, '0'..'9', '-', formatsettings.DecimalSeparator]) then
    Key := #0
  else if ((Key = formatsettings.DecimalSeparator) or (Key = '-')) and
          (Pos(Key, Text) > 0) then begin
    Key := #0;
  end
  else if (Key = '-') and
          (SelStart <> 0) then begin
    Key := #0;
  end;
end;

function TDspEdit.GetSelLength: Integer;
var
  Selection: TSelection;
begin
{$IF DEFINED(CLR)}
  SendGetSel(Selection.StartPos, Selection.EndPos);
{$ELSE}
  SendMessage(Handle, EM_GETSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));
{$ENDIF}
  Result := Selection.EndPos - Selection.StartPos;
end;


procedure TDspEdit.SetSelLength(const Value: Integer);
var
  Selection: TSelection;
begin
{$IF DEFINED(CLR)}
  SendGetSel(Selection.StartPos, Selection.EndPos);
{$ELSE}
  SendMessage(Handle, EM_GETSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));
{$ENDIF}
  Selection.EndPos := Selection.StartPos + Value;
  SendMessage(Handle, EM_SETSEL, Selection.StartPos, Selection.EndPos);
  SendMessage(Handle, EM_SCROLLCARET, 0, 0);
end;





procedure Register;
begin
  RegisterComponents('CDesp', [TDspEdit]);
end;

Initialization
  System.Classes.RegisterClass(TdspEdit);

end.
