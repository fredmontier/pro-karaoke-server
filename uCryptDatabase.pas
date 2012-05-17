unit uCryptDatabase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DynamicSkinForm, uDM, spSkinShellCtrls, SkinCtrls, SkinBoxCtrls,
  spfilectrl, StdCtrls, Mask, Buttons, FileCtrl, ComCtrls, RzTreeVw, RzFilSys,
  RzButton, RzRadChk, StrUtils, uTPLb_Codec,
  uTPLb_BaseNonVisualComponent, uTPLb_CryptographicLibrary, uTPLb_Hash,
  uTPLb_Signatory, uTPLb_OpenSSL, ExtCtrls;

  type
  TOperation = (opIdle, opSymetricEncrypt, opSymetricDecrypt,
      opSymetricCompare, opScribble, opCustomBlockSymetricEncrypt,
      opCustomBlockSymetricDecrypt, opRSAGen, opRSAEncrypt,
      opRSADecrypt, opSign, opVerify, opHash, opOpenSSL);

  TFrmCryptDatabase = class(TForm)
    spDynamicSkinForm1: TspDynamicSkinForm;
    btnLoadDir: TspSkinButton;
    FileListBox1: TspSkinFileListBox;
    spSkinButton1: TspSkinButton;
    DS: TRzDirectoryTree;
    spSkinStdLabel1: TspSkinStdLabel;
    CheckBox1: TRzCheckBox;
    CheckBox2: TRzCheckBox;
    ServerDir: TspSkinDirectoryEdit;
    spSkinStdLabel2: TspSkinStdLabel;
    pbarCustom: TProgressBar;
    rgCustomBlockChain: TRadioGroup;
    Signatory1: TSignatory;
    Sig: TOpenSSL_Signatory;
    codecRSA: TCodec;
    codecCustomBlock: TCodec;
    codecMainDemo: TCodec;
    ScribbleHash: THash;
    StringHash: THash;
    CryptographicLibrary1: TCryptographicLibrary;procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLoadDirClick(Sender: TObject);
    procedure spSkinButton1Click(Sender: TObject);
    procedure DSClick(Sender: TObject);
  private
    { Private declarations }
    FOp: TOperation;
//    FCountBytesProcessed: int64;
//    FEstimatedWorkLoad: int64;
    FdidPressAbortEncrypt: boolean;
    FScribblePad_EntropyBag: TStream;
    FBusyObj: TObject; // TBusy
    FSaveCursor: TCursor;
    pressedAbortHash: boolean;

    procedure SetOp( NewOp: TOperation);
    function  Busy: IInterface;
    procedure ChangeBusy( isEntering: boolean);
    function GetVol(AVol: String): String;
    procedure startEncrypt;
  public
    { Public declarations }
    property CurrentOperation: TOperation   read FOp write SetOp;
  end;

var
  FrmCryptDatabase: TFrmCryptDatabase;

implementation

uses uTPLb_Constants, uDemoBlockModeCipher;

{$R *.dfm}

procedure TFrmCryptDatabase.btnLoadDirClick(Sender: TObject);
begin
  startEncrypt;
end;

type TBusy = class( TInterfacedObject)
  private
    FOwner: TFrmCryptDatabase;
  public
    constructor Create( Owner1: TFrmCryptDatabase);
    destructor Destroy; override;
  end;

function TFrmCryptDatabase.Busy: IInterface;
begin
result := nil;
if Supports( FBusyObj, IInterface, result) then exit;
TBusy.Create( self);
Supports( FBusyObj, IInterface, result)
end;

procedure TFrmCryptDatabase.ChangeBusy(isEntering: boolean);
begin
if isEntering then
    begin
    FSaveCursor   := Screen.Cursor;
    Screen.Cursor := crHourGlass
    end
  else
    Screen.Cursor := FSaveCursor
end;

procedure TFrmCryptDatabase.DSClick(Sender: TObject);
begin
  FileListBox1.Directory := DS.Directory;
end;

procedure TFrmCryptDatabase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := caFree;
end;

function TFrmCryptDatabase.GetVol(AVol:String) : String;
begin
  if AVol = 'L' then Result := 'LEFT';
  if AVol = 'R' then Result := 'RIGHT';
  if AVol = 'S' then Result := 'STEREO';
end;

procedure TFrmCryptDatabase.SetOp(NewOp: TOperation);
begin
if FOp = NewOp then exit;
FOp := NewOp;
if FOp <> opIdle then
    begin
    pbarCustom  .Max := 0
    end
  else
    begin
    // tbd
    end;
end;

procedure TFrmCryptDatabase.spSkinButton1Click(Sender: TObject);
begin
  Close;
end;

const
  ChainIds: array[ 0..6 ] of string = (
   ECB_ProgId, CBC_ProgId, PCBC_ProgId, CFB_ProgId,
   CFB8bit_ProgId, CTR_ProgId, OFB_ProgId);

procedure TFrmCryptDatabase.startEncrypt;
begin
Busy;
CurrentOperation   := opCustomBlockSymetricEncrypt;
FdidPressAbortEncrypt := False;
codecCustomBlock.StreamCipherId := BlockCipher_ProgId;
codecCustomBlock.ChainModeId    :=  ChainIds[ rgCustomBlockChain.ItemIndex];
codecCustomBlock.BlockCipherId  := DemoProgId;
codecCustomBlock.Password := '123qweasdzxc';
codecCustomBlock.EncryptFile(Concat(DS.Directory,'\', FileListBox1.Items[FileListBox1.ItemIndex])
, Concat(ServerDir.Text,'\', FileListBox1.Items[FileListBox1.ItemIndex]));
//if codecCustomBlock.isUserAborted then
//    Log( 'Encryption operation aborted by user.')
//  else
//    LogFmt( 'Encryption succeeded. %d bytes processed.',
//            [codecCustomBlock.CountBytesProcessed]);
codecCustomBlock.Reset;
CurrentOperation := opIdle;
end;



{ TBusy }

constructor TBusy.Create(Owner1: TFrmCryptDatabase);
begin
FOwner := Owner1;
FOwner.FBusyObj := self;
FOwner.ChangeBusy( True)
end;

destructor TBusy.Destroy;
begin
  FOwner.FBusyObj := nil;
  FOwner.ChangeBusy( False);
  inherited;
end;

end.
