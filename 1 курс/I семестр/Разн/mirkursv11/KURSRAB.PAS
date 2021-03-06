Program KursRab;
uses CRT;
var
   c,                             {��६����� ��� �롮� �㭪� ����}
   col:byte;                      {��६����� ��� 梥�}
   k:char;                        {��६����� ��� ���뢠��� ����⮩ ������}
   result:text;                   {䠩����� ��६�����}
   f:boolean;                     {�᫨ ��⨭�, � ࠧ�蠥��� ������ � 䠩�}

(*-*-* ��楤�� ᮧ����� ���� �� ������� ���न��⠬,
������� 梥⮬ 䮭� � ⥪��, � ����񭭮� �������� *-*-*)
procedure Okno(tb,tc,x1,y1,x2,y2:byte;str:string);
begin
     textbackground(tb);           {������� 梥� 䮭�  }
     textcolor(tc);                {������� 梥� ⥪��}
     window(x1,y1,x2,y2);          {ᮧ����� ����       }
     clrscr;                       {���⪠ ��࠭�      }
     write(str);                   {���� ��ப�         }
end;

(*-*-* ����� ���� *-*-*)
procedure TitulList;
begin
    okno(0,0,17,8,67,18,'');                         {⥭�            }
    okno(7,0,15,7,65,17,'');                         {�᭮���� ����   }
    writeln;                                         {⥪�� ���쭮��}
    writeln;                                         {       ����    }
    writeln(' ���ᮢ�� ࠡ�� �� ����� "�������� � ���ଠ⨪�"');
    writeln;
    writeln('          �믮����: ��㤥�� ��㯯� ���-2000');
    writeln('                    ���ᥥ� ��᫠� ��ࣥ����');
    writeln;
    writeln('                     ��ਠ�� 11');
    writeln;
    writeln('                                 27 ��५� 2001 �.');
end;

(*-*-* ���� "��୨" *-*-*)
procedure B1;
begin
    Okno(col,0,1,1,9,1,'  ��୨');
end;

(*-*-* ���� "��⥣ࠫ" *-*-*)
procedure B2;
begin
    Okno(col,0,10,1,20,1,' ��⥣ࠫ');
end;

(*-*-* ���� "���.�ࠢ�����" *-*-*)
procedure B3;
begin
    Okno(col,0,21,1,35,1, '���. �ࠢ�����');
end;

(*-*-* ���� "��" *-*-*)
procedure B4;
begin
    Okno(col,0,36,1,42,1,'  ��');
end;

(*-*-* ���� "���࠭���" *-*-*)
procedure B5;
begin
    Okno(col,0,43,1,52,1,'���࠭���');
end;

(*-*-* ���� "������" *-*-*)
procedure B6;
begin
    Okno(col,0,53,1,65,1,' ������(F1)');
end;

(*-*-* ���� "��室" *-*-*)
procedure B7;
begin
    Okno(col,0,66,1,80,1,' ��室 (ESC)');
end;

(*-*-* ᮧ����� ���� ��� ���᫥���, ���孥� � ������ ������ *-*-*)
procedure Main;
begin
     Okno(3,0+Blink,1,25,79,25,'              ���ᮢ�� ࠡ�� ���ᥥ�� ��᫠��');
                                        {������ ������      }
     B1;B2;B3;B4;B5;B6;B7;              {������ ������     }
     Okno(1,0,1,2,80,24,'');            {���� ��� ���᫥���}
end;

(*-*-* ���᫥��� ���� �ࠢ����� ��⮤�� ���⮭� *-*-*)
procedure KORNI;
const
   a=0;            {��砫쭠� �窠 �஬���⪠}
   b=1;            {����筠� �窠 �஬���⪠}
   e=0.001;        {����譮���}
var
    x,             {������ᨬ�� ��६�����}
    y,             {��।��� �ਡ�������}
    p:real;        {�᫮���}
