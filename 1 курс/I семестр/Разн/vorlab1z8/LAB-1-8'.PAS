{      ������ୠ� ࠡ��   � 3
                    �����   � 20.
   �������⥫�� ᢥ�����
                ��� ����   ��뭨�� ����� ����ᠭ�஢��
                    ��㯯�   ���-2000
        �ணࠬ�� ����ᠭ�   26 䥢ࠫ�� 2001� 15:02
                    �����   ��� �ᯥ�⪨
}

program lab_3_20;
uses CRT;
const
  N=40;
var
  i:byte;
  Sum:real;

function S(i:byte):real;
begin
  S:=(1-sqr(i))*cos(sqrt(i+1));
end;

BEGIN
   ClrScr;
   for i:=1 to N do
   if S(i)<=-1.5 then Sum:=Sum+S(i);
   WriteLn(Sum:5:2);
   Repeat Until KeyPressed;
END.


