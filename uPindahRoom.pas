unit uPindahRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, DynamicSkinForm, StdCtrls, ExtCtrls, SkinCtrls, Mask,
  SkinBoxCtrls, AdvEdit, AdvEdBtn;

type
  TFrmPindahRoom = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnSave: TspSkinButton;
    BtnCancel: TspSkinButton;
    RoomBaru: TspSkinComboBox;
    RoomLama: TAdvEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    OpsiHarga: TspSkinComboBox;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure RoomLamaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function isValid: boolean;
    function isSave: boolean;
    function getRoomId(RoomName: String): string;
    function getDurasi(TransNum: String): double;
    procedure loadRoom;
  public
    { Public declarations }
  end;

var
  FrmPindahRoom: TFrmPindahRoom;

implementation

{$R *.dfm}


procedure TFrmPindahRoom.BtnSaveClick(Sender: TObject);
begin
  if isValid then
    isSave;
end;

procedure TFrmPindahRoom.FormShow(Sender: TObject);
begin
  loadRoom;
  RoomBaru.SetFocus;
end;



function TFrmPindahRoom.getDurasi(TransNum: String): double;
begin
  Result := 0;
  OpenSQL(DM.Buffer, 'select Jml_JamPerson from transaksi_room where NoTransaksi='+QuotedStr(TransNum));
  Result := DM.Buffer.Fields[0].AsFloat;
end;

function TFrmPindahRoom.getRoomId(RoomName: String): string;
var exist : boolean;
begin
  OpenSQL(dm.Buffer,'select id_room from room where room_name='+
    QuotedStr(RoomName));
  exist := dm.Buffer.RecordCount > 0;
  if exist then
    Result := dm.Buffer.Fields[0].AsString
    else Alert('DATA ROOM TIDAK VALID');
end;

function TFrmPindahRoom.isSave: boolean;
begin
  Result := true;
  try
    DM.Connection.StartTransaction;
      ExecSQL(DM.Buffer,'CALL SetMoveRoom ('+QuotedStr(getRoomId(RoomLama.Text))+
      ','+QuotedStr(getRoomId(RoomBaru.Items[RoomBaru.ItemIndex]))+','+
      IntToStr(OpsiHarga.ItemIndex)+','+FloatToStr(getDurasi(DM.TransNum))+')');
    DM.Connection.Commit;
  except
    DM.Connection.Rollback;
    Result := false;
    Alert(MSG_SAVE_UNSUCCES);
  end;
  if Result then
  begin
    DM.RoomID :=  getRoomId(RoomBaru.Items[RoomBaru.ItemIndex]);
    DM.RoomName := RoomBaru.Items[RoomBaru.ItemIndex];
    Inform(MSG_SAVE_SUCCES);
  end;
end;

function TFrmPindahRoom.isValid: boolean;
begin
  Result:= False;
  CekInput(Result, RoomBaru.ItemIndex > -1, 'Room Baru Belum dipilih.', RoomBaru);
end;

procedure TFrmPindahRoom.loadRoom;
begin
  RoomLama.Text := DM.RoomName;
  RoomBaru.Items.Clear;
  OpenSQL(DM._RecordSet,'select room_name from room WHERE id_room <>''SERVER'' '+
  'and status=''A'' and NoTransaksi is null and id_kategory in '+
  '(select s.IdRoomKategory from room_harga_sewa s join room_paket p on s.IdRoomPaket=p.Id '+
  ' where s.JamAwal<='+formatSQLDate(serverNow,3)+
  ' and s.JamAkhir>='+formatSQLDate(serverNow,3)+
  ' and '+IntToStr(DayOfWeek(serverNow))+
  ' in (select DayOf from room_harga_sewa_hari where IdHargaRomSewa=s.id))');

  with DM._RecordSet do
  begin
//   if RecordCount = 0 then Inform(formatSQLDate(serverNow,3));
    First;
    while not Eof do
    begin
      RoomBaru.Items.Add(Fields[0].AsString);
      Next;
    end;
  end;
end;

procedure TFrmPindahRoom.RoomLamaKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    SelectNext(ActiveControl, true, true);
end;

end.
