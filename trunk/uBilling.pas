unit uBilling;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, RzTabs, RzPanel,
  Menus, cxLookAndFeelPainters, cxButtons, dxSkinsCore, dxSkinBlack,
  dxSkinscxPCPainter, cxPC, cxControls, AdvSmoothButton, AdvSmoothPanel,
  AdvSmoothToggleButton, AdvGlassButton, AdvSmoothMenu, AdvSmoothMegaMenu,
  AdvGlowButton, AdvSmoothStatusIndicator, AdvSmoothSlider, uFlash, ImgList,
  sppngimagelist, SkinExCtrls, SkinHint, SkinData, DynamicSkinForm, SkinCtrls,
  AdvObj;

type
  TFrmBilling = class(TForm)
    PageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    Grid: TAdvStringGrid;
    TabSheet5: TRzTabSheet;
    AdvSmoothPanel1: TAdvSmoothPanel;
    Menu1: TAdvSmoothMenu;
    Timer2: TTimer;
    AUsed: TAdvSmoothStatusIndicator;
    AdvSmoothStatusIndicator2: TAdvSmoothStatusIndicator;
    AdvSmoothStatusIndicator3: TAdvSmoothStatusIndicator;
    AdvSmoothStatusIndicator4: TAdvSmoothStatusIndicator;
    AdvSmoothStatusIndicator5: TAdvSmoothStatusIndicator;
    AdvSmoothStatusIndicator6: TAdvSmoothStatusIndicator;
    RzLabel4: TRzLabel;
    ACall: TAdvSmoothStatusIndicator;
    spDynamicSkinForm1: TspDynamicSkinForm;
    TabSheet4: TRzTabSheet;
    AOrder: TAdvSmoothStatusIndicator;
    Timer3: TTimer;
    AddHours: TAdvSmoothStatusIndicator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure GridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure BtnKeluarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Menu1ItemClick(Sender: TObject; ItemIndex: Integer);
    procedure Timer2Timer(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure GridClick(Sender: TObject);
    procedure ACallClick(Sender: TObject);
    procedure GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure Timer3Timer(Sender: TObject);
    procedure AOrderClick(Sender: TObject);
  private
    { Private declarations }
    AColIndex, ARowIndex : Integer;
    CheckIn, RUNNING : Boolean;
    procedure LoadSQLByLimit(RoomType: integer; L1, L2: byte);
    procedure AutoLoadSQLByLimit(ATab: byte);
    Procedure ArrangeColSize;
    Procedure initGrid;

    function getID(AVar: String): string;
  public
    { Public declarations }
  end;

var
  FrmBilling: TFrmBilling;

implementation

uses uTransBilling, uChat, uListTransBilling, uTransBillingCafe, uListOrder;

{$R *.dfm}


procedure TFrmBilling.BtnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmBilling.AdvGlowButton1Click(Sender: TObject);
begin
  FrmBilling.Close;
end;

procedure TFrmBilling.AOrderClick(Sender: TObject);
begin
  FrmListOrder := TFrmListOrder.Create(Self);
  FrmListOrder.ShowModal;
end;

procedure TFrmBilling.ACallClick(Sender: TObject);
begin
    FrmChat := TFrmChat.Create(Self);
    FrmChat.ShowModal;
end;

procedure TFrmBilling.ArrangeColSize;
var i : integer;
begin
  for i := 0 to Grid.ColCount do
    if i mod 2 = 1 then
      Grid.ColWidths[i-1] := 99;
  Grid.DefaultRowHeight := 26;
end;

procedure TFrmBilling.AutoLoadSQLByLimit(ATab: byte);
begin
  case PageControl1.ActivePageIndex of
    0 : LoadSQLByLimit(0, 0 ,40);
    1 : LoadSQLByLimit(0, 40 ,40);
    2 : LoadSQLByLimit(0, 80 ,40);
    3 : LoadSQLByLimit(0, 120 ,40);
    4 : LoadSQLByLimit(0, 160 ,40);
  end;
end;

procedure TFrmBilling.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBilling.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmBilling.FormShow(Sender: TObject);
begin
  DM.TransRoom := True;
  self.Height := 685;
  self.Width := 1325;
end;

function TFrmBilling.getID(AVar: String): string;
begin
  openSQL(dm.Buffer,'select id_room from room where room_name='+QuotedStr(AVar));
  Result := dm.Buffer.Fields[0].AsString;
end;

procedure TFrmBilling.GridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
//  if aCol in [1]
//  then CanEdit := True;
  CanEdit := false;
end;

procedure TFrmBilling.GridClick(Sender: TObject);
begin
  case PageControl1.TabIndex of
    -1  : DM.TransRoom := True;
    0   : DM.TransRoom := False;
  end;
//  ShowMessage(IntToStr(PageControl1.TabIndex));
  if (Grid.Cells[Grid.Col, Grid.Row] = 'CHECK IN')
  then begin
    DM.RoomID := getID(Grid.Cells[Grid.Col -1, Grid.Row]);
    DM.RoomName := Grid.Cells[Grid.Col -1, Grid.Row];
    DM.Disc := 0;
    if DM.TransRoom = true then begin
      FrmTransBilling := TFrmTransBilling.Create(Self);
      FrmTransBilling.ShowModal;
    end
    else begin
      FrmTransBillingCafe := TFrmTransBillingCafe.Create(Self);
      FrmTransBillingCafe.ShowModal;
    end;
  end else
  if (Grid.Cells[Grid.Col, Grid.Row] = 'CHECK OUT') OR
  (Grid.Cells[Grid.Col, Grid.Row] = 'ORDER') OR
  (Grid.Cells[Grid.Col, Grid.Row] = 'HOUR')
  then begin
    DM.RoomID := getID(Grid.Cells[Grid.Col -1, Grid.Row]);
    DM.RoomName := Grid.Cells[Grid.Col -1, Grid.Row];
    DM.TransNum := getStrFromSQL(Dm.Buffer,'select NoTransaksi from room where id_room='+QuotedStr(DM.RoomID));
    FrmListTransBilling := TFrmListTransBilling.Create(Self);
    FrmListTransBilling.ShowModal;
  end else
  if (Grid.Cells[Grid.Col, Grid.Row] = 'CALL') then
  begin
    Dm.Status := 'P';
//    Timer2.Enabled := False;
    DM.RoomID := getID(Grid.Cells[Grid.Col -1, Grid.Row]);
    DM.RoomName := Grid.Cells[Grid.Col -1, Grid.Row];
//    DM.RoomName := Grid.Cells[Grid.Col, Grid.Row -2];
    ExecSQL(DM.Buffer,'update room set status=''A'' where id_room='+QuotedStr(DM.RoomID ));
    FrmChat := TFrmChat.Create(Self);
    FrmChat.ShowModal;
  end;

end;

procedure TFrmBilling.GridGetAlignment(Sender: TObject; ARow, ACol: Integer;
  var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  HAlign := taCenter;
  VAlign := vtaCenter;
end;

procedure TFrmBilling.initGrid;
begin
  Grid.Clear;
  Grid.RowCount := 1;
  Grid.ColCount := 1;
end;

procedure TFrmBilling.LoadSQLByLimit(RoomType: integer; L1, L2: byte);
var i, j, ACol, ARow, AOn, AOff, Asisa : integer;
begin
  initGrid;

  if RoomType = 0 then
    OpenSQL(DM.Buffer,'select distinct r.room_name, k.TypeRoom, r.status, r.SB, '+
    'r.mulai, r.selesai, NoTransaksi, Nama, r.id_room '+
    ',COALESCE((select durasi from room_hist where id_room=r.id_room and hist = 0), 0) as addHour '+
    'from room r left join room_type k on r.id_kategory = k.id '+
    'where r.room_name <> ''SERVER'' AND r.id_room <> '''' order by r.id_room limit '+IntToStr(L1)+','+IntToStr(L2)+'')
  else
    OpenSQL(DM.Buffer,'select distinct r.room_name, k.TypeRoom, r.status, r.SB, '+
    'r.mulai, r.selesai, NoTransaksi, Nama, r.id_room '+
    ',COALESCE((select durasi from room_hist where id_room=r.id_room and hist = 0), 0) as addHour '+
    'from room r left join room_type k on r.id_kategory = k.id '+
    'where r.room_name <> ''SERVER'' AND r.id_room <> '''' order by r.id_room limit '+IntToStr(L1)+','+IntToStr(L2)+'');

  i := 0; j :=0; ACol := 0; ARow := 0; AOn := 0; AOff := 0;
  while not DM.Buffer.Eof do
  begin
    if i = 16 then
    begin
      i := 0;
      ARow := ARow + 4;
    end;
    Grid.Cells[i, ARow] := DM.Buffer.Fields[0].AsString;
    Grid.Colors[i, ARow] := clBlack;
    Grid.FontColors[i, ARow] := clWhite;
    Grid.FontSizes[i, ARow] := 10;
    Grid.FontStyles[i, ARow] := [fsBold];
    //Grid.AddButton(i + 1, ARow, 0, 0,'Check In',haFull,vaFull);
    Grid.Cells[i + 1, ARow] := 'CHECK IN';
    Grid.Colors[i + 1, ARow] := clYellow;
    Grid.Cells[i , ARow+1] := DM.Buffer.Fields[1].AsString;
    Grid.MergeCells(i, ARow+1, 2, 1);
    Grid.Colors[i, ARow+1] := clSkyBlue;
    Grid.MergeCells(i, ARow+2, 2, 2);

    if length(DM.Buffer.Fields[6].AsString) > 1 then
    begin
      ASisa := getIntFromSQL(dm._RecordSet,'select CEILING((UNIX_TIMESTAMP(selesai) - UNIX_TIMESTAMP(now()))/60) AS sisa from room where id_room='+QuotedStr(DM.Buffer.Fields[8].AsString));
      if (ASisa <=15) and (ASisa > 0) then
        Grid.Colors[i, ARow+2] := clYellow else
        if (ASisa <= 0) then
        Grid.Colors[i, ARow+2] := clRed else
        Grid.Colors[i, ARow+2] := clLime;

      if not DM.TransRoom then Grid.Colors[i, ARow+2] := clLime;

      if DM.TransRoom then
        Grid.Cells[i, ARow+2] := 'IN USE'+#13+
        FormatDateTime('HH:MM:SS', DM.Buffer.Fields[4].AsDateTime)+
        ' - '+FormatDateTime('HH:MM:SS', DM.Buffer.Fields[5].AsDateTime)+#13+
        DM.Buffer.Fields[7].AsString
      else begin
        Grid.Alignments[i, ARow+2] := taLeftJustify;
        Grid.Cells[i, ARow+2] := 'Nama  : '+DM.Buffer.Fields[7].AsString+#13+
        'Total   : ';
      end;

      if DM.Buffer.Fields[2].AsString = 'P' then begin
        Grid.Cells[i + 1, ARow] := 'CALL';
        Grid.Colors[i + 1, ARow] := ACall.Appearance.Fill.Color;
      end else
      if DM.Buffer.Fields[2].AsString = 'O' then begin
        Grid.Cells[i + 1, ARow] := 'ORDER';
        Grid.Colors[i + 1, ARow] := AOrder.Appearance.Fill.Color;
      end else
      if DM.Buffer.Fields[9].AsFloat > 0 then begin
        Grid.Cells[i + 1, ARow] := 'HOUR';
        Grid.Colors[i + 1, ARow] := ACall.Appearance.Fill.Color;
      end else
        Grid.Cells[i + 1, ARow] := 'CHECK OUT';

      Inc(AOn);
    end
      else Grid.Colors[i, ARow+2] := clBlack;
    DM.Buffer.Next;
    Inc(i, 2); Inc(ACol);
    Grid.COlCount := i;
    Grid.RowCount := ARow + 4;
  end;
  AOff := DM.Buffer.RecordCount - AOn;
  ArrangeColSize;
end;

procedure TFrmBilling.Menu1ItemClick(Sender: TObject; ItemIndex: Integer);
begin
   DM.TransRoom := True;
   case ItemIndex of
    0 : PageControl1.ActivePageIndex := 0; //LoadSQLByLimit(0, 0, 40);
    1 : PageControl1.ActivePageIndex := 1;
    2 : PageControl1.ActivePageIndex := 2;
    3 : PageControl1.ActivePageIndex := 3;
    4 : begin
      PageControl1.ActivePageIndex := 4;
      DM.TransRoom := false;
    end;
//    5 : PageControl1.ActivePageIndex := 5;
  end;
end;

procedure TFrmBilling.RzBitBtn5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmBilling.TabSheet1Show(Sender: TObject);
begin
  LoadSQLByLimit(0, 0, 40);
end;

procedure TFrmBilling.TabSheet2Show(Sender: TObject);
begin
  LoadSQLByLimit(0, 40, 40);
end;

procedure TFrmBilling.TabSheet3Show(Sender: TObject);
begin
  LoadSQLByLimit(0, 80, 40);
end;

procedure TFrmBilling.TabSheet4Show(Sender: TObject);
begin
  LoadSQLByLimit(0, 160, 40);
end;

procedure TFrmBilling.TabSheet5Show(Sender: TObject);
begin
  LoadSQLByLimit(0, 120, 40);
end;

procedure TFrmBilling.Timer1Timer(Sender: TObject);
begin
//  AutoLoadSQLByLimit(0);
end;

procedure TFrmBilling.Timer2Timer(Sender: TObject);
begin
  AutoLoadSQLByLimit(0);
end;

procedure TFrmBilling.Timer3Timer(Sender: TObject);
var i, j : integer;
begin
  for i := 0 to Grid.ColCount - 1 do begin
    for j := 0 to Grid.RowCount - 1 do begin
      if Grid.Cells[i, j] = 'ORDER' then begin
        if Grid.Colors[i, j] = AOrder.Appearance.Fill.Color then
          Grid.Colors[i, j] := clBlack else
          Grid.Colors[i, j] := AOrder.Appearance.Fill.Color;
        end;
      if Grid.Cells[i, j] = 'CALL' then begin
        if Grid.Colors[i, j] = ACall.Appearance.Fill.Color then
          Grid.Colors[i, j] := clBlack else
          Grid.Colors[i, j] := ACall.Appearance.Fill.Color;
        end;
      if Grid.Cells[i, j] = 'HOUR' then begin
        if Grid.Colors[i, j] = AddHours.Appearance.Fill.Color then begin
          Grid.Colors[i, j] := clBackground;
          Grid.FontColors[i, j] := clYellow
        end else begin
          Grid.Colors[i, j] := AddHours.Appearance.Fill.Color;
          Grid.FontColors[i, j] := clBackground;
        end;
        end;
      end;
  end;
end;
end.
