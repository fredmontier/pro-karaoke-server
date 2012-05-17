unit uSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzStatus, uDM;

type
  TFrmSpalshScreen = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FrmSpalshScreen: TFrmSpalshScreen;

implementation

{$R *.dfm}

procedure TFrmSpalshScreen.FormCreate(Sender: TObject);
begin
  Width:= Image1.Width;
  Height:= Image1.Height;
  Screen.Cursor:= crHourGlass;
end;

procedure TFrmSpalshScreen.FormDestroy(Sender: TObject);
begin
  Cursor := crDefault;
end;

procedure TFrmSpalshScreen.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
end;

end.
