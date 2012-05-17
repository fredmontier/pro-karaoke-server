unit uCheckOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DynamicSkinForm, RzButton, AdvCombo, AdvEdit, ExtCtrls,
  RzLabel, RzBckgnd, uDM, Mask, SkinBoxCtrls, SkinCtrls, frxDesgn, frxClass,
  frxDBSet, StrUtils, DB, MemDS, DBAccess, Uni;

type
  TFrmCheckOut = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelCharge: TLabel;
    RzSeparator1: TRzSeparator;
    LabelDiscountRoom: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    RzSeparator2: TRzSeparator;
    Panel1: TPanel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    TransNum: TRzLabel;
    LabelTotal: TRzLabel;
    PaketPromo: TspSkinEdit;
    RoomName: TspSkinEdit;
    Nama: TspSkinEdit;
    Voucher: TspSkinComboBox;
    Compliment: TspSkinComboBox;
    TotalBayar: TspSkinEdit;
    TipeBayar: TspSkinComboBox;
    KembalianRp: TspSkinEdit;
    BtnPrint: TspSkinButton;
    BtnKeluar: TspSkinButton;
    DiBayar: TspSkinNumericEdit;
    TotalTransaksi: TspSkinNumericEdit;
    TipeBayarNo: TspSkinEdit;
    VoucherRp: TspSkinNumericEdit;
    spSkinButton1: TspSkinButton;
    RoomTotal: TspSkinNumericEdit;
    spDynamicSkinForm1: TspDynamicSkinForm;
    Report1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    RzSeparator3: TRzSeparator;
    Label19: TLabel;
    RzSeparator4: TRzSeparator;
    Disc: TspSkinNumericEdit;
    Bank: TspSkinComboBox;
    Label5: TLabel;
    BtnPreview: TspSkinButton;
    BtnRevisi: TspSkinButton;
    frxDesigner1: TfrxDesigner;
    Label6: TLabel;
    DiscRoomRp: TEdit;
    DiscFB: TEdit;
    TotalRoom: TEdit;
    TotalFood: TEdit;
    SubTotal: TEdit;
    ChargeRp: TEdit;
    TaxRp: TEdit;
    Query1: TUniQuery;
    procedure RzBitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnKeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure hargeRpKeyPress(Sender: TObject; var Key: Char);
    procedure ChargeRpChange(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure Report1AfterPrint(Sender: TfrxReportComponent);
    procedure TipeBayarChange(Sender: TObject);
    procedure DiBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnPreviewClick(Sender: TObject);
    procedure TotalRoomChange(Sender: TObject);
    procedure BtnRevisiClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DiscRoomRpChange(Sender: TObject);
    procedure DiscFBChange(Sender: TObject);
    procedure TaxRpChange(Sender: TObject);
  private
    { Private declarations }
    isRevisi : Boolean;
    function loadData(NoTrans: String): boolean;
    function isValid: boolean;
    function isSaved: boolean;
    function isSavedPreview: boolean;
    function isPrinted(Prev: boolean; NoTrx: String): boolean;
    function revisiBilling(): boolean;
    procedure Calculated;
    procedure Recalculated;
    procedure setEnableDisable;
  public
    { Public declarations }
  end;

var
  FrmCheckOut: TFrmCheckOut;
  ATotalBayar, ADisc, AKembalian, FTax, FService: double;
  ATotalRoom, ADiscRoom, ADiscFoodAdd, ATotalFood, AService, ATax, ATotal, ASubTotal: double;
  ARevisi: boolean;

implementation

uses uListTransBilling, uPassword;

{$R *.dfm}

procedure TFrmCheckOut.BtnPreviewClick(Sender: TObject);
begin
  if isSavedPreview then
    isPrinted(True, DM.TransNum);
end;

procedure TFrmCheckOut.BtnPrintClick(Sender: TObject);
begin
  if isValid then
    if isSaved then
      isPrinted(False, DM.TransNum);
end;

procedure TFrmCheckOut.BtnRevisiClick(Sender: TObject);
begin
  if BtnRevisi.Tag = 0 then
  begin
    ARevisi := FrmPassword.ExecPassword(0);
    isRevisi := ARevisi;
    setEnableDisable;
    if ARevisi then
    begin
      BtnRevisi.Caption := 'Simpan Revisi';
      BtnRevisi.Tag := 1;
    end;
  end
  else
  begin
//    if revisiBilling then
//    begin
//      ExecSQL(DM.Buffer, 'update transaksi_header set complement=' +
//      DiscFB.Text + ' where NoTransaksi=' + QuotedStr(DM.TransNum));
      Inform(MSG_SAVE_SUCCES);
      ARevisi := Not ARevisi;
      setEnableDisable;
      BtnRevisi.Caption := 'Revisi Billing';
      BtnRevisi.Tag := 0;
  end;
end;

procedure TFrmCheckOut.Button1Click(Sender: TObject);
begin
  Report1.DesignReport;
end;

procedure TFrmCheckOut.Calculated;
// var ABayar: Real;
begin
  ADisc := 0;
  ATotalBayar := 0;
  AKembalian := 0;

  // ABayar := StrFmtToFloatDef(DiBayar.Text,0);
  // DiBayar.text := FloatToStrFmt(ABayar, true, 0);
  ADisc := (StrFmtToFloatDef(DiscRoomRp.Text, 0)) / 100;
  ATotalBayar := (StrFmtToFloatDef(TotalTransaksi.Text, 0));
  // - (StrFmtToFloatDef(VoucherRp.Text,0) + StrFmtToFloatDef(DiBayar.Text,0) + ADisc);
  AKembalian := (StrFmtToFloatDef(VoucherRp.Text, 0) +
    StrFmtToFloatDef(DiBayar.Text, 0)) - ATotalBayar;

  TotalBayar.Text := FloatToStrFmt(ATotalBayar, True, 0);
  KembalianRp.Text := FloatToStrFmt(AKembalian, True, 0);
  LabelTotal.Caption := FloatToStrFmt(AKembalian, True, 0) + ',-  ';

  DiscFB.Text := FloatToStr(ADiscFoodAdd);
//  TotalFood.Text := FloatToStr(ATotalFood);
end;

procedure TFrmCheckOut.ChargeRpChange(Sender: TObject);
begin
  Calculated;
end;

procedure TFrmCheckOut.DiBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    BtnPrintClick(Sender);
end;

procedure TFrmCheckOut.DiscFBChange(Sender: TObject);
begin
  Recalculated;
end;

procedure TFrmCheckOut.DiscRoomRpChange(Sender: TObject);
begin
  Recalculated;
end;

procedure TFrmCheckOut.hargeRpKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SelectNext(ActiveControl, True, True);
    Calculated;
  end;
end;

procedure TFrmCheckOut.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  isRevisi := false;
  Action := caFree;
end;

procedure TFrmCheckOut.FormCreate(Sender: TObject);
begin
  KeyPreview := True;
end;

procedure TFrmCheckOut.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_f5 then
    Report1.DesignReport;
end;

procedure TFrmCheckOut.FormShow(Sender: TObject);
begin
  loadData(DM.TransNum);
end;

function TFrmCheckOut.isPrinted(Prev: boolean; NoTrx: String): boolean;
var
  AFile: String;
begin
  AFile := ExtractFilePath(Application.ExeName) + '\report\StrukBilling.fr3';
  if DM.cekFileReport('StrukBilling.fr3') then
  begin
    OpenSQL(DM.QRyReport, 'call SpViewStrukBilling (' + QuotedStr(DM.RoomID) +
      ',' + QuotedStr(NoTrx) + ')');
    frxDBDataset1.DataSet := DM.QRyReport;
    Report1.DataSet := frxDBDataset1;
    Report1.LoadFromFile(AFile);
    Report1.PrepareReport;
    if Prev then
      Report1.ShowReport
    else
    begin
      if Confirm('Apakah akan preview billing?') then
        Report1.ShowReport
      else
        Report1.Print;
    end;
  end;
  // else
  // Alert('File '+AFile+#13+'Tidak ditemukan.!');
end;

function TFrmCheckOut.isSaved: boolean;
var
  i: integer;
  exist: boolean;
  ABayar, ADiscount, ADiscountRoomAdd, ADiscountFBAdd, AVoucher, AService: real;
begin
  If isValid then
  begin
    Result := False;
    if Confirm('Data sudah benar ..?') then
    begin
      Result := True;
      try
        DM.Connection.StartTransaction;
        ABayar := 0;
        ADiscount := 0;
        AVoucher := 0;
        AService := 0;
        AVoucher := 0;
        ADiscountRoomAdd := 0;
        ABayar := StrFmtToFloatDef(DiBayar.Text, 0);
        ADiscount := StrFmtToFloatDef(Disc.Text, 0);
        AVoucher := StrFmtToFloatDef(VoucherRp.Text, 0);
        AService := StrFmtToFloatDef(ChargeRp.Text, 0);
        ADiscountRoomAdd := StrFmtToFloatDef(DiscRoomRp.Text, 0);
        ADiscountFBAdd := StrFmtToFloatDef(DiscFB.Text, 0);

      ExecSQL(DM.Buffer, 'update transaksi_header set ' +
        'TotalTransaksi=' + FloatToStr(ATotalBayar) +
        ',DiBayar=' + FloatToStr(ABayar) +
        ',CaraBayar=' + IntToStr(TipeBayar.ItemIndex) +
        ',NoKartu=' + QuotedStr(TipeBayarNo.Text) +
        ',Complement=' + IntToStr(Compliment.ItemIndex) +
        ',StatusBayar=1,Diskon=' + FloatToStr(ADiscount) +
        ',Voucher=' + FloatToStr(AVoucher) +
        ',TypeVoucher=' + IntToStr(Voucher.ItemIndex) +
        ',Service=' + FloatToStr(AService) +
        IfThen(Voucher.ItemIndex = 0, ',FreeRoom=' + FloatToStr(AVoucher),
        IfThen(isRevisi,',complement=' + FloatToStr(ADiscountFBAdd),',complement=0') +
        IfThen(isRevisi,',complement2=' + FloatToStr(ADiscountRoomAdd),',complement2=0') +
        ',FreeFB=' + FloatToStr(AVoucher)) +
        ' where NoTransaksi = ' + QuotedStr(DM.TransNum));

        // Transaksi Stock Keluar start here until ???
        OpenSQL(DM.Buffer,
          'select distinct d.IDStock, coalesce(d.QtyPakai*t.qty,d.Satuan,0) as Qty '
          + 'from transaksi_detail t join menu_fb_header h on h.IDMenu=t.IdFnb join menu_fb_detail d on d.IDMenu=h.IDMenu '
          + 'where t.NoTransaksi=' + QuotedStr(DM.TransNum));

        // Inform('Hapus Pesan');
        ExecSQL(DM.Buffer, 'update pesan set is_read=2 where id_room=' +
          QuotedStr(DM.RoomID));

        exist := DM.Buffer.RecordCount > 0;
        if exist then
        begin
          for i := 0 to DM.Buffer.RecordCount - 1 do
          begin
            ExecSQL(DM._RecordSet,
              'insert into stock_keluar (Tanggal,NoTransaksi,IdStock,Qty) ' +
              'values (Now(), ' + QuotedStr(DM.TransNum) + ',' +
              DM.Buffer.Fields[0].AsString + ',' + DM.Buffer.Fields[1]
              .AsString + ')');
            DM.Buffer.Next;
          end;
        end;
        // ????

        ExecSQL(DM.Buffer,
          'update room set NoTransaksi=null, mulai=null, selesai=null, nama=null '
          + 'where id_room = ' + QuotedStr(DM.RoomID));

        DM.Connection.Commit;
        // Inform(MSG_SAVE_SUCCES);
        FrmListTransBilling.Close;
        Close;
      except
        DM.Connection.Rollback;
        Result := False;
        Alert(MSG_SAVE_UNSUCCES);
      end;
    end;
  end;
end;

function TFrmCheckOut.isSavedPreview: boolean;
var
  i: integer;
  exist: boolean;
  ABayar, ADiscount, ADiscountRoomAdd, ADiscountFBAdd, AVoucher, AService: real;
begin
  Result := True;
  try
    DM.Connection.StartTransaction;
    ABayar := 0;
    ADiscount := 0;
    AVoucher := 0;
    AService := 0;
    AVoucher := 0;
    ADiscountFBAdd := 0;
    ADiscountRoomAdd := 0;

    ABayar := StrFmtToFloatDef(DiBayar.Text, 0);
    ADiscount := StrFmtToFloatDef(Disc.Text, 0);
    AVoucher := StrFmtToFloatDef(VoucherRp.Text, 0);
    AService := StrFmtToFloatDef(ChargeRp.Text, 0);
    ADiscountRoomAdd := StrFmtToFloatDef(DiscRoomRp.Text, 0);
    ADiscountFBAdd := StrFmtToFloatDef(DiscFB.Text, 0);

    ExecSQL(DM.Buffer, 'update transaksi_header set ' +
      'TotalTransaksi=' + FloatToStr(ATotalBayar) +
      ',DiBayar=' + FloatToStr(ABayar) +
      ',CaraBayar=' + IntToStr(TipeBayar.ItemIndex) +
      ',NoKartu=' + QuotedStr(TipeBayarNo.Text) +
      ',Complement=' + IntToStr(Compliment.ItemIndex) +
      ',StatusBayar=1,Diskon=' + FloatToStr(ADiscount) +
      ',Voucher=' + FloatToStr(AVoucher) +
      ',TypeVoucher=' + IntToStr(Voucher.ItemIndex) +
      ',Service=' + FloatToStr(AService) +
      IfThen(Voucher.ItemIndex = 0, ',FreeRoom=' + FloatToStr(AVoucher),
      ',complement=' + FloatToStr(ADiscountFBAdd) +
      ',complement2=' + FloatToStr(ADiscountRoomAdd) +
      ',FreeFB=' + FloatToStr(AVoucher)) +
      ' where NoTransaksi = ' + QuotedStr(DM.TransNum));

    DM.Connection.Commit;
  except
    DM.Connection.Rollback;
    Result := False;
    Alert(MSG_SAVE_UNSUCCES);
  end;
end;

function TFrmCheckOut.isValid: boolean;
begin
  if CekInput(Result, (AKembalian >= 0), 'Pembayaran beluam sesuai.',
    DiBayar) then
    // Result := true;
    // if AKembalian < 0 then begin
    // Result := false;
    // Alert('Data Belum Sesuai');
    // end;
end;

function TFrmCheckOut.loadData(NoTrans: String): boolean;
var
  exist: boolean;
begin
  ARevisi := False;
  FTax := 0;
  FService := 0;
  OpenSQL(Query1,'select ppn, charge from setting where active = 1');
  if Query1.RecordCount > 0 then begin
    FTax := Query1.Fields[0].Value;
    FService := Query1.Fields[1].Value;
  end;

  TransNum.Caption := 'No Transaksi : ' + NoTrans;
  OpenSQL(DM.Buffer, 'select * from v_struk where NoTransaksi=' +QuotedStr(NoTrans));
  exist := DM.Buffer.RecordCount > 0;
  if exist then
  begin
    with DM.Buffer do
    begin
      PaketPromo.Text := Fields[1].AsString;
      RoomName.Text := Fields[2].AsString;
      Nama.Text := Fields[3].AsString;
      TotalRoom.Text := FloatToStrFmt(Fields[10].AsFloat, True, 0);
      TotalFood.Text := FloatToStrFmt(Fields[11].AsFloat, True, 0);
      Label19.Caption := 'Pajak : ' + FloatToStr(FTax) + ' %';
      LabelCharge.Caption := 'Service : ' + FloatToStr(FService) + ' %';
      ChargeRp.Text := FloatToStrFmt(Fields[14].AsFloat, True, 0);
      TaxRp.Text := FloatToStrFmt(Fields[15].AsFloat, True, 0);
      SubTotal.Text := FloatToStrFmt(Fields[13].AsFloat, True, 0);
      // TotalTransaksi.Text  := FloatToStrFmt(Fields[6].AsFloat+Fields[7].AsFloat+Fields[10].AsFloat,True,0);
      TotalTransaksi.Text := FloatToStrFmt(Fields[16].AsFloat, True, 0);
      Disc.Text := FloatToStrFmt(Fields[8].AsFloat, True, 2);
      LabelDiscountRoom.Caption := 'Disc. Room : ' +
        FloatToStrFmt(Fields[8].AsFloat, True, 2) + ' %';
      DiscRoomRp.Text := FloatToStrFmt(Fields[9].AsFloat, True, 2);
      VoucherRp.Text := '0';
      TotalBayar.Text := '0';
      DiBayar.Text := '0';
      TotalBayar.Text := FloatToStrFmt(Fields[12].AsFloat, True, 0);
      KembalianRp.Text := FloatToStrFmt(0 - Fields[12].AsFloat, True, 0);
      RoomTotal.Text := FloatToStrFmt(Fields[6].AsFloat + Fields[7]
        .AsFloat, True, 0);
      LabelTotal.Caption := FloatToStrFmt(0 - Fields[15].AsFloat, True,
        0) + ',-  ';
    end;
  end;
  Calculated;
  setEnableDisable;
end;

procedure TFrmCheckOut.Recalculated;
begin
  if ARevisi then
  begin
    ATotalRoom := 0;
    ADiscRoom := 0;
    ADiscFoodAdd := 0;
    ATotalFood := 0;
    AService := 0;
    ATax := 0;
    ATotalRoom := (StrFmtToFloatDef(TotalRoom.Text, 0));
    ADiscRoom := (StrFmtToFloatDef(DiscRoomRp.Text, 0));
    ADiscFoodAdd := (StrFmtToFloatDef(DiscFB.Text, 0));
    ATotalFood := (StrFmtToFloatDef(TotalFood.Text, 0));
    ASubTotal := ATotalRoom - ADiscRoom + ATotalFood - ADiscFoodAdd;
    ATax := (ASubTotal * FTax)/100;
    TaxRp.Text := FloatToStrFmt(ATax, True, 0);
    AService := (ASubTotal * FService)/100;
    ChargeRp.Text := FloatToStrFmt(AService, True, 0);
    SubTotal.Text := FloatToStrFmt(ASubTotal, True, 0);
    ATotal := ASubTotal + AService + ATax;
    TotalTransaksi.Text := FloatToStrFmt(ATotal, True, 0);
  end;
end;

procedure TFrmCheckOut.Report1AfterPrint(Sender: TfrxReportComponent);
begin
  // ExecSQL(DM.Buffer,'update room set NoTransaksi=null, mulai=null, selesai=null, nama=null '+
  // 'where id_room = '+QuotedStr(DM.RoomID));
end;

function TFrmCheckOut.revisiBilling: boolean;
begin
  Result := True;
  try
    Inform(DM.TransNum);
    ExecSQL(DM._RecordSet, 'update transaksi_header set complemet=' +
      DiscFB.Text + ' where NoTransaksi=' + QuotedStr(DM.TransNum));
  except
    Result := false;
  end;
end;

procedure TFrmCheckOut.RzBitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmCheckOut.setEnableDisable;
begin
  TipeBayarNo.Visible := TipeBayar.ItemIndex > 0;
  Bank.Visible := TipeBayarNo.Visible;
  Label14.Visible := TipeBayarNo.Visible;
  Label5.Visible := TipeBayarNo.Visible;
  DiscRoomRp.Enabled := ARevisi;
  DiscFB.Enabled := ARevisi;
  TotalRoom.Enabled := ARevisi;
  TotalFood.Enabled := ARevisi;
  SubTotal.Enabled := ARevisi;
  ChargeRp.Enabled := ARevisi;
  TaxRp.Enabled := ARevisi;
end;

procedure TFrmCheckOut.spSkinButton1Click(Sender: TObject);
begin
  Report1.DesignReport;
end;

procedure TFrmCheckOut.TaxRpChange(Sender: TObject);
begin
  Recalculated;
end;

procedure TFrmCheckOut.TipeBayarChange(Sender: TObject);
begin
  setEnableDisable;
end;

procedure TFrmCheckOut.TotalRoomChange(Sender: TObject);
begin
 Recalculated;
end;

procedure TFrmCheckOut.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

end.
