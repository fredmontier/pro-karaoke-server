unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzGroupBar, ActnList, ExtCtrls, RzPanel, RzStatus, RzSplit, StrUtils,
  DynamicSkinForm, StdCtrls, SkinBoxCtrls, SkinCtrls, StdActns, frxDesgn,
  frxClass, frxDBSet, uGlobal, ShellAPI, frxCross, jpeg, RzLabel, DB, MemDS,
  DBAccess, Uni, frxExportXLS;

type
  TFrmMain = class(TForm)
    RzStatusBar1: TRzStatusBar;
    RzMarqueeStatus1: TRzMarqueeStatus;
    RzClockStatus1: TRzClockStatus;
    RzStatusPane1: TRzStatusPane;
    progressBar: TRzProgressStatus;
    RzSplitter1: TRzSplitter;
    RzGroupBar1: TRzGroupBar;
    RzGroup5: TRzGroup;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    RzGroup4: TRzGroup;
    RzGroup7: TRzGroup;
    RzGroup6: TRzGroup;
    PanelDepan: TspSkinGroupBox;
    Image1: TImage;
    spSkinMainMenuBar1: TspSkinMainMenuBar;
    ActionList1: TActionList;
    DataStockFB: TAction;
    DataMenuFB: TAction;
    StockMasuk: TAction;
    AdjustmentStock: TAction;
    DataRoom: TAction;
    HargaSewaRoom: TAction;
    Member: TAction;
    BillingTransaksi: TAction;
    TransferDataVIdeo: TAction;
    VideoEditing: TAction;
    VideoEqualizer: TAction;
    VideoTopChart: TAction;
    UserRegistration: TAction;
    GantiPassword: TAction;
    BackupDatabase: TAction;
    DataKaryawan: TAction;
    IfoTeksRoom: TAction;
    Setting: TAction;
    LockSistem: TAction;
    ReloadMenu: TAction;
    Exit: TAction;
    RemoteRoom: TAction;
    InputVideo: TAction;
    ListOrderFAndB: TAction;
    LapLogTeknisi: TAction;
    LapDaftarStock: TAction;
    LapDaftarMenuFnB: TAction;
    LapDaftarStockMasuk: TAction;
    LapDaftarPemakaianStock: TAction;
    LapDaftarStockPertanggal: TAction;
    LapKartuStock: TAction;
    LapAdjustmentStock: TAction;
    LapDaftarRoomCafe: TAction;
    LapDaftarHargaSewa: TAction;
    LapDaftarMember: TAction;
    LapBillingTransaksiHarian: TAction;
    SyncDatabase: TAction;
    DesignReport: TAction;
    Help: TAction;
    RzGroupController1: TRzGroupController;
    frxDesigner1: TfrxDesigner;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxCrossObject1: TfrxCrossObject;
    frxXLSExport1: TfrxXLSExport;
    LapRequestSong: TAction;
    LapSaran: TAction;
    EncryptDatabase: TAction;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DataRoomExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BillingTransaksiExecute(Sender: TObject);
    procedure HargaSewaRoomExecute(Sender: TObject);
    procedure MemberExecute(Sender: TObject);
    procedure AdjustmentStockExecute(Sender: TObject);
    procedure StockMasukExecute(Sender: TObject);
    procedure DataStockFBExecute(Sender: TObject);
    procedure DataMenuFBExecute(Sender: TObject);
    procedure SettingExecute(Sender: TObject);
    procedure ExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UserRegistrationExecute(Sender: TObject);
    procedure ReloadMenuExecute(Sender: TObject);
    procedure RemoteRoomExecute(Sender: TObject);
    procedure InputVideoExecute(Sender: TObject);
    procedure ListOrderFAndBExecute(Sender: TObject);
    procedure SyncDatabaseExecute(Sender: TObject);
    procedure LockSistemExecute(Sender: TObject);
    procedure LapDaftarStockExecute(Sender: TObject);
    procedure DesignReportExecute(Sender: TObject);
    procedure LapDaftarMenuFnBExecute(Sender: TObject);
    procedure LapDaftarStockMasukExecute(Sender: TObject);
    procedure LapBillingTransaksiHarianExecute(Sender: TObject);
    procedure HelpExecute(Sender: TObject);
    procedure LapDaftarPemakaianStockExecute(Sender: TObject);
    procedure LapAdjustmentStockExecute(Sender: TObject);
    procedure LapDaftarStockPertanggalExecute(Sender: TObject);
    procedure LapKartuStockExecute(Sender: TObject);
    procedure LapDaftarRoomCafeExecute(Sender: TObject);
    procedure LapDaftarHargaSewaExecute(Sender: TObject);
    procedure LapDaftarMemberExecute(Sender: TObject);
    procedure VideoEditingExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LapRequestSongExecute(Sender: TObject);
    procedure LapSaranExecute(Sender: TObject);
    procedure EncryptDatabaseExecute(Sender: TObject);
  private
    { Private declarations }
    _SQL: String;
    procedure loadLogo;
    function TampilReport(ASQL, AFile, AUserName : String): boolean;
  public
    { Public declarations }
    procedure startProgress;
    procedure prosessProgress(dataCount, progress: integer);
    procedure endProgress;

    Procedure SetEnableDisable;
  end;

