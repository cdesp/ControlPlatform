unit unBlockVar;

interface
uses unBlock,stdctrls,System.Classes,System.UITypes,Winapi.Messages,VCL.Controls;

const WM_REFVARS_MSG = WM_USER + 252;

Type


     TDspVarBlock=Class(TDspBlock)

     private
       DelCbox:TCheckBox;
       function GetToDelete: Boolean;
       procedure SetToDelete(const Value: Boolean);
     protected
         procedure Setprototype(const Value: boolean);Override;
         function createNewBlock: TDspBlock;override;
         procedure CheckAttach;override;
         procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X,  Y: Integer);override;
         procedure setParent(AParent:TWinControl);Override;
         procedure AssignTo(Dest:TPersistent);override;
     public
       constructor Create(AOwner: TComponent); override;
       Procedure DelCboxClick(Sender:TObject);
       procedure SetBounds( pLeft , pTop , pWidth , pHeight:integer );Override;
       Property ToDelete:Boolean read GetToDelete write SetToDelete;

     End;

     TDspCommandVarBlock=Class(TDspBlock)
     private
        procedure OnComboChange(Sender: tObject);
        procedure OnRefVarRequest(var Msg: TMessage); message WM_REFVARS_MSG;
     protected
       procedure SetParent(AParent: TWinControl); override;
       function getParam2: Integer;override;
       procedure setfParam2(const Value: Integer);override;
       procedure AssignTo(Dest:TPersistent);override;
       function createNewBlock: TDspBlock;override;
       Procedure FillVarCombo;
       Procedure CreateCtrl2;Override;
       function getParam2Control(x, y: integer): integer;Override;
       Constructor Create(AOwner: TComponent);Override;
       function Param2Visible: Boolean;Override;

     Public
      Function varCombo:TComboBox;
     End;




implementation
uses Types,unVariables,unUtils,Sysutils,vcl.graphics,math;

{ TDspVarBlock }

procedure TDspVarBlock.AssignTo(Dest: TPersistent);
begin
  inherited;
  if dest is  TDspVarBlock then
    TDspVarBlock(dest).height:=height-2;

end;

procedure TDspVarBlock.CheckAttach;
Var tmpctrl:TDspBlock;
    i:Integer;
    OtherParamRect:TRect;
    MyRect:TRect;
begin
     if Param1toAttach<>nil then
     Begin
       Param1toAttach.Param1Attaching:=false;
       Param1toAttach.Invalidate;
     End;

     if Param2toAttach<>nil then
     Begin
       Param2toAttach.Param2Attaching:=false;
       Param2toAttach.Invalidate;
     End;

     Param1toAttach:=nil;
     Param2toAttach:=nil;
     if (parent<>nil) and (parent.Tag=995) then
     Begin
        for i := 0 to  parent.ControlCount-1 do
        Begin
           if parent.Controls[i] is TDspBlock and (parent.Controls[i].Tag<>2000 ) and (parent.Controls[i]<>self) then
           Begin
              tmpctrl:=TDspBlock(parent.Controls[i]);
              MyRect:=BoundsRect;
              OtherParamRect:=tmpctrl.GetParam1Rect; //check param1
              if (not OtherParamRect.IsEmpty) and  tmpctrl.Param1Visible and
                IntersectRect(OtherParamRect,MyRect) then
               Begin
                  Param1toAttach:=  tmpctrl;
                  Param1toAttach.Param1Attaching:=True;
                  Repaint;
                  Break;//attach to 1st block we found
               End;
              OtherParamRect:=tmpctrl.GetParam2Rect; //check param2
              if (not OtherParamRect.IsEmpty) and  tmpctrl.Param2Visible and
                IntersectRect(OtherParamRect,MyRect) then
               Begin
                  Param2toAttach:=  tmpctrl;
                  Param2toAttach.Param2Attaching:=True;
                  Repaint;
                  Break;//attach to 1st block we found
               End;
           End;
        End;
     End;

end;

constructor TDspVarBlock.Create(AOwner: TComponent);
begin
  inherited;
  Tag:=2000;//we are var block
  topnose:=False;
  botnose:=False;
    DelCbox:=TCheckBox.Create(self);
    Delcbox.Left:=8;
    Delcbox.Top:=Height div 2-10;
    Delcbox.OnClick:=DelCboxClick;
    Delcbox.Caption:='';
    Delcbox.Hint:='Επέλεξε για διαγραφή';
    Delcbox.ShowHint:=true;
    Delcbox.Width:=16;
    Delcbox.parent:=self;
    Margins.Left:=Delcbox.Left+Delcbox.width;
    Margins.Top:=0;
end;

function TDspVarBlock.createNewBlock: TDspBlock;
begin
  result:= TDspVarBlock.CreateFloat(Owner);
  result.Height:=result.Height-2;
end;

procedure TDspVarBlock.DelCboxClick(Sender: TObject);
begin

end;


function TDspVarBlock.GetToDelete: Boolean;
begin
  Result:= DelCbox.Checked;
end;


procedure TDspVarBlock.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  if assigned(Param1toAttach) then
  Begin
    //Attach self variable block to Param1toAttach
    Param1toAttach.VarParam1:=Self;
    Param1toAttach.Param1Attaching:=false;
  End;
  if assigned(Param2toAttach) then
  Begin
    //Attach self variable block to Param1toAttach
    Param2toAttach.VarParam2:=Self;
    Param2toAttach.Param2Attaching:=false;
  End;

end;


procedure TDspVarBlock.SetBounds(pLeft, pTop, pWidth, pHeight: integer);
begin
  inherited SetBounds( pLeft , pTop , pWidth , pHeight );
end;


