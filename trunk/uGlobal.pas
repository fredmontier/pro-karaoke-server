unit uGlobal;

interface

type
  TFilters = class(TObject)

  public
    num1,num2,num3,num4,num5 : integer;
    str1, str2, str3, str4 : integer;
    Awal, Akhir: TDateTime;
    procedure Reset;
end;

implementation

{ TFilters }

procedure TFilters.Reset;
begin
  num1 := 0
end;

end.
