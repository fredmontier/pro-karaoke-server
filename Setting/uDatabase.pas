unit uDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, StdCtrls, Registry, SkinData, DynamicSkinForm,
  SkinCtrls, spDialogs, spMessages, Winsock, StrUtils, ShellAPI;

type
  TForm1 = class(TForm)
    EdServer: TEdit;
    EdName: TEdit;
    EdUser: TEdit;
    AdvGlowButton1: TAdvGlowButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdPass: TEdit;
    EdRoomID: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdIpAddress: TEdit;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    spCompressedStoredSkin1: TspCompressedStoredSkin;
    SM: TspSkinMessage;
    Label7: TLabel;
    EdServerVideo: TEdit;
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmpVersiSelect(Sender: TObject);
  private
    { Private declarations }
    RegDatabase : TRegistry;
    procedure SetCmd(AServer, ALokal, AFile: String);
    procedure loadSetting;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  DATABASE_PATH : String;
implementation

{$R *.dfm}


procedure TForm1.AdvGlowButton1Click(Sender: TObject);
var AFile : String;
begin
  try
    try
    // Setting Batch File For Dump MySQL
      AFile := ExtractFilePath(Application.ExeName)+'MySQL Server 5.1\bin\importing.cmd';
      SetCmd(EdServer.Text, EdIpAddress.Text, AFile);
    //ShowMessage(cript(txtDbPwd.Text));
      RegDatabase := TRegistry.Create;
      RegDatabase.OpenKey('\Software\ProKaraoke', True);
      RegDatabase.WriteString('dbServer', EdServer.Text);
      RegDatabase.WriteString('dbName', EdName.Text);
      RegDatabase.WriteString('dbUser', EdUser.Text);
      RegDatabase.WriteString('dbPass', EdPass.Text);
      RegDatabase.WriteString('roomID', EdRoomID.Text);
      RegDatabase.WriteString('IpAddress', EdIpAddress.Text);
      RegDatabase.WriteString('ServerVideo', EdServerVideo.Text);
      RegDatabase.WriteInteger('DefaultScreenWidth', Screen.Width);
      RegDatabase.WriteInteger('DefaultScreenHeight', Screen.Height);
      SM.MessageDlg('Setting sukses disimpan', mtInformation, [mbOK], 0);
    except
      SM.MessageDlg('Setting gagal disimpan', mtError, [mbOK], 0);
    end;
  finally
    RegDatabase.CloseKey;
    RegDatabase.Free;
  end;
  Application.Terminate;
end;

procedure TForm1.cmpVersiSelect(Sender: TObject);
begin
  loadSetting;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  loadSetting;
end;

procedure TForm1.loadSetting;
var AHost, AIp, Aerr : String;
    RegDb : TRegistry;
begin
  EdServer.Clear;
  EdName.Clear;
  EdUser.Clear;
  EdPass.Clear;
  EdRoomID.Clear;
  EdServerVideo.Clear;
  try
    try
    //ShowMessage(cript(txtDbPwd.Text));
      RegDb := TRegistry.Create;
      RegDb.OpenKey('\Software\ProKaraoke', True);
      if Length(RegDb.ReadString('dbName')) = 0 then
        EdName.Text       := 'Integrated' else
      EdServer.Text     := RegDb.ReadString('dbServer');
      EdUser.Text       := RegDb.ReadString('dbUser');
      EdPass.Text       := RegDb.ReadString('dbPass');
      EdRoomID.Text     := RegDb.ReadString('roomID');
      if RegDb.ReadString('IpAddress')='' then
        EdIpAddress.Text := AIp else
        EdIpAddress.Text  := RegDb.ReadString('IpAddress');
      EdServerVideo.Text  := RegDb.ReadString('ServerVideo');
    except
    end;
  finally
    RegDb.CloseKey;
    RegDb.Free;
  end;
end;

procedure TForm1.SetCmd(AServer, ALokal, AFile: String);
  var P1, P2, OFile: String;
      AList : TStringList;
begin
//  OFile := ExtractFilePath(Application.ExeName)+'SongList.real';
//  OFile := StringReplace(OFile,'\','/', [rfReplaceAll]);
  OFile := 'SongList.real';
  P1 := 'mysqldump -h '+AServer+' -u root -p123qweasdzxc integrated song_list --default-character-set=utf8 > '+OFile;
  P2 := 'mysql -h '+ALokal+' -u root -p123qweasdzxc integrated --default-character-set=utf8 < '+OFile;
  AList := TStringList.Create;
  try
    DeleteFile(AFile);
    AList.Add(P1);
    AList.Add(P2);
    AList.SaveToFile(AFile);
  finally
    FreeAndNil(AList);
  end;
end;

end.