var
  FrmMain: TFrmMain;

implementation

uses uRoom, uDM, uBilling, uBiayaRoom, uMember, uStockAdjustment, uStockMasuk,
  uStockBahanBaku, uMenuFood, uSetting, uUserRegistration, uRemoteRoom, uTransferVideo,
  uListFoodAndBeverage, uSyncDatabase, uFilter, uEditVideo, uCryptDatabase;

{$R *.dfm}

procedure TFrmMain.AdjustmentStockExecute(Sender: TObject);
begin
  bukaForm(FrmStockAdjustment, TFrmStockAdjustment, True, False);
end;

procedure TFrmMain.BillingTransaksiExecute(Sender: TObject);
begin
  FrmBilling := TFrmBilling.Create(Self);
  FrmBilling.ShowModal;
end;

procedure TFrmMain.DataMenuFBExecute(Sender: TObject);
begin
  bukaForm(FrmMenuFood, TFrmMenuFood, True, False);
end;

procedure TFrmMain.DataRoomExecute(Sender: TObject);
begin
   FrmRoom := TFrmRoom.Create(self);
   FrmRoom.ShowModal;
end;

procedure TFrmMain.DataStockFBExecute(Sender: TObject);
begin
  bukaForm(FrmStockBahanBaku, TFrmStockBahanBaku, True, False);
end;

procedure TFrmMain.DesignReportExecute(Sender: TObject);
begin
  frxReport1.DesignReport;
end;

procedure TFrmMain.EncryptDatabaseExecute(Sender: TObject);
begin
  bukaForm(FrmCryptDatabase, TFrmCryptDatabase, true, false);
end;

procedure TFrmMain.endProgress;
begin
  progressBar.Percent := 0;
end;

procedure TFrmMain.ExitExecute(Sender: TObject);
begin
  close;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree
end;

procedure TFrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := Confirm('Yakin keluar server?');
  if CanClose then  Application.Terminate;
  
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  PanelDepan.Caption := Self.Caption;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  SetEnableDisable;
  RzStatusPane1.Caption := 'Server With User Login As '+DM.User;
end;

procedure TFrmMain.HargaSewaRoomExecute(Sender: TObject);
begin
   FrmBiayaRoom := TFrmBiayaRoom.Create(nil);
   FrmBiayaRoom.ShowModal;
end;

