unit EditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormEdit = class(TForm)
    EditWidth: TEdit;
    EditHeight: TEdit;
    LabelWidth: TLabel;
    LabelHeght: TLabel;
    mrOk: TButton;
    procedure EditWidthKeyPress(Sender: TObject; var Key: Char);
    procedure EditHeightKeyPress(Sender: TObject; var Key: Char);
    procedure mrOkClick(Sender: TObject);
  private
    { Private declarations }
  public
     Good:integer;
    { Public declarations }
  end;

var
  FormEdit: TFormEdit;
  Good:integer;

implementation

{$R *.dfm}

procedure TFormEdit.EditWidthKeyPress(Sender: TObject; var Key: Char);
begin
if ((Key >= '0') and (Key <= '9') or (Key = #8)) then
 else Key := #0; // �������� �� ����(������ ����� � backspace)
end;

procedure TFormEdit.EditHeightKeyPress(Sender: TObject; var Key: Char);
begin
 if ((Key >= '0') and (Key <= '9') or (Key = #8)) then
 else Key := #0; // �������� �� ����(������ ����� � backspace)
end;

procedure TFormEdit.mrOkClick(Sender: TObject);
begin
	Good:=1;// ������ ����� ������� ����� ��
	FormEdit.Close;
end;

end.
