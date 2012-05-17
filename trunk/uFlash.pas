unit uFlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, sppngimagelist, SkinData, DynamicSkinForm, SkinCtrls, uDm,
  SkinExCtrls, SkinHint, ComCtrls, SkinTabs, ActnList, RzStatus, spMessages,
  ExtCtrls;

type
  TFrmFlash = class(TForm)
    spSkinToolBarEx1: TspSkinToolBarEx;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spPngImageList1: TspPngImageList;
    spSkinHint1: TspSkinHint;
    PopUpMenuBilling: TspSkinMenuEx;
    spPngImageList2: TspPngImageList;
    spPngImageList3: TspPngImageList;
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
    PopUpMenuFB: TspSkinMenuEx;
    popupMenuSetting: TspSkinMenuEx;
    procedure spSkinToolBarEx1Items3Click(Sender: TObject);
    procedure spSkinCheckRadioBox6Click(Sender: TObject);
    procedure spSkinButton2Click(Sender: TObject);
    procedure spSkinCheckRadioBox10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spSkinMenuEx1Items0Click(Sender: TObject);
    procedure DataRoomExecute(Sender: TObject);
    procedure spSkinMenuEx1Items4Click(Sender: TObject);
    procedure BillingTransaksiExecute(Sender: TObject);
    procedure spSkinMenuEx1Items3Click(Sender: TObject);
    procedure spSkinMenuEx1Items1Click(Sender: TObject);
    procedure spSkinMenuEx1Items2Click(Sender: TObject);
    procedure MemberExecute(Sender: TObject);
    procedure spSkinToolBarEx1Items0Click(Sender: TObject);
    procedure DataMenuFBExecute(Sender: TObject);
    procedure DataStockFBExecute(Sender: TObject);
    procedure PopUpMenuFBItems1Click(Sender: TObject);
    procedure StockMasukExecute(Sender: TObject);
    procedure AdjustmentStockExecute(Sender: TObject);
    procedure spSkinToolBarEx1Items4Click(Sender: TObject);
    procedure popupMenuSettingItems0Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFlash: TFrmFlash;

implementation

uses uBilling, uRoom, uBiayaRoom, uMember, uMenuFood, uStockBahanBaku,
  uStockMasuk, uStockAdjustment, uSetting;

{$R *.DFM}

procedure TFrmFlash.AdjustmentStockExecute(Sender: TObject);
begin
  FrmStockAdjustment := TFrmStockAdjustment.Create(Application);
  FrmStockAdjustment.ShowModal;
end;

procedure TFrmFlash.BillingTransaksiExecute(Sender: TObject);
begin
   FrmBilling := TFrmBilling.Create(self);
   FrmBilling.Show;
end;

procedure TFrmFlash.DataMenuFBExecute(Sender: TObject);
begin
  FrmStockBahanBaku := TFrmStockBahanBaku.Create(Application);
  FrmStockBahanBaku.ShowModal;
end;

procedure TFrmFlash.DataRoomExecute(Sender: TObject);
begin
   FrmRoom := TFrmRoom.Create(self);
   FrmRoom.ShowModal;
end;

procedure TFrmFlash.DataStockFBExecute(Sender: TObject);
begin
  FrmStockBahanBaku := TFrmStockBahanBaku.Create(Application);
  FrmStockBahanBaku.ShowModal;
end;

procedure TFrmFlash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrmFlash.FormCreate(Sender: TObject);
begin
  with spDynamicSkinForm1 do
  begin
    Height := Screen.Height;
    Width  := Screen.Width;
  end;
end;

procedure TFrmFlash.MemberExecute(Sender: TObject);
begin
  FrmMember := TFrmMember.Create(Application);
  FrmMember.ShowModal;
end;

procedure TFrmFlash.PopUpMenuFBItems1Click(Sender: TObject);
begin
  FrmMenuFood := TFrmMenuFood.Create(Application);
  FrmMenuFood.ShowModal;
end;

procedure TFrmFlash.popupMenuSettingItems0Click(Sender: TObject);
begin
  FrmSetting := TfrmSetting.Create(Application);
  FrmSetting.ShowModal;
end;

procedure TFrmFlash.spSkinToolBarEx1Items0Click(Sender: TObject);
begin
  PopUpMenuFB.Popup(spSkinToolBarEx1);
end;

procedure TFrmFlash.spSkinToolBarEx1Items3Click(Sender: TObject);
begin
  PopUpMenuBilling.Popup(spSkinToolBarEx1);
end;

procedure TFrmFlash.spSkinToolBarEx1Items4Click(Sender: TObject);
begin
  popupMenuSetting.Popup(spSkinToolBarEx1);
end;

procedure TFrmFlash.StockMasukExecute(Sender: TObject);
begin
  FrmStockMasuk := TFrmStockMasuk.Create(Application);
  FrmStockMasuk.ShowModal;
end;

procedure TFrmFlash.spSkinCheckRadioBox6Click(Sender: TObject);
begin
  spSkinToolBarEx1.RePaint;
end;

procedure TFrmFlash.spSkinMenuEx1Items0Click(Sender: TObject);
begin
  DataRoom.Execute;
end;

procedure TFrmFlash.spSkinMenuEx1Items1Click(Sender: TObject);
begin
  FrmBiayaRoom := TFrmBiayaRoom.Create(Application);
  FrmBiayaRoom.ShowModal;
end;

procedure TFrmFlash.spSkinMenuEx1Items2Click(Sender: TObject);
begin
  Member.Execute;
end;

procedure TFrmFlash.spSkinMenuEx1Items3Click(Sender: TObject);
begin
  BillingTransaksi.Execute;
end;

procedure TFrmFlash.spSkinMenuEx1Items4Click(Sender: TObject);
begin
  BillingTransaksi.Execute;
end;

procedure TFrmFlash.spSkinButton2Click(Sender: TObject);
var
  Item: TspSkinToolBarExItem;
begin
  spSkinToolBarEx1.BeginUpdateItems;
  Item := spSkinToolBarEx1.Items.Add;
  Item.ImageIndex := 8;
  Item.ActiveImageIndex := 9;
  spSkinToolBarEx1.EndUpdateItems;
end;

procedure TFrmFlash.spSkinCheckRadioBox10Click(Sender: TObject);
begin
//  spSkinToolBarEx1.ShowModalCaptions := spSkinCheckRadioBox10.Checked;
end;

end.