procedure TDspVarBlock.setParent(AParent: TWinControl);
begin
  inherited;
end;

procedure TDspVarBlock.Setprototype(const Value: boolean);
begin
  inherited;
  if assigned(DelCbox) then
  Begin
   DelCbox.Free;
   DelCbox:=nil;
   Margins.Left:=3;
  End;
end;




procedure TDspVarBlock.SetToDelete(const Value: Boolean);
begin
   DelCbox.Checked:=value;
end;

{ TDspCommandVarBlock }

procedure TDspCommandVarBlock.AssignTo(Dest: TPersistent);
begin
  inherited;

end;

constructor TDspCommandVarBlock.Create(AOwner: TComponent);
begin
  inherited;
  TotalParams:=2;
end;

procedure TDspCommandVarBlock.OnComboChange(Sender:tObject);
Var pName:string;
Begin
  if assigned(ctrl2) then
  Begin
   pname:='';
   if TComboBox(ctrl2).itemindex>-1 then
     pname:=TComboBox(ctrl2).Items[TComboBox(ctrl2).itemindex];
   if assigned(arduvars.GetVarByName(pName)) then
     fParam2:=arduvars.GetVarByName(pname).VarID
   else
    fParam2:=-1;

  End;
End;

procedure TDspCommandVarBlock.OnRefVarRequest(var Msg: TMessage);
begin

  FillVarCombo;

end;

function TDspCommandVarBlock.Param2Visible: Boolean;
begin
 Result:=False;
end;

procedure TDspCommandVarBlock.setfParam2(const Value: Integer);
Var pName:string;
begin
  fParam2 := Value; //variable id
  if not (csLoading in componentstate) then
  begin
    RecalcWidth;

    if assigned(ctrl2) then
     if TComboBox(ctrl2).items.Count>0 then
     Begin
      //find itemindex
      pname:='';
      if assigned(arduvars.GetVarByID(fparam2)) then
        pname:=arduvars.GetVarByID(fparam2).VarName;

      TComboBox(ctrl2).itemindex:=TComboBox(ctrl2).Items.IndexOf(pname);
     End;
  end;
end;

procedure TDspCommandVarBlock.SetParent(AParent: TWinControl);
begin
  inherited;
  if AParent<>nil then
  Begin
   FillVarCombo;
   if assigned(ctrl2) then
    Param2:=fParam2;
  End;

end;

function TDspCommandVarBlock.varCombo: TComboBox;
begin
   result:=  TComboBox(Ctrl2);
end;

procedure TDspCommandVarBlock.CreateCtrl2;
begin
  ctrl2:=TComboBox.create(self);
  ctrl2.Parent:=self;
  with TComboBox(Ctrl2) do
  Begin
   Font.Size:=10;
   Font.Color:=ctrlcolor2;
   Font.Style:=[fsbold];
   Visible:=False;
   Width:=40;
   onchange:=OnComboChange;
   BevelInner:=bvnone;
   Bevelkind:=bkFlat;
   BevelOuter:=bvSpace;
   StyleElements:=[];
   height:=18;
  End;
  TComboBox(Ctrl2).text:='';

end;

function TDspCommandVarBlock.createNewBlock: TDspBlock;
begin
 Result:=TDspCommandVarBlock.CreateFloat(Owner);
end;


procedure TDspCommandVarBlock.FillVarCombo;
var
  i,w: Integer;
  oldidx:Integer;
begin
   if  prototype or (csloading in componentstate) then exit;
   oldidx:=varCombo.itemindex;
   varCombo.Items.Assign(ArduVars);
   w:=0;
   for i := 0 to Pred(varCombo.Items.Count) do
   Begin
      w:=max(w,varCombo.Canvas.TextWidth(varCombo.Items[i]+'00'));
   End;
  // if VarCombo.Width<w then
    VarCombo.Width:=w+48; //then pulldown
   varCombo.itemindex:=oldidx;

   if VarCombo.text='' then
    if (varcombo.Itemindex<>-1) and (varcombo.Items.Count>0) then
       varcombo.text:=varcombo.Items[varcombo.Itemindex];
   { else//select 1st automatically
      if (varcombo.Items.Count>0) and (oldidx=-1) then
         varcombo.Itemindex:=0;}

   if (varcombo.ItemIndex=-1) and (varcombo.text<>'') then
     varcombo.text:='';




end;

function TDspCommandVarBlock.getParam2: Integer;
var pname:string;
begin
  result:=-1;
  if Assigned(Ctrl2) and not (csloading in componentstate)  then
  Begin
   pname:=TCombobox(Ctrl2).items[TCombobox(Ctrl2).ItemIndex];
   if arduvars.GetVarByName(pname)<>nil then
     Result:=arduvars.GetVarByName(pname).VarID;
  End;
end;

function TDspCommandVarBlock.getParam2Control(x, y: integer): integer;
var sv:TColor;
begin
  if prototype then
  Begin
    sv:=canvas.Font.Color;
    canvas.Font.Color:=clAqua;
    if assigned(ctrl2) then
     canvas.TextOut(x,y ,tCombobox(ctrl2).Text);
    canvas.Font.Color:=sv;
    result:=x+canvas.TextWidth(tCombobox(ctrl2).Text);
  End
  else
  Begin
    ctrl2.Visible:=true;
    tCombobox(ctrl2).Color:=HTMLtoColor('#084B8A');;
    tCombobox(ctrl2).font.Color:= clWhite;
    ctrl2.Left:=x;
    ctrl2.Top:=y-3;
    result:=ctrl2.Left+ctrl2.Width;
  End;
end;


initialization
 System.Classes.RegisterClass(TDspVarBlock);
 System.Classes.RegisterClass(TDspCommandVarBlock);

end.
