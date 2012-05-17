unit uListHari;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinCtrls, SkinBoxCtrls, AdvGlowButton;

type
  TFrmListHari = class(TForm)
    ListBoxHari: TspSkinCheckListBox;
    BtnOK: TAdvGlowButton;
    procedure FormShow(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure ListBoxHariClickCheck(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmListHari: TFrmListHari;

implementation

uses uDM, uBiayaRoom;

{$R *.dfm}

procedure TFrmListHari.BtnOKClick(Sender: TObject);
var i : byte;
begin
  DM.FListHari := TStringList.Create;
  with DM.FListHari do
  begin
     Clear;
     FrmBiayaRoom.Hari.Clear;
     for i := 1 to ListBoxHari.Items.Count - 1 do
     begin
        if ListBoxHari.Checked[i] = true then
        begin
          Add(IntToStr(i));
          FrmBiayaRoom.Hari.Text := FrmBiayaRoom.Hari.Text +ListBoxHari.Items.Strings[i]+ ',';
        end;
     end;
  end;
end;

procedure TFrmListHari.FormShow(Sender: TObject);
begin
  With ListBoxHari do
  begin
    Clear;
    Items.Add('SEMUA HARI');
    Items.Add('MINGGU');
    Items.Add('SENIN');
    Items.Add('SELASA');
    Items.Add('RABU');
    Items.Add('KAMIS');
    Items.Add('JUMAT');
    Items.Add('SABTU');
  end;
end;

procedure TFrmListHari.ListBoxHariClickCheck(Sender: TObject);
var i : byte;
begin
  if ListBoxHari.ItemIndex = 0 then
    for i := 1 to ListBoxHari.Items.Count - 1 do      
      ListBoxHari.Checked[i] := ListBoxHari.Checked[0];
end;

end.
