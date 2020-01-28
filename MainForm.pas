unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, EditForm;

type
  TFormRec = class(TForm)
    PaintBoxRec: TPaintBox;
    MainMenu: TMainMenu;
    CrRec: TMenuItem;
    Edit: TMenuItem;
    MenuUn: TMenuItem;
    MenuDisUn: TMenuItem;
    DelRec: TMenuItem;
    procedure PaintBoxRecMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxRecMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBoxRecMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxRecPaint(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MenuUnClick(Sender: TObject);
    procedure MenuDisUnClick(Sender: TObject);
    procedure CrRecClick(Sender: TObject);
    procedure RemoveRec;
    procedure DelRecClick(Sender: TObject);
    procedure EditClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMRec = class
  public
    Cord:TPoint;
    dX,dY:integer;
    RecW,RecH:integer;
    procedure UnRec(MCRec:TMRec);
    procedure DisUnRec(MCRec:TMRec);
    procedure Move(X,Y:Integer);

    constructor Create(x:integer;y:integer;w:integer;h:integer);

    function GetW:integer;
    procedure SetW(const Value:integer);
    function GetH:integer;
    procedure SetH(const Value:integer);

    property Width:integer  Read GetW write SetW;
    property Height:integer Read GetH write SetH;
  private
     MRec:TRect;
  end;

var
  FormRec: TFormRec;
  O1,O2:TMRec;
  yes,yes2:boolean;
  Cor,Cor2:TPoint;
  cur:integer;
  drag:Boolean;
  cntRec:integer;


implementation

uses Types;

{$R *.dfm}

procedure TMRec.Setw(const Value:integer);
begin
    RecW := Value;
end;

procedure TMRec.SetH(const Value:integer);
begin
  RecH := Value;
end;

function TMRec.GetW:integer;
begin
  Result := RecW;
end;

function TMRec.GetH:integer;
begin
  Result := RecH;
end;

procedure TMRec.UnRec(MCRec:TMRec);//объеденение
var
  tmpRect: TRect;
begin
  tmpRect := MRec;
  if MCRec.MRec.Left   < MRec.Left   then tmpRect.Left   :=  MCRec.MRec.Left;
  if MCRec.MRec.Top    < MRec.Top    then tmpRect.Top    :=  MCRec.MRec.Top;
  if MCRec.MRec.Right  > MRec.Right  then tmpRect.Right  :=  MCRec.MRec.Right;
  if MCRec.MRec.Bottom > MRec.Bottom then tmpRect.Bottom :=  MCRec.MRec.Bottom;
  MCRec.MRec:= tmpRect;
  MCRec.Cord:=tmpRect.TopLeft
end;

procedure TMRec.DisUnRec(MCRec:TMRec);//пересечение
var
  tmpRect: TRect;
begin
  tmpRect := MRec;
  if MCRec.MRec.Left   > MRec.Left   then tmpRect.Left   :=  MCRec.MRec.Left;
  if MCRec.MRec.Top    > MRec.Top    then tmpRect.Top    :=  MCRec.MRec.Top;
  if MCRec.MRec.Right  < MRec.Right  then tmpRect.Right  :=  MCRec.MRec.Right;
  if MCRec.MRec.Bottom < MRec.Bottom then tmpRect.Bottom :=  MCRec.MRec.Bottom;
  MCRec.MRec:= tmpRect;
  MCRec.Cord:=tmpRect.TopLeft
end;

constructor TMRec.Create(x:integer;y:integer;w:integer;h:integer);
begin
  inherited Create;
  Width:=w;
  Height:=h;
  MRec := Rect(x,y,w,h);
end;

procedure TFormRec.PaintBoxRecMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Cor.X:=X;
  Cor.Y:=Y;
  if (yes=true) then              //если первый прямоугольник создан то
  begin
    if PtInRect(O1.MRec,Cor) then//проверяем кликнули в него или нет
    begin
      drag:= true;
      cur:=1;
      O1.dX:= Cor.X-O1.Cord.X;
      O1.dY:= Cor.Y-O1.Cord.Y;
    end;
  end;
  if (yes2=true) then            //если второй прямоугольник создан то
  begin
    if PtInRect(O2.MRec,Cor) then//проверяем кликнули в него или нет
    begin
      drag:= true;
      cur:=2;
      O2.dX:= Cor.X-O2.Cord.X;
      O2.dY:= Cor.Y-O2.Cord.Y;
     end;
   end;
end;

procedure TMRec.Move(X,Y:Integer);//перемещение после того как drag = true
var
  W,H:Integer;
begin
  if (cur = 1) then             //проверяем какой прямоугольник двигать
  begin
    W:= O1.Width; H:= O1.Height;
    O1.MRec:= Rect(X,Y,X+W,Y+H);
    O1.Cord.X:=X;
    O1.Cord.Y:=Y;
  end
  else if (cur = 2) then
  begin
    W:= O2.Width; H:= O2.Height;
    O2.MRec:= Rect(X,Y,X+W,Y+H);
    O2.Cord.X:=X;
    O2.Cord.Y:=Y;
  end;
end;

procedure TFormRec.PaintBoxRecMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if ((yes) and (drag)) then
    begin
      if (cur = 1) then
      O1.Move(X-O1.dX,Y-O1.dY);
    end;
  if ((yes2) and (drag)) then
    begin
      if (cur = 2) then
      O2.Move(X-O2.dX,Y-O2.dY);
    end;
    PaintBoxRec.Invalidate;//обновляем PainBoxRec
end;

procedure TFormRec.PaintBoxRecMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  drag:=false;//говорим что движение завершено
end;

procedure TFormRec.PaintBoxRecPaint(Sender: TObject);
begin
if (yes) then
  begin
   PaintBoxRec.Canvas.Brush.Style:=bsClear;
   PaintBoxRec.Canvas.Rectangle(O1.MRec);
  end;
if (yes2) then
  begin
   PaintBoxRec.Canvas.Brush.Style:=bsClear;
   PaintBoxRec.Canvas.Rectangle(O2.MRec);
  end;
end;

procedure TFormRec.FormDestroy(Sender: TObject);//при закрытии формы разрушаем объекты
begin
  if (yes)  then O1.Free;
  if (yes2) then O2.Free;
end;

procedure TFormRec.MenuUnClick(Sender: TObject);
begin
  O1.UnRec(O2);
  O1.Free;
  yes:=false;
  cntRec:=cntRec-1;
  cur:=2;
  O2.Width:=O2.MRec.Right-O2.MRec.Left;
  O2.Height:=O2.MRec.Bottom-O2.MRec.Top;
  CrRec.Enabled:=True;
  MenuUn.Enabled:=False;
  MenuDisUn.Enabled:=False;
  PaintBoxRec.Invalidate;
end;

procedure TFormRec.MenuDisUnClick(Sender: TObject);
begin
  O1.DisUnRec(O2);
  O1.Free;
  yes:=false;
  cntRec:=cntRec-1;
  cur:=2;
  O2.Width :=O2.MRec.Right-O2.MRec.Left;
  O2.Height:=O2.MRec.Bottom-O2.MRec.Top;
  CrRec.Enabled:=True;
  MenuUn.Enabled:=False;
  MenuDisUn.Enabled:=False;
  PaintBoxRec.Invalidate;
end;

procedure TFormRec.CrRecClick(Sender: TObject);
var
  WidEd,HeiEd:integer;
begin
  FormEdit.ShowModal;
  if (FormEdit.Good = 1) then
  begin
    WidEd := StrToInt(FormEdit.EditWidth.Text);
    HeiEd := StrToInt(FormEdit.EditHeight.Text);
    FormEdit.Good:=0;
  end
  else
    begin
      WidEd:=0;
      HeiEd:=0;
      FormEdit.Good:=0;
      Exit;
    end;
  if (cntRec=0) then
  begin
    O1:= TMRec.Create(0,0,WidEd,HeiEd);
    yes:=true;
    Edit.Enabled:=true;
    DelRec.Enabled:=true;
    PaintBoxRec.Canvas.Brush.Style:=bsClear;
    PaintBoxRec.Canvas.Rectangle(O1.MRec);
    cntRec:=cntRec+1;
    if cntRec=2 then
    begin
      CrRec.Enabled:=False;
      MenuUn.Enabled:=True;
      MenuDisUn.Enabled:=True;
    end;
  end
  else if ((cntRec=1)and(yes)) then
  begin
    O2:= TMRec.Create(0,0,WidEd,HeiEd);
    yes2:=true;
    Edit.Enabled:=true;
    DelRec.Enabled:=true;
    PaintBoxRec.Canvas.Brush.Style:=bsClear;
    PaintBoxRec.Canvas.Rectangle(O2.MRec);
    cntRec:=cntRec+1;
    if cntRec=2 then
    begin
      CrRec.Enabled:=False;
      MenuUn.Enabled:=True;
      MenuDisUn.Enabled:=True;
    end;
  end
  else if ((cntRec=1)and(yes2))then
  begin
    O1:= TMRec.Create(0,0,WidEd,HeiEd);
    yes:=true;
    PaintBoxRec.Canvas.Brush.Style:=bsClear;
    PaintBoxRec.Canvas.Rectangle(O1.MRec);
    cntRec:=cntRec+1;
    if cntRec=2 then
    begin
      CrRec.Enabled:=False;
      MenuUn.Enabled:=True;
      MenuDisUn.Enabled:=True;
    end;
  end;
  
end;

procedure TFormRec.RemoveRec;
begin
    if ((cur=1)and(yes)) then
  begin
    O1.Free;
    yes:=false;
    PaintBoxRec.Invalidate;
    if (yes2) then cur:=2;
    cntRec:=cntRec-1;
    CrRec.Enabled:=True;
  end
  else
  if ((cur=2)and(yes2)) then
  begin
    O2.Free;
    yes2:=false;
    PaintBoxRec.Invalidate;
    if (yes) then cur:=1;
    cntRec:=cntRec-1;
    CrRec.Enabled:=True;
  end;
end;

procedure TFormRec.DelRecClick(Sender: TObject);
begin
  RemoveRec;
  MenuUn.Enabled:=False;
  MenuDisUn.Enabled:=False;
  if (cntRec=0) then
  begin
    Edit.Enabled:=False;
    DelRec.Enabled:=False;
  end;
end;

procedure TFormRec.EditClick(Sender: TObject);
begin
  if cur=1 then
  begin
    FormEdit.EditWidth.Text:=IntToStr(O1.Width);
    FormEdit.EditHeight.Text:=IntToStr(O1.Height);
  end;
  if cur=2 then
  begin
    FormEdit.EditWidth.Text:=IntToStr(O2.Width);
    FormEdit.EditHeight.Text:=IntToStr(O2.Height);
  end;
  FormEdit.ShowModal;
  if (FormEdit.Good = 1) then
  begin
     if cur=1 then
      begin
        O1.Width := StrToInt(FormEdit.EditWidth.Text,);
        O1.Height:= StrToInt(FormEdit.EditHeight.Text);
        O1.MRec:=Rect(O1.Cord.X,O1.Cord.Y,O1.Cord.X+O1.Width,O1.Cord.Y+O1.Height);
        PaintBoxRec.Invalidate;
      end;
      if cur=2 then
      begin
        O2.Width := StrToInt(FormEdit.EditWidth.Text);
        O2.Height:= StrToInt(FormEdit.EditHeight.Text);
        O2.MRec:=Rect(O2.Cord.X,O2.Cord.Y,O2.Cord.X+O2.Width,O2.Cord.Y+O2.Height);
        PaintBoxRec.Invalidate;
      end;
    FormEdit.Good:=0;
    FormEdit.EditHeight.Text:='70';
    FormEdit.EditHeight.Text:='70';
  end
  else
    begin
      FormEdit.Good:=0;
      Exit;
    end;
    PaintBoxRec.Invalidate;
end;

end.

