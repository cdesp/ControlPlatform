unit unVariables;

interface
uses System.Classes,Winapi.messages;


const WM_REFVARS_MSG = WM_USER + 252;

Type
  TArduVar=Class
    VarName:String;
    VarID:Integer;
    VarValue:String;
  End;

  TArduVariables=Class(TStringlist)
  private
    function GetNewID: Integer;
  Public
     Constructor Create;
     Destructor Destroy;Override;
     Function Newvar(VName:String):TArduVar;
     Function GetVarByID(id:integer):TArduVar;
     Function GetVarByName(nm:String):TArduVar;
     Procedure DeleteVar(VName:String);
     Procedure SaveVars(fnm:String);
     Procedure LoadVars(fnm:String);
     Function GetArduVar(idx:integer):TArduVar;
     procedure EmptyVars;
  end;

var
   ArduVars:TArduVariables;

implementation
uses math,sysutils,inifiles,vcl.forms;


{ TArduVariables }

constructor TArduVariables.Create;
begin


end;

procedure TArduVariables.DeleteVar(VName: String);
Var av:TArduVar;
    i:Integer;
begin
  av:=GetVarByName(VName);
  if assigned(av) then
  Begin
    i:=IndexOf(VName);
    Delete(i);
    av.Free;
  End;
  Application.MainForm.Perform(WM_REFVARS_MSG,0,WM_REFVARS_MSG);
end;

procedure TArduVariables.EmptyVars;
Var i:integer;
Begin
  for i:=count-1 downto 0 do
  Begin
    TArduVar(objects[i]).Free;
    Delete(i);
  End;
   Application.MainForm.Perform(WM_REFVARS_MSG,0,WM_REFVARS_MSG);
End;

destructor TArduVariables.Destroy;
begin
  EmptyVars;
  inherited;
end;

function TArduVariables.GetVarByID(id: integer): TArduVar;
Var i:integer;
begin
  Result:=nil;
  for i:= 0 to count-1 do
  Begin
    Result:=TArduVar(objects[i]);
    if Result.VarID=id then
     Break
    Else
     Result:=nil;
  End;

end;

function TArduVariables.GetVarByName(nm: String): TArduVar;
var i:integer;
begin
    i:=IndexOf(nm);
    if i>-1 then
     Result:= TArduVar(Objects[i])
    else Result:=nil;
end;



procedure TArduVariables.LoadVars(fnm: String);
Var Newnm:String;
    sl:TIniFile;
    i,cnt:integer;
    sectnm,vrnm:String;
    av:TArduVar;
begin
   EmptyVars;
   Newnm:=ChangeFileExt(fnm,'.var');
   sl:=TInifile.create(Newnm);
   cnt:=sl.ReadInteger('Var Count','Count',0);
   for I := 0 to cnt-1 do
   Begin
    sectnm:='Var_'+inttostr(i);
    vrnm:=sl.ReadString(sectnm,'VarName','');
    av:=Newvar(vrnm);
    av.VarID:=sl.ReadInteger(sectnm,'VarID',av.VarID);
    av.VarValue:=sl.ReadString(sectnm,'VarValue',av.VarValue);
   End;
   sl.Free;

end;

function TArduVariables.GetArduVar(idx: integer): TArduVar;
begin
  if (idx>=0) and (idx<count) then
    Result:=TArduVar(Objects[idx])
  else result:=nil;
end;

function TArduVariables.GetNewID:Integer;
Var i:integer;
Begin
  Result:=0;
  if Count>0 then
   for i:=0 to Count-1 do
     Result:=Max(Result,TArduVar(Objects[i]).VarID);
  Result:=Result+1;
End;

function TArduVariables.Newvar(VName: String): TArduVar;
Var Msg: TMessage;
begin
   Result:=TArduVar.Create;
   Result.VarName:=vname;
   Result.VarID:=GetNewID;
   Result.VarValue:='';
   AddObject(vname,Result);

   Msg.Msg := WM_REFVARS_MSG;
   Msg.WParam := 0;
   Msg.LParam := Result.VarID;
   Msg.Result := 0;

//   Application.MainForm.Broadcast(msg);
   Application.MainForm.Perform(WM_REFVARS_MSG,0,WM_REFVARS_MSG);
end;

procedure TArduVariables.SaveVars(fnm: String);
Var Newnm:String;
    i:integer;
    sl:Tinifile;
    sectnm:String;
begin
   Newnm:=ChangeFileExt(fnm,'.var');
   sl:=TInifile.create(Newnm);
   sl.WriteInteger('Var Count','Count',count);
   for I := 0 to count-1 do
   Begin
    sectnm:='Var_'+inttostr(i);
    sl.WriteString(sectnm,'VarName',TArduVar(Objects[i]).VarName);
    sl.WriteInteger(sectnm,'VarID',TArduVar(Objects[i]).VarID);
    sl.WriteString(sectnm,'VarValue',TArduVar(Objects[i]).VarValue);
   End;
   sl.Free;
end;

initialization
   ArduVars:=TArduVariables.Create;
end.
