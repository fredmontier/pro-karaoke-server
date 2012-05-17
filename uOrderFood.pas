unit uOrderFood;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DynamicSkinForm, Grids, AdvObj, BaseGrid, AdvGrid,StrUtils,
  SkinCtrls, RzLabel, ExtCtrls, uDM, Mask, SkinBoxCtrls, frxClass, frxDesgn;

type
  TFrmOrderFood = class(TForm)
    Panel1: TPanel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    BtnProses: TspSkinButton;
    BtnKeluar: TspSkinButton;
    grid: TAdvStringGrid;
    NamaRoom: TspSkinEdit;
    NamaGuest: TspSkinEdit;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinButton1: TspSkinButton;
    BtnDelete: TspSkinButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    LabelStatus: TRzLabel;
    Report1: TfrxReport;
    frxDesigner1: TfrxDesigner;
    procedure GridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnProsesClick(Sender: TObject);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure spSkinButton1Click(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure Report1AfterPrintReport(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }

    procedure initForm;
    procedure initGrid;
    procedure setNo;
    procedure setColWidth;
    procedure loadItem(ID: integer);
    procedure loadData(TransNum: String; isReport: Boolean);

    function isSaved(x: byte): boolean;
    function isPrint: boolean;
    function calcFood: double;

  public
    { Public declarations }
  end;

var
  FrmOrderFood: TFrmOrderFood;
const
  COL_NO          = 0;
  COL_ITEM_ID     = 1;
  COL_ITEM_KODE   = 2;
  COL_ITEM_NAME   = 3;
  COL_HARGA       = 4;
  COL_QTY         = 5;
  COL_DISC        = 6;
  COL_TOTAL       = 7;
  COL_HARGA_H     = 8;
  COL_QTY_H       = 9;
  COL_DISC_H      = 10;
  COL_TOTAL_H     = 11;


implementation

uses uLookup;

{$R *.dfm}

procedure TFrmOrderFood.BtnDeleteClick(Sender: TObject);
begin
//  if Confirm('Yakin hapus data?') then
    grid.RemoveNormalRow(grid.Row);
end;

procedure TFrmOrderFood.BtnKeluarClick(Sender: TObject);
begin
  close;
end;

procedure TFrmOrderFood.BtnProsesClick(Sender: TObject);
begin
  if Confirm('Data sudah benar?'+#13+'Data tidak dapat diubah kembali ')
  then if isSaved(3) then close;
end;

function TFrmOrderFood.calcFood: double;
var i: integer;
    ATotal: real;
begin
  ATotal :=0;
  for i := 1 to grid.RowCount do
  begin
    if Length(grid.Cells[COL_ITEM_ID, i]) > 0 then
      ATotal := ATotal + dm.StrFmtToFloatDef(grid.Cells[Col_Total, i],0);
//    ShowMessage(grid.Cells[colTotal, i]);
  end;
//  LbCalc.Caption := 'Total : '+DM.FloatToStrFmt(ATotal, True, 0);
  Result := ATotal;
end;

procedure TFrmOrderFood.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmOrderFood.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmOrderFood.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f5 then
    Report1.DesignReport;
end;

procedure TFrmOrderFood.FormShow(Sender: TObject);
begin
  initForm;
end;

procedure TFrmOrderFood.GridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := ACol in [COL_ITEM_KODE, COL_QTY];
end;

procedure TFrmOrderFood.gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol in [COL_HARGA, COL_QTY, COL_DISC, COL_TOTAL] then
    HAlign := taRightJustify
  else if ACol = COL_NO then
    HAlign := taCenter;
end;

procedure TFrmOrderFood.gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  if ACol = COL_QTY then
    AEditor := edFloat;
end;

procedure TFrmOrderFood.GridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//if key=VK_RETURN then
//begin
//  if grid.Col = COL_QTY then
//  begin
//    grid.Floats[COL_TOTAL_H, grid.Row] := (grid.Floats[COL_HARGA_H, grid.Row] * grid.Floats[COL_QTY, grid.Row])
//    - ((grid.Floats[COL_HARGA_H, grid.Row] * grid.Floats[COL_QTY, grid.Row]) * grid.Floats[COL_DISC_H, grid.Row])/100;
//    grid.Cells[COL_TOTAL, grid.Row] := FloatToStrFmt(grid.Floats[COL_TOTAL_H, grid.Row], true,0);
    if (grid.Col = col_Qty) and (Length(grid.Cells[col_item_ID, grid.Row]) >0) then  begin
      grid.Cells[col_Total, grid.Row] :=
        dm.FloatToStrFmt(grid.Floats[col_harga, grid.Row] * grid.Floats[col_Qty, grid.Row], true, 0);
        grid.Floats[COL_TOTAL_H, grid.Row] := (grid.Floats[COL_HARGA_H, grid.Row] * grid.Floats[COL_QTY, grid.Row]);
    end;
//  end;
//end else
if key=vk_f2 then
begin
  if grid.Col = COL_ITEM_KODE then
  begin
    OpenSQL(DM.Lookup, 'select f.IdMenu as ID, KodeMenu as Kode, f.NamaMenu as Menu, f.Harga, 0 as discount  '+
    'from menu_fb_header f JOIN menu_fb_kategori k on f.IDKategori=k.id order by f.NamaMenu');
    DM.Lookup.ReadOnly := True;
    bukaForm(Frmlookup, TFrmlookup, True, False);
    loadItem(DM.Lookup.Fields[0].AsInteger);
  end;
end;
end;

procedure TFrmOrderFood.initForm;
begin
  NamaRoom.Text := DM.RoomName;
  NamaGuest.Text := DM.User;
  loadData(DM.TransNum, False);
end;

procedure TFrmOrderFood.initGrid;
begin
  with Grid do
  begin
    Clear;
    RowCount := 2;
    ColCount :=  COL_TOTAL_H + 2;
    Cells[COL_NO, 0]        := 'No';
    Cells[COL_ITEM_ID, 0]   := 'ID';
    Cells[COL_ITEM_KODE, 0] := 'Kode';
    Cells[COL_ITEM_NAME, 0] := 'Deskripsi';
    Cells[COL_HARGA, 0]     := 'Harga';
    Cells[COL_QTY, 0]       := 'Quantity';
    Cells[COL_DISC, 0]      := 'Discount';
    Cells[COL_TOTAL, 0]     := 'Total';
    AutoSize := True;
    setColWidth;
  end;
end;

function TFrmOrderFood.isPrint: boolean;
var AFile: String;
begin
  AFile := ExtractFilePath(Application.ExeName)+'\report\confirm_FNB.fr3';
  Result := false;
  if DM.cekFileReport('confirm_FNB.fr3') then
  begin
    loadData(DM.TransNum, True);
    DM.DBDataset1.DataSet := DM.QRyReport;
    DM.DBDataset1.UserName := 'ConfirmFNB';
    Report1.DataSet := DM.DBDataset1;
    Report1.LoadFromFile(AFile);
    Report1.ShowReport;
    Result := true;
  end;
end;

function TFrmOrderFood.isSaved(x: byte): boolean;
var i : byte;
begin
  Result := true;
  try
    ExecSQL(DM.Buffer, 'delete from transaksi_detail where status < '+
      IntToStr(x)+' and NoTransaksi='+QuotedStr(DM.TransNum));
    for i := 1 to grid.RowCount do
    begin
      DM.Connection.StartTransaction;
      if grid.Cells[COL_ITEM_NAME, I] <> '' then
      begin
        ExecSQL(DM.Buffer, 'insert into transaksi_detail '+
        '(NoTransaksi, IdFnb, Harga, Qty, Diskon, Jumlah, status) '+
        'values ('+QuotedStr(DM.TransNum)+','+
        grid.Cells[COL_ITEM_ID, i]+','+
        grid.Cells[COL_HARGA_H, i]+','+
        grid.Cells[COL_QTY, i]+','+
        grid.Cells[COL_DISC, i]+','+
        grid.Cells[COL_TOTAL_H, i]+','+
        InttoStr(x)+')');

        if x>=3 then begin
          EXecSQL(DM.Buffer,'insert into stock_keluar (tanggal, noTransaksi, idStock, qty) '+
          'SELECT now(),'+QuotedStr(DM.TransNum)+', IdStock, ('+grid.Cells[COL_QTY, i]+'*QtyPakai) '+
          'FROM menu_fb_detail WHERE IDMenu='+grid.Cells[COL_ITEM_ID, i]);

          ExecSQL(DM.QRyReport,'update transaksi_detail set cetak=1 where NoTransaksi='+QuotedStr(DM.TransNum));

          EXecSQL(DM.Buffer,'update room set status=''A'' where NoTransaksi='+QuotedStr(DM.TransNum));
        end;
      end;
      DM.Connection.Commit;
    end;
//    Inform(MSG_SAVE_SUCCES);
  except
    DM.Connection.Rollback;
    Result := false;
    Alert(MSG_SAVE_UNSUCCES);
  end;
end;

procedure TFrmOrderFood.loadData(TransNum: String; isReport: Boolean);
var i : byte;
begin
  if isReport then
     OpenSQL(DM.QRyReport,'SELECT f.IDMenu, f.KodeMenu, f.NamaMenu, d.Harga, SUM(d.Qty) AS Qty, d.Diskon, SUM(d.Jumlah) AS Jumlah,'+
     'r.id_room, r.room_name, r.nama, r.NoTransaksi '+
     'FROM transaksi_detail d JOIN menu_fb_header f on d.IdFnb=f.IDMenu '+
     'JOIN room r ON r.NoTransaksi=d.NoTransaksi '+
     'WHERE d.status>=0 and Cetak =0 and d.NoTransaksi='+QuotedStr(TransNum)+' GROUP BY f.IDMenu') else
  begin
    OpenSQL(DM.Buffer,'SELECT f.IDMenu, f.KodeMenu, f.NamaMenu, d.Harga, SUM(d.Qty), d.Diskon, SUM(d.Jumlah),status '+
    'FROM transaksi_detail d JOIN menu_fb_header f on d.IdFnb=f.IDMenu '+
    'WHERE d.status in(1,2) and d.NoTransaksi='+QuotedStr(TransNum)+' GROUP BY f.IDMenu');
    initGrid;

    with DM.Buffer do
    begin
      if RecordCount > 0 then
      begin
         First;
         LabelStatus.Caption:='STATUS : '+
          ifthen(DM.Buffer.Fields[7].AsInteger>1,'SUDAH FIX ORDER','BELUM FIX ORDER');
         for i := 1 to RecordCount do
         begin
            grid.RowCount                 := i + 2;
            grid.Ints[COL_NO, i]          := i;
            grid.Ints[COL_ITEM_ID, i]     := Fields[0].AsInteger;
            grid.Cells[COL_ITEM_KODE, i]  := Fields[1].AsString;
            grid.Cells[COL_ITEM_NAME, i]  := Fields[2].AsString;
            grid.Cells[COL_HARGA, i]      := FloatToStrFmt(Fields[3].AsFloat, true, 0);
            grid.Floats[COL_HARGA_H, i]   := Fields[3].AsFloat;
            grid.Cells[COL_QTY, i]        := FloatToStrFmt(Fields[4].AsFloat, true, 0);
            grid.Floats[COL_QTY_H, i]     := Fields[4].AsFloat;
            grid.Floats[COL_DISC, i]      := Fields[5].AsFloat;
            grid.Cells[COL_TOTAL, i]      := FloatToStrFmt(Fields[6].AsFloat, true, 0);
            grid.Floats[COL_TOTAL_H, i]   := Fields[6].AsFloat;
            Next;
         end;
      end;
      grid.AutoSize:=true;
      setColWidth;
    end;
  end;
end;

procedure TFrmOrderFood.loadItem(ID: integer);
begin
  with Grid do
  begin
    Ints[COL_ITEM_ID, GetRealRow]     := ID;
    Cells[COL_ITEM_KODE, GetRealRow]  := DM.Lookup.Fields[1].AsString;
    Cells[COL_ITEM_NAME, GetRealRow]  := DM.Lookup.Fields[2].AsString;
    Cells[COL_HARGA, GetRealRow]      := FloatToStrFmt(DM.Lookup.Fields[3].AsFloat, true, 0);
    Floats[COL_HARGA_H, GetRealRow]   := DM.Lookup.Fields[3].AsFloat;
//    Cells[COL_QTY_H, GetRealRow]      := FloatToStrFmt(DM.Lookup.Fields[2].AsFloat, true, 0);
    Floats[COL_QTY, GetRealRow]       := 0;
    Cells[COL_DISC, GetRealRow]       := FloatToStrFmt(DM.Lookup.Fields[4].AsFloat, true, 0);
    Floats[COL_DISC_H, GetRealRow]    := DM.Lookup.Fields[4].AsFloat;
    Floats[COL_TOTAL, GetRealRow]     := 0;
    AutoSize                          := true;
    setColWidth;
    setNo;
  end;
end;

procedure TFrmOrderFood.Report1AfterPrintReport(Sender: TObject);
begin
  ExecSQL(DM.QRyReport,'update transaksi_detail set cetak=1 where NoTransaksi='+QuotedStr(DM.TransNum));
end;

procedure TFrmOrderFood.setColWidth;
begin
with grid do
begin
  ColWidths[COL_ITEM_ID]  := 0;
  ColWidths[COL_HARGA_H]  := 0;
  ColWidths[COL_QTY_H]    := 0;
  ColWidths[COL_DISC_H]   := 0;
  ColWidths[COL_TOTAL_H]  := 0;
end;
end;

procedure TFrmOrderFood.setNo;
var i : byte;
begin
  for i := 1 to grid.RowCount do
  begin
    if grid.Cells[COL_ITEM_ID, i] <> '' then
       grid.Ints[COL_NO, i] := i;
  end;
end;

procedure TFrmOrderFood.spSkinButton1Click(Sender: TObject);
begin
 if isSaved(2)
  then isPrint;
end;

end.
