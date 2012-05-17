unit uEditVideo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, StrUtils,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, AdvCGrid, spSkinShellCtrls, uDM,xVideo,
  SkinCtrls, StdCtrls, Mask, SkinBoxCtrls, DynamicSkinForm, ccedlink, ComCtrls,
  ExtCtrls, Menus, SkinMenus, RzTabs, RzPanel;

type
  TFrmEditVideo = class(TForm)
    OD: TspSkinOpenDialog;
    ColumnComboEditLink3: TColumnComboEditLink;
    Timer1: TTimer;
    spSkinPopupMenu1: TspSkinPopupMenu;
    Hapus1Baris1: TMenuItem;
    HapusSemuaBaris1: TMenuItem;
    spSkinStdLabel1: TspSkinStdLabel;
    spSkinStdLabel4: TspSkinStdLabel;
    grid: TAdvStringGrid;
    btnPlay: TspSkinButton;
    btnStop: TspSkinButton;
    ServerDir: TspSkinDirectoryEdit;
    Posisi: TspSkinTrackBar;
    Volume1: TspSkinSlider;
    Panel1: TPanel;
    RBLeft: TRadioButton;
    RBRight: TRadioButton;
    RadioButton1: TRadioButton;
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    EdJudul: TEdit;
    EdArtis: TEdit;
    BtnSearch: TspSkinButton;
    gauge: TspSkinGauge;
    Label3: TLabel;
    BtnSave: TspSkinButton;
    RzGroupBox2: TRzGroupBox;
    LbJudul: TLabel;
    LbArtis: TLabel;
    LbKategori: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure gridKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnTransferClick(Sender: TObject);
    procedure gridGetEditorProp(Sender: TObject; ACol, ARow: Integer;
      AEditLink: TEditLink);
    procedure btnPlayClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PosisiLastChange(Sender: TObject);
    procedure Volume1Change(Sender: TObject);
    procedure RBLeftClick(Sender: TObject);
    procedure RBRightClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Hapus1Baris1Click(Sender: TObject);
    procedure HapusSemuaBaris1Click(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure Volume1Click(Sender: TObject);
  private
    { Private declarations }
    chan : HSTREAM;
    loaded : boolean;
    
    procedure initForm;
    procedure initGrid;
    procedure setColWidth;
    procedure LoadData;
    function isValid: boolean;
    function issaved: boolean;
    function getAttrib: byte;
    
    procedure startProgress;
    procedure prosessProgress(dataCount, progress: integer);
    procedure endProgress;

  public
    { Public declarations }
  end;

  PProgressbar = ^TProgressBar;

var
  FrmEditVideo: TFrmEditVideo;
  ARow: integer;
const
  colPath     = 1;
  colJudul    = 2;
  colJudul2   = 3;
  colArtis    = 4;
  colArtis2   = 5;
  colBahasa   = 6;
  colkategori = 7;
  colVol      = 8;
  colDir      = 9;
  colTmp      = 10;
//  colPlay     = 7;
//  colStop     = 8;
//  colPath     = 1;
//  colJudul    = 2;
//  colJudul2   = 3;
//  colArtis    = 4;
//  colArtis2   = 5;
//  colBahasa   = 6;
//  colkategori = 7;
//  colVol      = 8;

implementation

{$R *.dfm}

procedure TurboCopyFile(
  const
    SourceFile, (* the source file *)
    DestinationFile: String; (* destination file *)
  Display: PProgressbar (* this is a pointer to progress bar
    which we update if assigned,
    this procedure can be called without a
    progress bar like so:
    TurboCopyFile(Source, Destination, NIL); *)
  );
type
  (* define an array of 4096 bytes which holds the bytes *)
  TurboBuffer = array[1..4096] of Byte;
const
  (* we need to set the size of the buffer in a constant *)
  szBuffer = sizeof(TurboBuffer);
var
  (* File streams with which we work *)
  InStream,
  OutStream: TFileStream;
  (* we need this to store a logical operation's result *)
  CanCopy: Boolean;
  (* holds the number of bytes left when
     InStream.Size -InStream.Position < 4096 bytes *)
  BytesLeft: Integer;
  (* the Buffer almighty *)
  Buffer: TurboBuffer;
begin
  (* Open the source file so we can read it's bytes *)
  InStream := TFileStream.Create(SourceFile, fmOpenRead);
  (* create a new file to the desired destination *)
  OutStream := TFileStream.Create(DestinationFile, fmCreate);

  (* check if a progress bar was passed *)
  if Assigned(Display) then
    Display^.Max := InStream.Size;

  (* this is the operation I was talking about in the
     variable section, this checks if we can read a
     full buffer(4096 bytes) *)
  CanCopy :=
    (InStream.Size > InStream.Position) and
    ((InStream.Size -InStream.Position) >= szBuffer);

  (* this ensures that the progress bar is being painted *)
  Application.ProcessMessages;

  (* loop while we CanCopy *)
  while CanCopy do begin
    (* read 4096 bytes from source file *)
    InStream.ReadBuffer(Buffer, szBuffer);
    (* then write it to destination file *)
    OutStream.WriteBuffer(Buffer, szBuffer);
    (* check if display is assigned *)
    if Assigned(Display) then
      (* update it's position *)
      Display^.Position := InStream.Position;
    CanCopy :=
      (InStream.Size > InStream.Position) and
      ((InStream.Size -InStream.Position) >= szBuffer);
  end;

  (* store the number of bytes that is less than 4096 into
     a local variable *)
  BytesLeft := InStream.Size -InStream.Position;

  (* do we have some bytes left ? we don't care how many,
     we just know it's less than 4096 bytes *)
  if BytesLeft > 0 then begin
    (* surprise, or not we have some bytes left,
       read them all into the buffer *)
    InStream.ReadBuffer(Buffer, BytesLeft);
    (* write them to destination file *)
    OutStream.WriteBuffer(Buffer, BytesLeft);
  end;

  (* do we have a progress bar ? *)
  if Assigned(Display) then
    (* we do? then update it's progress *)
    Display^.Position := Display^.Max;

  (* free the memory *)
  FreeAndNil(InStream);
  FreeAndNil(OutStream);
end; (* end of TurboCopyFile *)


procedure TFrmEditVideo.endProgress;
begin
  gauge.Value := 0;
  Cursor := crDefault;  
end;

procedure TFrmEditVideo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmEditVideo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if chan<>0 then
    alert('Tidak bisa keluar ketika video sedang diputar.!');
  CanClose := chan = 0;
end;

procedure TFrmEditVideo.FormShow(Sender: TObject);
begin
  initForm;
end;

function TFrmEditVideo.getAttrib: byte;
begin
if RBRight.Checked = true then
  Result := 2 else
if RBLeft.Checked  then
  Result := 1 else
  Result := 0;
end;

procedure TFrmEditVideo.gridCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol IN [colJudul, colJudul2, colArtis, colArtis2, colBahasa, colkategori, colVol])
              and (loaded);
end;

procedure TFrmEditVideo.gridDblClick(Sender: TObject);
begin
  ARow := grid.GetRealRow;
  LbJudul.Caption := Concat('Judul    : ',grid.Cells[colJudul, ARow]);
  LbArtis.Caption := Concat('Artis    : ',grid.Cells[colArtis, ARow]);
  LbKategori.Caption := Concat('Kategori : ',grid.Cells[colkategori, ARow]);
  ServerDir.Text := grid.Cells[colDir, ARow]; 
end;

procedure TFrmEditVideo.gridGetEditorProp(Sender: TObject; ACol,
  ARow: Integer; AEditLink: TEditLink);
begin
  with grid do begin
    case ACol of
    colBahasa, colkategori :begin
        ClearComboString;
        if FileExists('lang.dat') then
          ComboBox.Items.LoadFromFile('lang.dat')
          else Alert('File lang.dat tidak ditemukan');
      end;
    colVol :begin
        ClearComboString;
        if FileExists('vol.dat') then
          ComboBox.Items.LoadFromFile('vol.dat')
          else Alert('File vol.dat tidak ditemukan');
      end;
    end;
  end;
end;

procedure TFrmEditVideo.gridGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  if (ACol in [colBahasa,colkategori,colVol]) then
    AEditor := edComboList;
end;

procedure TFrmEditVideo.gridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then begin
    if grid.Col = colPath then
    begin
      if OD.Execute then
        grid.Cells[colPath, grid.Row] := OD.FileName;
    end;
  end;
//  if key=vk_delete then
//    grid.RemoveNormalRow(grid.Row);
end;

procedure TFrmEditVideo.Hapus1Baris1Click(Sender: TObject);
begin
  if grid.Row = 1 then
  begin
//    initGrid;
    grid.ClearRows(grid.Row, 1);
  end
    else grid.RemoveNormalRow(grid.Row);
end;

procedure TFrmEditVideo.HapusSemuaBaris1Click(Sender: TObject);
begin
  grid.RemoveRowsEx(1, grid.RowCount);
  initGrid;
end;

procedure TFrmEditVideo.initForm;
begin
  EdJudul.Clear;
  EdArtis.Clear;
  startProgress;
  loaded := false;
  initGrid;
  startProgress;
  Panel1.SendToBack;
  grid.BringToFront;
end;

procedure TFrmEditVideo.initGrid;
begin
  with Grid do
  begin
    Clear;
    RowCount := 2;
    FixedRows := 1;
    ColCount :=  colTmp + 2;
    Cells[0, 0]           := 'No';
    Cells[colJudul, 0]    := 'Judul';
    Cells[colJudul2, 0]   := 'Judul 2';
    Cells[colArtis, 0]    := 'Artis';
    Cells[colArtis2, 0]   := 'Artis 2';
    Cells[colBahasa, 0]   := 'Bahasa';
    Cells[colkategori, 0] := 'Kategori';
    Cells[colVol, 0]      := 'Audio';
    Cells[colPath, 0]     := 'Pilih File Video (F2)';
    setColWidth;
  end;
end;

function TFrmEditVideo.issaved: boolean;
begin

end;

function TFrmEditVideo.isValid: boolean;
begin
Result:= False;
//  if CekInput(Result, RoomID.Text <> '', 'Kode Room belum diisi.', RoomID) then
  CekInput(Result, ServerDir.Text <> '', 'Direktori penyimpanan belum diisi.', ServerDir);
end;

procedure TFrmEditVideo.LoadData;
var i : integer;
begin
  OpenSQL(DM._RecordSet,'select Judul,Judul2,Artis,Artis2,Bahasa,Jenis,CASE VOLUME WHEN ''L'' THEN ''LEFT'' WHEN ''R'' THEN ''RIGHT'' ELSE ''STEREO'' END,'+
  ' CONCAT(Direktori,NamaFile) AS APath,Direktori,NamaFile FROM song_list '+
//  'where judul like ''%'+EdJudul.Text+'%'' AND ''%'+EdArtis.Text+'%'' order by judul');
  'where judul like ''%'+EdJudul.Text+'%'' AND artis LIKE ''%'+EdArtis.Text+'%'' order by judul');
  initGrid;
  loaded := true;
  startProgress;
  for i := 1 to DM._RecordSet.RecordCount do begin
    prosessProgress(DM._RecordSet.RecordCount, i);
    grid.RowCount := 1 +i;
    grid.Ints[0, i] := i;
    grid.Cells[colJudul, i] := DM._RecordSet.Fields[0].AsString;
    grid.Cells[colJudul2, i] := DM._RecordSet.Fields[1].AsString;
    grid.Cells[colArtis, i] := DM._RecordSet.Fields[2].AsString;
    grid.Cells[colArtis2, i] := DM._RecordSet.Fields[3].AsString;
    grid.Cells[colBahasa, i] := DM._RecordSet.Fields[4].AsString;
    grid.Cells[colkategori, i] := DM._RecordSet.Fields[5].AsString;
    grid.Cells[colVol, i] := DM._RecordSet.Fields[6].AsString;
    grid.Cells[colPath, i] := DM._RecordSet.Fields[7].AsString;
    grid.Cells[colDir, i] := DM._RecordSet.Fields[8].AsString;
    grid.Cells[colTmp, i] := DM._RecordSet.Fields[9].AsString;
    DM._RecordSet.Next;
  end;
  endProgress;
end;

procedure TFrmEditVideo.PosisiLastChange(Sender: TObject);
begin
  xVideo_ChannelSetPosition(chan,Posisi.Value,xVideo_POS_SEC);
end;

procedure TFrmEditVideo.prosessProgress(dataCount, progress: integer);
begin
  gauge.Value := Trunc( 100 / (dataCount /progress));
  Cursor := crSQLWait;
  Application.ProcessMessages;  
end;

procedure TFrmEditVideo.RadioButton1Click(Sender: TObject);
begin
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,getAttrib);
end;

procedure TFrmEditVideo.RBLeftClick(Sender: TObject);
begin
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,getAttrib);
end;

procedure TFrmEditVideo.RBRightClick(Sender: TObject);
begin
    xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,getAttrib);
end;

procedure TFrmEditVideo.setColWidth;
begin
with grid do
begin
  AutoSize := True;
  ColWidths[colPath]      := 0;
  ColWidths[colDir]       := 0;
  ColWidths[colTmp]       := 0;
  ColWidths[colJudul]     := 300;
  ColWidths[colArtis]     := 100;
  ColWidths[colBahasa]    := 0;
  ColWidths[colkategori]  := 100;
  ColWidths[colVol]       := 70;
end;
end;

procedure TFrmEditVideo.startProgress;
begin
  gauge.Value := 0;  
end;

procedure TFrmEditVideo.Timer1Timer(Sender: TObject);
begin
  Posisi.Value := round(xVideo_ChannelGetPosition(chan,xVideo_POS_SEC));
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_VOL,Volume1.Value);
end;

procedure TFrmEditVideo.Volume1Change(Sender: TObject);
begin
  Timer1.Enabled:=False;
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_VOL,Volume1.Value);
  Timer1.Enabled:=True;