procedure TFrmMain.HelpExecute(Sender: TObject);
var AFile: String;
begin
  AFile := ExtractFilePath(Application.ExeName)+'Help\ManualBookServer.Pdf';
  if Not FileExists(AFile) then
   Alert(MSG_NO_FILE+#13+AFile)
  else ShellExecute(Handle,'Open',Pchar(AFile), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.InputVideoExecute(Sender: TObject);
begin
  bukaForm(FrmTransferVideo, TFrmTransferVideo, True, False);
end;

procedure TFrmMain.LapAdjustmentStockExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL := 'SELECT a.Tanggal,s.KodeStock,s.NamaStock,'+
    '(SELECT QtyAkhir FROM stock_akhir l WHERE l.IdStock=a.IDStock AND l.Tanggal= '+
    '(SELECT MAX(l1.Tanggal) FROM stock_akhir l1 WHERE l.IdStock=l1.IdStock AND l1.Tanggal < a.Tanggal )) AS QtyAkhir, '+
    'a.QtyFisik,a.QtyAdjust, '+
    formatSQLDate(DM.Awal, 2)+' AS Awal ,'+formatSQLDate(DM.Akhir, 2)+' AS Akhir '+
    'FROM stock_adjustment a '+
    'INNER JOIN stock s ON a.IDStock = s.IdStock '+
    'WHERE a.Tanggal BETWEEN '+formatSQLDate(DM.Awal, 4)+' AND '+formatSQLDate(DM.Akhir, 4)+
    ' ORDER BY a.Tanggal ';
    TampilReport(_SQL,'StockAdjustment', 'StockAdjustment');
  end;
end;

procedure TFrmMain.LapBillingTransaksiHarianExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL :='call SpViewReportStruk ('+
    QuotedStr(DM.User)+', 0,'+
    formatSQLDate(DM.Awal, 4)+','+
    formatSQLDate(DM.Akhir, 4)+')';
    TampilReport(_SQL,'TransaksiHarian', 'TransaksiHarian');
  end;
end;

procedure TFrmMain.LapDaftarHargaSewaExecute(Sender: TObject);
begin
  _SQL :=
  'SELECT t.TypeRoom, s.JamAwal, s.JamAkhir, s.Rate, s.RateNormal, s.MinOrder, s.MinDurasi, '+
  's.TypeVoucher, s.NilaiVoucher, s.ListHari, p.RoomPaket, '+
  '(SELECT '+
  '  CASE MIN(DayOf) '+
  '  WHEN 1 THEN ''MINGGU'' '+
  '  WHEN 2 THEN ''SENIN'' '+
  '  WHEN 3 THEN ''SELASA'' '+
  '  WHEN 4 THEN ''RABU'' '+
  '  WHEN 5 THEN ''KAMIS'' '+
  '  WHEN 6 THEN ''JUMAT'' '+
  '  ELSE''SABTU'' END '+
  'FROM room_harga_sewa_hari h WHERE h.IdHargaRomSewa=s.id) as HariAwal, '+
  '(SELECT '+
  '  CASE MAX(DayOf) '+
  '  WHEN 1 THEN ''MINGGU'' '+
  '  WHEN 2 THEN ''SENIN'' '+
  '  WHEN 3 THEN ''SELASA'' '+
  '  WHEN 4 THEN ''RABU'' '+
  '  WHEN 5 THEN ''KAMIS'' '+
  '  WHEN 6 THEN ''JUMAT'' '+
  '  ELSE ''SABTU'' END '+
  'FROM room_harga_sewa_hari h WHERE h.IdHargaRomSewa=s.id) as HariAKHIR '+
  'FROM room_harga_sewa s '+
  'INNER JOIN room_paket p ON p.Id = s.IdRoomPaket '+
  'INNER JOIN room_type t ON s.IdRoomKategory = t.id';
  TampilReport(_SQL,'HargaSewaRoom', 'HargaSewaRoom');
end;

procedure TFrmMain.LapDaftarMemberExecute(Sender: TObject);
begin
  _SQL :=
  'SELECT K.Id, M.MemberId, M.Nama, M.Alamat, M.Kota, M.Tempat, M.TglLahir,'+
  'M.Telepon, M.Expired, K.Nama, K.Disc, K.DiscFB '+
  'FROM member M INNER JOIN member_kategori K '+
  'ON K.Id = M.IdKategori ';
  TampilReport(_SQL,'MasterMember', 'MasterMember');
end;

procedure TFrmMain.LapDaftarMenuFnBExecute(Sender: TObject);
begin
  _SQL :='SELECT * FROM menu_fb_header m LEFT JOIN menu_fb_kategori k ON m.IDKategori=k.ID';
  TampilReport(_SQL,'MenuFoodBeverage', 'MenuFNB');
end;

procedure TFrmMain.LapDaftarPemakaianStockExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL := 'SELECT A.Tanggal,S.IdStock,S.KodeStock,S.NamaStock,S.SatuanPakai,S.SatuanStock,A.QtyAwal,A.QtyMasuk,A.QtyKeluar,A.QtyAdjust,A.QtyAkhir, '+
            formatSQLDate(DM.Awal, 2)+' AS Awal ,'+formatSQLDate(DM.Akhir, 2)+' AS Akhir '+
            'FROM stock S LEFT JOIN stock_akhir A ON S.IdStock = A.IdStock '+
            'WHERE A.Tanggal BETWEEN '+formatSQLDate(DM.Awal, 4)+' AND '+formatSQLDate(DM.Akhir, 4)+
            ' ORDER BY A.Tanggal ';
    TampilReport(_SQL,'StockPakai','StockPakai');
  end;
end;

procedure TFrmMain.LapDaftarRoomCafeExecute(Sender: TObject);
begin
  _SQL := 'SELECT R.id_room, R.room_name, T.TypeRoom, R.IP_Address '+
          'FROM room R LEFT JOIN room_type T ON R.id_kategory = T.id '+
          'ORDER BY T.TypeRoom';
  TampilReport(_SQL,'MasterRoom','MasterRoom');
end;

procedure TFrmMain.LapDaftarStockExecute(Sender: TObject);
begin
  _SQL :='SELECT * FROM stock s left join stock_kategori k on s.IDKategori=k.ID ORDER BY k.KategoriStock, s.NamaStock';
  TampilReport(_SQL,'Stock', 'ReportDataStock');
end;

procedure TFrmMain.LapDaftarStockMasukExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
     _SQL := 'SELECT *,'+formatSQLDate(DM.Awal, 2)+' AS Awal,'+formatSQLDate(DM.Akhir, 2)+' as Akhir '+
    'FROM stock_masuk m LEFT JOIN stock S ON m.IdStock=S.IdStock '+
    'WHERE m.tanggal BETWEEN '+formatSQLDate(DM.Awal, 4)+' AND '+formatSQLDate(DM.Akhir, 4);
    TampilReport(_SQL,'StockMasuk','StockMasuk');
  end;
end;

procedure TFrmMain.LapDaftarStockPertanggalExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL := 'SELECT s.KodeStock,s.NamaStock,a.QtyAkhir,a.Tanggal, '+
            formatSQLDate(DM.Awal, 2)+' AS Awal ,'+formatSQLDate(DM.Akhir, 2)+' AS Akhir '+
            'FROM stock s LEFT JOIN stock_akhir a ON a.IdStock = s.IdStock '+
            'WHERE a.tanggal BETWEEN '+formatSQLDate(DM.Awal, 4)+' AND '+formatSQLDate(DM.Akhir, 4);
    TampilReport(_SQL,'StockPertanggal','StockPertanggal');
  end;
end;

procedure TFrmMain.LapKartuStockExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL := 'SELECT A.Tanggal,S.IdStock,S.KodeStock,S.NamaStock,S.SatuanPakai,S.SatuanStock,A.QtyAwal,A.QtyMasuk,A.QtyKeluar,A.QtyAdjust,A.QtyAkhir, '+
            formatSQLDate(DM.Awal, 2)+' AS Awal ,'+formatSQLDate(DM.Akhir, 2)+' AS Akhir '+
            'FROM stock S LEFT JOIN stock_akhir A ON S.IdStock = A.IdStock '+
            'WHERE A.Tanggal BETWEEN '+formatSQLDate(DM.Awal, 4)+' AND '+formatSQLDate(DM.Akhir, 4)+
            ' ORDER BY S.NamaStock, A.Tanggal ';
    TampilReport(_SQL,'KartuStock','KartuStock');
  end;
end;

procedure TFrmMain.LapRequestSongExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL :='select *,'+formatSQLDate(DM.Awal, 2)+' as Awal,'+formatSQLDate(DM.Akhir, 2)+' as Akhir '+
    ' from request where tanggal BETWEEN '+
    formatSQLDate(DM.Awal, 4)+' AND '+
    formatSQLDate(DM.Akhir, 4)+ ' ORDER BY judul, penyanyi';
    TampilReport(_SQL,'RequestSong', 'RequestSong');
  end;
end;

procedure TFrmMain.LapSaranExecute(Sender: TObject);
begin
  if FrmFilter.Execute then begin
    _SQL :='select r.id_room,r.room_name,d.kat,d.saran,'+formatSQLDate(DM.Awal, 2)+' as Awal,'+formatSQLDate(DM.Akhir, 2)+' as Akhir '+
    ' from saran m join saran_detail d on m.id_saran=d.id_saran join room r on r.id_room=m.room '+
    ' where tanggal BETWEEN '+
    formatSQLDate(DM.Awal, 4)+' AND '+
    formatSQLDate(DM.Akhir, 4);
    TampilReport(_SQL,'Saran', 'Saran');
  end;
end;

procedure TFrmMain.ListOrderFAndBExecute(Sender: TObject);
begin
  bukaForm(FrmListFoodAndBeverage, TFrmListFoodAndBeverage, True, False);
end;


procedure TFrmMain.loadLogo;
  var BS: TStream;
  vGraphic: TGraphic;
begin
  OpenSQL(DM.Buffer,'select distinct(logo) from company where not logo is null');
  if DM.Buffer.RecordCount > 0 then
  begin
    BS := DM.Buffer.CreateBlobStream(DM.Buffer.FieldByName('logo'), bmRead);
    try
      vGraphic := TJPEGImage.Create;
      try
        vGraphic.LoadFromStream(BS);
        Image1.Picture.Graphic := vGraphic;
      finally
        vGraphic.Free;
      end;
    finally
      BS.Free;
    end;
  end
    else Image1.Picture := nil;
end;

procedure TFrmMain.LockSistemExecute(Sender: TObject);
begin
  Application.Terminate;
  ShellExecute(Handle,'Open',Pchar(extractFilepath(Application.ExeName)+'KaraokeServer.exe'), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.MemberExecute(Sender: TObject);
begin
  bukaForm(FrmMember, TFrmMember, True, False);
end;

procedure TFrmMain.prosessProgress(dataCount, progress: integer);
begin
  progressBar.Percent := Trunc( 100 / (dataCount /progress));
end;

procedure TFrmMain.ReloadMenuExecute(Sender: TObject);
begin
  SetEnableDisable;
end;

procedure TFrmMain.RemoteRoomExecute(Sender: TObject);
begin
  bukaForm(FrmRemoteRoom, TFrmRemoteRoom, true, false);
end;

procedure TFrmMain.SetEnableDisable;
var i , J : integer;
begin
loadLogo;
for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TRzGroup then
    begin
      (Components[i] as TRzGroup).Visible := false;
      OpenSQL(DM._RecordSet, 'select FormTag from user_form where FormTag < 0 AND IDUser='+QuotedStr(DM.User));
      DM._RecordSet.First;
      for j := 0 to DM._RecordSet.RecordCount -1 do
      begin
        if ((Components[i] as TRzGroup).Tag = DM._RecordSet.Fields[0].AsInteger)
//        or ((Components[i] as TRzGroup).Tag = -5) // --> comment hanya buat versi home
        then
          (Components[i] as TRzGroup).Visible := true; // Bisa Visible Juga
        DM._RecordSet.Next;
      end;
    end;
  end;

  for i := 0 to ComponentCount -1 do
  begin
    if Components[i] is TAction then
    begin
      (Components[i] as TAction).Visible := false;
      OpenSQL(DM._RecordSet, 'select FormTag from user_form where IDUser='+QuotedStr(DM.User));
      DM._RecordSet.First;
      for j := 0 to DM._RecordSet.RecordCount -1 do
      begin
        if ((Components[i] as TAction).Tag = DM._RecordSet.Fields[0].AsInteger)
        or ((Components[i] as TAction).Tag = 0) then
          (Components[i] as TAction).Visible := true; // Bisa Visible Juga
        DM._RecordSet.Next;
      end;
    end;
  end;
end;

procedure TFrmMain.SettingExecute(Sender: TObject);
begin
  bukaForm(FrmSetting, TFrmSetting, True, False);
end;

procedure TFrmMain.startProgress;
begin
  progressBar.Percent := 0;
end;

procedure TFrmMain.StockMasukExecute(Sender: TObject);
begin
  bukaForm(FrmStockMasuk, TFrmStockMasuk, True, False);  
end;

procedure TFrmMain.SyncDatabaseExecute(Sender: TObject);
begin
  bukaForm(FrmSyncDatabase, TFrmSyncDatabase, True, False);
end;

function TFrmMain.TampilReport(ASQL, AFile, AUserName: String): boolean;
var VFile: String;
begin
  VFile := ExtractFilePath(Application.ExeName)+'report\'+AFile+'.fr3';

  if FileExists(VFile) then begin
    try
      OpenSQL(DM.QRyReport, ASQL);
      IfThen(AUserName='', 'TeddySopyan', AUserName);
      frxDBDataset1.DataSet := DM.QRyReport;
      FrxDBDataset1.UserName := AUserName;
      frxReport1.DataSet := frxDBDataset1;
      frxReport1.LoadFromFile(VFile);
      frxReport1.PrepareReport(True);
      FrxReport1.ShowReport(True);
    except
      Alert('Gagal menampilkan report');
    end;
  end
  else Alert('File '+VFile+' tidak ditemukan !');
end;

procedure TFrmMain.UserRegistrationExecute(Sender: TObject);
begin
  bukaForm(FrmUserRegistration, TFrmUserRegistration, True, False);
end;

procedure TFrmMain.VideoEditingExecute(Sender: TObject);
begin
  bukaForm(FrmEditVideo, TFrmEditVideo, true, true);
end;

end.
