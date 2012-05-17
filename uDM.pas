unit uDM;

interface

uses
  SysUtils, Classes, UniProvider, MySQLUniProvider, DB, Registry, Windows, 
  DBAccess, Uni, MemDS, Controls, Dialogs, ImgList, AdvCombo, Forms, RzCommon,
  spMessages, SkinData, StrUtils, frxClass, frxDesgn, frxDBSet, frxExportPDF,
  frxExportXLS, DAScript, UniScript;

  procedure OpenSQL(TSQL: TUniQuery; _SQL: String);
  procedure ExecSQL(TSQL: TUniQuery; _SQL: String);
  function getIntFromSQL(TSQL: TUniQuery; _SQL: String): integer;
  function getStrFromSQL(TSQL: TUniQuery; _SQL: String): String;
  procedure Inform(AMsg: String);
  procedure Alert(AMsg: String);
  procedure LoadFormLookup;
  procedure bukaForm(AForm: TForm; AClass: TFormClass; isModal: boolean; isMax: boolean);
  function Confirm(AMsg: String) : boolean;
  function CekInput(var AResult: boolean; vState: boolean; vMsg: string; vControl: TWinControl): boolean;
  function FloatToStrFmt(AFloat: real; ExelStyle: boolean; digit: integer): string;
  function StrFmtToFloatDef(AString: string; ADefault: real; ExelStyle: Boolean=false): double;
  function serverNow: TDateTime;
  function hitungWaktu(DT1, DT2: TDateTime): integer;
  function formatSQLDate(ADate: TDateTime; def: integer): String;
type
  TDM = class(TDataModule)
    Connection: TUniConnection;
    MySQLUniProvider1: TMySQLUniProvider;
    Buffer: TUniQuery;
    ImageLibrary: TImageList;
    Lookup: TUniQuery;
    SkinData1: TspSkinData;
    SkinList1: TspCompressedSkinList;
    Message1: TspSkinMessage;
    _RecordSet: TUniQuery;
    DsFnB: TDataSource;
    RecordFnB: TUniQuery;
    Report1: TfrxReport;
    DBDataset1: TfrxDBDataset;
    ds_now_playing: TDataSource;
    now_playing: TUniQuery;
    QRyReport: TUniQuery;
    frxDesigner1: TfrxDesigner;
    Script1: TUniScript;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FUser: String;
    FRomID : String;
    FRomName : String;
    FIpAddr : String;
    FStatus : String;
    FTransNum : String;
    FTempID : String;
    FTempStr : String;
    FDisc : Real;
    FDiscFb : Real;
    FTransRoom: Boolean;
    RegDatabase : TRegistry;
    function GetConnection: string;
    procedure ConnectToDB;
    procedure RegCreateKeyDb;

  public
    { Public declarations }
    FListHari: TStringList;
    function GetRoomPaketByID(ACmb : TAdvComboBox) : integer;
    function GetRoomTypeByID(ACmb : TAdvComboBox) : integer;
    function cekFileReport(AFile: String): boolean;
    function FloatToStrFmt(AFloat: real; ExelStyle: boolean=false; digit: integer=2): string;
    function FloatToStrFmtShowDecimal(AFloat: real; digit: integer=4): string;
    function StrFmtToFloatDef(AString: string; ADefault: real; ExelStyle: Boolean=false): double;

    property User: String read FUser write FUser;
    property RoomID: String read FRomID write FRomID;
    property RoomName: String read FRomName write FRomName;
    property IpAddr: String read FIpAddr write FIpAddr;
    property Status: String read FStatus write FStatus;
    property TransNum: String read FTransNum write FTransNum;
    property Disc: Real read FDisc write FDisc;
    property DiscFb: Real read FDiscFb write FDiscFb;
    property TempID: String read FTempID write FTempID;
    property TempStr: String read FTempStr write FTempStr;
    property TransRoom: Boolean read FTransRoom write FTransRoom;

    var
      Awal, Akhir : TDateTime;
      int1,int2,int3,int4 : integer;
      Str1,Str2,Str3,Str4 : String;
  end;

var
  DM: TDM;
