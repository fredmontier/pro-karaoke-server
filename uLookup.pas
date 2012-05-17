unit uLookup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, AdvEdit, AdvCombo,
  RzLabel, RzButton, uDM, DB, MemDS, DBAccess, Uni, RzBckgnd, SkinCtrls,
  SkinGrids, spDBGrids, uFlash, AdvGlowButton, spdbctrls, DynamicSkinForm;

type
  TFrmLookup = class(TForm)
    Panel1: TPanel;
    RzLabel2: TRzLabel;
    RzLabel1: TRzLabel;
    DataSource1: TDataSource;
    spSkinPanel1: TspSkinPanel;
    spSkinDBGrid1: TspSkinDBGrid;
    spSkinDBNavigator1: TspSkinDBNavigator;
    spDynamicSkinForm1: TspDynamicSkinForm;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spSkinDBGrid1DblClick(Sender: TObject);
    procedure spSkinDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLookup: TFrmLookup;

implementation

{$R *.dfm}

procedure TFrmLookup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.Lookup.ReadOnly := False;
  Action := caFree;
end;

procedure TFrmLookup.spSkinDBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOk;
//  close;
end;

procedure TFrmLookup.spSkinDBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
    spSkinDBGrid1DblClick(Sender);
end;

end.
