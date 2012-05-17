object FrmMain: TFrmMain
  Left = 439
  Top = 110
  Caption = ' ProKaraoke Server v4 [Rev.1.0.0.6]'
  ClientHeight = 457
  ClientWidth = 831
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzStatusBar1: TRzStatusBar
    Left = 0
    Top = 438
    Width = 831
    Height = 19
    BorderInner = fsNone
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight, sdBottom]
    BorderWidth = 0
    TabOrder = 0
    VisualStyle = vsGradient
    object RzMarqueeStatus1: TRzMarqueeStatus
      Left = 273
      Top = 0
      Width = 195
      Height = 19
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Blinking = True
      Caption = 'SERVER BILLING'
      ExplicitLeft = 430
    end
    object RzClockStatus1: TRzClockStatus
      Left = 468
      Top = 0
      Width = 146
      Height = 19
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Alignment = taRightJustify
      ExplicitLeft = 619
      ExplicitHeight = 21
    end
    object RzStatusPane1: TRzStatusPane
      Left = 0
      Top = 0
      Width = 273
      Height = 19
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Caption = 'User Login As '
    end
    object progressBar: TRzProgressStatus
      Left = 601
      Top = 0
      Width = 230
      Height = 19
      Align = alRight
      ParentShowHint = False
      PartsComplete = 0
      Percent = 0
      TotalParts = 0
      ExplicitLeft = 620
    end
  end
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 22
    Width = 831
    Height = 416
    Position = 175
    Percent = 21
    HotSpotVisible = True
    SplitterWidth = 7
    Align = alClient
    TabOrder = 1
    BarSize = (
      175
      0
      182
      416)
    UpperLeftControls = (
      RzGroupBar1)
    LowerRightControls = (
      PanelDepan)
    object RzGroupBar1: TRzGroupBar
      Left = 0
      Top = 0
      Width = 175
      Height = 416
      GradientColorStyle = gcsMSOffice
      GradientColorStart = clBtnFace
      GradientColorStop = clBtnShadow
      GroupBorderSize = 8
      Align = alClient
      BorderWidth = 1
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
      object RzGroup5: TRzGroup
        Tag = -1
        Items = <
          item
            Action = DataStockFB
          end
          item
            Action = DataMenuFB
          end
          item
            Action = ListOrderFAndB
          end
          item
            Action = StockMasuk
          end
          item
            Action = AdjustmentStock
          end>
        Opened = False
        OpenedHeight = 127
        DividerVisible = False
        Caption = 'MASTER F & B'
        ParentColor = False
      end
      object RzGroup2: TRzGroup
        Tag = -2
        Items = <
          item
            Action = DataRoom
          end
          item
            Action = HargaSewaRoom
          end
          item
            Action = Member
          end
          item
            Action = BillingTransaksi
          end>
        Opened = False
        OpenedHeight = 107
        DividerVisible = False
        Caption = 'BILLING'
        ParentColor = False
      end
      object RzGroup3: TRzGroup
        Tag = -3
        Items = <
          item
            Action = InputVideo
          end
          item
            Action = TransferDataVIdeo
          end
          item
            Action = VideoEditing
          end
          item
            Action = VideoEqualizer
          end
          item
            Action = VideoTopChart
          end
          item
            Action = SyncDatabase
          end
          item
            Action = EncryptDatabase
          end>
        Opened = True
        OpenedHeight = 167
        DividerVisible = False
        Caption = 'VIDEO MANAGER'
        ParentColor = False
      end
      object RzGroup4: TRzGroup
        Tag = -4
        Items = <
          item
            Action = UserRegistration
          end
          item
            Action = GantiPassword
          end
          item
            Action = BackupDatabase
          end
          item
            Action = DataKaryawan
          end
          item
            Action = RemoteRoom
          end
          item
            Action = IfoTeksRoom
          end
          item
            Action = DesignReport
          end>
        Opened = False
        OpenedHeight = 167
        DividerVisible = False
        Caption = 'UTILITY'
        ParentColor = False
      end
      object RzGroup7: TRzGroup
        Tag = -6
        Items = <
          item
            Action = LapDaftarStock
          end
          item
            Action = LapDaftarMenuFnB
          end
          item
            Action = LapDaftarStockMasuk
          end
          item
            Action = LapDaftarPemakaianStock
          end
          item
            Action = LapDaftarStockPertanggal
          end
          item
            Action = LapKartuStock
          end
          item
            Action = LapAdjustmentStock
          end
          item
            Action = LapDaftarRoomCafe
          end
          item
            Action = LapDaftarHargaSewa
          end
          item
            Action = LapDaftarMember
          end
          item
            Action = LapBillingTransaksiHarian
          end
          item
            Action = LapRequestSong
          end
          item
            Action = LapSaran
          end>
        Opened = False
        OpenedHeight = 287
        DividerVisible = False
        Caption = 'REPORT'
        ParentColor = False
      end
      object RzGroup6: TRzGroup
        Tag = -5
        Items = <
          item
            Action = Setting
          end
          item
            Action = LockSistem
          end
          item
            Action = ReloadMenu
          end
          item
            Action = Help
          end
          item
            Action = Exit
          end>
        Opened = False
        OpenedHeight = 127
        DividerVisible = False
        Caption = 'SISTEM'
        ParentColor = False
      end
    end
    object PanelDepan: TspSkinGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 643
      Height = 410
      HintImageIndex = 0
      TabOrder = 0
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'groupbox'
      AlphaBlend = False
      AlphaBlendValue = 200
      UseSkinCursor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      RibbonStyle = False
      ImagePosition = spipDefault
      TransparentMode = False
      CaptionImageIndex = -1
      RealHeight = -1
      AutoEnabledControls = True
      CheckedMode = False
      Checked = False
      NumGlyphs = 1
      Spacing = 2
      DefaultAlignment = taLeftJustify
      DefaultCaptionHeight = 22
      BorderStyle = bvFrame
      CaptionMode = True
      RollUpMode = False
      RollUpState = False
      Caption = ' ProKaraoke Server v4'
      Align = alClient
      UseSkinSize = True
      object Image1: TImage
        Left = 1
        Top = 23
        Width = 641
        Height = 386
        Align = alClient
        Center = True
        Stretch = True
        ExplicitLeft = 272
        ExplicitTop = 144
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
    end
  end
  object spSkinMainMenuBar1: TspSkinMainMenuBar
    Left = 0
    Top = 0
    Width = 831
    Height = 22
    HintImageIndex = 0
    TabOrder = 2
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'mainmenubar'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    ToolBarMode = False
    ToolBarModeItemTransparent = False
    UseSkinSize = True
    UseSkinFont = True
    ScrollMenu = True
    DefItemFont.Charset = DEFAULT_CHARSET
    DefItemFont.Color = clBtnText
    DefItemFont.Height = 14
    DefItemFont.Name = 'Arial'
    DefItemFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 22
    PopupToUp = False
  end
  object ActionList1: TActionList
    Left = 216
    Top = 24
    object DataStockFB: TAction
      Tag = 1
      Caption = 'Data &Stock F&&B'
      OnExecute = DataStockFBExecute
    end
    object DataMenuFB: TAction
      Tag = 2
      Caption = 'Data &Menu F&&B'
      OnExecute = DataMenuFBExecute
    end
    object StockMasuk: TAction
      Tag = 3
      Caption = 'StockMasuk'
      OnExecute = StockMasukExecute
    end
    object AdjustmentStock: TAction
      Tag = 4
      Caption = 'Adjustment Stock'
      OnExecute = AdjustmentStockExecute
    end
    object DataRoom: TAction
      Tag = 6
      Caption = 'Data Room'
      OnExecute = DataRoomExecute
    end
    object HargaSewaRoom: TAction
      Tag = 7
      Caption = 'Harga Sewa Room'
      OnExecute = HargaSewaRoomExecute
    end
    object Member: TAction
      Tag = 8
      Caption = 'Member'
      OnExecute = MemberExecute
    end
    object BillingTransaksi: TAction
      Tag = 9
      Caption = 'Billing Transaksi'
      OnExecute = BillingTransaksiExecute
    end
    object TransferDataVIdeo: TAction
      Tag = 11
      Caption = 'Transfer Data VIdeo'
    end
    object VideoEditing: TAction
      Tag = 12
      Caption = 'Video Editing'
      OnExecute = VideoEditingExecute
    end
    object VideoEqualizer: TAction
      Tag = 13
      Caption = 'Video Equalizer'
    end
    object VideoTopChart: TAction
      Tag = 14
      Caption = 'Video Top Chart'
    end
    object UserRegistration: TAction
      Tag = 16
      Caption = 'User Registration'
      OnExecute = UserRegistrationExecute
    end
    object GantiPassword: TAction
      Tag = 17
      Caption = 'GantiPassword'
    end
    object BackupDatabase: TAction
      Tag = 18
      Caption = 'Backup Database'
    end
    object DataKaryawan: TAction
      Tag = 19
      Caption = 'DataKaryawan'
    end
    object IfoTeksRoom: TAction
      Tag = 20
      Caption = 'Info Teks Room'
    end
    object Setting: TAction
      Tag = 22
      Caption = 'Settings'
      OnExecute = SettingExecute
    end
    object LockSistem: TAction
      Caption = 'Lock Sistem'
      OnExecute = LockSistemExecute
    end
    object ReloadMenu: TAction
      Caption = 'Reload Menu'
      OnExecute = ReloadMenuExecute
    end
    object Exit: TAction
      Caption = 'Exit'
      OnExecute = ExitExecute
    end
    object RemoteRoom: TAction
      Tag = 23
      Caption = 'Remote Room'
      OnExecute = RemoteRoomExecute
    end
    object InputVideo: TAction
      Tag = 112
      Caption = 'Input Video'
      OnExecute = InputVideoExecute
    end
    object ListOrderFAndB: TAction
      Tag = 24
      Caption = 'List Order F&&B'
      OnExecute = ListOrderFAndBExecute
    end
    object LapLogTeknisi: TAction
      Tag = 200
      Caption = 'Log Teknisi'
    end
    object LapDaftarStock: TAction
      Tag = 100
      Caption = 'Daftar Stock'
      OnExecute = LapDaftarStockExecute
    end
    object LapDaftarMenuFnB: TAction
      Tag = 101
      Caption = 'Daftar Menu F&&B'
      OnExecute = LapDaftarMenuFnBExecute
    end
    object LapDaftarStockMasuk: TAction
      Tag = 102
      Caption = 'Daftar Stock Masuk'
      OnExecute = LapDaftarStockMasukExecute
    end
    object LapDaftarPemakaianStock: TAction
      Tag = 103
      Caption = 'Daftar Pemakaian Stock'
      OnExecute = LapDaftarPemakaianStockExecute
    end
    object LapDaftarStockPertanggal: TAction
      Tag = 113
      Caption = 'Daftar Stock Per Tanggal'
      OnExecute = LapDaftarStockPertanggalExecute
    end
    object LapKartuStock: TAction
      Tag = 104
      Caption = 'Kartu Stock'
      OnExecute = LapKartuStockExecute
    end
    object LapAdjustmentStock: TAction
      Tag = 105
      Caption = 'Adjustment Stock'
      OnExecute = LapAdjustmentStockExecute
    end
    object LapDaftarRoomCafe: TAction
      Tag = 107
      Caption = 'Daftar Room dan Cafe'
      OnExecute = LapDaftarRoomCafeExecute
    end
    object LapDaftarHargaSewa: TAction
      Tag = 108
      Caption = 'Daftar Harga Sewa'
      OnExecute = LapDaftarHargaSewaExecute
    end
    object LapDaftarMember: TAction
      Tag = 109
      Caption = 'Daftar Member'
      OnExecute = LapDaftarMemberExecute
    end
    object LapBillingTransaksiHarian: TAction
      Tag = 110
      Caption = 'Billing Transaksi Harian'
      OnExecute = LapBillingTransaksiHarianExecute
    end
    object SyncDatabase: TAction
      Tag = 111
      Caption = 'Sync Database'
      OnExecute = SyncDatabaseExecute
    end
    object DesignReport: TAction
      Tag = 999
      Caption = 'Design Report'
      OnExecute = DesignReportExecute
    end
    object Help: TAction
      Caption = 'Help (Pdf)'
      OnExecute = HelpExecute
    end
    object LapRequestSong: TAction
      Tag = 120
      Caption = 'Request Song'
      OnExecute = LapRequestSongExecute
    end
    object LapSaran: TAction
      Tag = 121
      Caption = 'Rekap Saran'
      OnExecute = LapSaranExecute
    end
    object EncryptDatabase: TAction
      Tag = 122
      Caption = 'Encrypt Database'
      OnExecute = EncryptDatabaseExecute
    end
  end
  object RzGroupController1: TRzGroupController
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ShowItemSelection = True
    ItemSelectionStyle = issImage
    Left = 248
    Top = 24
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    GradientEnd = 11982554
    GradientStart = clWindow
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    MemoParentFont = False
    Left = 320
    Top = 88
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 288
    Top = 88
  end
  object frxReport1: TfrxReport
    Version = '4.10.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #212#164#201#232
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40966.149136550930000000
    ReportOptions.LastChange = 40966.149136550930000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 256
    Top = 88
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 352
    Top = 88
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 400
    Top = 88
  end
end
