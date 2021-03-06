unit Password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Main;

type
  TPasswordForm = class(TForm)
    Edit_Pass: TEdit;
    Label1: TLabel;
    ButtonOK: TButton;
    Info: TLabel;
    EditNewPas: TEdit;
    Label2: TLabel;
    ButtonChange: TButton;
    ButtonNewPas: TButton;
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonChangeClick(Sender: TObject);
    procedure ButtonNewPasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordForm: TPasswordForm;

implementation

{$R *.dfm}
procedure Code(var text: string; password: string;
  decode: boolean); stdcall;
external 'Security.dll' name 'Code';

procedure TPasswordForm.ButtonOKClick(Sender: TObject);
var sPassword, sGetPas:string;
    PasFile: TextFile;
begin
   If FileExists('password')=false then Info.Caption:='���� � ������� �����������!'
   else
   begin
     sGetPas:=Edit_Pass.Text;
     AssignFile(PasFile,'password');
     Reset(PasFile);
     Readln(PasFile, sPassword);
     CloseFile(PasFile);
     Code(sPassword,'dis',true);
     If (sGetPas='') then Info.Caption:='������ ������ ������'
                    else if (sGetPas=sPassword) then
                                                begin
                                                   Form_Main.Show;
                                                   PasswordForm.Hide;
                                                end
                                                else Info.Caption:='������ �������!';
   end;
end;

procedure TPasswordForm.ButtonChangeClick(Sender: TObject);
begin
  ButtonChange.Visible:=false;
  EditNewPas.Visible:=true;
  Label2.Visible:=true;
  ButtonOK.Visible:=false;
  ButtonNewPas.Visible:=true;
end;

procedure TPasswordForm.ButtonNewPasClick(Sender: TObject);
var sPassword, sGetPas:string;
    PasFile: TextFile;
begin
If FileExists('password')=false then Info.Caption:='���� � ������� �����������!'
   else
   begin
     sGetPas:=Edit_Pass.Text;
     AssignFile(PasFile,'password');
     Reset(PasFile);
     Readln(PasFile, sPassword);
     CloseFile(PasFile);
     Code(sPassword,'dis',true);
     If (sGetPas='') then Info.Caption:='������ ������ ������'
                    else if (sGetPas=sPassword) then
                                                begin
                                                   If (EditNewPas.Text='') then Info.Caption:='����� ������ ������' else
                                                   begin
                                                     Rewrite(PasFile);
                                                     sPassword:=EditNewPas.Text;
                                                     Code(sPassword,'dis',false);
                                                     WriteLn(PasFile,sPassword);
                                                     CloseFile(PasFile);
                                                     Form_Main.Show;
                                                     PasswordForm.Hide;
                                                   end;
                                                end
                                                else Info.Caption:='������ �������!';
   end;
  ButtonChange.Visible:=true;
  EditNewPas.Visible:=false;
  Label2.Visible:=false;
  ButtonOK.Visible:=true;
  ButtonNewPas.Visible:=false;
end;

end.
