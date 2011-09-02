object MainForm: TMainForm
  Left = 267
  Top = 240
  Caption = 'waveBurner'
  ClientHeight = 258
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StartPosLabel: TLabel
    Left = 14
    Top = 83
    Width = 29
    Height = 13
    Caption = '0.00 s'
    ShowAccelChar = False
    Transparent = False
  end
  object AudioFormatLabel: TLabel
    Left = 14
    Top = 46
    Width = 3
    Height = 13
    ShowAccelChar = False
  end
  object EndPosLabel: TLabel
    Left = 294
    Top = 83
    Width = 29
    Height = 13
    Alignment = taRightJustify
    Caption = '0.00 s'
    ShowAccelChar = False
    Transparent = False
  end
  object Label1: TLabel
    Left = 683
    Top = 236
    Width = 6
    Height = 13
    Caption = '0'
  end
  object btnPlay: TBitBtn
    Left = 14
    Top = 108
    Width = 100
    Height = 25
    Caption = 'Play'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 2
    OnClick = btnPlayClick
  end
  object btnPause: TBitBtn
    Left = 118
    Top = 108
    Width = 100
    Height = 25
    Caption = 'Pause'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 3
    OnClick = btnPauseClick
  end
  object btnStop: TBitBtn
    Left = 223
    Top = 108
    Width = 100
    Height = 25
    Caption = 'Stop'
    DoubleBuffered = True
    Enabled = False
    ParentDoubleBuffered = False
    TabOrder = 4
    OnClick = btnStopClick
  end
  object Progress: TProgressBar
    Left = 14
    Top = 63
    Width = 309
    Height = 17
    TabOrder = 5
  end
  object btnSelectFile: TButton
    Left = 262
    Top = 22
    Width = 61
    Height = 21
    Caption = 'Browse...'
    TabOrder = 1
    OnClick = btnSelectFileClick
  end
  object WaveFileName: TEdit
    Left = 14
    Top = 22
    Width = 246
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
    Text = '*.wav'
    OnChange = WaveFileNameChange
  end
  object FileListBox1: TFileListBox
    Left = 342
    Top = 22
    Width = 387
    Height = 204
    ExtendedSelect = False
    FileEdit = WaveFileName
    ItemHeight = 13
    Mask = '*.wav'
    TabOrder = 6
    OnDblClick = FileListBox1DblClick
  end
  object Generate: TButton
    Left = 8
    Top = 139
    Width = 315
    Height = 25
    Caption = 'Generate Hex File'
    TabOrder = 7
    OnClick = GenerateClick
  end
  object btnBurn: TButton
    Left = 14
    Top = 170
    Width = 148
    Height = 25
    Caption = 'Burn'
    Enabled = False
    TabOrder = 8
    OnClick = btnBurnClick
  end
  object btnRead: TButton
    Left = 168
    Top = 170
    Width = 155
    Height = 25
    Caption = 'Read'
    Enabled = False
    TabOrder = 9
    OnClick = btnReadClick
  end
  object btnConfig: TButton
    Left = 223
    Top = 201
    Width = 100
    Height = 25
    Caption = 'Config Serial'
    TabOrder = 10
    OnClick = btnConfigClick
  end
  object btnClose: TButton
    Left = 117
    Top = 201
    Width = 100
    Height = 25
    Caption = 'Close Serial'
    Enabled = False
    TabOrder = 11
    OnClick = btnCloseClick
  end
  object btnOpen: TButton
    Left = 14
    Top = 201
    Width = 100
    Height = 25
    Caption = 'Open Serial'
    TabOrder = 12
    OnClick = btnOpenClick
  end
  object ProgressBar1: TProgressBar
    Left = 14
    Top = 232
    Width = 651
    Height = 17
    Step = 1
    TabOrder = 13
  end
  object StockAudioPlayer: TStockAudioPlayer
    BufferLength = 100
    OnActivate = StockAudioPlayerActivate
    OnDeactivate = StockAudioPlayerDeactivate
    OnLevel = StockAudioPlayerLevel
    Left = 122
    Top = 5
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'wav'
    Filter = 'Wave Files (*.wav)|*.wav|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select Wave File'
    Left = 19
    Top = 5
  end
  object ComPort1: TComPort
    BaudRate = brCustom
    Port = 'COM6'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    OnAfterOpen = ComPort1AfterOpen
    OnAfterClose = ComPort1AfterClose
    OnRxChar = ComPort1RxChar
    Left = 480
    Top = 40
  end
end
