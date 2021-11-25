unit Unit2;
    
interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDataModule2 = class(TDataModule)
    ADOQWork: TADOQuery;
    ADOQDigivir: TADOQuery;
    DataSWork: TDataSource;
    DataSposlygi: TDataSource;
    DataSKompanii: TDataSource;
    DataSDigivir: TDataSource;
    ADOTPers: TADOTable;
    DataSPers: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTKompanii: TADOTable;
    ADOQprodagi: TADOQuery;
    DataSprodagi: TDataSource;
    ADOQposlygi: TADOQuery;
    ADOTposlygi_cost: TADOTable;
    DataSource1: TDataSource;
    ADOQchek_print: TADOQuery;
    DataSchek_print: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.dfm}

end.
