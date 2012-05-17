unit uSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, SkinCtrls,
  SkinBoxCtrls, RzPanel, RzRadGrp, spDialogs, AdvGlowButton, StrUtils, AdvObj,
  AdvEdBtn, Mask;

type
  TFrmSetting = class(TForm)
    Panel1: TPanel;
    grid: TAdvStringGrid;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    BtnSave: TRzBitBtn;
    BtnCancel: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzSeparator1: TRzSeparator;
    RzSeparator2: TRzSeparator;
    spSkinPanel1: TspSkinPanel;
    ThemeServer: TspSkinComboBox;
    ThemePlayer: TspSkinComboBox;
    Label4: TLabel;
    Label5: TLabel;
    PanelSetting: TspSkinPanel;
    spSkinPanel3: TspSkinPanel;
    VolumePlayer: TspSkinCheckRadioBox;
    ScreenSaver: TspSkinCheckRadioBox;
    KeyHandling: TspSkinCheckRadioBox;
    TimerSetting: TspSkinCheckRadioBox;
    PromoPlayer: TspSkinCheckRadioBox;
    PindahRoom: TspSkinComboBox;
    Label3: TLabel;
    MaxOrderTime: TAdvEdit;
    FontDialog: TspSkinFontDialog;
    AdvGlowButton1: TAdvGlowButton;
    FontType: TAdvEdit;
    FontSize: TAdvEdit;
    spSkinPanel2: TspSkinPanel;
    LabelSample: TLabel;
    Lokasi: TAdvEditBtn;
    IpServerVideo: TspSkinEdit;
    spSkinStdLabel1: TspSkinStdLabel;
    Ppn: TAdvEdit;
    spSkinStdLabel2: TspSkinStdLabel;
    Service: TAdvEdit;
    spSkinStdLabel3: TspSkinStdLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoomTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RzButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn5Click(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnNewClick(Sender: TObject);
    procedure RoomTypeClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure gridClick(Sender: TObject);
    procedure gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure LokasiClickBtn(Sender: TObject);
    procedure LokasiKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure initForm;
    Procedure initGrid;
    Procedure LoadData(ID: String);
    Procedure LoadFromData(ID: String);
    procedure setEnableDisable;
    procedure lookupRoomType;

    function isValid: boolean;
    function isSaved: boolean;
    function getMaxRoom: integer;
    function cs(cb: TspSkinCheckRadioBox): char;
    function gs(cb: TspSkinCheckRadioBox): integer;
  public
    { Public declarations }
  end;

var
  FrmSetting: TFrmSetting;
CONST
  colNO               = 0;
  colID               = 1;
  colFontName         = 2;
  colFontSize         = 3;
  colSkinServerIndex  = 4;
  colSkinPlayerIndex  = 5;
  colKeyHandling      = 6;
  colDefaultVolume    = 7;
  colScreenSaver      = 8;
  colTimer            = 9;
  colShowPromo        = 10;
  colPindahRoom       = 11;
  colMaxFoodOrderTime = 12;
  colPpn              = 13;
  colActive           = 14;

implementation

{$R *.dfm}

function TFrmSetting.cs(cb: TspSkinCheckRadioBox): char;
begin
  if cb.Checked then
    Result := '1'
  else
    Result := '0';
end;

procedure TFrmSetting.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmSetting.FormCreate(Sender: TObject);
begin
  Width := Screen.Width;
  Height := Screen.Height;
end;

procedure TFrmSetting.FormShow(Sender: TObject);
begin
  LoadData('');
  lookupRoomType;
end;

function TFrmSetting.getMaxRoom: integer;
begin
  OpenSQL(DM.Buffer, 'select count(id_room) from room');
  if DM.Buffer.RecordCount > 0 then
    Result := DM.Buffer.Fields[0].AsInteger
  else
    Result := 0;
end;

procedure TFrmSetting.gridCanEditCell(Sender: TObject; ARow, ACol: Integer;
  var CanEdit: Boolean);
begin
  if ACol <> colActive then
    CanEdit := False;
end;

procedure TFrmSetting.gridClick(Sender: TObject);
begin
  if grid.Col = colActive then
  begin
    if Confirm('Aktifkan setting ?') then
    begin
      ExecSQL(DM.Buffer,'update setting set active=0');
      ExecSQL(DM.Buffer,'update setting set active=1 where id='+
        grid.Cells[colID, grid.Row]);
      Inform('Setting akan berfungsi setelah aplikasi di restart');
    end;
    LoadData('');
  end;
end;

procedure TFrmSetting.gridDblClick(Sender: TObject);
begin
  LoadFromData(grid.Cells[colId, grid.Row]);
end;

procedure TFrmSetting.gridGetEditorType(Sender: TObject; ACol, ARow: Integer;
  var AEditor: TEditorType);
begin
  if ACol in [colActive] then
    AEditor := edButton;
end;

function TFrmSetting.gs(cb: TspSkinCheckRadioBox): integer;
begin
  case Result of
    0 : cb.Checked := true;
    1 : cb.Checked := false;
  end;
end;

procedure TFrmSetting.initForm;
begin
  PanelSetting.Tag := 0;
  LabelSample.Caption := 'Hello World !';
  lookupRoomType;
  initGrid;
end;

procedure TFrmSetting.initGrid;
var i : integer;
begin
  with grid do
  begin
    Clear;
    RowCount                    := 3;
    FixedRows                   := 2;
    ColCount                    := colActive +2;
    MergeCells(colNO,0,1,2);
    Cells[colNO,0]              :='No';
    MergeCells(colID,0,1,2);
    Cells[colID,0]              :='ID';
    MergeCells(colFontName,0,colFontName,1);
    Cells[colFontSize,0]        :='Font';
    Cells[colFontName,1]        :='Type';
    Cells[colFontSize,1]        :='Size';
    MergeCells(colSkinServerIndex,0,2,1);
    Cells[colSkinPlayerIndex,0] :='Theme';
    Cells[colSkinServerIndex,1] :='Server';
    Cells[colSkinPlayerIndex,1] :='Player';
    Cells[colKeyHandling,0]     :='Key Handling';
    Cells[colDefaultVolume,0]   :='Volume';
    Cells[colScreenSaver,0]     :='Screen Saver';
    Cells[colTimer,0]           :='Timer';
    Cells[colShowPromo,0]       :='Promo';
    Cells[colPindahRoom,0]      :='Pindah Room';
    Cells[colMaxFoodOrderTime,0]:='Max Order Time';
    Cells[colPpn,0]             :='Ppn (%)';
    Cells[colActive,0]          :='Active';
    for i := 0 to ColCount -1 do
    begin
      WordWraps[i ,1];
      Alignments[i ,0] := taCenter;
      Alignments[i ,1] := taCenter;
      if i >= colKeyHandling then
        MergeCells(i,0,1,2);      
    end;
    AutoSize := true
  end;
end;

function TFrmSetting.isSaved: boolean;
begin
  try
    if PanelSetting.Tag = 0 then
    ExecSQL(DM.Buffer, 'insert into setting (KeyHandling, MaxFoodOrderTime, FontName, '+
    'FontSize, DefaultVolume, ScreenSaver, Timer, PindahRoom, ShowPromo, SkinServerIndex,'+
    'SkinPlayerIndex, id_lokasi,IpVideo, ppn, charge) '+
    'values ('+cs(KeyHandling)+','+MaxOrderTime.Text+','''+FontType.Text+''','+FontSize.Text+','+
    cs(VolumePlayer)+','+cs(ScreenSaver)+','+cs(TimerSetting)+','+IntToStr(PindahRoom.ItemIndex)+','+
    cs(PromoPlayer)+','+IntToStr(ThemeServer.ItemIndex)+','+IntToStr(ThemePlayer.ItemIndex)+','+
    IntToStr(Lokasi.Tag)+','+QuotedStr(IpServerVideo.Text)+','+Ppn.Text+','+Service.Text+')')
    else
    ExecSQL(DM.Buffer, 'update setting set '+
    'KeyHandling='+cs(KeyHandling)+','+
    'MaxFoodOrderTime='+MaxOrderTime.Text+','+
    'FontName='''+FontType.Text+''','+
    'FontSize='+FontSize.Text+','+
    'DefaultVolume='+cs(VolumePlayer)+','+
    'ScreenSaver='+cs(ScreenSaver)+','+
    'Timer='+cs(TimerSetting)+','+
    'PindahRoom='+IntToStr(PindahRoom.ItemIndex)+','+
    'ShowPromo='+cs(PromoPlayer)+','+
    'SkinServerIndex='+IntToStr(ThemeServer.ItemIndex)+','+
    'SkinPlayerIndex='+IntToStr(ThemePlayer.ItemIndex)+', '+
    'charge='+Service.Text+', '+
    'ppn='+Ppn.Text+', '+
    'IpVideo='+QuotedStr(IpServerVideo.Text)+' '+
    'where id='+IntToStr(PanelSetting.Tag) );
    LoadData('');
    Inform(MSG_SAVE_SUCCES);

  except
    Alert(MSG_SAVE_UNSUCCES);
  end;
end;

function TFrmSetting.isValid: boolean;
begin
  Result:= False;
  if CekInput(Result, FontType.Text <> '', 'Type Font belum diisi.', FontType) then
  if CekInput(Result, FontSize.Text <> '', 'Size Font belum diisi.', FontSize) then
  if CekInput(Result, ThemeServer.Text <> '', 'Theme Server belum diisi.', ThemeServer) then
  if CekInput(Result, ThemePlayer.Text <> '', 'Theme Player belum diisi.', ThemePlayer) then
  if CekInput(Result, PindahRoom.Text <> '', 'Pindah Room belum diisi.', PindahRoom) then
     CekInput(Result, MaxOrderTime.Text <> '', 'Max Food Order Time belum diisi.', MaxOrderTime);
end;

procedure TFrmSetting.LoadData(ID: String);
  function conv(AVar: integer): String;
  begin
    if AVar = 1 then
      Result := 'Ya'
      else Result := 'Tidak';
  end;
var i : integer;
begin
  initForm;

  OpenSQL(DM.Buffer , 'select * from setting');

  if DM.Buffer.RecordCount > 0 then
  begin
    with grid do
    begin
       for i := 1 to DM.Buffer.RecordCount do
       begin
          RowCount                           := 3 + i;
          Ints[colNO, i +1]                  := i;
          Cells[colID, i +1]                 := DM.Buffer.Fields[0].AsString;
          Cells[colFontName, i +1]           := DM.Buffer.Fields[3].AsString;
          Cells[colFontSize, i +1]           := DM.Buffer.Fields[5].AsString;
          Cells[colSkinServerIndex, i +1]    := dm.SkinList1.Skins.Items[DM.Buffer.Fields[11].AsInteger].CompressedFileName;
          Cells[colSkinPlayerIndex, i +1]    := dm.SkinList1.Skins.Items[DM.Buffer.Fields[12].AsInteger].CompressedFileName;
          Cells[colDefaultVolume, i +1]      := conv(DM.Buffer.Fields[6].Value);
          Cells[colKeyHandling, i +1]        := conv(DM.Buffer.Fields[1].Value);
          Cells[colScreenSaver, i +1]        := conv(DM.Buffer.Fields[7].Value);
          Cells[colTimer, i +1]              := conv(DM.Buffer.Fields[8].Value);
          Cells[colShowPromo, i +1]          := conv(DM.Buffer.Fields[10].Value);
          Cells[colPindahRoom, i +1]         := IfThen(DM.Buffer.Fields[9].AsInteger=0,'HARGA ROOM BARU','HARGA SEPARUH-SEPARUH');
          Floats[colMaxFoodOrderTime, i +1]  := DM.Buffer.Fields[2].AsFloat;
          Cells[colPpn, i +1]                := DM.Buffer.Fields[16].AsString;
          AddCheckBox(colActive, i +1, DM.Buffer.Fields[17].Value=1, false);
          DM.Buffer.Next;
       end;
    AutoSize := True;
    end;
//    LbInfo.Caption := 'JUMLAH ROOM = '+IntToStr(DM.Buffer.RecordCount);
  end;
//  initGrid;

end;

procedure TFrmSetting.LoadFromData(ID: String);
begin
  OpenSQL(DM.Buffer , 'select * from setting where ID='+ID);
  if DM.Buffer.RecordCount > 0 then
  begin
    with dm.Buffer do
    begin
      FontType.Text := Fields[3].AsString;
      FontSize.Text := Fields[5].AsString;
      LabelSample.Font.Size := Fields[5].AsInteger;
      ThemeServer.ItemIndex := Fields[11].AsInteger;
      ThemePlayer.ItemIndex := Fields[12].AsInteger;
      VolumePlayer.Checked := Fields[6].AsInteger = 1;
      KeyHandling.Checked := Fields[1].Value = 1;
      ScreenSaver.Checked  := Fields[7].AsInteger = 1;
      TimerSetting.Checked  := Fields[8].AsInteger = 1;
      PromoPlayer.Checked  := Fields[10].AsInteger = 1;
      PindahRoom.ItemIndex := Fields[9].AsInteger;
      MaxOrderTime.Text := Fields[2].AsString;
      Lokasi.Tag := Fields[13].AsInteger;
      Lokasi.Text := getStrFromSQL(DM._RecordSet,'select lokasi from location where id='+Fields[13].AsString);
      IpServerVideo.Text := Fields[14].AsString;
      Ppn.Text := Fields[16].AsString;
      Service.Text := Fields[17].AsString;
      PanelSetting.Tag := Fields[0].AsInteger;
    end;
  end else
    initForm;
  setEnableDisable;
end;

procedure TFrmSetting.LokasiClickBtn(Sender: TObject);
begin
  OpenSQL(DM.Lookup,'select ID, Lokasi from location order by lokasi');
  LoadFormLookup;
  Lokasi.Text := DM.Lookup.Fields[1].AsString;
  Lokasi.Tag := DM.Lookup.Fields[0].AsInteger;
end;

procedure TFrmSetting.LokasiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_f2 then
    LokasiClickBtn(Sender);
end;

procedure TFrmSetting.lookupRoomType;
var i : integer;
begin
  ThemeServer.Items.Clear;
  ThemePlayer.Items.Clear;
  for i := 0 to dm.SkinList1.Skins.Count -1 do
  begin
    ThemeServer.Items.Add(dm.SkinList1.Skins.Items[i].CompressedFileName);
    ThemePlayer.Items.Add(dm.SkinList1.Skins.Items[i].CompressedFileName);
  end;
end;

procedure TFrmSetting.RoomTypeClick(Sender: TObject);
begin
//  if RoomType.ItemIndex = 0 then
//  begin
//    OpenSQL(DM.Lookup, 'select nama as Kategori,rate as Harga, Discount  from room_kategory');
//    LoadFormLookup;
//    lookupRoomType;
//  end;
end;

procedure TFrmSetting.RoomTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
     SelectNext(ActiveControl, true, true);
end;
                             
procedure TFrmSetting.BtnSaveClick(Sender: TObject);
begin
  if (isValid) //and (getMaxRoom < 181)
   then isSaved;
end;

procedure TFrmSetting.AdvGlowButton1Click(Sender: TObject);
begin
  if FontDialog.Execute then
  begin
    FontType.Text := FontDialog.Font.Name;
    FontSize.Text := IntToStr(FontDialog.Font.Size);
//    LabelSample.Caption := 'Hello World !';
    LabelSample.Font.Name := FontDialog.Font.Name;
    LabelSample.Font.Size := FontDialog.Font.Size;
  end;
end;

procedure TFrmSetting.BtnCancelClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmSetting.BtnDeleteClick(Sender: TObject);
begin
  if Confirm(MSG_CONFIRM_DELETE) then
  begin
//    ExecSQL(DM.Buffer, 'delete from room where id_room='+QuotedStr(RoomID.Text));
  end;
end;

procedure TFrmSetting.BtnEditClick(Sender: TObject);
begin
  LoadFromData(grid.Cells[colID, grid.Row]);
end;

procedure TFrmSetting.RzBitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmSetting.BtnNewClick(Sender: TObject);
begin
  initForm;
end;

procedure TFrmSetting.RzButton5Click(Sender: TObject);
begin
  close;
end;

procedure TFrmSetting.setEnableDisable;
begin
//  RoomID.ReadOnly := (RoomID.Tag = 1);
//  BtnEdit.Enabled := (RoomID.Tag = 0);
//  BtnCancel.Enabled := (RoomID.Tag > 0);
//  BtnDelete.Enabled := (RoomID.Tag > 0);

end;

end.
