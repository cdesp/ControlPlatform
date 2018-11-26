unit unVariables;

interface
uses System.Classes,Winapi.messages;


const WM_REFVARS_MSG = WM_USER + 252;

Type
  TArduVar=Class
    VarName:String;
    VarID:Integer;
    VarValue:String;
    function getCvarname:string;
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
     function GetRealVarName(nm: string): string;
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


function greeklish(name:string):string;
Const greek:array[0..65] of string=('á','Ü','¢','Á','â','Â','ã', 'Ã', 'ä','Ä','å','Ý','Å','¸','æ','Æ','ç','Þ','Ç','è','È','é','ß','ú','À','É','º', 'ê','Ê','ë','Ë','ì','Ì','í','Í','î','Î','ï','ü','Ï','¼','ð','Ð','ñ','Ñ','ó','ò', 'Ó','ô','Ô','õ','ý','Õ','¾','ö','Ö','÷','×','ø','Ø','ù','þ','Ù','¿',' ',',');
  english:array[0..65] of string=('a', 'a','A','A','b','B','g','G','d','D','e','e','E','E','z','Z','i','i','I','th','Th', 'i','i','i','i','I','I','k','K','l','L','m','M','n','N','x','X','o','o','O','O','p','P' ,'r','R','s','s','S','t','T','u','u','Y','Y','f','F','ch','Ch','ps','Ps','o','o','O','O','_','_');

var  i:Integer;

 function Changeletter(l:char):string;
 var i:integer;
 Begin
    result:='';
    for I := 0 to High(greek) do
      if greek[i]=l then
      Begin
       result:=english[i];
       break;
      End;
    if result='' then result:=l;

 End;

Begin
   result:='';
   for I := 1 to Length(name) do
     result:=result+Changeletter(name[i]);


//   result:=StringReplace(name,name)
 //  $string  = str_replace&#40;$greek, $english, $Name&#41;;

End;

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

function TArduVariables.GetRealVarName(nm:string): string;
Var t:TArduVar;
Begin
  t:=GetVarByName(nm);
  if t<>nil then
    result:=greeklish(nm)
  else result:='NoVAR';
End;

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

{ TArduVar }

function TArduVar.getCvarname: string;
begin
  result:=greeklish(Varname);
end;

initialization
   ArduVars:=TArduVariables.Create;
end.