CONST
  DATABASE_PATH = '\Software\ProKaraoke';

  MSG_SAVE_SUCCES = 'DATA SUKSES DISIMPAN';
  MSG_SAVE_UNSUCCES = 'DATA GAGAL DISIMPAN'+#13+'PERIKSA KEMBALI DATA ANDA.!';
  MSG_NO_ROOM_KAT = 'DATA ROOM KATEGORY TIDAK DITEMUKAN.!';
  MSG_NO_ROOM_TYPE = 'DATA ROOM TYPE TIDAK DITEMUKAN.!';
  MSG_CONFIRM_DELETE = 'DATA AKAN DIHAPUS SECARA PERMANEN'+#13+'LANJUTKAN ..?';
  MSG_SERVER_ERROR  = 'SERVER GAGAL DIAKTIFKAN.!';
  MSG_NO_DATA  = 'DATA TIDAK DITEMUKAN.!';
  MSG_NO_FILE  = 'FILE TIDAK DITEMUKAN.!';

implementation

uses uLookup;

{$R *.dfm}

{ TDM }

procedure bukaForm(AForm: TForm; AClass: TFormClass; isModal: boolean; isMax: boolean);
begin
  AForm := AClass.Create(Application);
  if isModal then
    AForm.ShowModal
    else AForm.Show;
  if isMax then
    AForm.WindowState := wsMaximized;
end;

function formatSQLDate(ADate: TDateTime; def: integer): String;
begin
  case def of
  0 :  Result := QuotedStr(FormatDateTime('yyyy-mm-dd : hh:mm:ss', ADate));
  1 :  Result := QuotedStr(FormatDateTime('dd/mm/yyyy : hh:mm:ss', ADate));
  2 :  Result := QuotedStr(FormatDateTime('dd/mm/yyyy', ADate));
  3 :  Result := QuotedStr(FormatDateTime('hh:mm:ss', ADate));
  4 :  Result := QuotedStr(FormatDateTime('yyyy-mm-dd', ADate));
  end;
end;

function hitungWaktu(DT1, DT2: TDateTime): integer;
begin
  openSQL(dm.Buffer, 'select CEILING((UNIX_TIMESTAMP('+
  QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', DT1))+') - '+
  'UNIX_TIMESTAMP('+QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', DT2))+
  '))/60/60) AS hitung');
  Result := dm.Buffer.Fields[0].AsInteger;
end;


function serverNow: TDateTime;
begin
   openSQL(dm.Buffer, 'select now()');
   Result := dm.Buffer.Fields[0].AsDateTime;
end;

function getIntFromSQL(TSQL: TUniQuery; _SQL: String): integer;
begin
  with TSQL do
  begin
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    if TSQL.RecordCount > 0 then
      Result := Fields[0].Value
      else Result := 0;
  end;
end;

function getStrFromSQL(TSQL: TUniQuery; _SQL: String): String;
begin
  with TSQL do
  begin
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
    if TSQL.RecordCount > 0 then
      Result := Fields[0].Value
      else Result := '';
  end;
end;

function StrFmtToFloatDef(AString: string; ADefault: real; ExelStyle: Boolean=false): double;
begin
  if ExelStyle then
    if Copy(AString,1,1) = '(' then begin
      AString:= copy(AString, 2, length(AString)-2);
      AString:= '-' + AString;
    end;
  Result := StrToFloatDef(AnsiReplaceStr(AString,ThousandSeparator,''),0);
end;


function TDM.GetConnection: string;
var RegDb: TRegistry; //vWindow: HWND;
begin
//with TRegistry.Create do
//TRY
//RootKey := HKEY_LOCAL_MACHINE;
//if KeyExists('software\Prokaraoke') then {do something};
//FINALLY
//Free;
//END;
//end;

  RegDb:= TRegistry.Create;
  RegDb.RootKey:= HKEY_CURRENT_USER;
  try
    RegDb.OpenKey(DATABASE_PATH, False);
    Connection.Connected := False;
    Connection.Server:= RegDb.ReadString('dbServer');
    Connection.Database:= RegDb.ReadString('dbName');
    Connection.Username:= RegDb.ReadString('dbUser');
    Connection.Password:= '123qweasdzxc';
    IpAddr := RegDb.ReadString('IpAddress');
    Connection.Connect;
    SkinData1.SkinIndex := 
    getIntFromSQL(DM.Buffer, 'select distinct skinServerIndex from setting where active=1')
  finally
    RegDb.CloseKey;
    RegDb.Free;
  end;
end;

procedure TDM.RegCreateKeyDb;
begin
  try
    try
    //ShowMessage(cript(txtDbPwd.Text));
      RegDatabase.OpenKey(DATABASE_PATH, True);
      RegDatabase.WriteString('dbServer', '');
      RegDatabase.WriteString('dbDatabase', '');
      RegDatabase.WriteString('dbUser', '');
      RegDatabase.WriteString('dbPassword', '');
      RegDatabase.WriteInteger('connectionStatus', 1);
    except
    end;
  finally
    RegDatabase.CloseKey;
  end;
