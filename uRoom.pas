unit uRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, AdvObj, AdvEdBtn;

type
  TFrmRoom = class(TForm)
    Panel1: TPanel;
    RoomID: TAdvEdit;
    RoomName: TAdvEdit;
    RoomType: TAdvComboBox;
    IPAddress: TAdvEdit;
    RoomStatus: TAdvComboBox;
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
    LbInfo: TRzLabel;
    Lokasi: TAdvEditBtn;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoomTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RoomTypeClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure AdvComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LokasiClickBtn(Sender: TObject);
    procedure LokasiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure initForm;
    Procedure initGrid;
    Procedure LoadData(ID: String);
    Procedure LoadFromData(ID: String);
    procedure setEnableDisable;
    procedure lookupRoomType;

    function isValid: boolean;
    function isSaved: boolean;
    function getMaxRoom: integer;
    function getRoomState(AVar: String): integer;
    function SetRoomState : String;
  public
    { Public declarations }
  end;

var
  FrmRoom: TFrmRoom;
CONST
  colNO     = 0;
  colID     = 1;
  colNama   = 2;
  colTipe   = 3;
  colLokasi = 4;
  colIP     = 5;
  colStatus = 6;

implementation

{$R *.dfm}

procedure TFrmRoom.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmRoom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmRoom.FormShow(Sender: TObject);
begin
  LoadData('');
  lookupRoomType;
end;

function TFrmRoom.getMaxRoom: integer;
begin
  OpenSQL(DM.Buffer, 'select count(id_room) from room');
  if DM.Buffer.RecordCount > 0 then
    Result := DM.Buffer.Fields[0].AsInteger
  else
    Result := 0;
end;


function TFrmRoom.getRoomState(AVar: String): integer;
begin
  if AVar = 'O'  then Result := 0;
  if AVar = 'A'  then Result := 1;
  if AVar = 'P'  then Result := 2;
end;

procedure TFrmRoom.initForm;
begin
  RoomID.Tag := 0;
  Lokasi.Tag := 0;
  RoomID.Clear;
  RoomName.Clear;
  RoomType.ItemIndex := -1;
  IPAddress.Clear;
  setEnableDisable;
  Lokasi.Clear;
  RoomID.SetFocus;
end;

procedure TFrmRoom.initGrid;
begin
  grid.Alignments[colNama, 0] := taCenter;
  grid.Alignments[colTipe, 0] := taCenter;
  grid.Alignments[colIP, 0] := taCenter;
end;

