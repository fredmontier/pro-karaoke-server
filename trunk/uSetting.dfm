object FrmSetting: TFrmSetting
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsNone
  ClientHeight = 574
  ClientWidth = 788
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
  OnShow = FormShow
  DesignSize = (
    788
    574)
  PixelsPerInch = 96
  TextHeight = 13
  object RzSeparator1: TRzSeparator
    Left = 7
    Top = 318
    Width = 775
    ShowGradient = True
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
  end
  object RzSeparator2: TRzSeparator
    Left = 9
    Top = 359
    Width = 775
    ShowGradient = True
    Align = alCustom
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 50
    Align = alTop
    Color = clInactiveCaptionText
    ParentBackground = False
    TabOrder = 0
    object RzLabel2: TRzLabel
      Left = 10
      Top = 28
      Width = 104
      Height = 12
      Caption = 'Setting Awal Room'
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
      Top = 6
      Width = 207
      Height = 22
      AutoSize = False
      Caption = 'SETTING ROOM'
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
  object grid: TAdvStringGrid
    Left = 5
    Top = 367
    Width = 775
    Height = 202
    Cursor = crDefault
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 15
    DefaultRowHeight = 21
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goColSizing, goEditing]
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    OnClick = gridClick
    OnDblClick = gridDblClick
    OnCanEditCell = gridCanEditCell
    OnGetEditorType = gridGetEditorType
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'MS Sans Serif'
    ActiveCellFont.Style = [fsBold]
    CellNode.ShowTree = False
    ColumnHeaders.Strings = (
      'NO'
      'ID'
      'Nama Room'
      'Type Room'
      'IP Address'
      'Status')
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
    FloatFormat = '%.2f'
    Navigation.AllowInsertRow = True
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
    ScrollWidth = 16
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
    SelectionColor = clHighlight
    SelectionTextColor = clHighlightText
    SortSettings.Column = 0
    Version = '5.0.4.1'
    WordWrap = False
    ColWidths = (
      40
      71
      206
      110
      115
      68
      158
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
      21)
  end
  object BtnSave: TRzBitBtn
    Left = 8
    Top = 322
    Height = 36
    FrameColor = 7617536
    Caption = 'Simpan'
    Color = 15791348
    HotTrack = True
    TabOrder = 1
    OnClick = BtnSaveClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
      090909090909090909E8E8E881818181818181818181818181E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
      E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
      090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
      101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
      090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
      0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
      0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
      D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
      090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object BtnCancel: TRzBitBtn
    Left = 89
    Top = 322
    Height = 36
    FrameColor = 7617536
    Caption = 'Batal'
    Color = 15791348
    HotTrack = True
    TabOrder = 3
    OnClick = BtnCancelClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000830E0000830E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E85E09E8E8E8E8E8E8E8E8E8E8E8E8E8E8AC81E8E8E8E8E809090909
      09E8E8E8E8E8095EE8E8E8E88181818181E8E8E8E8E881ACE8E8E8E809090909
      E8E8E8E8E8E8E809E8E8E8E881818181E8E8E8E8E8E8E881E8E8E8E8090909E8
      E8E8E8E8E8E8E809E8E8E8E8818181E8E8E8E8E8E8E8E881E8E8E8E80909E809
      E8E8E8E8E8E8E809E8E8E8E88181E881E8E8E8E8E8E8E881E8E8E8E809E8E8E8
      0909E8E8E8E8095EE8E8E8E881E8E8E88181E8E8E8E881ACE8E8E8E8E8E8E8E8
      E8E8090909095EE8E8E8E8E8E8E8E8E8E8E881818181ACE8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object RzBitBtn5: TRzBitBtn
    Left = 705
    Top = 322
    Height = 36
    FrameColor = 7617536
    Anchors = [akTop, akRight]
    Caption = 'Keluar'
    Color = 15791348
    HotTrack = True
    TabOrder = 4
    OnClick = RzBitBtn5Click
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object spSkinPanel1: TspSkinPanel
    Left = 327
    Top = 55
    Width = 451
    Height = 89
    HintImageIndex = 0
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 5
    DrawDefault = True
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
    RollUpMode = True
    RollUpState = False
    Caption = ' Theme Setting'
    DesignSize = (
      451
      89)
    object Label4: TLabel
      Left = 14
      Top = 36
      Width = 39
      Height = 13
      Caption = 'Server :'
    end
    object Label5: TLabel
      Left = 15
      Top = 58
      Width = 40
      Height = 13
      Caption = 'Player : '
    end
    object spSkinStdLabel1: TspSkinStdLabel
      Left = 253
      Top = 35
      Width = 74
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
      Anchors = [akTop, akRight]
      Caption = 'IP Server Video'
    end
    object ThemeServer: TspSkinComboBox
      Left = 59
      Top = 32
      Width = 182
      Height = 20
      HintImageIndex = 0
      Anchors = [akLeft, akTop, akRight]
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
    end
    object ThemePlayer: TspSkinComboBox
      Left = 61
      Top = 58
      Width = 180
      Height = 20
      HintImageIndex = 0
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
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
    end
    object IpServerVideo: TspSkinEdit
      Left = 333
      Top = 32
      Width = 88
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
      ButtonMode = False
      SkinData = DM.SkinData1
      SkinDataName = 'edit'
      AlphaBlend = False
      AlphaBlendValue = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Anchors = [akTop, akRight]
      MaxLength = 15
      ParentFont = False
      TabOrder = 2
      ButtonImageIndex = -1
      LeftImageIndex = -1
      LeftImageHotIndex = -1
      LeftImageDownIndex = -1
      RightImageIndex = -1
      RightImageHotIndex = -1
      RightImageDownIndex = -1
    end
  end
  object PanelSetting: TspSkinPanel
    Left = 8
    Top = 56
    Width = 313
    Height = 257
    HintImageIndex = 0
    TabOrder = 6
    DrawDefault = True
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
    RollUpMode = True
    RollUpState = False
    Caption = ' Player Font Setting'
    object AdvGlowButton1: TAdvGlowButton
      Left = 8
      Top = 26
      Width = 105
      Height = 28
      Caption = 'Load Font Setting'
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      TabOrder = 0
      OnClick = AdvGlowButton1Click
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
    object FontType: TAdvEdit
      Left = 79
      Top = 68
      Width = 218
      Height = 21
      AutoFocus = True
      EmptyText = 'Kosong'
      Flat = True
      FocusColor = clBtnFace
      FocusLabel = True
      ReturnIsTab = True
      LabelCaption = 'Font Type :'
      LabelPosition = lpLeftCenter
      LabelMargin = 2
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      ReadOnly = True
      TabOrder = 1
      Visible = True
      Version = '2.8.5.0'
    end
    object FontSize: TAdvEdit
      Left = 79
      Top = 95
      Width = 42
      Height = 21
      AutoFocus = True
      EmptyText = 'Kosong'
      Flat = True
      FocusColor = clBtnFace
      FocusLabel = True
      ReturnIsTab = True
      LabelCaption = 'Font Size :'
      LabelPosition = lpLeftCenter
      LabelMargin = 2
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      ReadOnly = True
      TabOrder = 2
      Visible = True
      Version = '2.8.5.0'
    end
    object spSkinPanel2: TspSkinPanel
      Left = 3
      Top = 122
      Width = 307
      Height = 132
      HintImageIndex = 0
      TabOrder = 3
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
      CaptionMode = True
      RollUpMode = False
      RollUpState = False
      Caption = 'Sample Font'
      object LabelSample: TLabel
        Left = 1
        Top = 23
        Width = 305
        Height = 108
        Align = alClient
        Alignment = taCenter
        Caption = 'LabelSample'
        ExplicitWidth = 59
        ExplicitHeight = 13
      end
    end
  end
  object spSkinPanel3: TspSkinPanel
    Left = 327
    Top = 149
    Width = 451
    Height = 163
    HintImageIndex = 0
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 7
    DrawDefault = True
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
    RollUpMode = True
    RollUpState = False
    Caption = ' Global Player Setting'
    object Label3: TLabel
      Left = 25
      Top = 79
      Width = 72
      Height = 13
      Caption = 'Pindah Room  :'
    end
    object spSkinStdLabel2: TspSkinStdLabel
      Left = 422
      Top = 99
      Width = 11
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
      Caption = '%'
    end
    object spSkinStdLabel3: TspSkinStdLabel
      Left = 422
      Top = 72
      Width = 11
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
      Caption = '%'
    end
    object VolumePlayer: TspSkinCheckRadioBox
      Left = 19
      Top = 30
      Width = 150
      Height = 25
      HintImageIndex = 0
      TabOrder = 0
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'checkbox'
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
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Flat = True
      Caption = 'Default Volume Player'
    end
    object ScreenSaver: TspSkinCheckRadioBox
      Left = 191
      Top = 30
      Width = 98
      Height = 25
      HintImageIndex = 0
      TabOrder = 1
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'checkbox'
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
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Flat = True
      Caption = 'Screen Saver'
    end
    object KeyHandling: TspSkinCheckRadioBox
      Left = 19
      Top = 50
      Width = 158
      Height = 25
      HintImageIndex = 0
      TabOrder = 2
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'checkbox'
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
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Flat = True
      Caption = 'Active Player Key Handling'
    end
    object TimerSetting: TspSkinCheckRadioBox
      Left = 191
      Top = 50
      Width = 98
      Height = 25
      HintImageIndex = 0
      TabOrder = 3
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'checkbox'
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
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Flat = True
      Caption = 'TimerSetting'
    end
    object PromoPlayer: TspSkinCheckRadioBox
      Left = 323
      Top = 30
      Width = 114
      Height = 25
      HintImageIndex = 0
      TabOrder = 4
      DrawDefault = True
      SkinData = DM.SkinData1
      SkinDataName = 'checkbox'
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
      WordWrap = False
      AllowGrayed = False
      State = cbUnchecked
      ImageIndex = 0
      UseSkinFontColor = True
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = False
      GroupIndex = 0
      Flat = True
      Caption = 'Promo Jeda Lagu'
    end
    object PindahRoom: TspSkinComboBox
      Left = 103
      Top = 77
      Width = 200
      Height = 20
      HintImageIndex = 0
      TabOrder = 5
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
      Items.Strings = (
        'HARGA ROOM BARU'
        'HARGA SEPARUH-SEPARUH')
      ItemIndex = -1
      DropDownCount = 8
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Arial'
      Font.Style = []
      Sorted = False
      Style = spcbFixedStyle
    end
    object MaxOrderTime: TAdvEdit
      Left = 164
      Top = 102
      Width = 53
      Height = 21
      AutoFocus = True
      EmptyText = 'Kosong'
      Flat = True
      FocusColor = clBtnFace
      FocusLabel = True
      ReturnIsTab = True
      LabelCaption = 'Max Food Oder Time (Mnt) : '
      LabelPosition = lpLeftCenter
      LabelMargin = 2
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      TabOrder = 6
      Visible = True
      Version = '2.8.5.0'
    end
    object Lokasi: TAdvEditBtn
      Left = 67
      Top = 129
      Width = 172
      Height = 21
      ExcelStyleDecimalSeparator = True
      Flat = True
      FocusColor = clBtnFace
      ReturnIsTab = True
      LabelCaption = 'Lokasi : '
      LabelPosition = lpLeftCenter
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      ReadOnly = False
      TabOrder = 7
      Visible = True
      OnKeyDown = LokasiKeyDown
      Version = '1.3.2.7'
      ButtonStyle = bsButton
      ButtonWidth = 16
      Etched = False
      ButtonCaption = '...'
      OnClickBtn = LokasiClickBtn
    end
    object Ppn: TAdvEdit
      Left = 363
      Top = 94
      Width = 53
      Height = 21
      AutoFocus = True
      EmptyText = '0'
      Flat = True
      FocusColor = clBtnFace
      FocusLabel = True
      ReturnIsTab = True
      LabelCaption = 'PPN : '
      LabelPosition = lpLeftCenter
      LabelMargin = 2
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      TabOrder = 8
      Visible = True
      Version = '2.8.5.0'
    end
    object Service: TAdvEdit
      Left = 363
      Top = 67
      Width = 53
      Height = 21
      AutoFocus = True
      EmptyText = '0'
      Flat = True
      FocusColor = clBtnFace
      FocusLabel = True
      ReturnIsTab = True
      LabelCaption = 'Service : '
      LabelPosition = lpLeftCenter
      LabelMargin = 2
      LabelTransparent = True
      LabelAlwaysEnabled = True
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWindowText
      LabelFont.Height = -11
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = []
      Lookup.Separator = ';'
      BorderStyle = bsNone
      Color = clBtnFace
      Enabled = True
      TabOrder = 9
      Visible = True
      Version = '2.8.5.0'
    end
  end
  object FontDialog: TspSkinFontDialog
    AlphaBlend = False
    AlphaBlendValue = 200
    AlphaBlendAnimation = False
    SkinData = DM.SkinData1
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Title = 'Font'
    ShowSizeEdit = True
    ShowHeightEdit = False
    ShowScript = False
    Left = 144
    Top = 96
  end
end
