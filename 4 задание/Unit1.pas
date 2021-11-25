unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, DBCtrls, StdCtrls, ExtCtrls, DB;

type
  TDovidka = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button5: TButton;
    Button6: TButton;
    Panel2: TPanel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label6: TLabel;
    Edit5: TEdit;
    Panel3: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Panel4: TPanel;
    DateTimePicker1: TDateTimePicker;
    Button13: TButton;
    Button14: TButton;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    Panel5: TPanel;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dovidka: TDovidka;

implementation

uses Unit2, Unit6, Unit4;

{$R *.dfm}
   procedure TDovidka.FormShow(Sender: TObject);
begin
//DataModule1.ADOQTovari.Close;
//DataModule1.ADOQTovari.SQL.Text:= 'SELECT Tovari.���_������, Tovari.������������ AS Tovari_������������, Brend.������������ AS Brend_������������, Tovari.��_���, Tovari.����_��_��_��� '
//+' FROM Brend INNER JOIN Tovari ON Brend.[���_������] = Tovari.[���_������] ORDER BY Tovari.���_������';
//DataModule1.ADOQTovari.Open;

DataModule2.ADOQposlygi.Close;
DataModule2.ADOQposlygi.SQL.Text:=  ' SELECT poslygi.[��� �������], poslygi.[��� �������], poslygi.[ֳ�� �� �����], Kompanii.�����'
+' FROM Kompanii INNER JOIN poslygi ON Kompanii.[��� ��������] = poslygi.[��� ��������];';

 DataModule2.ADOQposlygi.Open;
//'SELECT poslygi.[��� �������], poslygi.[��� �������], poslygi.[ֳ�� �� �����], Kompanii.�����'
//+' FROM poslygi, Kompanii WHERE (poslygi.[��� �������]=Digivir.[��� �������]) AND (Digivir.[��� ��������]=Kompanii.[��� ��������])';

// INNER JOIN (Kompanii INNER JOIN Digivir ON Kompanii.[��� ��������] = Digivir.[��� ��������]) ON poslygi.[��� �������] = Digivir.[��� �������]';



end;
procedure TDovidka.Button1Click(Sender: TObject);
begin

Edit3.Text:='';
Edit5.Text:='0';
DBLookupComboBox1.KeyValue:=1;
Button10.Visible:=true;
Button11.Visible:=false;
Panel2.Visible:=true;
end;

procedure TDovidka.Button2Click(Sender: TObject);
begin
Edit3.Text:=DBGrid1.Fields[1].AsString;
  Edit5.Text:=DBGrid1.Fields[2].AsString;

DataModule2.ADOTKompanii.Locate('�����',DBGrid1.Fields[3].AsString,[loCaseInsensitive, loPartialKey]);  // !!!������ ��������!!! ��� ���� ��� �� �������� � ������� "����" ��� ���������
//��� ����� �������� �������� �������� ��� ���������, �� � ��� ���� ������ �� �������� �� DBGrid1 - ������ ����. ��� ����� ������������ ��� ������ ��� ���� � ADOTable ������ ������ �� �������� ��������� � ��������� ��������� �� ��������� ������
DBLookupComboBox1.KeyValue:= StrToInt(DataModule2.DataSKompanii.DataSet.Fields[0].AsString);

Button10.Visible:=false;
Button11.Visible:=True;

Panel2.Visible:=true;
end;

procedure TDovidka.Button3Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'DELETE * FROM poslygi Where (poslygi.[��� �������] = '+DBGrid1.Fields[0].AsString+')';
DataModule2.ADOQWork.ExecSQL;
FormShow(Sender);
end;

procedure TDovidka.Button12Click(Sender: TObject);
begin
Edit5.Text:='';
Edit3.Text:='';

FormShow(Sender);
panel2.Visible:=False;
end;

procedure TDovidka.Button10Click(Sender: TObject);
begin
DataModule2.ADOQposlygi.Close;
DataModule2.ADOQposlygi.SQL.Text:='INSERT INTO poslygi ( [��� �������], [ֳ�� �� �����], [��� ��������] ) values ( "'+Edit3.Text+'", '+Edit5.Text+', '+IntToStr(DBLookupComboBox1.KeyValue)+')';
DataModule2.ADOQposlygi.ExecSQL;

