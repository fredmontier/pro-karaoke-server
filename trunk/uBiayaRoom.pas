unit uBiayaRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, ComCtrls,
  AdvDateTimePicker, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, AdvObj, AdvEdBtn,
  SkinCtrls, SkinBoxCtrls, dxSkinDarkRoom, dxSkinFoggy, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinSeven, dxSkinSharp;

type
  TFrmBiayaRoom = class(TForm)
    Panel1: TPanel;
    HargaPromo: TAdvEdit;
    NilaiVoucher: TAdvEdit;
    TypeVoucher: TAdvComboBox;
    grid: TAdvStringGrid;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    BtnSave: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnDelete: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzSeparator1: TRzSeparator;
    RzSeparator2: TRzSeparator;
    MinOrder: TAdvEdit;
    MinDurasi: TAdvEdit;
    Time1: TcxTimeEdit;
    Label1: TLabel;
    Time2: TcxTimeEdit;
    Label2: TLabel;
    HargaNormal: TAdvEdit;
    NamaPaket: TAdvEditBtn;
    TypeRoom: TAdvEditBtn;
    Hari: TAdvEditBtn;
    procedure RzBitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure NamaPaketClickBtn(Sender: TObject);
    procedure TypeRoomClickBtn(Sender: TObject);
    procedure TypeRoomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HariClickBtn(Sender: TObject);
    procedure Time1KeyPress(Sender: TObject; var Key: Char);
    procedure NamaPaketKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HariKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure initGrid;
    procedure initForm;
    procedure setColWitdth;
    procedure LoadData;
    procedure LoadFromData;
    function isSaved: Boolean;
    function isSavedHari(ID: integer): Boolean;
    function isUpdate: Boolean;
    function isDelete: Boolean;
    function getJam(AVar: TcxTimeEdit): String;
    function cekHari(AVar: byte) : String;
    procedure setEnableDisable;

  public
    { Public declarations }
  end;

var
  FrmBiayaRoom: TFrmBiayaRoom;
CONST
  colNO         = 0;
  colNamaPaket  = 1;
  colTipeRoom   = 2;
  colHari       = 3;
  colJAm        = 4;
  colHargaPromo = 5;
  colHargaNormal= 6;
  ColMinOr      = 7;
  ColMinDurasi  = 8;
  ColVoucher    = 9;
  ColNilaiVoucher= 10;
  colIDPaket    = 11;
  colIDType     = 12;
  colIDHari     = 13;
  colIndex      = 14;





implementation

uses uLookup, uListHari;

{$R *.dfm}

procedure TFrmBiayaRoom.Time1KeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SelectNext(ActiveControl, true, true);
end;

procedure TFrmBiayaRoom.TypeRoomClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup, 'select ID, TypeRoom as Tipe from room_type');
  bukaForm(FrmLookup, TFrmLookup, True, False);
  TypeRoom.Text := DM.Lookup.Fields[1].AsString;
  TypeRoom.Tag := DM.Lookup.Fields[0].AsInteger;
end;

procedure TFrmBiayaRoom.TypeRoomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    TypeRoomClickBtn(Sender);
end;

procedure TFrmBiayaRoom.BtnCancelClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmBiayaRoom.BtnDeleteClick(Sender: TObject);
begin
  if isDelete then
    LoadData;
end;

procedure TFrmBiayaRoom.BtnEditClick(Sender: TObject);
begin
  LoadFromData;
end;

procedure TFrmBiayaRoom.BtnNewClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmBiayaRoom.BtnSaveClick(Sender: TObject);
begin
if BtnSave.Tag = 0 then
  isSaved
  else isUpdate;

FreeAndNil(DM.FListHari);
LoadData;
end;

function TFrmBiayaRoom.cekHari(AVar: byte): String;
begin
  case AVar of
    1 : Result := 'MINGGU';
    2 : Result := 'SENIN';
    3 : Result := 'SELASA';
    4 : Result := 'RABU';
    5 : Result := 'KAMIS';
    6 : Result := 'JUMAT';
    7 : Result := 'SABTU'
    else
    Result := 'UNKNOWN';
  end;
end;

procedure TFrmBiayaRoom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBiayaRoom.FormShow(Sender: TObject);
begin
  initForm;
  LoadData;
end;

function TFrmBiayaRoom.getJam(AVar: TcxTimeEdit): String;
begin
  Result := FormatDateTime('hh:mm', AVar.Time);
end;

procedure TFrmBiayaRoom.gridDblClick(Sender: TObject);
begin
  LoadFromData;
end;

procedure TFrmBiayaRoom.gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  case ACol of
    colHargaPromo,colHargaNormal,ColMinOr,ColMinDurasi,ColNilaiVoucher : HAlign:= taRightJustify;
  end;
end;

procedure TFrmBiayaRoom.HariClickBtn(Sender: TObject);
begin
  bukaForm(FrmListHari, TFrmListHari, True, False);
end;

