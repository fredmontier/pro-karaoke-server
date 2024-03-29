object FrmLookup: TFrmLookup
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 477
  ClientWidth = 550
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  DesignSize = (
    550
    477)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 550
    Height = 50
    Align = alTop
    Color = clInactiveCaptionText
    ParentBackground = False
    TabOrder = 0
    object RzLabel2: TRzLabel
      Left = 10
      Top = 28
      Width = 86
      Height = 12
      Caption = 'Pencarian Data'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = [fsItalic]
      ParentFont = False
      HighlightColor = clBlack
      TextStyle = tsRaised
    end
    object RzLabel1: TRzLabel
      Left = 10
      Top = 3
      Width = 180
      Height = 23
      AutoSize = False
      Caption = 'LOOKUP DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 39423
      Font.Height = -24
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      LightTextStyle = True
      TextStyle = tsRaised
    end
  end
  object spSkinPanel1: TspSkinPanel
    Left = 0
    Top = 62
    Width = 549
    Height = 412
    HintImageIndex = 0
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 1
    DrawDefault = True
    SkinDataName = 'panel'
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
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    Caption = 'spSkinPanel1'
    DesignSize = (
      549
      412)
    object spSkinDBGrid1: TspSkinDBGrid
      Left = 6
      Top = 5
      Width = 537
      Height = 361
      HintImageIndex = 0
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'grid'
      AlphaBlend = False
      AlphaBlendValue = 200
      UseSkinCursor = False
      Transparent = False
      WallpaperStretch = False
      UseSkinFont = True
      UseSkinCellHeight = True
      GridLineColor = clWindowText
      ColSizingwithLine = False
      DrawGraphicFields = False
      UseColumnsFont = False
      DefaultRowHeight = 17
      MouseWheelSupport = False
      SaveMultiSelection = False
      PickListBoxSkinDataName = 'listbox'
      PickListBoxCaptionMode = False
      DataSource = DataSource1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = spSkinDBGrid1DblClick
      OnKeyDown = spSkinDBGrid1KeyDown
    end
    object spSkinDBNavigator1: TspSkinDBNavigator
      Left = 3
      Top = 375
      Width = 540
      Height = 34
      HintImageIndex = 0
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'panel'
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
      TransparentMode = True
      CaptionImageIndex = -1
      RealHeight = -1
      AutoEnabledControls = True
      CheckedMode = False
      Checked = False
      NumGlyphs = 1
      Spacing = 2
      DefaultAlignment = taLeftJustify
      DefaultCaptionHeight = 22
      BorderStyle = bvNone
      CaptionMode = False
      RollUpMode = False
      RollUpState = False
      AdditionalGlyphs = False
      SkinMessage = DM.Message1
      DataSource = DataSource1
      BtnSkinDataName = 'button'
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.Lookup
    Left = 72
    Top = 96
  end
  object spDynamicSkinForm1: TspDynamicSkinForm
    WindowState = wsNormal
    ShowMDIScrollBars = True
    QuickButtons = <>
    QuickButtonsShowHint = False
    ClientInActiveEffect = False
    ClientInActiveEffectType = spieSemiTransparent
    DisableSystemMenu = False
    PositionInMonitor = sppDefault
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    UseSkinFontInCaption = True
    UseSkinSizeInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    ShowObjectHint = False
    UseDefaultObjectHint = True
    UseSkinCursors = False
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = True
    SupportNCArea = True
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    AlphaBlend = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    SkinData = DM.SkinData1
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Sizeable = True
    DraggAble = False
    NCDraggAble = True
    Magnetic = False
    MagneticSize = 10
    BorderIcons = [biSystemMenu]
    Left = 104
    Top = 96
  end
end
