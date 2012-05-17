unit uMenuFood;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,uFlash,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, AdvSmoothPanel,
  spSkinShellCtrls, AdvGlowButton, ShellApi, AdvObj, AdvEdBtn, SkinCtrls, Menus,
  AdvMenus;

type
  TFrmMenuFood = class(TForm)
    Panel1: TPanel;
    KodeMenu: TAdvEdit;
    FoodName: TAdvEdit;
    HargaJual: TAdvEdit;
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
    AdvSmoothPanel1: TAdvSmoothPanel;
    Image1: TImage;
    OD: TspSkinOpenPictureDialog;
    AdvGlowButton1: TAdvGlowButton;
    Desk: TMemo;
    Label1: TLabel;
    PicName: TAdvEdit;
    Kategori: TAdvEditBtn;
    Popup1: TAdvPopupMenu;
    Detail1: TMenuItem;
    HargaBeli: TAdvEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KategoriKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure KategoriClickBtn(Sender: TObject);
    procedure Detail1Click(Sender: TObject);
    procedure KodeMenuKeyPress(Sender: TObject; var Key: Char);
    procedure gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    { Private declarations }
    procedure initForm;
    Procedure initGrid;
    Procedure LoadData(ID: String);
    Procedure LoadFromData(ID: String);
    procedure setEnableDisable;
    
    function isValid: boolean;
    function isSaved: boolean;
    function isDelete: boolean;
    function getMaxRoom: integer;
    function copyImage(ASorch: String): String;
  public
    { Public declarations }
  end;

var
  FrmMenuFood: TFrmMenuFood;
const
  colNO     = 0;
  colID     = 1;
  colNama   = 2;
  colTipe   = 3;
  colHpp    = 4;
  colPrice  = 5;
  colStatus = 6;

implementation

uses uLookup, uMenuFoodDetail;

{$R *.dfm}

procedure TFrmMenuFood.Button1Click(Sender: TObject);
begin
  Close;
end;

function TFrmMenuFood.copyImage(ASorch: String): String;
var FDest : String;
begin
  FDest := ExtractFilePath(Application.ExeName)+'images\'+
    ExtractFileName(PicName.Text);
  if FileExists(ASorch) then
  begin
    CopyFile(PChar(ASorch), PChar(FDest), false);
    Result := ExtractFileName(FDest);
  end;
end;

procedure TFrmMenuFood.Detail1Click(Sender: TObject);
begin
  if KodeMenu.Tag > 0 then
  begin
    DM.TempID   := grid.Cells[1, grid.Row];
    DM.TempStr  := grid.Cells[2, grid.Row];
    ExecSQL(DM.Buffer, 'delete from menu_fb_detail_tmp where IDMenu = '+DM.TempID);
    bukaForm(FrmMenuFoodDetail, TFrmMenuFoodDetail, True, False);
  end else
    Alert('Data Menu Belum Dipilih!');
end;

procedure TFrmMenuFood.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmMenuFood.FormShow(Sender: TObject);
begin
  LoadData('');
end;

function TFrmMenuFood.getMaxRoom: integer;
begin
  OpenSQL(DM.Buffer, 'select count(id_room) from room');
  if DM.Buffer.RecordCount > 0 then
    Result := DM.Buffer.Fields[0].AsInteger
  else
    Result := 0;
end;

procedure TFrmMenuFood.gridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol in [colHpp, colPrice] then
    HAlign := taRightJustify;
end;

procedure TFrmMenuFood.Image1DblClick(Sender: TObject);
begin
  ShellExecute(Handle, 'Open', PChar(OD.FileName), nil, nil, SW_NORMAL);
end;

procedure TFrmMenuFood.initForm;
begin
  KodeMenu.Tag := 0;
  KodeMenu.Clear;
  FoodName.Clear;
  Kategori.Clear;
  HargaBeli.Clear;
  HargaJual.Clear;
  Desk.Clear;
  Image1.Picture := nil;
  PicName.Clear;
  setEnableDisable;
  FocusControl(KodeMenu);
