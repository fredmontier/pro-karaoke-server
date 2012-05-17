unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, AdvGlowButton, DynamicSkinForm, SkinCtrls;

type
  TFrmLogin = class(TForm)
    spSkinStdLabel2: TspSkinStdLabel;
    spSkinStdLabel1: TspSkinStdLabel;
    EdUser: TEdit;
    EdPass: TEdit;
    BtnConfirn: TAdvGlowButton;
    BtnCancel: TAdvGlowButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    RzLabel1: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnConfirnClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure EdUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EdPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }

    function successLogin: Boolean;
    function startTransaction: Boolean;
    function balanceStock: boolean;
    function updateStructDB: boolean;
  public
    { Public declarations }
    procedure Status(const MessageStatus: string);
  end;

var
  FrmLogin: TFrmLogin;

implementation

uses uMain, uDM, uFlash;

{$R *.dfm}

procedure TFrmLogin.BtnConfirnClick(Sender: TObject);
begin
if successLogin then
begin
  if (startTransaction) and (balanceStock) then
  begin
//    if updateStructDB then begin
      DM.User := EdUser.Text;
      Self.Hide;
      FrmMain.ShowModal;
//    end else
//      Alert('Update structure database, failed!');
  end;
end
else begin
  Alert('User Name atau Password tidak dikenal');
  FocusControl(EdUser); //Versi Server
//  FocusControl(EdPass); // Versi Home
end;
end;

function TFrmLogin.balanceStock: boolean;
var ada: boolean;
begin
Result := true;
try
  dm.Connection.StartTransaction;
  OpenSQL(DM.Buffer,'SELECT DISTINCT Tanggal FROM stock_akhir WHERE tanggal=date(now())');
  ada := DM.Buffer.RecordCount > 0;
  if not ada then
  begin
    ExecSQL(dm.Buffer,'INSERT INTO stock_akhir (Tanggal,IdStock,QtyAwal,QtyAkhir) '+
    'SELECT date(now()),IdStock,QtyAkhir,QtyAkhir FROM stock_akhir '+
    'WHERE tanggal=(select max(tanggal) FROM stock_akhir)');
  end;
  DM.Connection.Commit;
except
  DM.Connection.Rollback;
  Result := false;
  Alert('Data inisial stock gagal diekseskusi...');
end;
end;

procedure TFrmLogin.BtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFrmLogin.EdPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
  BtnConfirn.SetFocus;
end;

procedure TFrmLogin.EdUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=vk_return then
  EdPass.SetFocus;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  EdUser.Clear;
  EdPass.Clear;
end;

function TFrmLogin.startTransaction: Boolean;
var AFile: String;
begin
    Result := true;
  try
    DM.Script1.SQL.Clear;
    AFile := ExtractFilePath(Application.ExeName)+'getData.real';
    if FileExists(AFile) then begin
      DM.Script1.SQL.LoadFromFile(AFile);
      DM.Script1.Execute;
    end;
    ExecSQL(DM.Buffer, 'update room set status=''A'' where id_room=''SERVER'' ');
  except
    Alert(MSG_SERVER_ERROR);
    Result := false;
  end;
end;

procedure TFrmLogin.Status(const MessageStatus: string);
begin
  Self.Caption := 'Log on to '+ Application.Title;

  try
    if (MessageStatus<>'') then begin
      if (not Self.Visible) then Self.Show;
      //if (not Self.Visible) then Self.Visible := true;
    end else begin
      {$IFDEF DEBUG}

      {$ENDIF}
      if (Self.Visible) then Self.Hide;
      //if (Self.Visible) then Self.Visible := false;
    end;
  except
  end;
  Application.ProcessMessages;
end;

function TFrmLogin.successLogin: Boolean;
begin
  Result := getIntFromSQL(DM.Buffer,'select count(*) from user_dat where username='+QuotedStr(EdUser.Text)+
  ' and password='+QuotedStr(EdPass.Text)) > 0;
end;

