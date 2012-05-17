program KaraokeServer;

uses
  Forms,
  Controls,
  uBilling in 'uBilling.pas' {FrmBilling},
  uDM in 'uDM.pas' {DM: TDataModule},
  uLogin in 'uLogin.pas' {FrmLogin},
  uLookup in 'uLookup.pas' {FrmLookup},
  uMain in 'uMain.pas' {FrmMain},
  uMember in 'uMember.pas' {FrmMember},
  uMenuFood in 'uMenuFood.pas' {FrmMenuFood},
  uOrderFood in 'uOrderFood.pas' {FrmOrderFood},
  uStockAdjustment in 'uStockAdjustment.pas' {FrmStockAdjustment},
  uStockBahanBaku in 'uStockBahanBaku.pas' {FrmStockBahanBaku},
  uStockMasuk in 'uStockMasuk.pas' {FrmStockMasuk},
  uTransBillingCafe in 'uTransBillingCafe.pas' {FrmTransBillingCafe},
  uListOrder in 'uListOrder.pas' {FrmListOrder},
  uBiayaRoom in 'uBiayaRoom.pas' {FrmBiayaRoom},
  uListHari in 'uListHari.pas' {FrmListHari},
  uSplashScreen in 'uSplashScreen.pas' {FrmSpalshScreen},
  uListTransBilling in 'uListTransBilling.pas' {FrmListTransBilling},
  uDurasiRoom in 'uDurasiRoom.pas' {FrmDurasiRoom},
  uPindahRoom in 'uPindahRoom.pas' {FrmPindahRoom},
  uSetting in 'uSetting.pas' {FrmSetting},
  uRoom in 'uRoom.pas' {FrmRoom},
  uCheckOut in 'uCheckOut.pas' {FrmCheckOut},
  uMenuFoodDetail in 'uMenuFoodDetail.pas' {FrmMenuFoodDetail},
  uUserRegistration in 'uUserRegistration.pas' {FrmUserRegistration},
  uRemoteRoom in 'uRemoteRoom.pas' {FrmRemoteRoom},
  uTransferVideo in 'uTransferVideo.pas' {FrmTransferVideo},
  xVideo in '..\KaraokeEnterprise\xVideo.pas',
  uListFoodAndBeverage in 'uListFoodAndBeverage.pas' {FrmListFoodAndBeverage},
  uCryptDatabase in 'uCryptDatabase.pas' {FrmCryptDatabase},
  uFilter in 'uFilter.pas' {FrmFilter},
  uTransBilling in 'uTransBilling.pas' {FrmTransBilling},
  uEditVideo in 'uEditVideo.pas' {FrmEditVideo},
  uChat in 'uChat.pas' {FrmChat},
  uPassword in 'uPassword.pas' {FrmPassword},
  uSyncDatabase in 'uSyncDatabase.pas' {FrmSyncDatabase},
  uTPLb_Codec in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_Codec.pas',
  uTPLb_CodecIntf in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_CodecIntf.pas',
  uTPLb_Constants in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_Constants.pas',
  uTPLb_CryptographicLibrary in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_CryptographicLibrary.pas',
  uTPLb_Hash in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_Hash.pas',
  uTPLb_OpenSSL in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_OpenSSL.pas',
  uTPLb_Signatory in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_Signatory.pas',
  uTPLb_SimpleBlockCipher in 'C:\Program Files\TurboPower LockBox 3\run\library surface\uTPLb_SimpleBlockCipher.pas',
  uDemoBlockModeCipher in 'uDemoBlockModeCipher.pas';

{$R *.RES}

begin
//  with TFrmSpalshScreen.Create(Application) do
//  begin
//    try
//      Show;
      Application.Initialize;
//      while Timer1.Enabled do Application.ProcessMessages;
//    finally
//      Free;
//    end;
//  end;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmFilter, FrmFilter);
  Application.CreateForm(TFrmChat, FrmChat);
  Application.CreateForm(TFrmPassword, FrmPassword);
  Application.CreateForm(TFrmSyncDatabase, FrmSyncDatabase);
  Application.Run;
end.
