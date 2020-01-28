program Rectangle;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormRec},
  EditForm in 'EditForm.pas' {FormEdit};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormRec, FormRec);
  Application.CreateForm(TFormEdit, FormEdit);
  Application.Run;
end.
