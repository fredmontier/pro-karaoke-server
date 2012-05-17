object FrmEditVideo: TFrmEditVideo
  Left = 49
  Top = 55
  BorderIcons = [biSystemMenu]
  Caption = ':: Edit Video ::'
  ClientHeight = 657
  ClientWidth = 902
  Color = clBtnFace
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
  OnShow = FormShow
  DesignSize = (
    902
    657)
  PixelsPerInch = 96
  TextHeight = 13
  object spSkinStdLabel1: TspSkinStdLabel
    Left = 545
    Top = 14
    Width = 110
    Height = 13
    EllipsType = spetNone
    UseSkinFont = True
    UseSkinColor = True
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -11
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    SkinData = DM.SkinData1
    SkinDataName = 'stdlabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Anchors = [akTop, akRight]
    Caption = 'Direktori Penyimpanan '
    ParentFont = False
    ExplicitLeft = 476
  end
  object spSkinStdLabel4: TspSkinStdLabel
    Left = 8
    Top = 14
    Width = 67
    Height = 13
    EllipsType = spetNone
    UseSkinFont = True
    UseSkinColor = True
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -11
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    SkinData = DM.SkinData1
    SkinDataName = 'stdlabel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Caption = 'Preview Video'
    ParentFont = False
  end
  object Label3: TLabel
    Left = 360
    Top = 16
    Width = 206
    Height = 13
    Caption = 'Double Klik Pada Tabel Untuk Pilih Edit Lagu'
  end
  object grid: TAdvStringGrid
    Left = 358
    Top = 35
    Width = 536
    Height = 584
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 10
    DefaultRowHeight = 21
    DrawingStyle = gdsClassic
    RowCount = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
    ParentFont = False
    ParentShowHint = False
    PopupMenu = spSkinPopupMenu1
    ScrollBars = ssBoth
    ShowHint = True
    TabOrder = 0
    OnDblClick = gridDblClick
    OnCanEditCell = gridCanEditCell
    OnGetEditorType = gridGetEditorType
    OnGetEditorProp = gridGetEditorProp
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    CellNode.ShowTree = False
    ColumnSize.Stretch = True
    ControlLook.FixedGradientHoverFrom = clGray
    ControlLook.FixedGradientHoverTo = clWhite
    ControlLook.FixedGradientDownFrom = clGray
    ControlLook.FixedGradientDownTo = clSilver
    ControlLook.ControlStyle = csClassic
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'MS Sans Serif'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    EnhRowColMove = False
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'MS Sans Serif'
    FilterDropDown.Font.Style = []
    FilterDropDownClear = '(All)'
    FixedColWidth = 40
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = []
    FloatFormat = '%.4f'
    Navigation.AllowDeleteRow = True
    Navigation.AdvanceOnEnter = True
    Navigation.AdvanceInsert = True
    Navigation.AdvanceAuto = True
    Navigation.InsertPosition = pInsertAfter
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'MS Sans Serif'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'MS Sans Serif'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'MS Sans Serif'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'MS Sans Serif'
    PrintSettings.FooterFont.Style = []
    PrintSettings.Borders = pbNoborder
    PrintSettings.Centered = False
    PrintSettings.PageNumSep = '/'
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'MS Sans Serif'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurence'
    SearchFooter.HintFindPrev = 'Find previous occurence'
    SearchFooter.HintHighlight = 'Highlight occurences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SearchFooter.ShowClose = False
    SearchFooter.ShowMatchCase = False
    SearchFooter.Visible = True
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SortSettings.Column = 0
    Version = '5.6.0.0'
    WordWrap = False
    ExplicitWidth = 375
    ColWidths = (
      40
      64
      64
      64
      64
      64
      64
      64
      64
      64)
    RowHeights = (
      21
      21
      21
      21
      21)
  end
  object btnPlay: TspSkinButton
    Left = 269
    Top = 319
    Width = 41
    Height = 25
    Hint = 
      'Untuk memulai preview video, anda harus mendaftarkan file video ' +
      'pada table file video dengan cara menekan tombol F2'
    HintImageIndex = 0
    TabOrder = 1
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = False
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    ShowHint = True
    TabStop = True
    CanFocused = True
    Down = False
    GroupIndex = 0
    Caption = 'Play'
    NumGlyphs = 1
    Spacing = 1
    OnClick = btnPlayClick
  end
  object btnStop: TspSkinButton
    Left = 311
    Top = 319
    Width = 41
    Height = 25
    HintImageIndex = 0
    TabOrder = 2
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = False
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    TabStop = True
    CanFocused = True
    Down = False
    GroupIndex = 0
    Caption = 'Stop'
    NumGlyphs = 1
    Spacing = 1
    OnClick = btnStopClick
  end
  object ServerDir: TspSkinDirectoryEdit
    Left = 658
    Top = 11
    Width = 236
    Height = 20
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = True
    SkinData = DM.SkinData1
    SkinDataName = 'buttonedit'
    AlphaBlend = False
    AlphaBlendValue = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    Anchors = [akTop, akRight]
    Enabled = False
    ParentFont = False
    TabOrder = 3
    ButtonImageIndex = 0
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    DlgTreeShowLines = True
    DlgTreeButtonExpandImageIndex = 0
    DlgTreeButtonNoExpandImageIndex = 1
    DlgShowToolBar = True
    DlgToolButtonImageIndex = 0
    ExplicitLeft = 589
  end
  object Posisi: TspSkinTrackBar
    Left = 9
    Top = 293
    Width = 343
    Height = 20
    HintImageIndex = 0
    TabOrder = 4
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'htrackbar'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    JumpWhenClick = False
    CanFocused = False
    MouseSupport = True
    MinValue = 0
    MaxValue = 100
    Value = 0
    Vertical = False
    OnLastChange = PosisiLastChange
  end
  object Volume1: TspSkinSlider
    Left = 9
    Top = 320
    Width = 91
    Height = 27
    HintImageIndex = 0
    TabOrder = 5
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'slider'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    ThumbImageIndex = 0
    ThumbActiveImageIndex = 1
    Increment = 1
    Options = [soShowFocus, soSmooth]
    Value = 50
    Transparent = True
    UseSkinThumb = True
    OnChange = Volume1Change
    OnClick = Volume1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 35
    Width = 344
    Height = 252
    Hint = 
      'Untuk memulai preview video, anda harus mendaftarkan file video ' +
      'pada table file video dengan cara menekan tombol F2'
    Caption = 'Video Preview'
    Color = clBlue
    Ctl3D = False
    ParentBackground = False
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object RBLeft: TRadioButton
    Left = 106
    Top = 324
    Width = 48
    Height = 17
    Caption = 'Left'
    Checked = True
    TabOrder = 7
    TabStop = True
    OnClick = RBLeftClick
  end
  object RBRight: TRadioButton
    Left = 160
    Top = 324
    Width = 48
    Height = 17
    Caption = 'Right'
    TabOrder = 8
    OnClick = RBRightClick
  end
  object RadioButton1: TRadioButton
    Left = 214
    Top = 324
    Width = 52
    Height = 17
    Caption = 'Stereo'
    TabOrder = 9
    OnClick = RadioButton1Click
  end
  object RzGroupBox1: TRzGroupBox
    Left = 3
    Top = 353
    Width = 349
    Height = 104
    Caption = 'Mode Pencarian  '
    TabOrder = 10
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = 'Judul : '
    end
    object Label2: TLabel
      Left = 19
      Top = 46
      Width = 32
      Height = 13
      Caption = 'Artis : '
    end
    object EdJudul: TEdit
      Left = 57
      Top = 21
      Width = 280
      Height = 19
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      Text = 'EdJudul'
    end
    object EdArtis: TEdit
      Left = 57
      Top = 43
      Width = 280
      Height = 19
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      Text = 'Edit1'
    end
    object BtnSearch: TspSkinButton
      Left = 240
      Top = 70
      Width = 97
      Height = 25
      Hint = 
        'Untuk memulai preview video, anda harus mendaftarkan file video ' +
        'pada table file video dengan cara menekan tombol F2'
      HintImageIndex = 0
      TabOrder = 2
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'button'
      AlphaBlend = False
      AlphaBlendValue = 200
      UseSkinCursor = False
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      UseSkinFont = True
      DefaultWidth = 0
      DefaultHeight = 0
      CheckedMode = False
      ImageIndex = -1
      AlwaysShowLayeredFrame = False
      UseSkinSize = False
      UseSkinFontColor = True
      RepeatMode = False
      RepeatInterval = 100
      AllowAllUp = False
      ShowHint = True
      TabStop = True
      CanFocused = True
      Down = False
      GroupIndex = 0
      Caption = 'Mulai Pencarian'
      NumGlyphs = 1
      Spacing = 1
      OnClick = BtnSearchClick
    end
  end
  object gauge: TspSkinGauge
    Left = 3
    Top = 607
    Width = 349
    Height = 24
    HintImageIndex = 0
    TabOrder = 11
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'gauge'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    ProgressAnimationPause = 1000
    UseSkinSize = False
    TextAlphaBlend = False
    TextAlphaBlendValue = 200
    ShowProgressText = True
    ShowPercent = True
    MinValue = 0
    MaxValue = 100
    Value = 50
    Vertical = False
  end
  object BtnSave: TspSkinButton
    Left = 3
    Top = 567
    Width = 349
    Height = 34
    Hint = 
      'Untuk memulai preview video, anda harus mendaftarkan file video ' +
      'pada table file video dengan cara menekan tombol F2'
    HintImageIndex = 0
    TabOrder = 12
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = False
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    ShowHint = True
    TabStop = True
    CanFocused = True
    Down = False
    GroupIndex = 0
    Caption = 'Simpan'
    NumGlyphs = 1
    Spacing = 1
    OnClick = BtnSaveClick
  end
  object RzGroupBox2: TRzGroupBox
    Left = 3
    Top = 471
    Width = 349
    Height = 90
    Caption = ' Data Siap Simpan '
    TabOrder = 13
    object LbJudul: TLabel
      Left = 6
      Top = 24
      Width = 44
      Height = 13
      Caption = 'Judul    : '
    end
    object LbArtis: TLabel
      Left = 6
      Top = 43
      Width = 41
      Height = 13
      Caption = 'Artis     :'
    end
    object LbKategori: TLabel
      Left = 6
      Top = 62
      Width = 50
      Height = 13
      Caption = 'Kategori : '
    end
  end
  object OD: TspSkinOpenDialog
    ShowHiddenFiles = False
    ToolButtonsTransparent = False
    OverwritePromt = False
    DialogWidth = 0
    DialogHeight = 0
    DialogMinWidth = 0
    DialogMinHeight = 0
    CheckFileExists = True
    MultiSelection = False
    AlphaBlend = False
    AlphaBlendValue = 225
    AlphaBlendAnimation = False
    CtrlAlphaBlend = False
    CtrlAlphaBlendValue = 225
    CtrlAlphaBlendAnimation = False
    LVHeaderSkinDataName = 'resizetoolbutton'
    SkinData = DM.SkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Title = 'Open file'
    Filter = 'All files|*.*'
    FilterIndex = 1
    Left = 624
    Top = 216
  end
  object ColumnComboEditLink3: TColumnComboEditLink
    Tag = 0
    AutoPopupWidth = False
    EditStyle = esInplace
    PopupWidth = 0
    PopupHeight = 0
    WantKeyLeftRight = False
    WantKeyUpDown = True
    WantKeyHomeEnd = False
    WantKeyPriorNext = False
    WantKeyReturn = False
    WantKeyEscape = False
    Columns = 3
    DirectDrop = False
    DropHeight = 200
    DropWidth = 150
    EditColumn = 1
    Etched = True
    Flat = True
    GridLines = False
    Items.Strings = (
      'Good'
      'Bad'
      'Unknown')
    LookupColumn = 1
    LookupIncr = False
    Left = 656
    Top = 176
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 616
    Top = 176
  end
  object spSkinPopupMenu1: TspSkinPopupMenu
    Left = 704
    Top = 216
    object Hapus1Baris1: TMenuItem
      Caption = 'Hapus 1 Baris'
      OnClick = Hapus1Baris1Click
    end
    object HapusSemuaBaris1: TMenuItem
      Caption = 'Hapus Semua Baris'
      OnClick = HapusSemuaBaris1Click
    end
  end
end
