unit uListTransBilling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDm, DynamicSkinForm, SkinCtrls, StdCtrls, ExtCtrls;

type
  TFrmListTransBilling = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    Panel1: TspSkinPanel;
    BtnCheckOut: TspSkinButton;
    BtnShutDown: TspSkinButton;
    BtrnFoodOrder: TspSkinButton;
    BtnClose: TspSkinButton;
    BtnPindahRoom: TspSkinButton;
    BtnDurasi: TspSkinButton;
    spSkinPanel1: TspSkinPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnRemoteRoom: TspSkinButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnShutDownClick(Sender: TObject);
    procedure BtnDurasiClick(Sender: TObject);
    procedure BtnPindahRoomClick(Sender: TObject);
    procedure BtnCheckOutClick(Sender: TObject);
    procedure BtrnFoodOrderClick(Sender: TObject);
    procedure BtnRemoteRoomClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function setEnambeDisable: boolean;
  public
    { Public declarations }
  end;

var
  FrmListTransBilling: TFrmListTransBilling;

implementation

uses uPindahRoom, uDurasiRoom, uCheckOut, uOrderFood, uRemoteRoom, uPassword;

{$R *.dfm}

procedure TFrmListTransBilling.BtnDurasiClick(Sender: TObject);
begin
  bukaForm(FrmDurasiRoom, TFrmDurasiRoom, true, false);
end;

procedure TFrmListTransBilling.BtnPindahRoomClick(Sender: TObject);
begin
  bukaForm(FrmPindahRoom, TFrmPindahRoom, true, false);
end;

procedure TFrmListTransBilling.BtnRemoteRoomClick(Sender: TObject);
begin
  bukaForm(FrmremoteRoom, TFrmremoteRoom, true, false);
end;

procedure TFrmListTransBilling.BtnShutDownClick(Sender: TObject);
var
  NoTrans : String;
begin
  if FrmPassword.ExecPassword(0) then
  begin
    if Confirm('YAKIN AKAN MEMATIKAN ROOM '+DM.RoomName) then
    begin
        NoTrans := getStrFromSQL(Dm.Buffer,'select NoTransaksi from room where id_room='+QuotedStr(DM.RoomID));
        if Length(NoTrans) > 1  then begin
          Alert('Room Masih Dipakai!');
        end
        else begin
        try
          DM.Connection.StartTransaction;
           ExecSQL(DM.Buffer, 'update room set NoTransaksi=null, mulai=null, '+
          'selesai=null, nama=null where id_room='+QuotedStr(DM.RoomID));
          DM.Connection.Commit;
          Inform('ROOM SUKSES DIMATIKAN');
        except
          DM.Connection.Rollback;
          Inform('ROOM GAGAL DIMATIKAN');
        end;
      end;
    end;
  end;
end;

procedure TFrmListTransBilling.BtrnFoodOrderClick(Sender: TObject);
begin
  bukaForm(FrmOrderFood, TFrmOrderFood, True, False);
end;

procedure TFrmListTransBilling.FormActivate(Sender: TObject);
begin
  setEnambeDisable;
end;

procedure TFrmListTransBilling.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListTransBilling.FormCreate(Sender: TObject);
begin
  KeyPreview := true;
end;

procedure TFrmListTransBilling.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    DM.Report1.DesignReport;
end;

procedure TFrmListTransBilling.FormShow(Sender: TObject);
begin
  Label1.Caption := 'PROPERTIES OF '+ DM.RoomName;
end;

function TFrmListTransBilling.setEnambeDisable: boolean;
begin
//  BtrnFoodOrder.Enabled := getIntFromSQL(DM.Buffer,'select count(status) from room where status=''O'' and NoTransaksi='+QuotedStr(DM.TransNum))>0;
end;

procedure TFrmListTransBilling.BtnCheckOutClick(Sender: TObject);
begin
  bukaForm(FrmCheckOut, TFrmCheckOut, True, False);
end;

procedure TFrmListTransBilling.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
