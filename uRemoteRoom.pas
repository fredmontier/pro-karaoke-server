unit uRemoteRoom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, uDM, ExtCtrls, RzPanel, RzSplit, SkinCtrls, Grids,
  AdvObj, BaseGrid, AdvGrid, AdvCGrid, uMain, StdCtrls, Mask, SkinBoxCtrls,
  DBAdvGrid, AdvEdit;

type
  TFrmRemoteRoom = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    RzSplitter1: TRzSplitter;
    GroupBox1: TspSkinGroupBox;
    GroupBox2: TspSkinGroupBox;
    GridRoom: TAdvColumnGrid;
    RzSplitter2: TRzSplitter;
    gridSong: TAdvStringGrid;
    spSkinToolBar1: TspSkinToolBar;
    spSkinSpeedButton2: TspSkinSpeedButton;
    spSkinToolBar2: TspSkinToolBar;
    spSkinStdLabel1: TspSkinStdLabel;
    Judul: TspSkinEdit;
    spSkinStdLabel2: TspSkinStdLabel;
    Artis: TspSkinEdit;
    spSkinSpeedButton3: TspSkinSpeedButton;
    spSkinSpeedButton4: TspSkinSpeedButton;
    spSkinBevel2: TspSkinBevel;
    spSkinSpeedButton6: TspSkinSpeedButton;
    spSkinSpeedButton7: TspSkinSpeedButton;
    spSkinSpeedButton8: TspSkinSpeedButton;
    gridNowPlaying: TDBAdvGrid;
    spSkinToolBar3: TspSkinToolBar;
    spSkinSpeedButton1: TspSkinSpeedButton;
    spSkinSpeedButton5: TspSkinSpeedButton;
    LbPlayNow: TspSkinStdLabel;
    spSkinSpeedButton9: TspSkinSpeedButton;
    spSkinSpeedButton10: TspSkinSpeedButton;
    spSkinBevel1: TspSkinBevel;
    spSkinSpeedButton11: TspSkinSpeedButton;
    spSkinSpeedButton12: TspSkinSpeedButton;
    EdVol: TAdvEdit;
    spSkinSpeedButton13: TspSkinSpeedButton;
    EdPitch: TAdvEdit;
    spSkinSpeedButton14: TspSkinSpeedButton;
    spSkinBevel3: TspSkinBevel;
    spSkinBevel4: TspSkinBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure GridRoomCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure GridSongCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure spSkinButton1Click(Sender: TObject);
    procedure GridSongCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure spSkinSpeedButton1Click(Sender: TObject);
    procedure GridRoomClick(Sender: TObject);
    procedure spSkinSpeedButton2Click(Sender: TObject);
    procedure spSkinSpeedButton7Click(Sender: TObject);
    procedure spSkinSpeedButton8Click(Sender: TObject);
    procedure spSkinSpeedButton5Click(Sender: TObject);
    procedure spSkinSpeedButton6Click(Sender: TObject);
    procedure spSkinSpeedButton4Click(Sender: TObject);
    procedure spSkinSpeedButton9Click(Sender: TObject);
    procedure spSkinSpeedButton10Click(Sender: TObject);
    procedure spSkinSpeedButton3Click(Sender: TObject);
    procedure spSkinSpeedButton12Click(Sender: TObject);
    procedure spSkinSpeedButton11Click(Sender: TObject);
    procedure spSkinSpeedButton13Click(Sender: TObject);
    procedure spSkinSpeedButton14Click(Sender: TObject);
    procedure JudulKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ArtisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure initForm;
    procedure initGrid(AID: byte);
    procedure loadRoomActive;
    procedure loadSongList;
    procedure loadNowPlaying(ARoom: String);
    procedure updateVol(ARoom, AVol: String);
    procedure updatePitch(ARoom, AVol: String);
    function getGridChecked: Boolean;
    function isSaved: Boolean;
  public
    { Public declarations }
  end;

var
  FrmRemoteRoom: TFrmRemoteRoom;

implementation

{$R *.dfm}

procedure TFrmRemoteRoom.ArtisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    loadSongList;
end;

procedure TFrmRemoteRoom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmRemoteRoom.FormShow(Sender: TObject);
begin
  initForm;
  loadRoomActive;
//  loadSongList;
  initGrid(0);
end;

function TFrmRemoteRoom.getGridChecked: Boolean;
  var i : integer;