procedure TFrmBiayaRoom.HariKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key=vk_f2 then
      HariClickBtn(Sender);
end;

procedure TFrmBiayaRoom.initForm;
var iIndex:integer;
begin
  iIndex := -1;
  NamaPaket.Clear;
  TypeRoom.Clear;
  Hari.Clear;
  TypeVoucher.ItemIndex := iIndex;
  Time1.Text := '00:00';
  Time2.Text := '00:00';
  HargaPromo.FloatValue := 0;
  HargaNormal.FloatValue := 0;
  MinOrder.FloatValue := 0;
  MinDurasi.FloatValue := 0;
  NilaiVoucher.FloatValue := 0;
  BtnSave.Tag := 0;

  setEnableDisable;
end;

procedure TFrmBiayaRoom.initGrid;
begin
with grid do
begin
  Clear;
  Col := colIndex + 1;
  ColumnHeaders.Add('No');
  ColumnHeaders.Add('Nama Paket');
  ColumnHeaders.Add('Type Room');
  ColumnHeaders.Add('Hari');
  ColumnHeaders.Add('Jam');
  ColumnHeaders.Add('Harga Promo');
  ColumnHeaders.Add('Min Order');
  ColumnHeaders.Add('Min Durasi');
  ColumnHeaders.Add('Voucher');
  ColumnHeaders.Add('Nilai Voucher');
end;
end;

function TFrmBiayaRoom.isDelete: Boolean;
begin
Result := True;
if grid.Cells[colIndex, grid.Row] <> '' then
  if Confirm(MSG_CONFIRM_DELETE) then begin
    ExecSQL(DM.Buffer, 'delete from room_harga_sewa_hari '+
      'Where IdHargaRomSewa = '+grid.Cells[colIndex, grid.Row]);
    ExecSQL(DM.Buffer, 'delete from room_harga_sewa '+
      'Where id = '+grid.Cells[colIndex, grid.Row]);
  end
  else
    Result := False
else
Result := False;
end;

function TFrmBiayaRoom.isSaved: Boolean;
var SQL : String;
    ID: integer;
begin
  try
    SQL := 'insert into room_harga_sewa (idRoomPaket, idRoomKategory, Hari, JamAwal, '+
           'JamAkhir, Rate, RateNormal, MinOrder, MinDurasi, TypeVoucher, NilaiVoucher '+
           ') values ('+
           IntToStr(NamaPaket.Tag)+','+
           IntToStr(TypeRoom.Tag)+','+
           QuotedStr(Hari.Text)+','+
           QuotedStr(Time1.Text)+','+
           QuotedStr(Time2.Text)+','+
           HargaPromo.Text+','+
           HargaNormal.Text+','+
           MinOrder.Text+','+
           MinDurasi.Text+','+
           QuotedStr(TypeVoucher.Items[TypeVoucher.ItemIndex])+','+
           NilaiVoucher.Text+')';

    ExecSQL(DM.Buffer, SQL);
    ID := getIntFromSQL(DM.Buffer,'SELECT @@IDENTITY ');

    isSavedHari(ID);

    Result := True;
    Inform(MSG_SAVE_SUCCES);
  except
    MessageDlg('', mtError, [mbOK], 0);
    Result := False;
    Inform(MSG_SAVE_UNSUCCES);
  end;
end;

function TFrmBiayaRoom.isSavedHari(ID: integer): Boolean;
var i: byte;
begin
  try
    ExecSQL(DM.Buffer,'delete from room_harga_sewa_hari where IdHargaRomSewa = '+IntToStr(ID));

    for i := 0 to DM.FListHari.Count - 1 do
    ExecSQL(DM.Buffer,'insert into room_harga_sewa_hari (IdHargaRomSewa, DayOf) values ('+
      IntToStr(ID)+','+DM.FListHari.Strings[i]+')');

    Result := True;
//    Inform(MSG_SAVE_SUCCES);
  except
    Result := False;
    Inform(MSG_SAVE_UNSUCCES);
  end;
end;

function TFrmBiayaRoom.isUpdate: Boolean;
var SQL : String;
begin
  try
    SQL := 'update room_harga_sewa set '+
           'Hari = '+QuotedStr(Hari.Text)+','+
           'JamAwal = '+QuotedStr(Time1.Text)+','+
           'JamAkhir = '+QuotedStr(Time2.Text)+','+
           'Rate = '+HargaPromo.Text+','+
           'RateNormal = '+HargaNormal.Text+','+
           'MinOrder = '+MinOrder.Text+','+
           'MinDurasi = '+MinDurasi.Text+','+
           'TypeVoucher = '+QuotedStr(TypeVoucher.Items[TypeVoucher.ItemIndex])+','+
           'NilaiVoucher = '+NilaiVoucher.Text+' where id = '+IntToStr(BtnSave.Tag);

    ExecSQL(DM.Buffer, SQL);
    isSavedHari(BtnSave.Tag);
    Result := True;
    NamaPaket.Tag := 0;
    Inform(MSG_SAVE_SUCCES);
  except
    MessageDlg('', mtError, [mbOK], 0);
    Result := False;
    Inform(MSG_SAVE_UNSUCCES);
  end;
