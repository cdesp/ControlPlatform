unit DspUtils;

interface
uses Vcl.Graphics;

function DarkenColor(Color: TColor; Amount: Integer): TColor;
function LightenColor(Color: TColor; Amount: Integer): TColor;
function HTMLtocolor(htmColor:String):tColor;

implementation

type
TRGBAColor = packed record
R, G, B, A: Byte;
end;

function HTMLtocolor(htmColor:String):tColor;
var DColor:String;
begin
//  htmColor= #084B8A    Delphi Color='$008A4B08'
  DColor:='$00'+copy(htmColor,6,2)+copy(htmColor,4,2)+copy(htmColor,2,2);
  result:=StringtoColor(DColor)
end;


function DarkenColor(Color: TColor; Amount: Integer): TColor;
var
C: TRGBAColor;
begin
C := TRGBAColor(ColorToRGB(Color));
C.R := C.R * (100 - Amount) div 100;
C.G := C.G * (100 - Amount) div 100;
C.B := C.B * (100 - Amount) div 100;
Result := TColor(C);
end;

function LightenColor(Color: TColor; Amount: Integer): TColor;
var
C: TRGBAColor;
begin
C := TRGBAColor(ColorToRGB(Color));
C.R := 255 - (255 - C.R) * (100 - Amount) div 100;
C.G := 255 - (255 - C.G) * (100 - Amount) div 100;
C.B := 255 - (255 - C.B) * (100 - Amount) div 100;
Result := TColor(C);
end;



end.
