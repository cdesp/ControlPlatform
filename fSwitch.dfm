object frmSwitch: TfrmSwitch
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Switch'
  ClientHeight = 674
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLaser: TPanel
    Left = 8
    Top = 8
    Width = 513
    Height = 367
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 0
    object Image3: TImage
      Left = 168
      Top = 1
      Width = 344
      Height = 346
      Align = alClient
      Stretch = True
      ExplicitLeft = 1
      ExplicitWidth = 338
      ExplicitHeight = 511
    end
    object Label2: TLabel
      Left = 1
      Top = 347
      Width = 511
      Height = 19
      Align = alBottom
      Alignment = taCenter
      Caption = #916#953#945#954#972#960#964#951#962'/'#922#959#965#956#960#943
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 149
    end
    object RadioGroup1: TRadioGroup
      Left = 1
      Top = 1
      Width = 167
      Height = 346
      Align = alLeft
      Caption = #917#960#953#955#941#958#964#949' '#916#953#945#954#972#960#964#951
      Items.Strings = (
        #916#953#945#954#972#960#964#951#962' '#928#955#942#954#964#961#959#965
        #913#957#953#967#957#949#965#964#942#962' Laser'
        #913#957#953#967#957#949#965#964#942#962' '#934#969#964#972#962
        #916#953#945#954#972#960#964#951#962' '#916#972#957#951#963#951#962
        #916#953#945#954#972#960#964#951#962' '#933#948#961#945#961#947#973#961#959#965
        #924#945#947#957#951#964#953#954#972#962' '#916#953#945#954#972#960#964#951#962
        #916#953#945#954#972#960#964#951#962' '#928#961#972#963#954#961#959#965#963#951#962
        #913#957#953#967#957#949#965#964#942#962' '#922#955#943#963#951#962
        #913#957#953#967#957#949#965#964#942#962' '#913#960#972#963#964#945#963#951#962
        #913#957#953#967#957#949#965#964#942#962' '#924#945#973#961#959#965)
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 381
    Width = 679
    Height = 156
    Font.Charset = GREEK_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      #913#965#964#942' '#951' '#963#965#963#954#949#965#942' '#967#961#949#953#940#950#949#964#945#953' '#956#972#957#959' '#941#957#945' '#963#942#956#945' '#947#953#945' '#957#945' '#955#949#953#964#959#965#961#947#942#963#949#953'.'
      ''
      #932#959' signal (S) '#942' Data (D0) '#963#965#957#948#941#963#964#949' '#964#959' '#963#949' '#954#940#960#959#953#959' pin '#964#959#965' Arduino.'
      ''
      #935#961#949#953#940#950#949#964#945#953'  '#964#951' '#947#949#943#969#963#951' (GND) (-)'
      ''
      #954#945#953' '#943#963#969#962' '#964#951#957' '#964#940#963#951' (+5v) '#945#957#940#955#959#947#945' '#964#959#957' '#948#953#945#954#972#960#964#951' '#942' '#964#959' '#954#959#965#956#960#943
      ''
      #919' '#964#940#963#951' VCC (+5V) '#949#943#957#945#953' '#963#965#957#942#952#969#962' '#963#964#951#957' '#956#941#963#951
      ''
      '')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    Zoom = 100
  end
  object GroupBox1: TGroupBox
    Left = 534
    Top = 8
    Width = 153
    Height = 184
    Caption = #929#973#952#956#953#963#951' '#931#965#963#954#949#965#942#962
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 32
      Width = 49
      Height = 13
      Caption = 'Signal Pin:'
    end
    object SpinEdit1: TSpinEdit
      Left = 63
      Top = 29
      Width = 49
      Height = 22
      Hint = #916#953#940#955#949#958#949' '#964#959' Pin '#960#959#965' '#941#967#949#953#962' '#963#965#957#948#941#963#949#953' '#964#951#957' '#963#965#963#954#949#965#942
      MaxValue = 255
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0
      OnChange = SpinEdit1Change
    end
    object SpinEdit2: TSpinEdit
      Left = 63
      Top = 77
      Width = 49
      Height = 22
      Hint = #916#953#940#955#949#958#949' '#964#959' Pin '#960#959#965' '#941#967#949#953#962' '#963#965#957#948#941#963#949#953' '#964#951#957' '#963#965#963#954#949#965#942
      MaxValue = 255
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 0
      Visible = False
      OnChange = SpinEdit2Change
    end
  end
end