begin
  Result := false;
  for i := 0 to GridRoom.RowCount - 1 do begin
    if GridRoom.IsChecked(2,i) = true then
      Result := true;
  end;
  if Result = false then begin
    Alert('TIDAK ADA ROOM YANG DIPILIH'+#13+'SILAHKAN ULANGI KEMBALI');
    FocusControl(GridRoom);
  end;
end;

procedure TFrmRemoteRoom.GridRoomCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol = 2;
end;

procedure TFrmRemoteRoom.GridRoomClick(Sender: TObject);
var i : integer;
begin
//  if GridRoom.Col = 1 then
    loadNowPlaying(GridRoom.Cells[0, GridRoom.Row]);
end;

procedure TFrmRemoteRoom.GridSongCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol = 5;
end;

procedure TFrmRemoteRoom.GridSongCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
  var i : integer;
begin
  if (ACol=5) and (ARow=0) then
    for i := 0 to GridSong.RowCount - 1 do
        GridSong.CheckCol(State, 5)
end;

procedure TFrmRemoteRoom.initForm;
begin
  Judul.Clear;
  Artis.Clear;
  initGrid(1);
end;

procedure TFrmRemoteRoom.initGrid(AID: byte);
begin
  case AID of
    0 :
    begin
      GridSong.Clear;
      gridSong.RowCount := 2;
      gridSong.ColCount := 8;
      GridSong.Cells[0, 0] := 'Judul Lagu';
      GridSong.Cells[1, 0] := 'Artis';
      GridSong.Cells[2, 0] := 'Kategori';
      gridSong.AddCheckBox(5, 0, false, false);
      gridSong.AutoSize := true;
      gridSong.ColWidths[3] := 0;
      gridSong.ColWidths[4] := 0;
    end;
    1 :
    begin
      GridNowPlaying.ColCount := 6;
//      GridNowPlaying.RowCount := 2;
//      GridNowPlaying.Clear;
      GridNowPlaying.Cells[0,0] := 'No';
      GridNowPlaying.Cells[1,0] := 'Judul';
      GridNowPlaying.Cells[2,0] := 'Artis';
      GridNowPlaying.Cells[3,0] := 'Nama File';
      GridNowPlaying.Cells[4,0] := 'Volume';
      GridNowPlaying.AutoSize := true;
      GridNowPlaying.ColWidths[1] := 0;
      GridNowPlaying.ColWidths[4] := 0;
      GridNowPlaying.ColWidths[5] := 0;
    end;  
  end;
end;

function TFrmRemoteRoom.isSaved: Boolean;
var i,j : integer;
begin
Result := True;
try
//  FrmMain.startProgress;
  DM.Connection.StartTransaction;

  for i := 0 to GridRoom.RowCount - 1 do
  begin
    if GridRoom.IsChecked(2,i) = true then
    begin
//    FrmMain.prosessProgress(GridRoom.RowCount, i);
      for j := 1 to GridSong.RowCount - 1 do
      begin
        if GridSong.IsChecked(5,j) = true then
        begin
          ExecSQL(dm.Buffer, 'insert into now_playing (room,tanggal,judul,artis,nama_file,direktori,volume) '+
          'select '+QuotedStr(GridRoom.Cells[0,i])+',now(),judul,artis,NamaFile,direktori,volume from song_list '+
          'where judul='+QuotedStr(GridSong.Cells[0, j])+' and artis='+QuotedStr(GridSong.Cells[1, j]));
          Application.ProcessMessages;
          GroupBox2.Caption :='Song List Processing '+GridRoom.Cells[0,i]+'... '+
          GridSong.Cells[0, j]+' : '+GridSong.Cells[1, j]+' .....';
        end;
      end;
    end;
  end;
  DM.Connection.Commit;
//  FrmMain.endProgress;
  GroupBox2.Caption :='Song List';
//  Inform(MSG_SAVE_SUCCES);
except
  DM.Connection.Rollback;
  Result := false;
  Alert(MSG_SAVE_UNSUCCES);
end;
end;

procedure TFrmRemoteRoom.JudulKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    loadSongList;
end;

procedure TFrmRemoteRoom.loadNowPlaying(ARoom: String);
begin
   OpenSQL(DM.now_playing,'select IDNP, judul, artis, nama_file, volume from now_playing where room='+QuotedStr(ARoom));
   LbPlayNow.Caption := 'Playlist Room : '+GridRoom.Cells[1, GridRoom.Row];
   initGrid(1);
   OpenSQL(DM.Buffer,'select vol, pitch from room where id_room='+QuotedStr(ARoom));
   EdVol.Text := DM.Buffer.Fields[0].AsString;
   EdPitch.Text := DM.Buffer.Fields[1].AsString;
end;

procedure TFrmRemoteRoom.loadRoomActive;
var i : integer;
begin
  OpenSQL(DM.Buffer, 'select distinct id_room, room_name, nama from room where not room_name like ''%CAFE%'' and not NoTransaksi is null order by room_name');
  GridRoom.Clear;
  for i := 0 to  DM.Buffer.RecordCount -1 do
  begin
     GridRoom.RowCount := i +1;
     GridRoom.Cells[0, i] := dm.Buffer.Fields[0].AsString;
     GridRoom.Cells[1, i] := dm.Buffer.Fields[1].AsString+' ('+dm.Buffer.Fields[2].AsString+')';
     GridRoom.AddCheckBox(2, i, false, true);
     Dm.Buffer.Next;
  end;
//  GridRoom.AutoSize := true;
  GridRoom.ColWidths[0] := 0;
  GridRoom.ColWidths[1] := 175;
  GridRoom.ColWidths[2] := 20;
end;

procedure TFrmRemoteRoom.loadSongList;
var i : integer;
begin
  OpenSQL(DM.Buffer, 'select distinct judul, artis, jenis, Direktori, NamaFile, volume '+
  'from song_list where artis like ''%'+Artis.Text+'%'' AND judul like ''%'+Judul.Text+'%'' order by judul');
//  GridSong.Clear;
//  gridSong.RowCount := 2;
//  GridSong.Cells[0, 0] := 'Judul Lagu';
//  GridSong.Cells[1, 0] := 'Artis';
//  GridSong.Cells[2, 0] := 'Kategori';
//  GridSong.AddCheckBox(5, 0, false, true);
  initGrid(0);
  for i := 1 to  DM.Buffer.RecordCount -1 do
  begin
     GridSong.RowCount := i +1;
     GridSong.Cells[0, i] := dm.Buffer.Fields[0].AsString;
     GridSong.Cells[1, i] := dm.Buffer.Fields[1].AsString;
     GridSong.Cells[2, i] := dm.Buffer.Fields[2].AsString;
     GridSong.Cells[3, i] := dm.Buffer.Fields[3].AsString;
     GridSong.Cells[4, i] := dm.Buffer.Fields[4].AsString;
     GridSong.AddCheckBox(5, i, false, true);
     GridSong.Cells[6, i] := dm.Buffer.Fields[5].AsString;
     Dm.Buffer.Next;
  end;
  GridSong.AutoSize := true;
  GridSong.ColWidths[3] := 0;
  GridSong.ColWidths[4] := 0;
  GridSong.ColWidths[5] := 20;
  GridSong.ColWidths[6] := 0;
end;

procedure TFrmRemoteRoom.spSkinButton1Click(Sender: TObject);
begin
  isSaved;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton10Click(Sender: TObject);
begin
  ExecSQL(DM._RecordSet,'update now_playing set state=0 where room='+QuotedStr(GridRoom.Cells[0, gridRoom.Row]));
  ExecSQL(DM._RecordSet,'update now_playing set state=9 where IDNP='+DM.now_playing.FieldByName('IDNP').AsString)
end;

procedure TFrmRemoteRoom.spSkinSpeedButton11Click(Sender: TObject);
begin
  if EdVol.IntValue > 0 then
  begin
    EdVol.Text := IntToStr(StrToInt(EdVol.Text) - 10);
    updateVol(GridRoom.Cells[0,GridRoom.Row], EdVol.Text);
  end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton12Click(Sender: TObject);
begin
  if EdVol.IntValue < 100 then
  begin
    EdVol.Text := IntToStr(StrToInt(EdVol.Text) + 10);
    updateVol(GridRoom.Cells[0,GridRoom.Row], EdVol.Text);
  end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton13Click(Sender: TObject);
begin
  if EdPitch.IntValue > -5 then
  begin
    EdPitch.Text := IntToStr(StrToInt(EdPitch.Text) - 1);
    updatePitch(GridRoom.Cells[0,GridRoom.Row], EdPitch.Text);
  end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton14Click(Sender: TObject);
begin
  if EdPitch.IntValue < 5 then
  begin
    EdPitch.Text := IntToStr(StrToInt(EdPitch.Text) + 1);
    updatePitch(GridRoom.Cells[0,GridRoom.Row], EdPitch.Text);
  end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton1Click(Sender: TObject);
var i : integer;
begin
if getGridChecked then
begin
  if isSaved then
  begin
    for i := 1 to gridSong.RowCount - 1 do
      gridSong.SetCheckBoxState(5, i, false);
    loadNowPlaying(GridRoom.Cells[0,GridRoom.Row]);
  end;
end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton3Click(Sender: TObject);
begin
  loadSongList;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton4Click(Sender: TObject);
var idlama, idbaru,maxrec : integer;
begin
  OpenSQL(DM._RecordSet, 'select max(IDNP) as maxrec from now_playing');
  maxrec:=dm._RecordSet.FieldByName('maxrec').AsInteger;

  if not dm.now_playing.IsEmpty then
  begin
    idlama:=dm.now_playing.FieldByName('IDNP').Value;
    if dm.now_playing.RecNo<dm.now_playing.RecordCount then
    begin
      dm.now_playing.Next;
      idbaru:=dm.now_playing.FieldByName('IDNP').Value;

      ExecSQL(DM.Buffer, 'update now_playing set IDNP='+IntToStr(maxrec+1000)+
      ' where IDNP='+IntToStr(idbaru)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');

      ExecSQL(DM._RecordSet,'update now_playing set IDNP='+IntToStr(idbaru)+', state=2 '+
      ' where IDNP='+IntToStr(idlama)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');

      ExecSQL(DM.Buffer, 'update now_playing set IDNP='+
      IntToStr(idlama)+' where IDNP='+IntToStr(maxrec+1000)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');
    end;
    loadNowPlaying(GridRoom.Cells[0, gridroom.Row]);
    dm.now_playing.Locate('IDNP', idbaru, []);
end;
end;


procedure TFrmRemoteRoom.spSkinSpeedButton5Click(Sender: TObject);
begin
  if not DM.now_playing.IsEmpty then begin
    ExecSQL(DM.Buffer,'delete from now_playing where IDNP='+DM.now_playing.FieldByName('IDNP').AsString);
    loadNowPlaying(GridRoom.Cells[0,GridRoom.Row]);
  end;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton6Click(Sender: TObject);
begin
  dm.now_playing.Refresh;
end;

procedure TFrmRemoteRoom.spSkinSpeedButton7Click(Sender: TObject);
var  maxrec, idLama, idBaru : integer;
begin
  OpenSQL(dm._RecordSet,'select max(IDNP) as maxrec from now_playing');
  maxrec:=dm._RecordSet.FieldByName('maxrec').AsInteger;

  if not dm.now_playing.IsEmpty then
  begin
    idlama:=dm.now_playing.FieldByName('IDNP').Value;
    if dm.now_playing.RecNo>1 then
    begin
      dm.now_playing.Prior;
      idbaru:=dm.now_playing.FieldByName('IDNP').Value;

      ExecSQL(DM._RecordSet,'update now_playing set IDNP='+IntToStr(maxrec+1000)+
      ' where IDNP='+IntToStr(idbaru)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');

      ExecSQL(DM._RecordSet,'update now_playing set IDNP='+IntToStr(idbaru)+', state=2 '+
      ' where IDNP='+IntToStr(idlama)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');

      ExecSQL(DM._RecordSet,'update now_playing set IDNP='+
      IntToStr(idlama)+' where IDNP='+IntToStr(maxrec+1000)+' and room='''+GridRoom.Cells[0, gridRoom.Row]+'''');
    end;
  end;
  loadNowPlaying(GridRoom.Cells[0, gridroom.Row]);
  dm.now_playing.Locate('IDNP', idbaru, []);
end;

procedure TFrmRemoteRoom.spSkinSpeedButton8Click(Sender: TObject);
begin
if not (DM.now_playing.IsEmpty )then
  begin
    ExecSQL(DM._RecordSet,'update now_playing set state=0 where room='+QuotedStr(GridRoom.Cells[0, gridRoom.Row]));
    ExecSQL(DM._RecordSet,'update now_playing set state=1 where IDNP='+DM.now_playing.FieldByName('IDNP').AsString);
  end
  else
    Alert(MSG_NO_DATA);
end;

procedure TFrmRemoteRoom.spSkinSpeedButton9Click(Sender: TObject);
begin
  ExecSQL(DM._RecordSet,'update now_playing set state=0 where room='+QuotedStr(GridRoom.Cells[0, gridRoom.Row]));
  ExecSQL(DM._RecordSet,'update now_playing set state=5 where IDNP='+DM.now_playing.FieldByName('IDNP').AsString)
end;

procedure TFrmRemoteRoom.updatePitch(ARoom, AVol: String);
begin
  ExecSQL(DM.Buffer,'update room set pitch='+AVol+' where id_room='+QuotedStr(ARoom));
end;

procedure TFrmRemoteRoom.updateVol(ARoom, AVol: String);
begin
  ExecSQL(DM.Buffer,'update room set vol='+AVol+' where id_room='+QuotedStr(ARoom));
end;

end.