begin
    Main;          {�맮� ��楤��� Main}
    textcolor(15); {������� 梥� ⥪��}
    x:=0;          {��᢮���� ������ᨬ�� ��६����� ��砫� ��१��}
    repeat
      y:=x-(exp(x)-1/exp(x)-2)/(exp(x)+exp(-x));{���᫥��� �ਡ�������}
      p:=abs(y-x);                              {�������� �᫮���}
      x:=y;                                     {������ᨬ�� ��६�����
                                                 ��ᢠ������� �ਡ�������}
    until p<=e;                                 {���� �� �믮������ �᫮���}
    writeln;
    writeln('      �ࠢ����� e^x-e^(-x)-2=0 ����� �� ��१�� [0;1] ��७� x=',x:1:4);
    write('                     /��⮤ ���⮭�/');
(*-*-* ������ � 䠩�, �᫨ f=true *-*-*)
    if f then
    begin
       writeln(result);
       writeln(result,'      �ࠢ����� e^x-e^(-x)-2=0 ����� �� ��१�� [0;1] ��७� x=',x:1:4);
       writeln(result,'                     /��⮤ ���⮭�/');
    end;
end;

(*-*-* ��楤�� ���᫥��� ��⥣ࠫ� ��⮤�� ����ᮭ� *-*-*)
procedure INTEGRAL;
const
  a=0;                {��砫쭠� �窠 ������� ��१��}
  b=3;                {����筠� �窠 ������� ��१��}
  n2=36;              {��१�� ��⥣�஢���� ࠧ���� �� n2=20 ��⥩}
var
    w,              {�������⥫쭠� ��६����� ��� ������ ����� ��ࠦ����}
    x,              {������ᨬ�� ��६����� (��㬥��)}
    h,              {蠣}
    S:real;         {�㬬�}
    c:integer;
begin
    Main;                {���⪠ �������� ���� ��। ���᫥��ﬨ}
    h:=(b-a)/n2;         {���᫥��� 蠣�}
    x:=0;                {��砫쭮� ���祭�� x}
    c:=1;                {��砫쭮� ���祭�� �}
    S:=0.5974;           {��砫쭮� ���祭�� �㬬�}
    repeat
      x:=x+h;            {㢥��祭�� ��㬥�� �� 蠣 ��⥣�஢����}
      w:=x/(1+x);        {����塞 ��ࠦ���� ���饥 ��� ������ ��ᨭ��}
      S:=S+(3+c)*2*arctan(w/sqrt(1-sqr(w)));{�ਡ���塞 � �㬬� ��।��� ᫠������}
      c:=-1;             {���塞 ���� � �� ��⨢��������}
    until x>=b-h;        {�஢�ઠ �᫮���}
    S:=S*(h/3);          {㬭������ �㬬� �� ����室��� �����樥��}
    textcolor(15);       {����� 梥� ⥪��}
    writeln;             {�뢮� �� ��ᯫ�� १����}
    writeln('   ��⥣ࠫ arcsin(sqrt(x/(x+1))) �� �஬���⪥ [0;3] = ',S:4:4);
    writeln('                        /��⮤ ����ᮭ�/');
(*-*-* ������ � 䠩�, �᫨ f=true *-*-*)
    if f then
    begin
       writeln(result);
       writeln(result,'   ��⥣ࠫ arcsin(sqrt(x/(x+1))) �� �஬���⪥ [0;3] = ',S:4:4);
       writeln(result,'                        /��⮤ ����ᮭ�/');
    end;
end;

(*-*-* ��楤�� �襭�� ����७樠�쭮�� �ࠢ�����  *-*-*)
procedure DIFFER;
const
    a=0;                        {��砫쭮� ���祭�� ��१�� ��⥣�஢����}
    b=1;                        {����筮� ���祭�� ��१�� ��⥣�஢����}
    h=0.1;                      {蠣}
