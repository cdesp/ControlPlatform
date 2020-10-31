object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #917#960#953#955#959#947#941#962
  ClientHeight = 183
  ClientWidth = 477
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 48
    Width = 114
    Height = 16
    Caption = #920#941#963#951' Arduino IDE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 160
    Top = 47
    Width = 206
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnExit = Edit1Exit
  end
  object Button1: TButton
    Left = 372
    Top = 45
    Width = 65
    Height = 25
    Caption = #913#957#945#950#942#964#951#963#951
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
  object Button3: TButton
    Left = 240
    Top = 120
    Width = 75
    Height = 25
    Caption = #902#954#965#961#959
    ModalResult = 2
    TabOrder = 3
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.exe'
    Filter = 'Arduino EXE|arduino.exe'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #914#961#949#943#964#949' '#964#959' Arduino.exe'
    Left = 56
    Top = 96
  end
end
