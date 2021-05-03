object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ilbeyli_odev'
  ClientHeight = 420
  ClientWidth = 641
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    641
    420)
  PixelsPerInch = 96
  TextHeight = 19
  object Paddle: TShape
    Left = 272
    Top = 392
    Width = 80
    Height = 20
    OnMouseMove = PaddleMouseMove
  end
  object Ball: TShape
    Left = 140
    Top = 212
    Width = 20
    Height = 20
    Shape = stCircle
  end
  object lblScore: TLabel
    Left = 484
    Top = 16
    Width = 133
    Height = 25
    Anchors = [akTop, akRight]
    AutoSize = False
    BiDiMode = bdRightToLeft
    Caption = 'Score: 0'
    Color = clBtnFace
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Lucida Console'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
  end
  object lblGameOver: TLabel
    Left = 0
    Top = 80
    Width = 633
    Height = 38
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Game Over'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object lblRestart: TLabel
    Left = 8
    Top = 124
    Width = 625
    Height = 16
    Alignment = taCenter
    Anchors = [akLeft, akTop, akRight]
    AutoSize = False
    Caption = 'Restart'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = lblRestartClick
    OnMouseEnter = lblRestartMouseEnter
    OnMouseLeave = lblRestartMouseLeave
  end
  object tmrGame: TTimer
    Enabled = False
    Interval = 25
    OnTimer = tmrGameTimer
    Left = 16
    Top = 328
  end
end
