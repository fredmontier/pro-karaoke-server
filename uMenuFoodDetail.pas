unit uMenuFoodDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinCtrls, uDM, DynamicSkinForm, AdvEdBtn, StdCtrls, AdvEdit, Grids,
  AdvObj, BaseGrid, AdvGrid, RzButton;

type
  TFrmMenuFoodDetail = class(TForm)
    GB: TspSkinGroupBox;
    spDynamicSkinForm1: TspDynamicSkinForm;
    grid: TAdvStringGrid;
    BtnSave: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
    procedure initForm;
    procedure resetForm;
    procedure initGrid;
    function isSaved: boolean;
    procedure loadData;
    procedure getItem;
    procedure searchItem(withWarning:boolean=true);
  public
    { Public declarations }
  end;

var
  FrmMenuFoodDetail: TFrmMenuFoodDetail;
const
  colNo       = 0;
  colKode     = 1;
  colNama     = 2;
  colQty      = 3;
  colSatuan   = 4;
  colIDX      = 5;
  colQtyH     = 6;

implementation

uses uLookup;

{$R *.dfm}

procedure TFrmMenuFoodDetail.BtnSaveClick(Sender: TObject);
begin
  isSaved;
end;

procedure TFrmMenuFoodDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmMenuFoodDetail.FormShow(Sender: TObject);
begin
  initForm;
end;

procedure TFrmMenuFoodDetail.getItem;
begin
  OpenSQL(DM.Lookup, 'select IdStock as ID, KodeStock as KODE, NamaStock as Deskripsi,SatuanPakai as Satuan FROM stock');
  DM.Lookup.ReadOnly := true;
  bukaForm(FrmLookup, TFrmLookup, True, False);
  OpenSQL(DM.Buffer,'SELECT COALESCE(QtyPakai, 0) FROM menu_fb_detail '+
  'WHERE IDMenu='+DM.TempID+
  ' AND IDStock='+IntToStr(DM.Lookup.Fields[0].AsInteger));
  grid.Ints[colIDX,     grid.Row] := DM.Lookup.Fields[0].AsInteger;
  grid.Cells[colKode,   grid.Row] := DM.Lookup.Fields[1].AsString;
  grid.Cells[colNama,   grid.Row] := DM.Lookup.Fields[2].AsString;
  grid.Cells[colSatuan, grid.Row] := DM.Lookup.Fields[3].AsString;
  grid.Floats[colQtyH, grid.Row] := DM.Buffer.Fields[0].AsFloat;
end;

procedure TFrmMenuFoodDetail.gridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol in [colKode, colQty];
end;

procedure TFrmMenuFoodDetail.gridGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol = colQty then HAlign := taRightJustify;  
end;

procedure TFrmMenuFoodDetail.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    getItem;
  if key=vk_return then
    if grid.Col = colKode then    
      searchItem;
end;

procedure TFrmMenuFoodDetail.initForm;
begin
  GB.Caption := DM.TempStr;
  resetForm;
  initGrid;
  loadData;
end;

procedure TFrmMenuFoodDetail.initGrid;
begin
  with grid do
  begin
    Clear;
    RowCount := 2;
    ColCount := colQtyH +2;
    Cells[colNo,    0]   := 'No';
    Cells[colKode,  0]  := 'Kode';
    Cells[colNama,  0]  := 'Nama';
    Cells[colQty,   0]  := 'Qty Pakai';
    Cells[colSatuan,0]  := 'Satuan Pakai';
    ColWidths[colIDX]   := 0;
    ColWidths[colQtyH]  := 0;
  end;
end;

function TFrmMenuFoodDetail.isSaved: boolean;
var i : integer;
    ATotal : double;
begin
  Result := true;
  try
    ExecSQL(DM.Buffer, 'delete from menu_fb_detail where IDMenu='+DM.TempID);
    for i := 1 to grid.RowCount -1 do
    begin
      if grid.Cells[colKode, i] <> '' then
      begin
        ATotal := 0;
        ATotal := StrFmtToFloatDef(grid.Cells[colQty, i],2) + StrFmtToFloatDef(grid.Cells[colQtyH, i],2);
        ExecSQL(DM.Buffer, 'insert into menu_fb_detail (IDMenu, IDStock, QtyPakai, Satuan) '+
        'values ('+DM.TempID+','+grid.Cells[colIDX, i]+','+
        FloatToStr(ATotal)+','+QuotedStr(grid.Cells[colSatuan, i])+')');
      end;
    end;
    loadData;
    Alert(MSG_SAVE_SUCCES);
//    if not Confirm('Input lagi?') then Close;
  Except
    Result := false;
    Alert(MSG_SAVE_UNSUCCES);
  end;
end;

procedure TFrmMenuFoodDetail.loadData;
var _sql: string;
    i : integer;
begin
  _sql := 'CALL SpViewBahanBakuDetail('+DM.TempID+')';

  OpenSQL(DM.Buffer, _sql);
  with Dm.Buffer do
  begin
    First;
    for i := 1 to RecordCount do
    begin
      grid.RowCount := 2 + i;
      grid.Ints[0, i] := i;
      grid.Ints[colIDX,   i] := Fields[1].AsInteger;
      grid.Cells[colKode, i] := Fields[2].AsString;
      grid.Cells[colNama, i] := Fields[3].AsString;
      grid.Floats[colQty, i] := Fields[4].AsFloat;
      grid.Floats[colQtyH,i] := 0;
      grid.Cells[colSatuan, i] := Fields[5].AsString;
      Next;
    end;
  end;
end;

procedure TFrmMenuFoodDetail.resetForm;
begin

end;

procedure TFrmMenuFoodDetail.RzBitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenuFoodDetail.searchItem(withWarning:boolean=true);
  function search_same_item(existID: integer): integer;
  var i: integer;
  begin
    Result:= 0;
    for i:= 1 to grid.RowCount-2 do
      if (StrToIntDef(grid.Cells[colIDX, i],0) = existID) then begin
        Result:= i;
        exit;
      end;
  end;
  var samaID, row: integer;
begin
samaID:= search_same_item(grid.Ints[colIDX, grid.Row]);
  if (samaID <> 0) then begin
   row:= samaID;
      if withWarning then
      begin
        Alert('Item sudah ada');
        grid.ClearRows(grid.Row, 1);
      end;
      grid.Row:= samaID;
      grid.Row := row;
      grid.Col := colQty;
  end;
end;

end.
