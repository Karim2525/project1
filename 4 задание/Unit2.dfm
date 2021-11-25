object DataModule2: TDataModule2
  OldCreateOrder = False
  Left = 782
  Top = 175
  Height = 592
  Width = 362
  object ADOQWork: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 112
    Top = 32
  end
  object ADOQDigivir: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Digivir.['#1050#1086#1076' '#1076#1086#1075#1086#1074#1110#1088#1091'],  Digivir.['#1062#1110#1085#1072'], Digivir.['#1050#1110#1083#1100#1082#1110#1089 +
        #1090#1100' '#1084#1110#1089#1103#1094#1110#1074'], Digivir.['#1044#1072#1090#1072']'
      'FROM Digivir;')
    Left = 112
    Top = 216
  end
  object DataSWork: TDataSource
    DataSet = ADOQWork
    Left = 208
    Top = 32
  end
  object DataSposlygi: TDataSource
    DataSet = ADOQposlygi
    Left = 208
    Top = 96
  end
  object DataSKompanii: TDataSource
    DataSet = ADOTKompanii
    Left = 208
    Top = 152
  end
  object DataSDigivir: TDataSource
    DataSet = ADOQDigivir
    Left = 216
    Top = 208
  end
  object ADOTPers: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'personal'
    Left = 112
    Top = 272
  end
  object DataSPers: TDataSource
    DataSet = ADOTPers
    Left = 224
    Top = 272
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=rec.m' +
      'db;Mode=Share Deny None;Persist Security Info=False;Jet OLEDB:Sy' +
      'stem database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database P' +
      'assword="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mo' +
      'de=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk T' +
      'ransactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Creat' +
      'e System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLE' +
      'DB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without ' +
      'Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 32
    Top = 152
  end
  object ADOTKompanii: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'Kompanii'
    Left = 112
    Top = 160
  end
  object ADOQprodagi: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT prodagi.['#1050#1086#1076' '#1087#1088#1086#1076#1072#1078#1110'], prodagi.['#1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074'], proda' +
        'gi.'#1044#1072#1090#1072', prodagi.['#1050#1086#1076' '#1076#1086#1075#1086#1074#1110#1088#1091'], Kompanii.'#1053#1072#1079#1074#1072', poslygi.['#1058#1080#1087' '#1087#1086 +
        #1089#1083#1091#1075#1080'], personal.'#1060#1030#1054', prodagi.'#1062#1110#1085#1072
      
        'FROM (Kompanii INNER JOIN poslygi ON Kompanii.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1111'] = p' +
        'oslygi.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1110']) INNER JOIN (personal INNER JOIN prodagi O' +
        'N personal.['#1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072'] = prodagi.['#1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072']) ON posly' +
        'gi.['#1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080'] = prodagi.['#1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080'];')
    Left = 120
    Top = 328
  end
  object DataSprodagi: TDataSource
    DataSet = ADOQprodagi
    Left = 224
    Top = 328
  end
  object ADOQposlygi: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT poslygi.['#1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080'], poslygi.['#1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080'], poslygi.['#1062#1110 +
        #1085#1072' '#1079#1072' '#1084#1110#1089#1103#1094#1100'], Kompanii.'#1053#1072#1079#1074#1072
      
        'FROM Kompanii INNER JOIN poslygi ON Kompanii.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1111'] = po' +
        'slygi.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1110'];')
    Left = 112
    Top = 104
  end
  object ADOTposlygi_cost: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'poslygi'
    Left = 120
    Top = 384
  end
  object DataSource1: TDataSource
    DataSet = ADOTposlygi_cost
    Left = 232
    Top = 384
  end
  object ADOQchek_print: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT prodagi.['#1050#1086#1076' '#1087#1088#1086#1076#1072#1078#1110'], poslygi.['#1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080'], prodagi.['#1050#1110 +
        #1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074'], poslygi.['#1062#1110#1085#1072' '#1079#1072' '#1084#1110#1089#1103#1094#1100'], prodagi.'#1044#1072#1090#1072', person' +
        'al.'#1060#1030#1054', prodagi.['#1050#1086#1076' '#1076#1086#1075#1086#1074#1110#1088#1091'], prodagi.'#1062#1110#1085#1072', Kompanii.'#1053#1072#1079#1074#1072
      
        'FROM (Kompanii INNER JOIN poslygi ON Kompanii.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1111'] = p' +
        'oslygi.['#1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1110']) INNER JOIN (personal INNER JOIN prodagi O' +
        'N personal.['#1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072'] = prodagi.['#1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072']) ON posly' +
        'gi.['#1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080'] = prodagi.['#1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080'];')
    Left = 120
    Top = 440
  end
  object DataSchek_print: TDataSource
    DataSet = ADOQchek_print
    Left = 232
    Top = 448
  end
end