function TFrmRoom.isSaved: boolean;
begin
  if RoomID.Tag = 0 then
  ExecSQL(DM.Buffer, 'insert into room (id_room, room_name, IP_Address, id_kategory, id_location, status) '+
    'values ('''+RoomID.Text+''','''+RoomName.Text+''','''+IPAddress.Text+''','+
    IntToStr(RoomType.ItemIndex)+','+IntToStr(Lokasi.Tag)+','+QuotedStr(setRoomState)+')')
  else
  ExecSQL(DM.Buffer, 'update room set room_name='''+RoomName.Text+''',IP_Address='''+IPAddress.Text+''','+
  'id_location='+IntToStr(Lokasi.Tag)+', id_kategory='+IntToStr(RoomType.ItemIndex)+', status='+QuotedStr(setRoomState)+
  ' where id_room='''+RoomID.Text+'''');
  LoadData('');
end;

function TFrmRoom.isValid: boolean;
begin
  Result:= False;
  if CekInput(Result, RoomID.Text <> '', 'Kode Room belum diisi.', RoomID) then
  if CekInput(Result, RoomName.Text <> '', 'Nama Room belum diisi.', RoomName) then
  if CekInput(Result, RoomType.ItemIndex <> -1, 'Tipe Room belum sesuai.', RoomType) then
  if CekInput(Result, Lokasi.Text <> '', 'Lokasi Room belum sesuai.', Lokasi) then
  if RoomID.Tag = 0 then
  begin
    if CekInput(Result,
      getIntFromSQL(dm.Buffer,'select count(id_room) from room where id_room='+
      QuotedStr(RoomID.Text)) = 0, 'ID Room sudah ada.', RoomID) then
    if CekInput(Result,
      getIntFromSQL(dm.Buffer,'select count(id_room) from room where room_name='+
      QuotedStr(RoomName.Text)) = 0, 'Nama Room sudah ada.', RoomName) then
    if CekInput(Result,
      getIntFromSQL(dm.Buffer,'select count(id_room) from room where ip_address='+
      QuotedStr(IPAddress.Text)) = 0, 'Ip Address sudah ada.', IPAddress) then
  end;
    CekInput(Result, IPAddress.Text <> '', 'IP Address belum sesuai.', IPAddress);
end;

procedure TFrmRoom.LoadData(ID: String);
var i : integer;
begin
  initForm;
  
  OpenSQL(DM.Buffer , 'select r.id_room, r.room_name, k.TypeRoom, r.ip_address, r.status, l.lokasi '+
  'from room r left join room_type k on r.id_kategory=k.id join location l on l.id=r.id_location '+
  'order by r.room_name ');

  if DM.Buffer.RecordCount > 0 then
  begin
    with grid do
    begin
       for i := 1 to DM.Buffer.RecordCount do
       begin
          RowCount := i + 1;
          Ints[colNO, i] := i;
          Cells[colID, i] := DM.Buffer.Fields[0].AsString;
          Cells[colNama, i] := DM.Buffer.Fields[1].AsString;
          Cells[colTipe, i] := DM.Buffer.Fields[2].AsString;
          Cells[colIP, i] := DM.Buffer.Fields[3].AsString;
          Cells[colLokasi, i] := DM.Buffer.Fields[5].AsString;
          If DM.Buffer.Fields[4].AsString='A' Then
            Cells[colStatus, i]:='AKTIF'
          else If DM.Buffer.Fields[4].AsString='P' Then
            Cells[colStatus, i]:='PERBAIKAN' else
            Cells[colStatus, i]:='OFF';
          if i mod 2 = 1 then
              RowColor[i] := clMenu;
          DM.Buffer.Next;
       end;
    end;
    LbInfo.Caption := 'JUMLAH ROOM = '+IntToStr(DM.Buffer.RecordCount);
  end;
  initGrid;

end;

procedure TFrmRoom.LoadFromData(ID: String);
begin
  OpenSQL(DM.Buffer , 'select r.id_room, r.room_name, r.id_kategory, r.ip_address, r.status, l.id, l.lokasi '+
  'from room r join location l on l.id=r.id_location where r.id_room='''+ID+'''');
  if DM.Buffer.RecordCount > 0 then
  begin
    RoomID.Text := DM.Buffer.Fields[0].AsString;
    RoomName.Text := DM.Buffer.Fields[1].AsString;
    RoomType.ItemIndex := DM.Buffer.Fields[2].AsInteger;
    IPAddress.Text := DM.Buffer.Fields[3].AsString;
    RoomStatus.ItemIndex := getRoomState(DM.Buffer.Fields[4].AsString);
    Lokasi.Tag := DM.Buffer.Fields[5].AsInteger;
    Lokasi.Text := DM.Buffer.Fields[6].AsString;
    RoomID.Tag := 1;
  end else
    initForm;
  setEnableDisable;
end;

procedure TFrmRoom.LokasiClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup,'select ID, Lokasi from location order by lokasi');
  LoadFormLookup;
  Lokasi.Text := DM.Lookup.Fields[1].AsString;
  Lokasi.Tag := DM.Lookup.Fields[0].AsInteger;
end;

procedure TFrmRoom.LokasiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    LokasiClickBtn(Sender);
end;

procedure TFrmRoom.lookupRoomType;
var i : integer;
begin
  RoomType.Clear;
  RoomType.Items.Add('Add New Item ...');
  OpenSQL(DM.Buffer,'select TypeRoom from room_type');
  if DM.Buffer.RecordCount > 0 then
    while not DM.Buffer.Eof do
    begin
      RoomType.Items.Add(DM.Buffer.Fields[0].AsString);
      DM.Buffer.Next;
    end;
end;

procedure TFrmRoom.RoomTypeClick(Sender: TObject);
begin
  if RoomType.ItemIndex = 0 then
  begin
    OpenSQL(DM.Lookup, 'select ID, TypeRoom as Kategori from room_type');
    LoadFormLookup;
    lookupRoomType;
  end;  
end;

procedure TFrmRoom.RoomTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
     SelectNext(ActiveControl, true, true);
end;

procedure TFrmRoom.BtnSaveClick(Sender: TObject);
begin
  if (isValid) //and (getMaxRoom < 181)
   then isSaved;
end;

procedure TFrmRoom.AdvComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
     SelectNext(ActiveControl, true, true);
end;

procedure TFrmRoom.BtnCancelClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmRoom.BtnDeleteClick(Sender: TObject);
begin
  if Confirm(MSG_CONFIRM_DELETE) then
  begin
    ExecSQL(DM.Buffer, 'delete from room where id_room='+QuotedStr(RoomID.Text));
    LoadData('');
  end;
end;

procedure TFrmRoom.BtnEditClick(Sender: TObject);
begin
  LoadFromData(grid.Cells[colID, grid.Row]);
end;

procedure TFrmRoom.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmRoom.BtnNewClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmRoom.RzButton5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmRoom.setEnableDisable;
begin
  RoomID.ReadOnly := (RoomID.Tag = 1);
  BtnEdit.Enabled := (RoomID.Tag = 0);
  BtnCancel.Enabled := (RoomID.Tag > 0);
  BtnDelete.Enabled := (RoomID.Tag > 0);
end;

function TFrmRoom.SetRoomState: String;
begin
  case RoomStatus.ItemIndex of
    0 : Result := 'O'; // OFF
    1 : Result := 'A'; // AKTIF
    2 : Result := 'P'; // PERBAIKAN
  end;
end;

end.
