unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, In_Dohod, Tabl_Dohod, Tabl_Rashod, In_Rashod, Tabl_Zarplat,
  In_Zarplat, KontrAgent, Sotrudnik, QDohod, QRashod, About, jpeg, ExtCtrls, ShellAPI;

type
  TForm_Main = class(TForm)
    MainFormMenu: TMainMenu;
    dd1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N20: TMenuItem;
    N18: TMenuItem;
    procedure N13Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

procedure TForm_Main.N13Click(Sender: TObject);
begin
  //���� ������-������
  In_Dohodi.Show;
  Tabl_Dohodi.Dohodi_Table.Last;
end;

procedure TForm_Main.N6Click(Sender: TObject);
begin
  //������� - ������
  Tabl_Dohodi.Show;
end;

procedure TForm_Main.N7Click(Sender: TObject);
begin
  //������� - �������
  Tabl_Rashodi.Show;
end;



procedure TForm_Main.N14Click(Sender: TObject);
begin
 //���� ������ - �������
  In_Rashodi.Show;
  Tabl_Rashodi.Rashodi_Table.Last;
end;

procedure TForm_Main.N8Click(Sender: TObject);
begin
 //������� - ������� �����������
 Tabl_Zarplata.Show;
end;

procedure TForm_Main.N15Click(Sender: TObject);
begin
  //���� ������ - ������� �����������
  In_Zarplata.Show;
  Tabl_Zarplata.Zarplata_Table.Last;
end;

procedure TForm_Main.N11Click(Sender: TObject);
begin
  //������� ������ - �����������
  KontrAgenti.Show;
end;

procedure TForm_Main.N12Click(Sender: TObject);
begin
  //������� ������ - ����������
  Sotrudniki.Show;
end;



procedure TForm_Main.N18Click(Sender: TObject);
begin
  //������� - ������
  QDohodi.Show;
end;

procedure TForm_Main.N10Click(Sender: TObject);
begin
  //� ���������
  FormAbout.Show;
end;

procedure TForm_Main.N20Click(Sender: TObject);
begin
  //������� - �������
  QRashodi.Show;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TForm_Main.N9Click(Sender: TObject);
begin
   ShellExecute(Form_Main.Handle,nil,'spravka.doc',nil,nil,SW_RESTORE);
end;

end.