end;

procedure TFrmMenuFood.initGrid;
begin
//  grid.Alignments[colNama, 0] := taCenter;
//  grid.Alignments[colTipe, 0] := taCenter;
//  grid.Alignments[colPrice, 0] := taCenter;
  grid.AutoSize:=True;
  grid.ColWidths[colID] := 0;
end;

function TFrmMenuFood.isDelete: boolean;
begin
  if Confirm(MSG_CONFIRM_DELETE) then
  begin
    ExecSQL(dm.Buffer, 'delete from foodandbeverage where id_fnb='+
      grid.Cells[colID, grid.Row]);
  end;
end;

function TFrmMenuFood.isSaved: boolean;
begin
  Result := true;
  try
    if KodeMenu.Tag = 0 then
    ExecSQL(DM.Buffer, 'insert into menu_fb_header (KodeMenu, NamaMenu, IDKategori, HargaBeli, Harga, Deskripsi, Gambar) '+
      'values ('+QuotedStr(KodeMenu.Text)+','+QuotedStr(FoodName.Text)+','+IntToStr(Kategori.Tag)+','+HargaBeli.Text+','+
      HargaJual.Text+','+QuotedStr((Desk.Text))+','+QuotedStr(copyImage(OD.FileName))+')')
    else
    ExecSQL(DM.Buffer, 'update menu_fb_header set '+
    'KodeMenu='+QuotedStr(KodeMenu.Text)+','+
    'IDKategori='+IntToStr(Kategori.Tag)+','+
    'NamaMenu='+QuotedStr(FoodName.Text)+','+
    'HargaBeli='+HargaBeli.Text+','+
    'Harga='+HargaJual.Text+','+
    'Deskripsi='+QuotedStr(Desk.Text)+','+
    'Gambar='+QuotedStr(copyImage(OD.FileName))+
    ' where IDMenu='+IntToStr(KodeMenu.Tag));

//    Inform(IntToStr(KodeMenu.Tag));
//    ExecSQL(DM.Buffer, 'call SpInsertBahanBakuDetail ('+IntToStr(KodeMenu.Tag)+')');

    LoadData('');
    Inform(MSG_SAVE_SUCCES);
  except
    Result := false;
    Alert(MSG_SAVE_UNSUCCES);
  end;
end;

function TFrmMenuFood.isValid: boolean;
begin
  Result:= False;
  if HargaBeli.Text = '' then HargaBeli.Text := '0';
  if HargaJual.Text = '' then HargaJual.Text := '0';
//  if CekInput(Result, RoomID.Text <> '', 'Kode Room belum diisi.', RoomID) then
  if CekInput(Result, FoodName.Text <> '', 'Nama Menu belum diisi.', FoodName) then
  if CekInput(Result, Kategori.Text <> '', 'Kategori belum sesuai.', Kategori) then
  if CekInput(Result, Kategori.Text <> '', 'Kategori belum sesuai.', Kategori) then
  if CekInput(Result, StrToInt(HargaBeli.Text) < StrToInt(HargaJual.Text) ,
    'Harga jual tidak boleh lebih kecil dari harga beli.', HargaJual) then
  if CekInput(Result, (HargaBeli.Text <> '') or (StrToInt(HargaBeli.Text) <= 0),
    'Harga beli belum sesuai.', Kategori) then
      CekInput(Result, HargaJual.Text <> '' , 'Harga jual belum sesuai.', HargaJual);
end;

