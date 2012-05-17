unit uPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvGlowButton, SkinCtrls, SkinBoxCtrls, StdCtrls, UDM;

type
  TFrmPassword = class(TForm)
    edPass: TspSkinPasswordEdit;
    AdvGlowButton2: TAdvGlowButton;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecPassword(ID: byte): boolean;
  end;

var
  FrmPassword: TFrmPassword;

implementation

{$R *.dfm}

{ TFrmPassword }

function TFrmPassword.ExecPassword(ID: byte): boolean;
begin
  Result := false;
  self.ShowModal;
  if edPass.Text = 'mautauaja' then begin
    ModalResult := mrok;
    Result := true;
  end
  else Application.MessageBox('Password tidak dikenal','Ilegal Password', 0);
end;

procedure TFrmPassword.FormShow(Sender: TObject);
begin
  edPass.Clear;
  FocusControl(edPass);
end;

end.