var
    z,                          {�������⥫쭠� ��६�����}
    x,                          {��㬥��}
    p,                          {�ந������� � �窥}
    t,                          {�筮� ���祭��}
    r:real;                     {�ਡ�������� ���祭��}
begin
    Main;                       {���⪠ �������� ���� ��। ���᫥��ﬨ}
    textcolor(15);              {������� 梥� ⥪��}
    x:=a;                       {��砫쭮� ���祭�� �}
    r:=-0.9;                    {�ਡ�������� ���祭�� � ��砫쭮� �窥}
    p:=3.2;                     {�ந������� � ��砫쭮� �窥}
    writeln;                    {�뢮� �� ��ᯫ�� �᫮���}
    writeln('        ���祭�� ����७樠�쭮�� �ࠢ����� y``+ y`-6y = 3x^2 - x -1');
    writeln('          �� y(0)=-0.9, y`(0)=3.2 �� ��१�� [0;1] � 蠣�� = 0.1 : ');
    gotoxy(12,7);
    writeln('   ��㬥��         �筮� �襭��       �ਡ�������� �襭��');
    writeln;
(*-*-* ������ �᫮��� � 䠩�, �᫨ f=true *-*-*)
    if f then
    begin
      writeln(result);
      writeln(result,'        ���祭�� ����७樠�쭮�� �ࠢ����� y``+ y`-6y = 3x^2 - x -1');
      writeln(result,'          �� y(0)=-0.9, y`(0)=3.2 �� ��१�� [0;1] � 蠣�� = 0.1 : ');
      writeln(result);
      writeln(result,'               ��㬥��         �筮� �襭��       �ਡ�������� �襭��');
      writeln(result);
    end;
(*-*-* 横� ���᫥��� *-*-*)
    repeat
       z:=p+h*(3*sqr(x)-x-1-p+6*r);             {�������⥫쭮� ��६�����
                                                 ��ᢠ������� ���祭��
                                                 p � �窥 x               }
       r:=r+h*p;                                {�ਡ�������� ���祭��     }
       p:=z;
       x:=x+h;                                  {����� ���祭�� x          }
       t:=0.1*exp(2*x)-exp(-3*x)-0.5*sqr(x);    {�筮� ���᫥��� �㭪樨 }
