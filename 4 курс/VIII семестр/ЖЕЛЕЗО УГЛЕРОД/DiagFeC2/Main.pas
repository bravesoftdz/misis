unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, XPMan, GPainter, Points;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    procedure PaintBox1Paint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  TCoords = array of TCoord;

var
  Form1: TForm1;
  gp: TGraphicPainter;

implementation
{$R *.dfm}

function Polinom2(StartC,EndC:TCoord;a,b,c,step:Double):TCoords;
var Res:TCoords;
    n,i:integer;
begin
  n:=Trunc((EndC.X-StartC.X)/step);
  SetLength(Res,n+2);
  Res[0]:=StartC;
  for i := 1 to n do
    begin
       Res[i].X := StartC.X + i*step;
       Res[i].Y := a + b*(Res[i].X) + c*(Res[i].X)*(Res[i].X);
    end;
  Res[n+1]:=EndC;
  Result := Res;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  gp.isDrawNet := CheckBox1.Checked;
  gp.Repaint;
end;

procedure TForm1.FormCreate(Sender: TObject);
var step:Double;
begin
  gp := TGraphicPainter.Create(PaintBox1.Canvas);
  gp.SetXRange(0,6.7); //���������� �������� � %
  gp.SetYRange(600,1600); //�����������
  gp.SetSize(PaintBox1.Width,PaintBox1.Height);
  gp.SetSteps(0.5,100);
  step:=0.1;
  with gp do
  begin
    AddPolyLine('AB',Polinom2(
                      cA,
                      cB,
                      1539,
                      10.832,
                      -180.271,
                      step));
    AddPolyLine('BC',Polinom2(
                      cB,
                      cC,
                      1509,
                      -9.96,
                      -17.37,
                      step));
    AddPolyLine('IE',Polinom2(
                      cI,
                      cE,
                      1534,
                      -221.833,
                      18.984,
                      step));
    AddPolyLine('SE',Polinom2(
                      cS,
                      cE,
                      364.257,
                      507.971,
                      -66.707,
                      step));
    AddPolyLine('GS',Polinom2(
                      cG,
                      cS,
                      910.396,
                      -335.079,
                      133.99,
                      step));
    AddPolyLine('CD',Polinom2(
                      cC,
                      cD,
                      411.968,
                      253.258,
                      -19.133,
                      step));

    AddPolyLine('AH',[cA,cH]);
    AddPolyLine('HI',[cH,cI]);
    AddPolyLine('IB',[cI,cB]);
    AddPolyLine('NH',[cN,cH]);
    AddPolyLine('NI',[cN,cI]);
    AddPolyLine('EC',[cE,cC]);
    AddPolyLine('EC',[cP,cS]);
    AddPolyLine('CF',[cC,cF]);
    AddPolyLine('DF',[cD,cF]);
    AddPolyLine('GP',[cG,cP]);
    AddPolyLine('GP',[cS,cK]);
    AddPolyLine('FK',[cF,cK]);
    AddPolyLine('KL',[cK,cL]);
    AddPolyLine('QP',[cQ,cP]);

    AddText('��������+��������',Coord(2.2,1275));
    AddText('��������+��������',Coord(5.8,1184));
    AddText('��������',Coord(0.7,1125));
    AddText('������',Coord(0.3,765));
    AddText('��������+��������',Coord(4.0,875));
    AddText('������, ������, ���������, ��������',Coord(3.3,675));
    AddText('��������',Coord(4.3,1415));
  end;
  gp.Repaint;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  gp.SetSize(PaintBox1.Width,PaintBox1.Height);
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var s:string;
begin
  Label1.Caption := '�����������:  '+FloatToStrF(gp.fromY(Y),ffFixed,4,0)+'� C';
  Label2.Caption := '������������ ��������:  '+FloatToStrF(gp.fromX(X),ffFixed,1,1)+' %';
end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  gp.Repaint;
end;

end.
