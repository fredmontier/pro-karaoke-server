object FrmDurasiRoom: TFrmDurasiRoom
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 193
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 18
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Proses'
    Transparent = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 272
    Height = 49
    Align = alTop
    BevelOuter = bvNone
    Color = clBackground
    ParentBackground = False
    TabOrder = 3
    object Label1: TLabel
      Left = 11
      Top = 9
      Width = 165
      Height = 19
      Caption = 'DURASI ROOM 001'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DLight
      Font.Height = -19
      Font.Name = 'MS Gothic'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 11
      Top = 28
      Width = 176
      Height = 13
      Caption = 'penambahan durasi room'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = cl3DLight
      Font.Height = -13
      Font.Name = 'MS Gothic'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object BtnSave: TspSkinButton
    Left = 145
    Top = 98
    Width = 106
    Height = 31
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
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
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
    Caption = 'Simpan'
    NumGlyphs = 1
    Spacing = 1
    ModalResult = 1
    OnClick = BtnSaveClick
  end
  object BtnCancel: TspSkinButton
    Left = 145
    Top = 135
    Width = 106
    Height = 31
    HintImageIndex = 0
    TabOrder = 4
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
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
    Caption = 'Batal'
    NumGlyphs = 1
    Spacing = 1
    ModalResult = 2
  end
  object Durasi: TAdvEdit
    Left = 18
    Top = 98
    Width = 121
    Height = 72
    EditAlign = eaCenter
    EditType = etNumeric
    EmptyText = '0'
    Flat = True
    FocusColor = clBtnFace
    ReturnIsTab = True
    LabelFont.Charset = DEFAULT_CHARSET
    LabelFont.Color = clWindowText
    LabelFont.Height = -11
    LabelFont.Name = 'Tahoma'
    LabelFont.Style = []
    Lookup.Separator = ';'
    BorderStyle = bsNone
    Color = clBtnFace
    Enabled = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -53
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0'
    Transparent = True
    Visible = True
    Version = '2.8.6.7'
  end
  object cmbAddHour: TspSkinComboBox
    Left = 56
    Top = 61
    Width = 195
    Height = 20
    HintImageIndex = 0
    TabOrder = 0
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'combobox'
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
    UseSkinSize = True
    ToolButtonStyle = False
    HideSelection = True
    AutoComplete = True
    HorizontalExtent = False
    ImageIndex = -1
    ListBoxUseSkinItemHeight = True
    ListBoxAlphaBlend = False
    ListBoxAlphaBlendAnimation = False
    ListBoxAlphaBlendValue = 200
    ListBoxWidth = 0
    ListBoxCaptionMode = False
    ListBoxUseSkinFont = True
    ListBoxDefaultFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultFont.Color = clWindowText
    ListBoxDefaultFont.Height = 14
    ListBoxDefaultFont.Name = 'Arial'
    ListBoxDefaultFont.Style = []
    ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultCaptionFont.Color = clWindowText
    ListBoxDefaultCaptionFont.Height = 14
    ListBoxDefaultCaptionFont.Name = 'Arial'
    ListBoxDefaultCaptionFont.Style = []
    ListBoxDefaultItemHeight = 20
    ListBoxCaptionAlignment = taLeftJustify
    CharCase = ecNormal
    DefaultColor = clWindow
    ItemIndex = -1
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    Sorted = False
    Style = spcbFixedStyle
    OnChange = cmbAddHourChange
  end
  object spDynamicSkinForm1: TspDynamicSkinForm
    UseRibbon = False
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
    MenusSkinData = DM.SkinData1
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Sizeable = True
    DraggAble = False
    NCDraggAble = True
    Magnetic = False
    MagneticSize = 10
    BorderIcons = []
    Left = 226
    Top = 88
  end
end