//DataModule2.ADOQposlygi.Close;
//DataModule2.ADOQposlygi.SQL.Text:= 'SELECT poslygi.[��� �������], poslygi.[��� �������], poslygi.[ֳ�� �� �����], Kompanii.����� '
//+' FROM poslygi INNER JOIN (Kompanii INNER JOIN Digivir ON Kompanii.[��� ��������] = Digivir.[��� ��������]) ON poslygi.[��� �������] = Digivir.[��� �������];';
//DataModule2.ADOQposlygi.Open;

                FormShow(Sender);
panel2.Visible:=False;
end;

procedure TDovidka.Button7Click(Sender: TObject);
begin
DataModule2.ADOTPers.Insert;
end;

procedure TDovidka.Button8Click(Sender: TObject);
begin
if  DataModule2.ADOTPers.Modified then
 DataModule2.ADOTPers.Post;
end;

procedure TDovidka.Button9Click(Sender: TObject);
begin
DataModule2.ADOTPers.Delete;
end;

procedure TDovidka.Button13Click(Sender: TObject);
begin
DataModule2.ADOQDigivir.Close;
DataModule2.ADOQDigivir.SQL.Text:='SELECT * FROM Digivir  WHERE Digivir.[����]= :dt';
DataModule2.ADOQDigivir.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yy',DateTimePicker1.Date);
ShowMessage(DataModule2.ADOQDigivir.SQL.Text);
DataModule2.ADOQDigivir.Open;
end;

procedure TDovidka.Edit1Change(Sender: TObject);
begin
DataModule2.ADOQposlygi.Close;
DataModule2.ADOQposlygi.SQL.Text:= ' SELECT poslygi.[��� �������], poslygi.[��� �������], poslygi.[ֳ�� �� �����], Kompanii.�����'
+' FROM Kompanii INNER JOIN poslygi ON Kompanii.[��� ��������] = poslygi.[��� ��������] where poslygi.[��� �������] like "%'+Edit1.Text+'%" ORDER BY poslygi.[��� �������]';
DataModule2.ADOQposlygi.Open;
end;

procedure TDovidka.Button11Click(Sender: TObject);
begin

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:='UPDATE poslygi SET poslygi.[��� �������] = "'+Edit3.Text+'", poslygi.[��� ��������]= "'+IntToStr(DBLookupComboBox1.KeyValue)+'",   poslygi.[ֳ�� �� �����]='+Edit5.Text+' '
+' WHERE (((poslygi.[��� �������])='+DBGrid1.Fields[0].AsString+'))';
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);


panel2.Visible:=False;
end;

procedure TDovidka.Button14Click(Sender: TObject);
begin
DataModule2.ADOQDigivir.Close;
DataModule2.ADOQDigivir.SQL.Text:='SELECT Digivir.[��� �������], Digivir.[��� �������], Digivir.[��� ����������], Digivir.[ʳ������ ������], Digivir.[��� ��������], Digivir.[ֳ��], Digivir.[��� ������], Digivir.[����] FROM[Digivir]';
DataModule2.ADOQDigivir.Open;
end;

procedure TDovidka.Button5Click(Sender: TObject);
begin
DataModule2.ADOQposlygi.Close;
DataModule2.ADOQposlygi.SQL.Text:= ' SELECT poslygi.[��� �������], poslygi.[��� �������], poslygi.[ֳ�� �� �����], Kompanii.�����'
+' FROM Kompanii INNER JOIN poslygi ON Kompanii.[��� ��������] = poslygi.[��� ��������] where poslygi.[��� �������] = '+Edit2.Text+' ORDER BY poslygi.[��� �������]';
DataModule2.ADOQposlygi.Open;
end;

procedure TDovidka.Button6Click(Sender: TObject);
begin
FormShow(Sender);
end;

procedure TDovidka.Button15Click(Sender: TObject);
begin
DataModule2.ADOTKompanii.Insert;
end;

procedure TDovidka.Button16Click(Sender: TObject);
begin
if  DataModule2.ADOTKompanii.Modified then
 DataModule2.ADOTKompanii.Post;
end;

procedure TDovidka.Button17Click(Sender: TObject);
begin
DataModule2.ADOTKompanii.Delete;
end;

procedure TDovidka.Button18Click(Sender: TObject);
begin
Zvit.QuickRep1.PreviewModal;
end;

procedure TDovidka.Button4Click(Sender: TObject);
begin
Advertising_Otchet.QuickRep1.PreviewModal;
end;

end.
