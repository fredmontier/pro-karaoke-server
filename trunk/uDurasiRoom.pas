unit uDurasiRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, DynamicSkinForm, StdCtrls, ExtCtrls, SkinCtrls, Mask,
  SkinBoxCtrls, AdvEdit, AdvEdBtn;

type
  TFrmDurasiRoom = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnSave: TspSkinButton;
    BtnCancel: TspSkinButton;
    Durasi: TAdvEdit;
    cmbAddHour: TspSkinComboBox;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure cmbAddHourChange(Sender: TObject);
  private
    { Private declarations }
    procedure initForm;
    procedure setEnableDisble;

    function isValid: boolean;
    function isSave: boolean;
    function getDurasi: TDateTime;
  public
    { Public declarations }
  end;

var
  FrmDurasiRoom: TFrmDurasiRoom;

implementation

{$R *.dfm}


procedure TFrmDurasiRoom.BtnSaveClick(Sender: TObject);
begin
  if isValid then
    isSave;
end;

procedure TFrmDurasiRoom.cmbAddHourChange(Sender: TObject);
begin
  setEnableDisble;
end;

procedure TFrmDurasiRoom.FormShow(Sender: TObject);
begin
  initForm;
  setEnableDisble;
end;


function TFrmDurasiRoom.getDurasi: TDateTime;
begin
  OpenSQL(dm.Buffer,'select date_add(selesai, interval '+
  FloatToStr(StrToFloat(Durasi.Text) * 60)  +
  ' minute) from room where id_room='+QuotedStr(DM.RoomID));
  Result := dm.Buffer.Fields[0].AsDateTime;
end;

procedure TFrmDurasiRoom.initForm;
var aDurasi: integer;
begin
  aDurasi := 0;
  cmbAddHour.Items.Clear;
  cmbAddHour.Items.Add('TAMBAH DURASI');
  cmbAddHour.Items.Add('TOLAK (JAM OPERASI HABIS)');
  cmbAddHour.Items.Add('TOLAK (WAITING LIST)');
  cmbAddHour.ItemIndex := 0;
  FocusControl(cmbAddHour);
end;

function TFrmDurasiRoom.isSave: boolean;
begin
  Result := true;
  try
    DM.Connection.StartTransaction;
    if cmbAddHour.ItemIndex = 0 then begin
      ExecSQL(DM.Buffer,'update transaksi_room set selesai='+formatSQLDate(getDurasi, 0)+
      ',Jml_JamPerson=Jml_JamPerson + '+Durasi.Text+
      ',Harga=Jml_JamPerson*HargaPerJam '+
      ' where IdRoom='+QuotedStr(Dm.RoomID));
      ExecSQL(DM.Buffer,'delete from room_hist where id_room ='+QuotedStr(DM.RoomID));
    end
    else begin
      ExecSQL(DM.Buffer,'delete from room_hist where id_room ='+QuotedStr(DM.RoomID));
      ExecSQL(DM.Buffer,'insert into room_hist (id_room, hist) values ('+
        QuotedStr(Dm.RoomID)+','+QuotedStr(IntToStr(cmbAddHour.ItemIndex))+')');
    end;

    DM.Connection.Commit;
  except
    DM.Connection.Rollback;
    Result := false;
    Alert(MSG_SAVE_UNSUCCES);
  end;
  if Result then
    Inform(MSG_SAVE_SUCCES);
end;

function TFrmDurasiRoom.isValid: boolean;
begin
  Result:= False;
  if CekInput(Result, Durasi.Text <> '', 'Durasi belum diisi.', Durasi) then
     CekInput(Result, (StrToInt(Durasi.Text) <> 0) or (cmbAddHour.ItemIndex > 0), 'Durasi tidak valid.', Durasi);
end;

procedure TFrmDurasiRoom.setEnableDisble;
var aDurasi : integer;
begin
  aDurasi := getIntFromSQL(DM.Buffer,'select durasi from room_hist where id_room='+
  QuotedStr(DM.RoomID)+' and hist = 0');
  if aDurasi > 0 then Durasi.Text := IntToStr(aDurasi) else Durasi.Text := '1';

  Durasi.Enabled := cmbAddHour.ItemIndex = 0;
  if cmbAddHour.ItemIndex > 0 then Durasi.Text := '0';
end;

end.