end;

procedure TFrmEditVideo.Volume1Click(Sender: TObject);
begin
  ShowHint := true;
  Hint := Concat('Volume : ', IntToStr(Volume1.Value),' %');
end;

procedure TFrmEditVideo.btnPlayClick(Sender: TObject);
begin
  if chan<>0 then
  begin
   xVideo_StreamFree(chan);
   chan:=0;
  end;
  Chan :=xVideo_StreamCreateFile(PChar(grid.Cells[colPath, ARow]),0,
    {$IFDEF UNICODE}xVideo_UNICODE or xVideo_STREAM_AUTOFREE
    {$Else}xVideo_STREAM_AUTOFREE {$ENDIF});
  Posisi.MaxValue:=round(xVideo_ChannelGetLength(chan,xVideo_POS_SEC));
  xVideo_ChannelSetWindow(chan,Panel1.Handle);
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_ChanProcess,getAttrib);
  xVideo_ChannelSetAttribute(chan,xVideo_ATTRIB_VOL,Volume1.Value);
  xVideo_ChannelPlay(chan);
end;

procedure TFrmEditVideo.BtnSaveClick(Sender: TObject);
begin
  if ARow > 0 then begin
    ExecSQL(DM.Buffer,'update song_list set '+
    'judul='+QuotedStr(grid.Cells[colJudul, ARow])+
    ',artis='+QuotedStr(grid.Cells[colArtis, ARow])+
    ',bahasa='+QuotedStr(grid.Cells[colBahasa, ARow])+
    ',jenis='+QuotedStr(grid.Cells[colkategori, ARow])+
    ',volume='+QuotedStr(LeftStr(grid.Cells[colVol, ARow],1))+
    ' where NamaFile='+QuotedStr(grid.Cells[colTmp, ARow]));
    Inform(MSG_SAVE_SUCCES);
    ARow := 0;
  end
  else
    Alert('Belum ada data yang disimpan');
