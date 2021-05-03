unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Paddle: TShape;
    Ball: TShape;
    lblScore: TLabel;
    lblGameOver: TLabel;
    lblRestart: TLabel;
    tmrGame: TTimer;
    procedure ControlPaddle(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PaddleMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure tmrGameTimer(Sender: TObject);
    procedure lblRestartMouseEnter(Sender: TObject);
    procedure lblRestartMouseLeave(Sender: TObject);
    procedure lblRestartClick(Sender: TObject);
  private
    procedure InitGame;
    procedure UpdateScore;
    procedure GameOver;
    procedure IncreaseSpeed;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Score: Integer;
  SpeedX, SpeedY: Integer;
implementation

{$R *.dfm}

procedure TForm1.ControlPaddle(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
      Paddle.Left:= X - Paddle.Width div 2;
      Paddle.Top:= ClientHeight-Paddle.Height-2;

end;

procedure TForm1.PaddleMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
     ControlPaddle(Sender,Shift,X+Paddle.Left,Y+Paddle.Top);
end;

procedure TForm1.tmrGameTimer(Sender: TObject);
begin
  Ball.Left:=Ball.Left+SpeedX;
  Ball.Top:=Ball.Top+SpeedY;

  if Ball.Top <= 0 then SpeedY:= -SpeedY;
  if (Ball.Left <= 0) or (Ball.Left + Ball.Width >= ClientWidth) then SpeedX:= -SpeedX;

  if Ball.Top + Ball.Height >= ClientHeight then GameOver;

  if (Ball.Left + Ball.Width >= Paddle.Left) and (Ball.Left <= Paddle.Left + Paddle.Width)
  and (Ball.Top + Ball.Height >= Paddle.Top) then
  begin
    SpeedY:= -SpeedY;
    IncreaseSpeed;


    Inc(Score);
    UpdateScore;
  end;



end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoubleBuffered:=True;
  InitGame;
end;

procedure TForm1.GameOver;
begin
   tmrGame.Enabled:=False;

   lblGameOver.Visible:=True;
   lblRestart.Visible:=True;

end;

procedure TForm1.IncreaseSpeed;
begin
  if SpeedX > 0  then Inc(SpeedX) else Dec(SpeedX);
  if SpeedY > 0  then Inc(SpeedY) else Dec(SpeedY);


end;

procedure Tform1.InitGame;
begin
  Score:= 0;
  SpeedX:= 4;
  SpeedY:= 4;

  lblGameOver.Visible:=False;
  lblRestart.Visible:=False;
  lblRestart.Font.Style:=[];
  Ball.Left:=10;
  Ball.Top:=10;

  UpdateScore;

  tmrGame.Enabled:=True;

end;

procedure TForm1.lblRestartClick(Sender: TObject);
begin
  InitGame;
end;

procedure TForm1.lblRestartMouseEnter(Sender: TObject);
begin
   lblRestart.Font.Style:=[fsBold];
end;

procedure TForm1.lblRestartMouseLeave(Sender: TObject);
begin
   lblRestart.Font.Style:=[];
end;

procedure Tform1.UpdateScore;
begin
  lblScore.Caption:='Score:' + IntToStr(Score);
end;
end.
