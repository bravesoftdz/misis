unit In_Dohod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Tabl_Dohod, ExtCtrls, ComCtrls;

type
  TIn_Dohodi = class(TForm)
    Dohod_KontrAgent: TDBEdit;
    Dohod_Name: TDBEdit;
    Dohod_Ed: TDBEdit;
    Dohod_Cena: TDBEdit;
    Dohod_Kolichestvo: TDBEdit;
    Label_Dohod_Data: TLabel;
    Label_Dohod_KontrAgent: TLabel;
    Label_Dohod_Name: TLabel;
    Label_Dohod_Ed: TLabel;
    Label_Dohod_Cena: TLabel;
    Label_Dohod_Kolichestvo: TLabel;
    Button_Add_Dohod: TButton;
    Dohod_Num: TDBEdit;
    Dohod_Data: TDateTimePicker;
    procedure Button_Add_DohodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  In_Dohodi: TIn_Dohodi;

implementation

uses DB, DBTables;

{$R *.dfm}

procedure TIn_Dohodi.Button_Add_DohodClick(Sender: TObject);
begin
     with Tabl_Dohodi.Dohodi_Table do
     begin
       FieldByName('Data').Value :=  In_Dohodi.Dohod_Data.Date;
       FieldByName('Summa').Value := StrToInt(In_Dohodi.Dohod_Cena.Text)*StrToInt(In_Dohodi.Dohod_Kolichestvo.Text);
       Post;
       Append;
       Post;
     end;

    
end;



end.