(*\* �뢮� १��⮢ �� ��ᯫ�� */*)
       write('             ',x:8:4);
       write('             ',t:8:4);
       writeln('             ',r:8:4);
(*-*-* ������ � 䠩� १���⮢, �᫨ f=true *-*-*)
       if f then
       begin
          write(result,'             ',x:8:4);
          write(result,'             ',t:8:4);
          writeln(result,'             ',r:8:4);
       end;
    until x>b;             {�� ��᫥����� ���祭�� ��१�� ��⥣�஢����}

end;

(*-*-* ��楤�� ���᫥��� �鸞  *-*-*)
procedure RIAD;
   var
   s,                    {�㬬�}
   x,                    {��㬥��}
   y,                    {�㭪��}
   h,                    {蠣}
   t,                    {������� �㬬�}
   p:real;               {䠪�ਠ�}
   n:byte;               {���浪��� ����� ������� �㬬�}
begin
   Main;                    {���⪠ �������� ���� ��। ���᫥��ﬨ}
   textcolor(15);           {������� 梥� ⥪��}
   x:=0.1;                  {��砫쭮� ���祭�� �}
   h:=(1-0.1)/10;           {���᫥��� ���祭�� 蠣�}
   writeln;
   writeln('            ���祭�� �㬬� S = 1+3*(x^2)+...+((2*n+1)/n!)*x^2*n');
   writeln('            � �㭪樨 y=(1+2*(x^2))*e^x^2 �� ��१�� [0.1;1] : ');
   gotoxy(12,7);
   writeln('   ��㬥��              �㬬�               �㭪��');
   writeln;
(*-*-* ������ � 䠩�, �᫨ f=true *-*-*)
   if f then
   begin
     writeln(result);
     writeln(result,'            ���祭�� �㬬� S = 1+3*(x^2)+...+((2*n+1)/n!)*x^2*n');
     writeln(result,'            � �㭪樨 y=(1+2*(x^2))*e^x^2 �� ��१�� [0.1;1] : ');
     writeln(result,'               ��㬥��              �㬬�               �㭪��');
     writeln(result);
   end;
(*-*-* 横� ���᫥��� *-*-*)
   repeat
     s:=1; {��砫쭮� ���祭�� �㬬�}
     p:=1; {��砫쭮� ���祭�� 䠪�ਠ�� (1!=1)}
     t:=0; {��砫쭮� ���祭�� ������� �㬬�}
     for n:=1 to 10 do
     begin
       p:=p*n;                       {���᫥��� 䠪�ਠ��}
       t:=((2*n+1)*exp(2*n*ln(x)))/p;{���᫥��� ��।���� ������� �㬬�}
       s:=s+t;                       {㢥��祭�� �㬬� �� ��।��� �������}
     end;
     y:=(1+2*sqr(x))*exp(sqr(x));   {��᢮���� ��६����� y ���祭�� �㭪樨}
     write('             ',x:8:4);  {�뢮� ���祭�� �� ��ᯫ��}
     write('             ',s:8:4);
     writeln('             ',y:8:4);
(*-*-* ������ � 䠩�, �᫨ f=true *-*-*)
     if f then
     begin
         write(result,'             ',x:8:4);
         write(result,'             ',s:8:4);
         writeln(result,'             ',y:8:4);
     end;
     x:=x+h;                     {㢥��祭�� ���祭�� ��६����� x �� 蠣}
   until x>1;                    {������� �� ���� �஬���⪠, �����⥫쭮}
end;

(*-*-* ��楤��, ��।������ ����稥 �訡�� �� ����� � 䠩� *-*-*)
procedure dont;
begin
   IF IOResult <>0 THEN
      begin
         Main;
         textcolor(15);
         writeln;
         writeln('  ������ ����� �� ����� ���� �����⢫���');
         writeln('  ������ ���� ������� ��� ��室� �� �ணࠬ��');
      end
      ELSE Exit;
   repeat until keypressed;
   Halt;
end;

(*-*-* ��楤��, �����⢫���� ������ � 䠩� *-*-*)
procedure SAVE;
begin
     Assign(result,'result.pas');{�易�� 䠩����� ��६. � result.pas}
{$I-}                            {��४⨢� �⪫�祭�� ����஫�
                                             �訡�� �����(�뢮��)}
     Rewrite(result);            {ᮧ���� ���� ��� ������ �������騩 䠩�}
     dont;                       {�஢�ઠ �� ����稥 �訡��}
{$I+}                            {��४⨢� ������祭�� ����஫�
                                             �訡�� �����(�뢮��)}
     f:=true;                    {ࠧ�蠥� �����뢠�� � 䠩� �����}
     KORNI;                      { �맮� ���          }
     INTEGRAL;                   { ��楤�� � �襭�ﬨ}
     DIFFER;                     { ��� �����          }
     RIAD;                       { ������  � 䠩�      }
     Main;                       {���⪠ �������� ����}
     textcolor(15);
     gotoxy(10,7);
     writeln('�� ����� �த������ ࠡ��� ��᫥ ������ �� ���� �������');
     f:=false;                   {����頥��� �����뢠�� ����� � 䠩�}
     close(result);              {�����⨥ 䠩��}
     repeat until keypressed;
     Main;                       {���⪠ �������� ����}
end;

(*-*-* ��楤�� ������ *-*-*)
procedure HELP;
begin
     Main;
     Okno(0,0,12,6,72,21,'');
     Okno(3,1,10,5,70,20,'');
     writeln;
     writeln('       *** F1 *** ������ *** HELP *** ������ *** F1 ***');
     writeln('              ��� ������������ ������ ����������');
     writeln;
     writeln('      �����蠬� ����� ��ࠢ� � ����� �� ����� �롨��� ');
     writeln('  �ॡ㥬� �㭪� ����. �� ����⨨ ������ Enter �� ');
     writeln('  ����᪠�� ������ ����.');
     writeln('      ��室 �� �ணࠬ�� �����⢫���� �� ��⨢���樨');
     writeln('   ��樨 "��室", ���� �� ����⨨ ������ Esc.');
     writeln('      ���࠭���� १���⮢ ���᫥���  � 䠩� result.pas ');
     writeln(' - ���� "���࠭���".');
     writeln('      ������ - ���� "������", ������ F1.');
     writeln('      ��� �����饭�� � ࠡ�� ������ ���� �������.');
     writeln;
     writeln('                         ����� �����!!!     /����/');
     repeat until keypressed;    {��᫥ ������ �� ���� �������}
     Main;                       {���⪠ �������� ����}
end;

(*-*-* ��楤��, �����⢫���� �롮� ��।������� ��樨 � ���� *-*-*)
procedure Vibor;
begin
   k:=ReadKey;                                  {���뢠��� ����⮩ ������}
   IF k=#75 THEN IF c=1 THEN c:=7 ELSE c:=c-1;  {��ॢ�� ����� �����}
   IF k=#77 THEN IF c=7 THEN c:=1 ELSE c:=c+1;  {��ॢ�� ����� ��ࠢ�}
   IF c=1 THEN begin col:=2;B1 end ELSE begin col:=7;B1 end; {���᪠       }
   IF c=2 THEN begin col:=2;B2 end ELSE begin col:=7;B2 end; {"������" ���� }
   IF c=3 THEN begin col:=2;B3 end ELSE begin col:=7;B3 end; {� ��।������}
   IF c=4 THEN begin col:=2;B4 end ELSE begin col:=7;B4 end; {梥�,         }
   IF c=5 THEN begin col:=2;B5 end ELSE begin col:=7;B5 end; {�᫨ �롮�    }
   IF c=6 THEN begin col:=2;B6 end ELSE begin col:=7;B6 end; {�⮨�/�� �⮨�}
   IF c=7 THEN begin col:=2;B7 end ELSE begin col:=7;B7 end; {�� ��        }
end;

(*-*-* ��楤��, �����⢫���� ��⨢����� ��࠭��� ��樨 � ���� *-*-*)
procedure Active;
begin
     IF k=#59 THEN HELP;       {���� "������" �� ����⨨ F1}
     IF k=#13 THEN             {�� ����⨨ ������ Enter}
     case c of
         1: KORNI;             {��⨢��������� ���� �� "�����" �� "��������"}
         2: INTEGRAL;          {� ����ᨬ��� �� ⮣�, �� ����� �㭪� ����}
         3: DIFFER;            {�� ��⠭����� �롮�}
         4: RIAD;
         5: SAVE;
         6: HELP;
         7: Halt;
     end;
end;

(*-*-* ������� ��������� *-*-*)
BEGIN
   col:=7;                    {��६����� 梥� ��ᢠ����� ���祭�� �ண�}
   f:=false;                  {����頥� ������ �� ������ �롮� "���࠭���"}
   Main;                      {���⪠ �������� ����}
   TitulList;                 {�뢮� �� ��ᯫ�� ���쭮�� ����}
   repeat until keypressed;   {�� ������ �� ���� �������}
   Main;                      {���⪠ �������� ����}
   c:=1;                      {�롮� �� �㭪� "��୨"}
   repeat
     Vibor;                   {�롮� ��।������� ��樨 � ����}
     Active                   {��⨢����� ��࠭��� ��樨}
   until k=#27;               {�த�������� �� ������ �� ������� ESC}
END.