function TFrmLogin.updateStructDB: boolean;
//var AMemo : TMemo;
begin
{Result := true;
AMemo := TMemo.Create(Self); 
AMemo.Parent := Self;
AMemo.Clear;
AMemo.Lines.Add('DELIMITER $$ '+#13+
'DROP PROCEDURE IF EXISTS `integrated`.`SpViewStrukBilling`$$ '+
'CREATE DEFINER=`root`@`%` PROCEDURE `SpViewStrukBilling`(RoomID VARCHAR(7), NoTrans VARCHAR(20))  '+
'BEGIN '+
'   SELECT TipeTrans, id_room, room_name, NoTransaksi, mulai, selesai, nama, '+
'	CaraBayar,Voucher,sum(qty) as qty, sum(Price) as price, sum(Diskon),((sum(qty)* sum(Price))*sum(Diskon))/100 AS Disc_Rp, '+
'	(select DISTINCT Ppn from setting where Active=1) as Ppn,(SELECT (Ppn/100) * (sum(qty)* sum(Price))) as PPn_Rp,Dibayar,TotalTransaksi '+
'   from '+
'	( '+
'	SELECT ''MasterRoom'' as TipeTrans, id_room,room_name,NoTransaksi,mulai,selesai,nama,0 as qty,0 as Price,0 as Diskon, '+
'	(select if(CaraBayar=0,''CASH'',''NON CASH'') from transaksi_header where NoTransaksi=NoTrans) as CaraBayar, '+
'	(select Voucher from transaksi_header where NoTransaksi=NoTrans) as Voucher, '+
'	(select Dibayar from transaksi_header where NoTransaksi=NoTrans) as Dibayar, '+
'	(select TotalTransaksi from transaksi_header where NoTransaksi=NoTrans) as TotalTransaksi '+
'	from room WHERE NoTransaksi=NoTrans '+
'	union all '+
'	SELECT ''TransHeader''as TipeTrans, '''' as id_room,'''' as room_name,NoTransaksi, '+
'	(select mulai from room WHERE NoTransaksi=NoTrans) as mulai,(select Selesai from room WHERE NoTransaksi=NoTrans) as selesai, '+
'	'' as nama, 0 as qty,0 as Price,Diskon,CaraBayar,Voucher,Dibayar,TotalTransaksi '+
'	from transaksi_header WHERE NoTransaksi=NoTrans '+
'	union all '+
'	SELECT ''Trans Room'' as TipeTrans, t.idRoom,r.room_name,t.NoTransaksi, '+
'	(select mulai from room WHERE NoTransaksi=NoTrans) as mulai,(select Selesai from room WHERE NoTransaksi=NoTrans) as selesai, '+
'	'' as nama,Jml_JamPerson as qty,HargaPerJam as Price , '+
'	(select diskon from transaksi_header h where NoTransaksi=NoTrans) as Diskon, '+
'	(select if(CaraBayar=0,''CASH'',''NON CASH'') from transaksi_header where NoTransaksi=NoTrans) as CaraBayar, '+
'	(select Voucher from transaksi_header where NoTransaksi=NoTrans) as Voucher, '+
'	(select Dibayar from transaksi_header where NoTransaksi=NoTrans) as Dibayar, '+
'	(select TotalTransaksi from transaksi_header where NoTransaksi=NoTrans) as TotalTransaksi '+
'	from transaksi_room t join room r on t.IdRoom=r.id_room '+
'	WHERE t.NoTransaksi=NoTrans '+
'	union all '+
'	SELECT ''Trans Other'' as TipeTrans,f.KodeMenu as idRoom,f.NamaMenu as room_name,NoTransaksi, '+
'	(select mulai from room WHERE NoTransaksi=NoTrans) as mulai,(select Selesai from room WHERE NoTransaksi=NoTrans) as selesai, '+
'	'' as nama , COALESCE(d.qty,0),COALESCE(d.harga,0),0 as Diskon, '+
'	(select if(CaraBayar=0,''CASH'',''NON CASH'') from transaksi_header where NoTransaksi=NoTrans) as CaraBayar, '+
'	(select Voucher from transaksi_header where NoTransaksi=NoTrans) as Voucher, '+
'	(select Dibayar from transaksi_header where NoTransaksi=NoTrans) as Dibayar, '+
'	(select TotalTransaksi from transaksi_header where NoTransaksi=NoTrans) as TotalTransaksi '+
'	from transaksi_detail d join menu_fb_header f on d.IdFnb=f.IDMenu WHERE NoTransaksi=NoTrans  '+
'	) as M WHERE M.qty>0 and M.price>0 '+
'	group by TipeTrans, id_room; '+
'END$$ '+
' '+
'DELIMITER ;');
  try
    ExecSQL(dm.Buffer, AMemo.Lines.Text);
  except
    Result := false;
  end; }
end;

end.
