object MainForm: TMainForm
  Left = 314
  Top = 293
  Width = 1055
  Height = 558
  Caption = 'Main form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 320
    Height = 507
    Align = alLeft
    DataSource = DataModule2.DataSDigivir
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object TPanel
    Left = 320
    Top = 0
    Width = 727
    Height = 507
    Align = alClient
    TabOrder = 1
    object Label5: TLabel
      Left = 32
      Top = 96
      Width = 50
      Height = 13
      Caption = #1055#1077#1088#1089#1086#1085#1072#1083
    end
    object Label6: TLabel
      Left = 24
      Top = 144
      Width = 64
      Height = 24
      Caption = #8470' '#1095#1077#1082#1091
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 24
      Top = 200
      Width = 45
      Height = 24
      Caption = #1030#1090#1086#1075#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 305
      Width = 725
      Height = 201
      Align = alBottom
      TabOrder = 0
      object DBGrid2: TDBGrid
        Left = 1
        Top = 1
        Width = 723
        Height = 199
        Align = alClient
        DataSource = DataModule2.DataSprodagi
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 336
      Top = 1
      Width = 390
      Height = 304
      Align = alRight
      TabOrder = 1
      Visible = False
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 62
        Height = 13
        Caption = #1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080
      end
      object Label2: TLabel
        Left = 16
        Top = 64
        Width = 85
        Height = 13
        Caption = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1084#1110#1089#1103#1094#1110#1074
      end
      object Label3: TLabel
        Left = 16
        Top = 104
        Width = 123
        Height = 13
        Caption = #1050#1086#1084#1087#1072#1085#1110#1103' '#1087#1088#1077#1076#1089#1090#1072#1074#1085#1080#1082#1110#1074
      end
      object Label4: TLabel
        Left = 160
        Top = 152
        Width = 105
        Height = 24
        Caption = #1062#1110#1085#1072' '#1090#1086#1074#1072#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 152
        Top = 16
        Width = 145
        Height = 21
        KeyField = #1050#1086#1076' '#1088#1077#1082#1083#1072#1084#1080
        ListField = #1058#1080#1087' '#1087#1086#1089#1083#1091#1075#1080
        ListSource = DataModule2.DataSposlygi
        TabOrder = 0
      end
      object Edit1: TEdit
        Left = 152
        Top = 56
        Width = 129
        Height = 21
        TabOrder = 1
        Text = '1'
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 152
        Top = 96
        Width = 145
        Height = 21
        KeyField = #1050#1086#1076' '#1082#1086#1084#1087#1072#1085#1110#1111
        ListField = #1053#1072#1079#1074#1072
        ListSource = DataModule2.DataSKompanii
        TabOrder = 2
      end
      object Button1: TButton
        Left = 16
        Top = 144
        Width = 137
        Height = 41
        Caption = #1044#1086#1076#1072#1090#1080
        TabOrder = 4
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 16
        Top = 200
        Width = 137
        Height = 41
        Caption = #1042#1080#1076#1072#1083#1080#1090#1080
        TabOrder = 3
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 16
        Top = 256
        Width = 137
        Height = 41
        Caption = #1053#1072#1076#1088#1091#1082#1091#1074#1072#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
        TabOrder = 5
        OnClick = Button3Click
      end
    end
    object DateTimePicker1: TDateTimePicker
      Left = 32
      Top = 24
      Width = 153
      Height = 21
      CalAlignment = dtaLeft
      Date = 44513.6344277431
      Time = 44513.6344277431
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object Button4: TButton
      Left = 32
      Top = 56
      Width = 153
      Height = 25
      Caption = #1057#1090#1074#1086#1088#1080#1090#1080' '#1076#1086#1075#1086#1074#1110#1088
      Enabled = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 32
      Top = 112
      Width = 153
      Height = 21
      KeyField = #1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072
      ListField = #1060#1030#1054
      ListSource = DataModule2.DataSPers
      TabOrder = 4
      OnClick = DBLookupComboBox3Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 1000
    Top = 8
    object N1: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1082#1072
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = ' '#1055#1088#1072#1081#1089'-'#1083#1080#1089#1090
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1110
      OnClick = N3Click
    end
  end
end
