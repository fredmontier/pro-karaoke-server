object FrmChat: TFrmChat
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'From Chatt'
  ClientHeight = 501
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzSplitter1: TRzSplitter
    Left = 0
    Top = 0
    Width = 942
    Height = 501
    BorderWidth = 3
    Position = 291
    Percent = 31
    UsePercent = True
    RealTimeDrag = True
    HotSpotVisible = True
    SplitterWidth = 8
    Align = alClient
    TabOrder = 0
    BarSize = (
      294
      3
      302
      498)
    UpperLeftControls = (
      RzGroupBar1
      spSkinPanel2)
    LowerRightControls = (
      spSkinPanel1)
    object RzGroupBar1: TRzGroupBar
      Left = 0
      Top = 0
      Width = 291
      Height = 495
      GradientColorStart = clBtnFace
      GradientColorStop = clBtnShadow
      GroupBorderSize = 8
      Align = alClient
      Color = clBtnShadow
      ParentColor = False
      TabOrder = 0
    end
    object spSkinPanel2: TspSkinPanel
      Left = 0
      Top = 0
      Width = 291
      Height = 495
      HintImageIndex = 0
      TabOrder = 1
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
      RollUpMode = False
      RollUpState = False
      Caption = ' Data Room'
      Align = alClient
      object CheckBox1: TCheckBox
        Left = 112
        Top = 3
        Width = 110
        Height = 17
        Caption = 'Pilih Semua Room'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object grid: TAdvStringGrid
        Left = 1
        Top = 23
        Width = 289
        Height = 471
        Cursor = crDefault
        Align = alClient
        ColCount = 6
        DefaultRowHeight = 21
        FixedCols = 0
        RowCount = 5
        FixedRows = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goEditing]
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        OnClick = gridClick
        OnCanEditCell = gridCanEditCell
        OnGetEditorType = gridGetEditorType
        ActiveCellFont.Charset = DEFAULT_CHARSET
        ActiveCellFont.Color = clWindowText
        ActiveCellFont.Height = -11
        ActiveCellFont.Name = 'MS Sans Serif'
        ActiveCellFont.Style = [fsBold]
        CellNode.ShowTree = False
        ColumnHeaders.Strings = (
          ''
          'Level'
          'Margin %'
          'Markup'
          'Markup %'
          'Harga Jual')
        ColumnSize.Stretch = True
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
        ExplicitLeft = -707
        ExplicitTop = 117
        ExplicitWidth = 973
        ExplicitHeight = 378
        ColWidths = (
          64
          64
          64
          64
          186
          526)
        RowHeights = (
          21
          21
          21
          21
          21)
      end
    end
    object spSkinPanel1: TspSkinPanel
      Left = 0
      Top = 0
      Width = 637
      Height = 495
      HintImageIndex = 0
      TabOrder = 0
      DrawDefault = True
      SkinData = DM.SkinData1
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
      Align = alClient
      object RzSplitter2: TRzSplitter
        Left = 1
        Top = 1
        Width = 635
        Height = 493
        BorderWidth = 4
        Orientation = orVertical
        Position = 333
        Percent = 68
        HotSpotVisible = True
        SplitterWidth = 7
        Align = alClient
        TabOrder = 0
        BarSize = (
          4
          337
          631
          344)
        UpperLeftControls = (
          Memo1)
        LowerRightControls = (
          Memo2
          BtnSend
          BtnClear
          BtnClearOpr)
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 627
          Height = 333
          Align = alClient
          Color = clMenuText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'Memo1')
          ParentFont = False
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 0
          Top = -1
          Width = 627
          Height = 100
          Anchors = [akLeft, akTop, akRight, akBottom]
          Color = clMenuText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            'Memo2')
          ParentFont = False
          TabOrder = 0
          OnKeyDown = Memo2KeyDown
        end
        object BtnSend: TAdvGlowButton
          Left = 524
          Top = 105
          Width = 100
          Height = 33
          Anchors = [akRight, akBottom]
          Caption = 'Send'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 1
          OnClick = BtnSendClick
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
        object BtnClear: TAdvGlowButton
          Left = 284
          Top = 105
          Width = 116
          Height = 33
          Anchors = [akRight, akBottom]
          Caption = 'Hapus Pesan Opr'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 2
          OnClick = BtnClearClick
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
        object BtnClearOpr: TAdvGlowButton
          Left = 406
          Top = 105
          Width = 112
          Height = 33
          Anchors = [akRight, akBottom]
          Caption = 'Hapus Pesan Room'
          NotesFont.Charset = DEFAULT_CHARSET
          NotesFont.Color = clWindowText
          NotesFont.Height = -11
          NotesFont.Name = 'Tahoma'
          NotesFont.Style = []
          TabOrder = 3
          OnClick = BtnClearOprClick
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
      end
    end
  end
  object spDynamicSkinForm1: TspDynamicSkinForm
    WindowState = wsNormal
    ShowMDIScrollBars = True
    QuickButtons = <>
    QuickButtonsShowHint = False
    ClientInActiveEffect = False
    ClientInActiveEffectType = spieSemiTransparent
    DisableSystemMenu = False
    PositionInMonitor = sppScreenCenter
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
    BorderIcons = [biSystemMenu, biMaximize]
    Left = 72
    Top = 96
  end
  object TimerMemo1: TTimer
    OnTimer = TimerMemo1Timer
    Left = 848
    Top = 32
  end
end