end;

function TDM.StrFmtToFloatDef(AString: string; ADefault: real;
  ExelStyle: Boolean): double;
begin
    if ExelStyle then
      if Copy(AString,1,1) = '(' then begin
        AString:= copy(AString, 2, length(AString)-2);
        AString:= '-' + AString;
      end;
    Result := StrToFloatDef(AnsiReplaceStr(AString,ThousandSeparator,''),0);
end;



function Confirm(AMsg: String): boolean;
begin
Result :=false;
  if DM.Message1.MessageDlg(AMsg, mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then Result := true;
end;

procedure Inform(AMsg: String);
begin
  DM.Message1.MessageDlg(AMsg, mtInformation, [mbOK], 0);
end;

procedure Alert(AMsg: String);
begin
  DM.Message1.MessageDlg(AMsg, mtWarning, [mbOK], 0);
end;

procedure LoadFormLookup;
begin
  FrmLookup := TFrmLookup.Create(Application);
  FrmLookup.ShowModal;
end;

function FloatToStrFmt(AFloat: real; ExelStyle: boolean; digit: integer): string;
var buntut: string;
begin
  buntut:= RightStr('#####', digit);

  if (ExelStyle) and (AFloat < 0) then
    Result := '('+FormatFloat('#,##0.'+buntut, abs(AFloat))+')'
  else
    Result := FormatFloat('#,##0.'+buntut, AFloat);
end;

procedure ExecSQL(TSQL: TUniQuery; _SQL: String);
begin
  With TSQL do
  begin
    close;
    sql.Clear;
    sql.Text := _SQL;
    Execute;
  end;
end;

procedure OpenSQL(TSQL: TUniQuery; _SQL: String);
begin
  With TSQL do
  begin
    close;
    sql.Clear;
    sql.Text := _SQL;
    Open;
  end;
end;

function CekInput(var AResult: boolean; vState: boolean; vMsg: string; vControl: TWinControl): boolean;
begin
    Result:= vState;
    AResult:= vState;
    if Result = true then Exit;
    DM.Message1.MessageDlg(vMsg, mtWarning,[mbOk], 0);
    vControl.SetFocus;
end;


function TDM.cekFileReport(AFile: String): boolean;
begin
  Result := true;
  if not FileExists(ExtractFilePath(Application.ExeName)+'\report\'+AFile)
  then begin
    Result := false;
    Alert('File '+AFile+' tidak ditemukan, hubungi IT');
  end;
end;

procedure TDM.ConnectToDB;
begin
  RegDatabase:= TRegistry.Create;
  RegDatabase.RootKey:= HKEY_CURRENT_USER;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  GetConnection;
end;

function TDM.FloatToStrFmt(AFloat: real; ExelStyle: boolean;
  digit: integer): string;
  var buntut: string;
  begin
    buntut:= RightStr('#####', digit);

    if (ExelStyle) and (AFloat < 0) then
      Result := '('+FormatFloat('#,##0.'+buntut, abs(AFloat))+')'
    else
      Result := FormatFloat('#,##0.'+buntut, AFloat);
end;

function TDM.FloatToStrFmtShowDecimal(AFloat: real; digit: integer): string;
  var buntut: string;
  begin
    buntut:= RightStr('#####0', digit);
    Result:= FormatFloat('#,##0.'+buntut, AFloat);
end;

function TDM.GetRoomPaketByID(ACmb: TAdvComboBox): integer;
begin
  OpenSQL(Buffer, 'select id from room_paket where room_paket = '+
  QuotedStr(ACmb.Items[ACmb.ItemIndex]));
  if Buffer.RecordCount > 0 then
    Result := Buffer.Fields[0].AsInteger
  else begin
    Result := -1;
    MessageDlg('Data Room Paket Tidak Ditemukan !', mtWarning, [mbOK], 0);
    Exit;
  end;

end;

function TDM.GetRoomTypeByID(ACmb: TAdvComboBox): integer;
begin
  OpenSQL(Buffer, 'select id_kategory from room_kategory where nama = '+
  QuotedStr(ACmb.Items[ACmb.ItemIndex]));
  if Buffer.RecordCount > 0 then
    Result := Buffer.Fields[0].AsInteger
  else begin
    Result := -1;
    MessageDlg(MSG_NO_ROOM_KAT, mtWarning, [mbOK], 0);
    Exit;
  end;
end;

{ TDM }


end.
