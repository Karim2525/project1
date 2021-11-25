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
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO Digivir (Дата, Ціна ) Values (:dt, 0);';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yy',DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'select * from Digivir order by [Код договіру]';
DataModule2.ADOQWork.Open;

DataModule2.ADOQWork.Last;
ChekNum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
Label6.Caption:='№ договiру: '+ ChekNum;

DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:= 'SELECT prodagi.[Код продажі], prodagi.[Кількість місяців],'
+' prodagi.Дата, prodagi.[Код договіру], Kompanii.Назва, poslygi.[Тип послуги], personal.ФІО, prodagi.Ціна'
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[Код компанії] = poslygi.[Код компаніі])  '
+' INNER JOIN (personal INNER JOIN prodagi ON personal.[Код працівника] = prodagi.[Код працівника]) '
+' ON poslygi.[Код реклами] = prodagi.[Код реклами] '
+' Where (((prodagi.[Код договіру])='+ChekNum+'));';
DataModule2.ADOQprodagi.Open;
ChekSum:='0';
Label4.Caption:='Ітого: '+ChekSum;
Panel2.Visible:=True;
Button4.Enabled:=False;
 DBGrid2.Visible:=True;
//DBLookupComboBox3.Enabled:=False;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
DataModule2.ADOQDigivir.Close;
DataModule2.ADOQDigivir.SQL.Text:='SELECT Digivir.[Код договіру], Digivir.Ціна, Digivir.[Кількість місяців], Digivir.Дата FROM Digivir;';
DataModule2.ADOQDigivir.Open;
end;

procedure TMainForm.DBLookupComboBox3Click(Sender: TObject);
begin
Button4.Enabled:=True;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
CenaTov:= IntToStr(DataModule2.DataSposlygi.DataSet.Fields[2].AsInteger * strtoint(edit1.text));
label4.caption:= 'Ціна (грн): ' + CenaTov;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'INSERT INTO prodagi (  [Кількість місяців], [Дата], [Код договіру],  [Код компаніі], [Код реклами], [Код працівника], [Ціна] ) '
 +' Values ( '+edit1.Text+', :dt, '+ChekNum+', '+inttostr(DBLookupComboBox2.KeyValue)+', '+inttostr(DBLookupComboBox1.KeyValue)+', '+inttostr(DBLookupComboBox3.KeyValue)+',  '+CenaTov+')';
DataModule2.ADOQWork.Parameters.ParamByName('dt').Value:=FormatDateTime('dd.mm.yy', DateTimePicker1.Date);
DataModule2.ADOQWork.ExecSQL;


DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:='SELECT prodagi.[Код продажі], prodagi.[Кількість місяців], prodagi.Дата, prodagi.[Код договіру], Kompanii.Назва, poslygi.[Тип послуги], personal.ФІО, prodagi.Ціна  '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[Код компанії] = poslygi.[Код компаніі]) INNER JOIN (personal INNER JOIN prodagi ON personal.[Код працівника] = prodagi.[Код працівника]) ON poslygi.[Код реклами] = prodagi.[Код реклами]'
+' WHERE (((prodagi.[Код договіру])= '+ChekNum+')) ' ;
DataModule2.ADOQprodagi.open;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(prodagi.[Ціна]) AS [Sum-Ціна] FROM prodagi GROUP BY prodagi.[Код договіру] HAVING (((prodagi.[Код договіру])= '+ChekNum+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label7.caption:= 'Ітого: ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Digivir SET Digivir.[Ціна] = '+ChekSum+', Digivir.[Кількість місяців]= '+edit1.Text+' WHERE (((Digivir.[Код договіру])='+ChekNum+'))';
DataModule2.ADOQWork.ExecSQL;

FormShow(Sender);             
end;

procedure TMainForm.Button2Click(Sender: TObject);
begin
DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:= 'Delete * from prodagi Where [Код продажі] = '+DBGrid2.Fields[0].AsString+'';
DataModule2.ADOQWork.ExecSQL;


DataModule2.ADOQprodagi.Close;
DataModule2.ADOQprodagi.SQL.Text:='SELECT prodagi.[Код продажі], prodagi.[Кількість місяців], prodagi.Дата, prodagi.[Код договіру], Kompanii.Назва, poslygi.[Тип послуги], personal.ФІО, prodagi.Ціна  '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[Код компанії] = poslygi.[Код компаніі]) INNER JOIN (personal INNER JOIN prodagi ON personal.[Код працівника] = prodagi.[Код працівника]) ON poslygi.[Код реклами] = prodagi.[Код реклами]'
+' WHERE (((prodagi.[Код договіру])= '+ChekNum+')) ' ;
DataModule2.ADOQprodagi.open;


DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' Select Sum(prodagi.[Ціна]) AS [Sum-Ціна] FROM prodagi GROUP BY prodagi.[Код договіру] HAVING (((prodagi.[Код договіру])= '+ChekNum+'))';
DataModule2.ADOQWork.Open;
ChekSum:= DataModule2.DataSWork.DataSet.Fields[0].AsString;
label7.caption:= 'Ітого: ' + ChekSum;

DataModule2.ADOQWork.Close;
DataModule2.ADOQWork.SQL.Text:=' UPDATE Digivir SET Digivir.[Ціна] = '+ChekSum+' WHERE (((Digivir.[Код договіру])='+ChekNum+'))';
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
DataModule2.ADOQchek_print.SQL.Text:= 'SELECT prodagi.[Код продажі], poslygi.[Тип послуги], prodagi.[Кількість місяців], prodagi.Дата, personal.ФІО, prodagi.[Код договіру], prodagi.Ціна, Kompanii.Назва '
+' FROM (Kompanii INNER JOIN poslygi ON Kompanii.[Код компанії] = poslygi.[Код компаніі]) INNER JOIN (personal INNER JOIN prodagi ON personal.[Код працівника] = prodagi.[Код працівника]) ON poslygi.[Код реклами] = prodagi.[Код реклами]'
+' Where prodagi.[Код договіру] = '+ChekNum+';';
DataModule2.ADOQchek_print.Open;


Dogovir_print.QRLabel2.Caption:='Дата: ' + DateToStr(DateTimePicker1.Date);
Dogovir_print.QRLabel3.Caption:='Робітник: ' + DBLookupComboBox2.Text;
Dogovir_print.QRLabel1.Caption:='Чек№ ' + ChekNum;
Dogovir_print.QRLabel12.Caption:='ІТОГО: ' + ChekSum;


Dogovir_print.QuickRep1.PreviewModal;
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
 Form7.show
end;

end.