end;

procedure TFrmEditVideo.BtnSearchClick(Sender: TObject);
begin
  LoadData;
end;

procedure TFrmEditVideo.btnStopClick(Sender: TObject);
begin
  xVideo_ChannelStop(chan);
  xVideo_StreamFree(chan);
  chan := 0;
end;

procedure TFrmEditVideo.btnTransferClick(Sender: TObject);
var i : integer;
    ADir, NamaFile: String;
begin
if isValid then
begin
  try
    btnStopClick(Sender);
    startProgress;
    for i := 1 to grid.RowCount do
    begin
      if (grid.Cells[colJudul, i] <> '') or
      (grid.Cells[colArtis, i] <> '') or
      (grid.Cells[colPath, i] <> '') or
      (grid.Cells[colBahasa, i] <> '') or
      (grid.Cells[colKategori, i] <> '') or
      (grid.Cells[colVol, i] <> '') or
      (grid.Cells[colPath, i] <> '') then
      begin
        Application.ProcessMessages;
        prosessProgress(grid.RowCount, i);

  //      ADir := '\\\\192.168.1.1\\banklagu\\';
        NamaFile := grid.Cells[colJudul, i]+'#'+grid.Cells[colArtis, i]+'#'+grid.Cells[colBahasa, i]+
  //      '#'+grid.Cells[colVol, i]+ExtractFileExt(grid.Cells[colPath, i]);
        '#'+grid.Cells[colVol, i]+'.MPG';

        ExecSQL(DM.Buffer, 'insert into song_list (Judul,artis,bahasa,jenis,volume,NamaFile,Direktori) '+
        'values ('+QuotedStr(grid.Cells[colJudul, i])+','+QuotedStr(grid.Cells[colArtis, i])+','+
        QuotedStr(grid.Cells[colBahasa, i])+','+QuotedStr(grid.Cells[colKategori, i])+','+
        QuotedStr(LeftStr(grid.Cells[colVol, i],1))+','+QuotedStr(NamaFile)+','+
        QuotedStr(StringReplace(ServerDir.Text,'\','\\',[rfReplaceAll])+'\\') +')');
      end;
    end;
    Inform(MSG_SAVE_SUCCES);
    initForm;
  finally
    endProgress;
  end;
end;
end;

end.
