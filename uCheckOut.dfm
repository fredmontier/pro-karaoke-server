object FrmCheckOut: TFrmCheckOut
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 603
  ClientWidth = 638
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    638
    603)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 21
    Top = 63
    Width = 106
    Height = 19
    Caption = 'Paket Promo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label2: TLabel
    Left = 21
    Top = 91
    Width = 103
    Height = 19
    Caption = 'Room / Cafe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 20
    Top = 119
    Width = 132
    Height = 19
    Caption = 'Guest / Member'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 19
    Top = 369
    Width = 127
    Height = 19
    Caption = 'Total Transaksi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object LabelCharge: TLabel
    Left = 21
    Top = 302
    Width = 75
    Height = 19
    Caption = 'Service : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object RzSeparator1: TRzSeparator
    Left = 53
    Top = 401
    Width = 426
    Height = 1
    ShowGradient = True
    Color = clBtnFace
  end
  object LabelDiscountRoom: TLabel
    Left = 21
    Top = 176
    Width = 122
    Height = 19
    Caption = 'Discount Room'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 21
    Top = 409
    Width = 107
    Height = 19
    Caption = 'Free Voucher'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label8: TLabel
    Left = 318
    Top = 277
    Width = 55
    Height = 13
    Caption = 'Compliment'
    Transparent = True
    Visible = False
  end
  object Label9: TLabel
    Left = 331
    Top = 380
    Width = 55
    Height = 13
    Caption = 'Total Bayar'
    Transparent = True
    Visible = False
  end
  object Label10: TLabel
    Left = 19
    Top = 435
    Width = 88
    Height = 19
    Caption = 'Tipe Bayar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 21
    Top = 492
    Width = 69
    Height = 19
    Caption = 'Di Bayar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label12: TLabel
    Left = 21
    Top = 522
    Width = 86
    Height = 19
    Caption = 'Kembalian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object RzSeparator2: TRzSeparator
    Left = 20
    Top = 549
    Width = 427
    Height = 1
    ShowGradient = True
    Color = clBtnFace
  end
  object Label14: TLabel
    Left = 367
    Top = 465
    Width = 77
    Height = 19
    Caption = 'No. Kartu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label15: TLabel
    Left = 315
    Top = 408
    Width = 67
    Height = 19
    Caption = 'Nominal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label16: TLabel
    Left = 19
    Top = 147
    Width = 95
    Height = 19
    Caption = 'Total Room'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label17: TLabel
    Left = 21
    Top = 204
    Width = 81
    Height = 19
    Caption = 'Total F&&B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label18: TLabel
    Left = 23
    Top = 266
    Width = 69
    Height = 19
    Caption = 'Subtotal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object RzSeparator3: TRzSeparator
    Left = 54
    Top = 294
    Width = 426
    Height = 1
    ShowGradient = True
    Color = clBtnFace
  end
  object Label19: TLabel
    Left = 21
    Top = 332
    Width = 63
    Height = 19
    Caption = 'Pajak : '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object RzSeparator4: TRzSeparator
    Left = 55
    Top = 359
    Width = 426
    Height = 1
    ShowGradient = True
    Color = clBtnFace
  end
  object Label5: TLabel
    Left = 19
    Top = 465
    Width = 82
    Height = 19
    Caption = 'Pilih Bank'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label6: TLabel
    Left = 21
    Top = 236
    Width = 108
    Height = 19
    Caption = 'Discount F&&B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 50
    Align = alTop
    Color = clInactiveCaptionText
    ParentBackground = False
    TabOrder = 16
    DesignSize = (
      638
      50)
    object RzLabel2: TRzLabel
      Left = 10
      Top = 30
      Width = 110
      Height = 12
      Caption = 'Check out transaksi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      HighlightColor = clBlack
      TextStyle = tsRaised
    end
    object RzLabel1: TRzLabel
      Left = 10
      Top = 6
      Width = 177
      Height = 26
      AutoSize = False
      Caption = 'CHECK OUT'
      Font.Charset = ANSI_CHARSET
      Font.Color = 39423
      Font.Height = -24
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      LightTextStyle = True
      TextStyle = tsRaised
    end
    object TransNum: TRzLabel
      Left = 128
      Top = 27
      Width = 190
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Check out transaksi'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Arial Rounded MT Bold'
      Font.Style = []
      ParentFont = False
      HighlightColor = clBlack
      TextStyle = tsRaised
    end
    object LabelTotal: TRzLabel
      Left = 363
      Top = 4
      Width = 272
      Height = 41
      Alignment = taRightJustify
      Anchors = [akLeft, akRight]
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 39423
      Font.Height = -37
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      LightTextStyle = True
      TextStyle = tsRaised
      ExplicitWidth = 230
    end
  end
  object PaketPromo: TspSkinEdit
    Left = 197
    Top = 61
    Width = 281
    Height = 25
    Text = 'PaketPromo'
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    ReadOnly = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Enabled = False
    ParentFont = False
    TabOrder = 17
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
  end
  object RoomName: TspSkinEdit
    Left = 197
    Top = 89
    Width = 281
    Height = 25
    Text = 'spSkinEdit1'
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    ReadOnly = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Enabled = False
    ParentFont = False
    TabOrder = 18
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
  end
  object Nama: TspSkinEdit
    Left = 197
    Top = 117
    Width = 281
    Height = 25
    Text = 'spSkinEdit1'
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    ReadOnly = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Enabled = False
    ParentFont = False
    TabOrder = 19
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
  end
  object Voucher: TspSkinComboBox
    Left = 197
    Top = 407
    Width = 110
    Height = 23
    HintImageIndex = 0
    TabOrder = 8
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'combobox'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinSize = False
    ToolButtonStyle = False
    HideSelection = True
    AutoComplete = True
    HorizontalExtent = False
    ImageIndex = -1
    ListBoxUseSkinItemHeight = False
    ListBoxAlphaBlend = False
    ListBoxAlphaBlendAnimation = False
    ListBoxAlphaBlendValue = 200
    ListBoxWidth = 0
    ListBoxCaptionMode = False
    ListBoxUseSkinFont = False
    ListBoxDefaultFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultFont.Color = clWindowText
    ListBoxDefaultFont.Height = -16
    ListBoxDefaultFont.Name = 'Arial'
    ListBoxDefaultFont.Style = [fsBold]
    ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultCaptionFont.Color = clWindowText
    ListBoxDefaultCaptionFont.Height = -16
    ListBoxDefaultCaptionFont.Name = 'Arial'
    ListBoxDefaultCaptionFont.Style = [fsBold]
    ListBoxDefaultItemHeight = 20
    ListBoxCaptionAlignment = taLeftJustify
    CharCase = ecNormal
    DefaultColor = clWindow
    Text = 'F & B'
    Items.Strings = (
      'ROOM'
      'F & B')
    ItemIndex = -1
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Sorted = False
    Style = spcbFixedStyle
    OnKeyPress = hargeRpKeyPress
  end
  object Compliment: TspSkinComboBox
    Left = 402
    Top = 215
    Width = 81
    Height = 20
    HintImageIndex = 0
    TabOrder = 20
    Visible = False
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
    Text = 'None'
    Items.Strings = (
      'None'
      'F & B'
      'ROOM'
      'ALL')
    ItemIndex = 0
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    Sorted = False
    Style = spcbFixedStyle
    OnKeyPress = hargeRpKeyPress
  end
  object TotalBayar: TspSkinEdit
    Left = 392
    Top = 377
    Width = 89
    Height = 20
    Text = 'spSkinEdit1'
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    ReadOnly = True
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
    Visible = False
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
  end
  object TipeBayar: TspSkinComboBox
    Left = 197
    Top = 432
    Width = 110
    Height = 24
    HintImageIndex = 0
    TabOrder = 10
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'combobox'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinSize = False
    ToolButtonStyle = False
    HideSelection = True
    AutoComplete = True
    HorizontalExtent = False
    ImageIndex = -1
    ListBoxUseSkinItemHeight = False
    ListBoxAlphaBlend = False
    ListBoxAlphaBlendAnimation = False
    ListBoxAlphaBlendValue = 200
    ListBoxWidth = 0
    ListBoxCaptionMode = False
    ListBoxUseSkinFont = False
    ListBoxDefaultFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultFont.Color = clWindowText
    ListBoxDefaultFont.Height = -16
    ListBoxDefaultFont.Name = 'Arial'
    ListBoxDefaultFont.Style = [fsBold]
    ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultCaptionFont.Color = clWindowText
    ListBoxDefaultCaptionFont.Height = -16
    ListBoxDefaultCaptionFont.Name = 'Arial'
    ListBoxDefaultCaptionFont.Style = [fsBold]
    ListBoxDefaultItemHeight = 20
    ListBoxCaptionAlignment = taLeftJustify
    CharCase = ecNormal
    DefaultColor = clWindow
    Text = 'CASH'
    Items.Strings = (
      'CASH'
      'CREDIT')
    ItemIndex = 0
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Sorted = False
    Style = spcbFixedStyle
    OnChange = TipeBayarChange
    OnKeyPress = hargeRpKeyPress
  end
  object KembalianRp: TspSkinEdit
    Left = 197
    Top = 520
    Width = 148
    Height = 25
    Text = 'spSkinEdit1'
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    ReadOnly = True
    Alignment = taRightJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
  end
  object BtnPrint: TspSkinButton
    Left = 23
    Top = 556
    Width = 108
    Height = 33
    HintImageIndex = 0
    TabOrder = 15
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = False
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
    Caption = '&Print Billing'
    NumGlyphs = 1
    Spacing = 1
    OnClick = BtnPrintClick
  end
  object BtnKeluar: TspSkinButton
    Left = 495
    Top = 554
    Width = 126
    Height = 33
    HintImageIndex = 0
    Anchors = [akRight, akBottom]
    TabOrder = 22
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = False
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
    Caption = '&Keluar'
    NumGlyphs = 1
    Spacing = 1
    OnClick = BtnKeluarClick
  end
  object DiBayar: TspSkinNumericEdit
    Left = 197
    Top = 490
    Width = 148
    Height = 25
    Text = '0'
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    Alignment = taRightJustify
    UseSkinFont = False
    ValueType = vtFloat
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnChange = ChargeRpChange
    OnKeyDown = DiBayarKeyDown
  end
  object TotalTransaksi: TspSkinNumericEdit
    Left = 197
    Top = 366
    Width = 121
    Height = 25
    Text = '0'
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    Alignment = taRightJustify
    UseSkinFont = False
    ValueType = vtFloat
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    ReadOnly = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Enabled = False
    ParentFont = False
    TabOrder = 7
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnKeyPress = hargeRpKeyPress
  end
  object TipeBayarNo: TspSkinEdit
    Left = 450
    Top = 463
    Width = 171
    Height = 25
    DefaultColor = clWindow
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    AlphaBlend = False
    AlphaBlendValue = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnKeyPress = hargeRpKeyPress
  end
  object VoucherRp: TspSkinNumericEdit
    Left = 399
    Top = 405
    Width = 122
    Height = 25
    Text = '0'
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    Alignment = taRightJustify
    UseSkinFont = False
    Decimal = 0
    ValueType = vtFloat
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnChange = ChargeRpChange
    OnKeyPress = hargeRpKeyPress
  end
  object spSkinButton1: TspSkinButton
    Left = 475
    Top = 362
    Width = 118
    Height = 33
    HintImageIndex = 0
    TabOrder = 23
    Visible = False
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = False
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
    Caption = 'Setting Report'
    NumGlyphs = 1
    Spacing = 1
    OnClick = spSkinButton1Click
  end
  object RoomTotal: TspSkinNumericEdit
    Left = 414
    Top = 351
    Width = 67
    Height = 20
    Text = '0'
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    Alignment = taRightJustify
    UseSkinFont = True
    ValueType = vtFloat
    MaxValue = 100.000000000000000000
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = 14
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 24
    Visible = False
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnChange = ChargeRpChange
    OnKeyPress = hargeRpKeyPress
  end
  object Disc: TspSkinNumericEdit
    Left = 362
    Top = 174
    Width = 121
    Height = 25
    Text = '0'
    Increment = 1.000000000000000000
    SupportUpDownKeys = False
    Alignment = taRightJustify
    UseSkinFont = False
    ValueType = vtFloat
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBlack
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    DefaultWidth = 0
    DefaultHeight = 0
    ButtonMode = False
    SkinData = DM.SkinData1
    SkinDataName = 'edit'
    ReadOnly = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Enabled = False
    ParentFont = False
    TabOrder = 25
    Visible = False
    ButtonImageIndex = -1
    LeftImageIndex = -1
    LeftImageHotIndex = -1
    LeftImageDownIndex = -1
    RightImageIndex = -1
    RightImageHotIndex = -1
    RightImageDownIndex = -1
    OnKeyPress = hargeRpKeyPress
  end
  object Bank: TspSkinComboBox
    Left = 197
    Top = 462
    Width = 164
    Height = 24
    HintImageIndex = 0
    TabOrder = 11
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'combobox'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = [fsBold]
    UseSkinFont = False
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinSize = False
    ToolButtonStyle = False
    HideSelection = True
    AutoComplete = True
    HorizontalExtent = False
    ImageIndex = -1
    ListBoxUseSkinItemHeight = False
    ListBoxAlphaBlend = False
    ListBoxAlphaBlendAnimation = False
    ListBoxAlphaBlendValue = 200
    ListBoxWidth = 0
    ListBoxCaptionMode = False
    ListBoxUseSkinFont = False
    ListBoxDefaultFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultFont.Color = clWindowText
    ListBoxDefaultFont.Height = -16
    ListBoxDefaultFont.Name = 'Arial'
    ListBoxDefaultFont.Style = [fsBold]
    ListBoxDefaultCaptionFont.Charset = DEFAULT_CHARSET
    ListBoxDefaultCaptionFont.Color = clWindowText
    ListBoxDefaultCaptionFont.Height = -16
    ListBoxDefaultCaptionFont.Name = 'Arial'
    ListBoxDefaultCaptionFont.Style = [fsBold]
    ListBoxDefaultItemHeight = 20
    ListBoxCaptionAlignment = taLeftJustify
    CharCase = ecNormal
    DefaultColor = clWindow
    Text = 'CASH'
    Items.Strings = (
      'VISA'
      'MASTER CARD'
      'PAYPAL')
    ItemIndex = -1
    DropDownCount = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Sorted = False
    Style = spcbFixedStyle
    OnChange = TipeBayarChange
    OnKeyPress = hargeRpKeyPress
  end
  object BtnPreview: TspSkinButton
    Left = 137
    Top = 556
    Width = 128
    Height = 33
    HintImageIndex = 0
    TabOrder = 26
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = False
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
    Caption = 'P&review Billing'
    NumGlyphs = 1
    Spacing = 1
    OnClick = BtnPreviewClick
  end
  object BtnRevisi: TspSkinButton
    Left = 271
    Top = 556
    Width = 128
    Height = 33
    HintImageIndex = 0
    TabOrder = 27
    DrawDefault = True
    SkinData = DM.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -16
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = False
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
    Caption = 'Re&visi Billing'
    NumGlyphs = 1
    Spacing = 1
    OnClick = BtnRevisiClick
  end
  object DiscRoomRp: TEdit
    Left = 197
    Top = 173
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = '0'
    OnChange = DiscRoomRpChange
    OnKeyPress = hargeRpKeyPress
  end
  object DiscFB: TEdit
    Left = 197
    Top = 232
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = '0'
    OnChange = DiscFBChange
    OnKeyPress = hargeRpKeyPress
  end
  object TotalRoom: TEdit
    Left = 197
    Top = 144
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Text = '0'
    OnChange = DiscRoomRpChange
    OnKeyPress = hargeRpKeyPress
  end
  object TotalFood: TEdit
    Left = 197
    Top = 202
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '0'
    OnChange = DiscFBChange
    OnKeyPress = hargeRpKeyPress
  end
  object SubTotal: TEdit
    Left = 197
    Top = 263
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    Text = '0'
    OnChange = DiscFBChange
    OnKeyPress = hargeRpKeyPress
  end
  object ChargeRp: TEdit
    Left = 197
    Top = 299
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = '0'
    OnChange = ChargeRpChange
    OnKeyPress = hargeRpKeyPress
  end
  object TaxRp: TEdit
    Left = 197
    Top = 329
    Width = 121
    Height = 27
    Alignment = taRightJustify
    BevelInner = bvNone
    BevelKind = bkFlat
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    Text = '0'
    OnChange = TaxRpChange
    OnKeyPress = hargeRpKeyPress
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
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Sizeable = True
    DraggAble = False
    NCDraggAble = True
    Magnetic = False
    MagneticSize = 10
    BorderIcons = [biSystemMenu, biMinimize, biMaximize, biRollUp]
    Left = 400
    Top = 310
  end
  object Report1: TfrxReport
    Version = '4.10.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40902.141034270800000000
    ReportOptions.LastChange = 40949.749787476900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnAfterPrint = Report1AfterPrint
    Left = 440
    Top = 310
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'StrukBilling'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Color = 16053492
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Data'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Color = clNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 102.000000000000000000
      PaperHeight = 150.000000000000000000
      PaperSize = 256
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 3.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 98.267780000000000000
        ParentFont = False
        Top = 18.897650000000000000
        Width = 362.834880000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 362.834880000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Color = clGray
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'Nama Karaoke')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Left = 67.305247750000000000
          Top = 45.354360000000000000
          Width = 100.531430910000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'NoTransaksi'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          Memo.UTF8W = (
            '[StrukBilling."NoTransaksi"]')
          ParentFont = False
        end
        object StrukBillingmulai: TfrxMemoView
          Left = 68.031540000000000000
          Top = 60.472480000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'mulai'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.FormatStr = 'mm/dd/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          Memo.UTF8W = (
            '[StrukBilling."mulai"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 68.031540000000000000
          Top = 75.590600000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.FormatStr = 'mm/dd/yyyy hh:mm'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          Memo.UTF8W = (
            '[StrukBilling."selesai"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 45.354360000000000000
          Width = 66.515660910000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'No Trx : ')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Top = 60.472480000000000000
          Width = 66.515660910000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Mulai : ')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Top = 75.590600000000000000
          Width = 66.515660910000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Selesai : ')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Align = baWidth
          Top = 26.456710000000000000
          Width = 362.834880000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'SLIP PEMBAYARAN LUNAS')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 139.842610000000000000
        Width = 362.834880000000000000
        object Memo2: TfrxMemoView
          Width = 359.054886220000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 0.069958610000000000
          Top = 1.000000000000000000
          Width = 177.841659140000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'DESKRIPSI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 177.100279840000000000
          Top = 1.000000000000000000
          Width = 29.764779840000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'QTY')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 206.865059680000000000
          Top = 1.000000000000000000
          Width = 50.142516540000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'HARGA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 257.008040000000000000
          Width = 38.803926540000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'DISC')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 294.803340000000000000
          Width = 65.260636540000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'JUMLAH')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 215.433210000000000000
        Width = 362.834880000000000000
        Condition = 'StrukBilling."TipeTrans"'
        object StrukBillingTipeTrans: TfrxMemoView
          Width = 642.520100000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'TipeTrans'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[StrukBilling."TipeTrans"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 15.118120000000000000
        ParentFont = False
        Top = 253.228510000000000000
        Width = 362.834880000000000000
        DataSet = frxDBDataset1
        DataSetName = 'StrukBilling'
        RowCount = 0
        object Memo13: TfrxMemoView
          Left = 7.629018610000000000
          Width = 170.282599140000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'room_name'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          Memo.UTF8W = (
            '[StrukBilling."room_name"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 177.100279840000000000
          Width = 29.764779840000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'qty'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[StrukBilling."qty"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 206.865059680000000000
          Width = 50.142516540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<StrukBilling."Price">]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 294.803340000000000000
          Width = 65.260636540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(<StrukBilling."qty">*<StrukBilling."price">)-<StrukBilling."Di' +
              'sc_Rp">]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 257.008040000000000000
          Width = 38.803926540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataField = 'Disc_Rp'
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StrukBilling."Disc_Rp"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 117.165430000000000000
        ParentFont = False
        Top = 332.598640000000000000
        Width = 362.834880000000000000
        object Memo11: TfrxMemoView
          Left = 275.905690000000000000
          Top = 52.133890000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[StrukBilling."TotalTransaksi"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Top = 52.133890000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'GRAND TOTAL : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 275.905690000000000000
          Top = 67.252010000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StrukBilling."Dibayar"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 67.252010000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Bayar [StrukBilling."CaraBayar"] : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Top = 36.015770000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'PPN [StrukBilling."Ppn"] % : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 275.905690000000000000
          Top = 36.015770000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM(((<StrukBilling."qty">*<StrukBilling."price">)*<StrukBillin' +
              'g."Ppn">)/100,MasterData1,3)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Subtotal : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 275.905690000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM((<StrukBilling."qty">*<StrukBilling."price">)-<StrukBilling' +
              '."Disc_Rp">,MasterData1,3)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 275.905690000000000000
          Top = 98.267780000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[(<StrukBilling."Dibayar">+<StrukBilling."Voucher">)-<StrukBilli' +
              'ng."TotalTransaksi">]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Top = 98.267780000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Sisa Kembalian : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 279.685220000000000000
          Top = 83.149660000000000000
          Width = 80.378756540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StrukBilling."Voucher"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 83.149660000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Bayar VOUCHER : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Top = 18.897650000000000000
          Width = 276.914316540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'Service : ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 275.905690000000000000
          Top = 18.897650000000000000
          Width = 84.158286540000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[StrukBilling."sum(Service)"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 18.897650000000000000
        ParentFont = False
        Top = 291.023810000000000000
        Width = 362.834880000000000000
        object StrukBillingTotalTransaksi: TfrxMemoView
          Left = 279.685220000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            
              '[SUM((<StrukBilling."qty">*<StrukBilling."price">)-(<StrukBillin' +
              'g."Disc_Rp">),MasterData1)]')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          Width = 279.685220000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8W = (
            'Jumlah [StrukBilling."TipeTrans"] : ')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        Height = 34.015770000000000000
        Top = 510.236550000000000000
        Width = 362.834880000000000000
        object Memo34: TfrxMemoView
          Align = baWidth
          Top = 3.779530000000000000
          Width = 362.834880000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'StrukBilling'
          DisplayFormat.DecimalSeparator = '.'
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI Symbol'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Terima kasih atas kunjungan anda')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'StrukBilling'
    CloseDataSource = False
    DataSet = DM.QRyReport
    BCDToCurrency = False
    Left = 480
    Top = 310
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
    Left = 520
    Top = 310
  end
  object Query1: TUniQuery
    Connection = DM.Connection
    Left = 560
    Top = 312
  end
end
