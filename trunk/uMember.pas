unit uMember;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, ComCtrls,
  AdvDateTimePicker, AdvEdBtn, AdvCardList, AdvObj;

type
  TFrmMember = class(TForm)
    RzSeparator1: TRzSeparator;
    RzSeparator2: TRzSeparator;
    Label1: TLabel;
    Panel1: TPanel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    MemberID: TAdvEdit;
    MemberName: TAdvEdit;
    grid: TAdvStringGrid;
    BtnSave: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    BtnEdit: TRzBitBtn;
    BtnDelete: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    Alamat: TAdvEdit;
    Kota: TAdvEdit;
    TmpLahir: TAdvEdit;
    TglLahir: TAdvDateTimePicker;
    Telepon: TAdvEdit;
    TglExp: TAdvDateTimePicker;
    MemberKategori: TAdvEditBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoomTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemberKatIDClickBtn(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure MemberKategoriClickBtn(Sender: TObject);
    procedure MemberKategoriKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemberIDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure initGrid;
    procedure initForm;
    procedure setColWidth;
    function isSaved : Boolean;
    function isUpdated : Boolean;
    function isDelete : Boolean;
    function getMemberKatID(AVar: String; Index: Boolean): String;
    procedure LoadData;
    procedure LoadFromData;
    procedure setEnableDisable;

  public
    { Public declarations }
  end;

var
  FrmMember: TFrmMember;
CONST
  colNO           = 0;
  colMemberID     = 1;
  colMemberNama   = 2;
  colTglExp       = 3;
  colLast         = 4;

implementation

uses uLookup, uFlash;

{$R *.dfm}

procedure TFrmMember.BtnCancelClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmMember.BtnDeleteClick(Sender: TObject);
begin
    if isDelete then
    LoadData;
end;

procedure TFrmMember.BtnEditClick(Sender: TObject);
begin
  LoadFromData;
end;

procedure TFrmMember.BtnSaveClick(Sender: TObject);
begin
  if MemberID.Tag = 0 then
    isSaved
    else isUpdated;
  LoadData;
end;

procedure TFrmMember.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmMember.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;


procedure TFrmMember.FormShow(Sender: TObject);
begin
  LoadData;
end;

function TFrmMember.getMemberKatID(AVar: String; Index: Boolean): String;
begin
  if Index then
  begin
    OpenSQL(DM.Buffer, 'select * from member_kategory where kategory = '+QuotedStr(AVar));
    Result := DM.Buffer.Fields[0].AsString;
  end
  else
  begin
    OpenSQL(DM.Buffer, 'select * from member_kategory where id_kategory = '+QuotedStr(AVar));
    Result := DM.Buffer.Fields[1].AsString;
  end;
end;

procedure TFrmMember.gridDblClick(Sender: TObject);
begin
  LoadFromData;
end;

procedure TFrmMember.initForm;
begin
  MemberID.Tag := 0;
  MemberID.Clear;
  MemberName.Clear;
  Alamat.Clear;
  Kota.Clear;
  Telepon.Clear;
  TmpLahir.Clear;
  TglLahir.Date := now;
  TglExp.Date := now;
  MemberKategori.Clear;
  MemberKategori.Tag := 0;
  setEnableDisable;
end;

procedure TFrmMember.initGrid;
begin
with grid do
begin
  Clear;
  ColumnHeaders.Add('No');
  ColumnHeaders.Add('Member ID');
  ColumnHeaders.Add('Nama Member');
  ColumnHeaders.Add('Tgl Expired');
end;
end;

function TFrmMember.isDelete: Boolean;
begin
Result := True;
if grid.Cells[colMemberID, grid.Row] <> '' then
  if Confirm(MSG_CONFIRM_DELETE) then
    ExecSQL(DM.Buffer, 'delete from member '+
      'Where MemberID = '+
      QuotedStr(grid.Cells[colMemberID, grid.Row]))
  else
    Result := False
else
Result := False;

end;

function TFrmMember.isSaved : Boolean;
var SQL : String;
begin
Result := True;
try
  SQL := 'insert into member (IdKategori,Nama,Alamat,Kota,Telepon,tempat,TglLahir,Expired) '+
  'values ('+IntToStr(MemberKategori.Tag)+','+
  QuotedStr(MemberName.Text)+','+
  QuotedStr(Alamat.Text)+','+
  QuotedStr(Kota.Text)+','+
  QuotedStr(Telepon.Text)+','+
  QuotedStr(TmpLahir.Text)+','+
  QuotedStr(FormatDateTime('yyyy-mm-dd',TglLahir.Date))+','+
  QuotedStr(FormatDateTime('yyyy-mm-dd',TglExp.Date))+')';
  ExecSQL(DM.Buffer, SQL);
  Inform(MSG_SAVE_SUCCES);
except
  Result := false;
  Alert(MSG_SAVE_UNSUCCES);
end;
end;

function TFrmMember.isUpdated: Boolean;
var SQL : String;
begin
  try
    SQL := 'update member set '+
           'IdKategori = '+IntToStr(MemberKategori.Tag)+','+
           'Nama = '+QuotedStr(MemberName.Text)+','+
           'Alamat = '+QuotedStr(Alamat.Text)+','+
           'Kota = '+QuotedStr(Kota.Text)+','+
           'Telepon = '+QuotedStr(Telepon.Text)+','+
           'Tempat = '+QuotedStr(TmpLahir.Text)+','+
           'TglLahir = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglLahir.Date))+','+
           'Expired = '+QuotedStr(FormatDateTime('yyyy-mm-dd', TglExp.Date))+
           ' where MemberId = '+QuotedStr(MemberID.Text);

    ExecSQL(DM.Buffer, SQL);
    Result := True;
    Inform(MSG_SAVE_SUCCES);
  except
    Result := False;
    Inform(MSG_SAVE_UNSUCCES);
  end;
end;

procedure TFrmMember.LoadData;
var i : integer;
begin
  initForm;
  OpenSQL(DM.Buffer,'select m.MemberId, m.Nama, m.Expired  '+
  'from member m join member_kategori k on m.IdKategori=k.id ');
  initGrid;
  with DM.Buffer do
  begin
    if recordCount > 0 then
    begin
       for i := 1 to RecordCount do
       begin
          grid.RowCount := i + 2;
          grid.Ints[colNO, i] := i;
          grid.Ints[colMemberID, i] := Fields[0].AsInteger;
          grid.Cells[colMemberNama, i] := Fields[1].AsString;
          grid.Dates[colTglExp, i] := Fields[2].AsDateTime;
          if Fields[2].AsDateTime < Now then
            grid.RowColor[i] := clYellow;
          Next;
       end;
    end;
  end;
  setColWidth;
end;

procedure TFrmMember.LoadFromData;
var SQL : String;
begin
  if grid.Cells[colMemberID, grid.GetRealRow] <> '' then
  begin
    SQL :='select * from member m join member_kategori k on m.IdKategori=k.id '+
    'where MemberID = '+grid.Cells[colMemberID, grid.Row];
    OpenSQL(DM.Buffer, SQL);
    with DM.Buffer do
    begin
      MemberID.Text := Fields[0].AsString;
      MemberName.Text := Fields[2].AsString;
      Alamat.Text := Fields[3].AsString;
      Kota.Text := Fields[4].AsString;
      TmpLahir.Text := Fields[5].AsString;
      TglLahir.Date := Fields[6].AsDateTime;
      Telepon.Text := Fields[7].AsString;
      TglExp.Date := Fields[8].AsDateTime;
      MemberKategori.Text := Fields[10].AsString;
      MemberKategori.Tag := Fields[9].AsInteger;
      MemberID.Tag := 1;
    end;
  end;
  setEnableDisable;
end;


procedure TFrmMember.MemberIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then SelectNext(ActiveControl, true, true);
end;

procedure TFrmMember.MemberKategoriClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup, 'select ID, Nama, Disc AS Disc_Room, DiscFB as Disc_Food from member_kategori');
  bukaForm(FrmLookup, TFrmLookup, True, False);
  MemberKategori.Text := DM.Lookup.Fields[1].AsString;
  MemberKategori.Tag := DM.Lookup.Fields[0].AsInteger;
end;

procedure TFrmMember.MemberKategoriKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    MemberKategoriClickBtn(Sender);
end;

procedure TFrmMember.MemberKatIDClickBtn(Sender: TObject);
begin
  FrmLookup := TFrmLookup.Create(Application);
  Frmlookup.Show;
end;

procedure TFrmMember.RoomTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
     SelectNext(ActiveControl, true, true);
end;

procedure TFrmMember.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmMember.setColWidth;
begin
with grid do
begin
  AutoSize := True;
  ColWidths[1] := 0;
end;
end;

procedure TFrmMember.setEnableDisable;
begin
  MemberID.ReadOnly := MemberID.Tag > 0;
  BtnEdit.Enabled := MemberID.Tag = 0;
  BtnCancel.Enabled := MemberID.Tag > 0;
  BtnDelete.Enabled := MemberID.Tag > 0;
end;

end.