procedure TFrmMenuFood.LoadData(ID: String);
var i : integer;
begin
  initForm;
  
  OpenSQL(DM.Buffer , 'select * from menu_fb_header h JOIN menu_fb_kategori k on h.IDKategori=k.ID');

  if DM.Buffer.RecordCount > 0 then
  begin
    with grid do
    begin
       for i := 1 to DM.Buffer.RecordCount do
       begin
          RowCount := i + 1;
          Ints[colNO, i] := i;
          Cells[colID, i] := DM.Buffer.Fields[0].AsString;
          Cells[colNama, i] := DM.Buffer.Fields[2].AsString;
          Cells[colTipe, i] := DM.Buffer.Fields[9].AsString;
          Cells[colHpp, i] := FloatToStrFmt(DM.Buffer.Fields[4].Value, True, 0);
          Cells[colPrice, i] := FloatToStrFmt(DM.Buffer.Fields[5].Value, True, 0);
          if i mod 2 = 1 then
              RowColor[i] := clMenu;
          DM.Buffer.Next;
       end;
    end;
//    LbInfo.Caption := 'JUMLAH ROOM = '+IntToStr(DM.Buffer.RecordCount);
  end;
  initGrid;
end;

procedure TFrmMenuFood.LoadFromData(ID: String);
begin
  OpenSQL(DM.Buffer , 'select * from menu_fb_header h '+
  'JOIN menu_fb_kategori k on h.IDKategori=k.ID where h.IDMenu='+ID);
  if DM.Buffer.RecordCount > 0 then
  begin
    KodeMenu.Tag := DM.Buffer.Fields[0].AsInteger;
    KodeMenu.Text := DM.Buffer.Fields[1].AsString;
    FoodName.Text := DM.Buffer.Fields[2].AsString;
    Kategori.Tag := DM.Buffer.Fields[8].AsInteger;
    Kategori.Text := DM.Buffer.Fields[9].AsString;
    HargaBeli.Text := DM.Buffer.Fields[4].AsString;
    HargaJual.Text := DM.Buffer.Fields[5].AsString;
    Desk.Text:= DM.Buffer.Fields[6].AsString;
    PicName.Text := DM.Buffer.Fields[7].AsString;
    OD.FileName := ExtractFilePath(Application.ExeName)+'images\'+DM.Buffer.Fields[7].AsString;
    Image1.Picture.LoadFromFile(OD.FileName);
//    KodeMenu.Tag := 1;
  end else
    initForm;
  setEnableDisable;
end;



procedure TFrmMenuFood.KategoriClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup, 'select ID, Kategori from menu_fb_kategori');
  bukaForm(FrmLookup, TFrmLookup, True, False);
  Kategori.Tag := DM.Lookup.Fields[0].AsInteger;
  Kategori.Text := DM.Lookup.Fields[1].AsString;
end;

procedure TFrmMenuFood.KategoriKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
     KategoriClickBtn(Sender);
end;

procedure TFrmMenuFood.KodeMenuKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
  SelectNext(ActiveControl, true, true);
end;

procedure TFrmMenuFood.BtnSaveClick(Sender: TObject);
begin
  if (isValid) then
    isSaved;
end;

procedure TFrmMenuFood.AdvGlowButton1Click(Sender: TObject);
begin
  if OD.Execute then
  begin
    Image1.Picture := nil;
    Image1.Picture.LoadFromFile(OD.FileName);
    PicName.Text := ExtractFileName(OD.FileName);
  end;
end;

procedure TFrmMenuFood.BtnCancelClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmMenuFood.BtnDeleteClick(Sender: TObject);
begin
  if isDelete then
    LoadData('');
end;

procedure TFrmMenuFood.BtnEditClick(Sender: TObject);
begin
  LoadFromData(grid.Cells[colID, grid.Row]);
end;

procedure TFrmMenuFood.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMenuFood.BtnNewClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmMenuFood.RzButton5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMenuFood.setEnableDisable;
begin
  BtnEdit.Enabled := (KodeMenu.Tag = 0);
  BtnCancel.Enabled := (KodeMenu.Tag > 0);
  BtnDelete.Enabled := (KodeMenu.Tag > 0);
  PicName.Visible := false;
end;

end.