end;

procedure TFrmBiayaRoom.LoadData;
var i : integer;
begin
  initForm;
  initGrid;

  OpenSQL(DM.Buffer, 'select p.RoomPaket,k.TypeRoom,s.*  '+
  'FROM room_harga_sewa s join room_paket p on s.IdRoomPaket=p.Id  '+
  'join room_type k on s.IdRoomKategory = k.id');

  with DM.Buffer do
  begin
    if RecordCount > 0 then
    begin
      for i := 1 to RecordCount do
      begin
         grid.RowCount := i + 1;
         grid.Ints[colNO, i] := i;
         grid.Cells[colNamaPaket, i] := Fields[0].AsString;
         grid.Cells[colTipeRoom, i] := Fields[1].AsString;
         grid.Cells[colHari, i] := Fields[5].AsString;
         grid.Cells[colJAm, i] := Fields[6].AsString+' S.D '+Fields[7].AsString;
         grid.Cells[colHargaPromo, i]:= FloatToStrFmt(Fields[8].Value, true, 2);
         grid.Cells[colHargaNormal, i]:= FloatToStrFmt(Fields[9].Value, true, 2);
         grid.Cells[ColMinOr, i] := FloatToStrFmt(Fields[10].Value, true, 2);
         grid.Cells[ColMinDurasi, i] := FloatToStrFmt(Fields[11].Value, true, 2);
         grid.Cells[ColVoucher, i] := Fields[12].AsString;
         grid.Cells[ColNilaiVoucher, i] := FloatToStrFmt(Fields[13].Value, true, 2);
         grid.Ints[colIDPaket, i] := Fields[3].AsInteger;
         grid.Ints[colIDType, i] := Fields[4].AsInteger;
         grid.Ints[colIndex, i] := Fields[2].AsInteger;
         if i mod 2 = 1 then
            grid.RowColor[i] := clMenu;
         Next;
      end;
    end;
  end;
  setColWitdth;
end;

procedure TFrmBiayaRoom.LoadFromData;
var i : byte;
begin
  OpenSQL(DM.Buffer, 'select p.RoomPaket,k.TypeRoom,s.*  '+
  'FROM room_harga_sewa s join room_paket p on s.IdRoomPaket=p.Id  '+
  'join room_type k on s.IdRoomKategory = k.id '+
  'Where s.id='+grid.Cells[colIndex, grid.Row]);
  with DM.Buffer do
  begin
    if recordCount > 0 then
    begin
      NamaPaket.Text := Fields[0].AsString;
      TypeRoom.Text := Fields[1].AsString;
      Hari.Text := Fields[5].AsString;
      Time1.Text := Fields[6].AsString;
      Time2.Text := Fields[7].AsString;
      HargaPromo.Text := Fields[8].AsString;
      HargaNormal.Text := Fields[9].AsString;
      MinOrder.Text := Fields[10].AsString;
      MinDurasi.Text := Fields[11].AsString;
      TypeVoucher.Text := Fields[12].AsString;
      NilaiVoucher.Text := Fields[13].AsString;
      BtnSave.Tag := Fields[2].AsInteger;
    end;
  end;
  OpenSQL(DM.Buffer, 'select DayOf from room_harga_sewa_hari where IdHargaRomSewa='+
  grid.Cells[colIndex, grid.Row]);
  DM.FListHari := TStringList.Create;
  for i := 0 to DM.Buffer.RecordCount -1 do
    DM.FListHari.Add(DM.Buffer.Fields[0].AsString);

  setEnableDisable;
end;


procedure TFrmBiayaRoom.NamaPaketClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup, 'select ID, RoomPaket as Paket, Singkat from room_paket');
  bukaForm(FrmLookup, TFrmLookup, True, False);
  NamaPaket.Text := DM.Lookup.Fields[1].AsString;
  NamaPaket.Tag := DM.Lookup.Fields[0].AsInteger;
end;

procedure TFrmBiayaRoom.NamaPaketKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    NamaPaketClickBtn(Sender);
end;

procedure TFrmBiayaRoom.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;


procedure TFrmBiayaRoom.setColWitdth;
begin
  grid.AutoSize := True;
  grid.ColWidths[colIDPaket] := 0;
  grid.ColWidths[colIDType] := 0;
  grid.ColWidths[colIDHari] := 0;
  grid.ColWidths[colIndex] := 0;
end;

procedure TFrmBiayaRoom.setEnableDisable;
begin
  NamaPaket.Enabled := BtnSave.Tag = 0;
  TypeRoom.Enabled := BtnSave.Tag = 0;
//  Hari.ReadOnly := True;
  BtnCancel.Enabled := (BtnSave.Tag > 0);
  BtnEdit.Enabled := (BtnSave.Tag = 0);
  BtnDelete.Enabled := (BtnSave.Tag > 0);
end;

end.
