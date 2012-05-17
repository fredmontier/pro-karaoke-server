unit uListOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, Udm, SkinCtrls, RzGroupBar, Grids, BaseGrid, AdvGrid,
  ExtCtrls, RzPanel, RzSplit, StdCtrls, AdvGlowButton, AdvObj;

type
  TFrmListOrder = class(TForm)
    RzSplitter1: TRzSplitter;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinPanel1: TspSkinPanel;
    RzGroupBar1: TRzGroupBar;
    spSkinPanel2: TspSkinPanel;
    TimerMemo1: TTimer;
    grid: TAdvStringGrid;
    gridList: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gridClick(Sender: TObject);
    procedure TimerMemo1Timer(Sender: TObject);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnClearOprClick(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure loadChattRoom;
    procedure viewChattRoom(RoomID: String);
    function isValid: boolean;
  public
    { Public declarations }
  end;

var
  FrmListOrder: TFrmListOrder;
const
  ColMenu = 0;
  ColMenuStatus = 1;

implementation

{$R *.dfm}

procedure TFrmListOrder.BtnClearClick(Sender: TObject);
begin
    execSQL(DM.Buffer,'update pesan set is_read =2 where pesan_siapa = ''operator'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure TFrmListOrder.BtnClearOprClick(Sender: TObject);
begin
  execSQL(DM.Buffer,'update pesan set is_read =2 where pesan_siapa = ''member'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure TFrmListOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmListOrder.FormShow(Sender: TObject);
begin
  loadChattRoom;
end;

procedure TFrmListOrder.gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := ACol = 2;
end;

procedure TFrmListOrder.gridClick(Sender: TObject);
begin
  DM.RoomID := grid.Cells[0, grid.GetRealRow];
  viewChattRoom(grid.Cells[0, grid.GetRealRow]);
end;

procedure TFrmListOrder.gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  if ACol = 2 then
    AEditor := edCheckBox;
end;


function TFrmListOrder.isValid: boolean;
begin
 end;

procedure TFrmListOrder.loadChattRoom;
var i : integer;
begin
  gridList.Clear;
  gridList.ColCount := ColMenuStatus +2;
  gridList.RowCount := ColMenuStatus +1;
  gridList.Cells[ColMenu, 0] := 'Menu';
  gridList.Cells[ColMenuStatus, 0] := 'Status';

  OpenSQL(dm.Buffer, 'select id_room, room_name, status from room where not NoTransaksi is null ');
  grid.Clear;
  grid.ColCount := 3;
  with dm.Buffer do
  begin
     for i := 0 to RecordCount -1 do
     begin
        grid.RowCount := 1 + i;
        grid.Cells[0, i] := Fields[0].AsString;
        grid.Cells[1, i] := Fields[1].AsString;
//        grid.AddCheckBox(2, i, false, false);
//        if Fields[2].AsString='P' then
//          grid.RowColor[i]:=clYellow;        
        Next;
     end;
  end;
  grid.AutoSize := true;
  grid.HideColumn(0);
end;

procedure TFrmListOrder.TimerMemo1Timer(Sender: TObject);
begin
//  viewChattRoom(DM.RoomID);
end;

procedure TFrmListOrder.viewChattRoom(RoomID: String);
var i : integer;
begin
  OpenSQL(dm.Buffer, 'select h.NamaMenu, d.status, r.room_name from transaksi_detail d '+
  'join menu_fb_header h on d.IdFnb=h.IDMenu join room r on r.NoTransaksi=d.NoTransaksi '+
  'WHERE  r.id_room='+QuotedStr(DM.RoomID));
  gridList.Clear;
  gridList.Cells[ColMenu, 0] := 'Menu';
  gridList.Cells[ColMenuStatus, 0] := 'Status';
  with DM.Buffer do
  begin
    if RecordCount > 0 then begin
      First;
      for i := 1 to RecordCount do begin
        gridList.RowCount := 1 +i;
        gridList.Cells[ColMenu, i] := Fields[0].AsString;
        if Fields[1].AsInteger = 1 then begin
          gridList.Cells[ColMenuStatus, i] := Fields[2].AsString + ' Order';
          gridList.Colors[ColMenuStatus, i] := clYellow;
        end;
        if Fields[1].AsInteger = 2 then begin
          gridList.Cells[ColMenuStatus, i] := Fields[2].AsString + ' Confirm';
          gridList.Colors[ColMenuStatus, i] := clInfoBk;
        end;
        if Fields[1].AsInteger = 3 then begin
          gridList.Cells[ColMenuStatus, i] := Fields[2].AsString + ' Fixed';
          gridList.Colors[ColMenuStatus, i] := clRed;
        end;

        Next;
      end;
      gridList.AutoSize :=true;
    end;
  end;
end;

end.
