unit uFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, AdvGlowButton, UDM, DynamicSkinForm;

type
  TFrmFilter = class(TForm)
    Label1: TLabel;
    dtpAwal: TDateTimePicker;
    Label2: TLabel;
    dtpAkhir: TDateTimePicker;
    BtnConfirn: TAdvGlowButton;
    BtnCancel: TAdvGlowButton;
    spDynamicSkinForm1: TspDynamicSkinForm;
    procedure BtnConfirnClick(Sender: TObject);
    procedure dtpAwalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpAkhirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dtpAkhirChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Execute: boolean;
  end;

var
  FrmFilter: TFrmFilter;

implementation

{$R *.dfm}

function FDOM(Date: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

procedure TFrmFilter.BtnConfirnClick(Sender: TObject);
begin
  DM.Awal := dtpAwal.DateTime;
  DM.Akhir := dtpAkhir.DateTime;
  ModalResult := mrOk;
end;

procedure TFrmFilter.dtpAkhirChange(Sender: TObject);
begin
  dtpAwal.Date := FDOM(dtpAkhir.DateTime);
end;

procedure TFrmFilter.dtpAkhirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    FocusControl(BtnConfirn);
end;

procedure TFrmFilter.dtpAwalKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    FocusControl(dtpAkhir);
end;

function TFrmFilter.Execute: boolean;
begin
  Self.ShowModal;
  Result := ModalResult=mrOk;
end;

procedure TFrmFilter.FormShow(Sender: TObject);
begin
  dtpAwal.Date := FDOM(serverNow);
  dtpAkhir.Date := serverNow;
  FocusControl(dtpAwal);
end;

end.
