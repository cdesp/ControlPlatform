unit unUtils;

interface
uses Vcl.Graphics;

function DarkenColor(Color: TColor; Amount: Integer): TColor;
function LightenColor(Color: TColor; Amount: Integer): TColor;

implementation

type
TRGBAColor = packed record
R, G, B, A: Byte;
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
