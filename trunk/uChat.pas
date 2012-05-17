unit uChat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, Udm, SkinCtrls, RzGroupBar, Grids, BaseGrid, AdvGrid,
  ExtCtrls, RzPanel, RzSplit, StdCtrls, AdvGlowButton, AdvObj;

type
  TFrmChat = class(TForm)
    RzSplitter1: TRzSplitter;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinPanel1: TspSkinPanel;
    RzGroupBar1: TRzGroupBar;
    spSkinPanel2: TspSkinPanel;
    RzSplitter2: TRzSplitter;
    Memo1: TMemo;
    Memo2: TMemo;
    BtnSend: TAdvGlowButton;
    TimerMemo1: TTimer;
    BtnClear: TAdvGlowButton;
    BtnClearOpr: TAdvGlowButton;
    CheckBox1: TCheckBox;
    grid: TAdvStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridClick(Sender: TObject);
    procedure BtnSendClick(Sender: TObject);
    procedure TimerMemo1Timer(Sender: TObject);
    procedure Memo2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnClearClick(Sender: TObject);
    procedure BtnClearOprClick(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure CheckBox1Click(Sender: TObject);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
  private
    { Private declarations }
    procedure loadChattRoom;
    procedure viewChattRoom(RoomID: String);
    function isValid: boolean;
    function isSaved: boolean;
  public
    { Public declarations }
  end;

var
  FrmChat: TFrmChat;

implementation

{$R *.dfm}

procedure TFrmChat.BtnClearClick(Sender: TObject);
begin
    execSQL(DM.Buffer,'update pesan set is_read =2 where pesan_siapa = ''operator'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure TFrmChat.BtnClearOprClick(Sender: TObject);
begin
  execSQL(DM.Buffer,'update pesan set is_read =2 where pesan_siapa = ''member'' AND id_room='+QuotedStr(DM.RoomID));
end;

procedure TFrmChat.BtnSendClick(Sender: TObject);
begin
if isValid then
  if not isSaved then
    Alert(MSG_SAVE_UNSUCCES);
end;

procedure TFrmChat.CheckBox1Click(Sender: TObject);
var i : integer;
begin
//if ARow = 0 then begin
//  for i := 1 to gridBranch.RowCount -1 do
//    gridBranch.SetCheckBoxState(ACol, i, State);
  for i := 0 to grid.RowCount - 1 do begin
//    ShowMessage(IntToStr(i));
    grid.SetCheckBoxState(2, i, CheckBox1.Checked);
  end;
  grid.SetCheckBoxState(2, 2, true);
end;

procedure TFrmChat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmChat.FormShow(Sender: TObject);
begin
  Memo1.Clear;
  Memo2.Clear;
  loadChattRoom;
//  viewChattRoom(getStrFromSQL(dm.Buffer, 'select id_room from room where room_name='+QuotedStr(DM.RoomName)));
end;

procedure TFrmChat.gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  CanEdit := ACol = 2;
end;

procedure TFrmChat.gridClick(Sender: TObject);
begin
  DM.RoomID := grid.Cells[0, grid.GetRealRow];
  viewChattRoom(grid.Cells[0, grid.GetRealRow]);
end;

procedure TFrmChat.gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  if ACol = 2 then
    AEditor := edCheckBox;
end;

function TFrmChat.isSaved: boolean;
begin
  try
    Result := true;
    execSQL(dm.Buffer, 'insert into pesan (id_room, member, username, pesan, tanggal, pesan_siapa) '+
    'values ('+QuotedStr(DM.RoomID)+','+QuotedStr(DM.RoomID)+','+QuotedStr(DM.RoomID)+','+
    QuotedStr(Trim(Memo2.Lines.Text))+','+QuotedStr(FormatDateTime('yyyy-mm-dd', Date))+','+
    QuotedStr('operator')+')');
    Memo2.Clear;
  except
    Result := false;
  end;
end;

function TFrmChat.isValid: boolean;
begin
  Result := true;
  if Memo1.Lines.Text = '' then
    Result := false;
end;

procedure TFrmChat.loadChattRoom;
var i : integer;
begin
  OpenSQL(dm.Buffer, 'select id_room, room_name, status from room where not NoTransaksi is null ');
  grid.Clear;
  grid.ColCount := 4;
  with dm.Buffer do
  begin
     for i := 0 to RecordCount -1 do
     begin
        grid.RowCount := 1 + i;
        grid.Cells[0, i] := Fields[0].AsString;
        grid.Cells[1, i] := Fields[1].AsString;
        grid.AddCheckBox(2, i, false, false);
        if Fields[2].AsString='P' then
          grid.RowColor[i]:=clYellow;        
        Next;
     end;
  end;
  grid.AutoSize := true;
  grid.HideColumn(0);
end;

procedure TFrmChat.Memo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then BtnSend.OnClick(Sender);
end;

procedure TFrmChat.TimerMemo1Timer(Sender: TObject);
begin
  viewChattRoom(DM.RoomID);
end;

procedure TFrmChat.viewChattRoom(RoomID: String);
begin
  OpenSQL(dm.Buffer, 'select pesan_siapa, pesan from pesan where is_read < 2 and id_room='+QuotedStr(DM.RoomID));
  with DM.Buffer do
  begin
    First;
    Memo1.Clear;
    while not Eof do
    begin
      Memo1.Lines.Add(Fields[0].AsString+' : '+
        Fields[1].AsString);
      next;
    end;
  end;
end;

end.
