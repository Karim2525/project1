unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, Grids, DBGrids, ComCtrls, StdCtrls, DBCtrls, DB;

type
  TMainForm = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid2: TDBGrid;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ChekNum, ChekSum, CenaTov:String;

implementation

uses Unit1, Unit2, Unit4, Unit5, Unit7;

{$R *.dfm}

procedure TMainForm.N1Click(Sender: TObject);
begin
Dovidka.Show;
end;

procedure TMainForm.Button4Click(Sender: TObject);
begin   
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO Digivir (����, ֳ�� ) Values (:dt, 0);';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yy',DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'select * from Digivir order by [��� �������]';
DataModule2.ADOQWork.Open;

DataModule2.ADOQWork.Last;
ChekNum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
Label6.Caption:='� �����i��: '+ ChekNum;

DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:= 'SELECT prodagi.[��� ������], prodagi.[ʳ������ ������],'
+' prodagi.����, prodagi.[��� �������], Kompanii.�����, poslygi.[��� �������], personal.Բ�, prodagi.ֳ��'
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[��� ������] = poslygi.[��� ������])  '
+' INNER JOIN (personal INNER JOIN prodagi ON personal.[��� ����������] = prodagi.[��� ����������]) '
+' ON poslygi.[��� �������] = prodagi.[��� �������] '
+' Where (((prodagi.[��� �������])='+ChekNum+'));';
DataModule2.ADOQprodagi.Open;
ChekSum:='0';
Label4.Caption:='�����: '+ChekSum;
Panel2.Visible:=True;
Button4.Enabled:=False;
 DBGrid2.Visible:=True;
//DBLookupComboBox3.Enabled:=False;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
DataModule2.ADOQDigivir.Close;
DataModule2.ADOQDigivir.SQL.Text:='SELECT Digivir.[��� �������], Digivir.ֳ��, Digivir.[ʳ������ ������], Digivir.���� FROM Digivir;';
DataModule2.ADOQDigivir.Open;
end;

procedure TMainForm.DBLookupComboBox3Click(Sender: TObject);
begin
Button4.Enabled:=True;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
CenaTov:= IntToStr(DataModule2.DataSposlygi.DataSet.Fields[2].AsInteger * strtoint(edit1.text));
label4.caption:= 'ֳ�� (���): ' + CenaTov;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO prodagi (  [ʳ������ ������], [����], [��� �������],  [��� ������], [��� �������], [��� ����������], [ֳ��] ) '
 +' Values ( '+edit1.Text+', :dt, '+ChekNum+', '+inttostr(DBLookupComboBox2.KeyValue)+', '+inttostr(DBLookupComboBox1.KeyValue)+', '+inttostr(DBLookupComboBox3.KeyValue)+',  '+CenaTov+')';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yy', DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;


DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:='SELECT prodagi.[��� ������], prodagi.[ʳ������ ������], prodagi.����, prodagi.[��� �������], Kompanii.�����, poslygi.[��� �������], personal.Բ�, prodagi.ֳ��  '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[��� ������] = poslygi.[��� ������]) INNER JOIN (personal INNER JOIN prodagi ON personal.[��� ����������] = prodagi.[��� ����������]) ON poslygi.[��� �������] = prodagi.[��� �������]'
+' WHERE (((prodagi.[��� �������])= '+ChekNum+')) ' ;
DataModule2.ADOQprodagi.open;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(prodagi.[ֳ��]) AS [Sum-ֳ��] FROM prodagi GROUP BY prodagi.[��� �������] HAVING (((prodagi.[��� �������])= '+ChekNum+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label7.caption:= '�����: ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Digivir SET Digivir.[ֳ��] = '+ChekSum+', Digivir.[ʳ������ ������]= '+edit1.Text+' WHERE (((Digivir.[��� �������])='+ChekNum+'))';
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);             
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'Delete * from prodagi Where [��� ������] = '+DBGrid2.Fields[0].AsString+'';
DataModule2.ADOQWork.ExecSQL;


DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:='SELECT prodagi.[��� ������], prodagi.[ʳ������ ������], prodagi.����, prodagi.[��� �������], Kompanii.�����, poslygi.[��� �������], personal.Բ�, prodagi.ֳ��  '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[��� ������] = poslygi.[��� ������]) INNER JOIN (personal INNER JOIN prodagi ON personal.[��� ����������] = prodagi.[��� ����������]) ON poslygi.[��� �������] = prodagi.[��� �������]'
+' WHERE (((prodagi.[��� �������])= '+ChekNum+')) ' ;
DataModule2.ADOQprodagi.open;


DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(prodagi.[ֳ��]) AS [Sum-ֳ��] FROM prodagi GROUP BY prodagi.[��� �������] HAVING (((prodagi.[��� �������])= '+ChekNum+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label7.caption:= '�����: ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Digivir SET Digivir.[ֳ��] = '+ChekSum+' WHERE (((Digivir.[��� �������])='+ChekNum+'))';
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
     Advertising_Otchet.QuickRep1.PreviewModal;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
DataModule2.ADOQchek_print.Close;
DataModule2.ADOQchek_print.SQL.Text:= 'SELECT prodagi.[��� ������], poslygi.[��� �������], prodagi.[ʳ������ ������], prodagi.����, personal.Բ�, prodagi.[��� �������], prodagi.ֳ��, Kompanii.����� '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[��� ������] = poslygi.[��� ������]) INNER JOIN (personal INNER JOIN prodagi ON personal.[��� ����������] = prodagi.[��� ����������]) ON poslygi.[��� �������] = prodagi.[��� �������]'
+' Where prodagi.[��� �������] = '+ChekNum+';';
DataModule2.ADOQchek_print.Open;


Dogovir_print.QRLabel2.Caption:='����: ' + DateToStr(DateTimePicker1.Date);
Dogovir_print.QRLabel3.Caption:='�������: ' + DBLookupComboBox2.Text;
Dogovir_print.QRLabel1.Caption:='��� ' + ChekNum;
Dogovir_print.QRLabel12.Caption:='�����: ' + ChekSum;


Dogovir_print.QuickRep1.PreviewModal;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
 Form7.show
end;

end.
