unit uListFoodAndBeverage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDM, DynamicSkinForm, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid,
  DB, MemDS, DBAccess, Uni, ExtCtrls, SkinCtrls, StdCtrls;

type
  TFrmListFoodAndBeverage = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    Timer1: TTimer;
    grid: TAdvStringGrid;
    spSkinToolBar1: TspSkinToolBar;
    BtnSimpan: TspSkinSpeedButton;
    BtnPrint: TspSkinSpeedButton;
    spSkinBevel1: TspSkinBevel;
    CbAuto: TCheckBox;
    BtnHapus: TspSkinSpeedButton;
    btnRefresh: TspSkinSpeedButton;
    btnSettingreport: TspSkinSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure CbAutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure btnSettingreportClick(Sender: TObject);
  private
    { Private declarations }
    procedure initForm;
    procedure initGrid;
    procedure loadOrder;
    procedure printOrder(IDRoom: String);
  public
    { Public declarations }
  end;

var
  FrmListFoodAndBeverage: TFrmListFoodAndBeverage;

const
  colNo   = 0;
  colID   = 1;
  colNama   = 2;
  colIP   = 3;

implementation

{$R *.dfm}

procedure TFrmListFoodAndBeverage.CbAutoClick(Sender: TObject);
begin
  Timer1.Enabled := CbAuto.Checked;
end;

procedure TFrmListFoodAndBeverage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListFoodAndBeverage.FormCreate(Sender: TObject);
begin
  initGrid;
end;

procedure TFrmListFoodAndBeverage.FormShow(Sender: TObject);
begin
  initForm;
end;

procedure TFrmListFoodAndBeverage.gridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := false;
end;

procedure TFrmListFoodAndBeverage.initForm;
begin
  CbAuto.Checked := true;
end;

procedure TFrmListFoodAndBeverage.initGrid;
begin
  grid.Cells[colNo, 0] := 'No';
  grid.Cells[colID, 0] := 'ID';
  grid.Cells[colNama, 0] := 'Room';
  grid.Cells[colIP, 0] := 'Ip Address';

  grid.AutoSize := True;
  grid.ColWidths[colID] := 0;
end;

procedure TFrmListFoodAndBeverage.loadOrder;
var i : integer;
begin
  with Dm.RecordFnB do
  begin
    close;
    sql.Clear;
    sql.Add('SELECT distinct r.id_room,r.room_name,r.IP_Address, d.NoTransaksi ');
    sql.Add('FROM room r LEFT JOIN transaksi_detail d on (r.NoTransaksi=d.NoTransaksi and d.status=0) ');
    sql.Add('LEFT JOIN location_detail l on l.id_location=r.id_location ');
    sql.Add('where l.ip_address='+QuotedStr(DM.IpAddr));
    Open;
    First;
    grid.Clear;
    for i := 1 to RecordCount - 1 do
    begin
      grid.RowCount := 2 + i;
      grid.Ints[colNo, i] := i;
      grid.Cells[colID, i] := Fields[0].AsString;
      grid.Cells[colNama, i] := Fields[1].AsString;
      grid.Cells[colIP, i] := Fields[2].AsString;
      if Length(Fields[3].AsString)>0 then
        grid.RowColor[i] := clBlue;
      Next;
    end;
  end;
  initGrid;
end;

procedure TFrmListFoodAndBeverage.printOrder(IDRoom: String);
var
  AFIle: String;
begin
  AFIle := ExtractFilePath(Application.ExeName)+'\report\ListOrderFNB.fr3';
  if FileExists(AFIle) then
  begin
    openSQL(DM.Buffer,'SELECT * FROM room r JOIN transaksi_detail d on (r.NoTransaksi=d.NoTransaksi and d.status=0) '+
    'JOIN menu_fb_header h on d.IdFnb=h.IDMenu where r.id_room='+QuotedStr(IDRoom));
    if Dm.Buffer.RecordCount = 0 then
      Alert('Room tidak Order Food and Beverage.')
    else begin
      with DM do
      begin
        DBDataset1.DataSet := Buffer;
        DBDataset1.UserName := 'ListOrderFNB';
        Report1.DataSet := DBDataset1;
        Report1.LoadFromFile(AFIle);
        Report1.ShowReport(true);
      end;
    end;
  end else
    Alert('File Report '+#13+AFIle+#13+'Tidak Ditemukan');
end;

procedure TFrmListFoodAndBeverage.BtnPrintClick(Sender: TObject);
begin
  printOrder(grid.Cells[colID, grid.GetRealRow]);
end;

procedure TFrmListFoodAndBeverage.btnRefreshClick(Sender: TObject);
begin
  loadOrder;
end;

procedure TFrmListFoodAndBeverage.btnSettingreportClick(Sender: TObject);
begin
  DM.Report1.DesignReport();
end;

procedure TFrmListFoodAndBeverage.Timer1Timer(Sender: TObject);
begin
  loadOrder;
end;

end.
