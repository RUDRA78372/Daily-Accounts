unit TabbedTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.TabControl,
  FMX.StdCtrls, FMX.Gestures, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
  FMX.ListBox, FMX.ScrollBox, FMX.Memo, System.IOUtils, FMX.ExtCtrls,
  FMX.DateTimeCtrls,FMX.DialogService.async;

type
  TTabbedForm = class(TForm)
    HeaderToolBar: TToolBar;
    ToolBarLabel: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    GestureManager1: TGestureManager;
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label3: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Edit5: TEdit;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    Edit8: TEdit;
    Label8: TLabel;
    Edit9: TEdit;
    Label9: TLabel;
    Edit10: TEdit;
    Label10: TLabel;
    Edit11: TEdit;
    Label11: TLabel;
    Button1: TButton;
    Button2: TButton;
    ListBox1: TListBox;
    Button3: TButton;
    Memo1: TMemo;
    Button4: TButton;
    Memo2: TMemo;
    ImageViewer2: TImageViewer;
    Memo3: TMemo;
    StyleBook1: TStyleBook;
    DateEdit1: TDateEdit;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormGesture(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabbedForm: TTabbedForm;

implementation

{$R *.fmx}

var
  Cl: Boolean = false;
  Cl2: Boolean = false;
  Day: integer = 0;

procedure TTabbedForm.Button1Click(Sender: TObject);
begin
  Cl := True;
  if not(Edit1.Text = '') then
    Memo1.Lines.Add(Label1.Text + '' + Edit1.Text);
  if not(Edit2.Text = '') then
    Memo1.Lines.Add(Label2.Text + '' + Edit2.Text);
  if not(Edit3.Text = '') then
    Memo1.Lines.Add(Label3.Text + '' + Edit3.Text);
  if not(Edit4.Text = '') then
    Memo1.Lines.Add(Label4.Text + '' + Edit4.Text);
  if not(Edit5.Text = '') then
    Memo1.Lines.Add(Label5.Text + '' + Edit5.Text);
  if not(Edit6.Text = '') then
    Memo1.Lines.Add(Label6.Text + '' + Edit6.Text);
  if not(Edit7.Text = '') then
    Memo1.Lines.Add(Label7.Text + '' + Edit7.Text);
  if not(Edit8.Text = '') then
    Memo1.Lines.Add(Label8.Text + '' + Edit8.Text);
  if not(Edit9.Text = '') then
    Memo1.Lines.Add(Label9.Text + '' + Edit9.Text);
  if not(Edit10.Text = '') then
    Memo1.Lines.Add(Label10.Text + '' + Edit10.Text);
  if not(Edit11.Text = '') then
    Memo1.Lines.Add(Label11.Text + '' + Edit11.Text);
end;

procedure TTabbedForm.Button2Click(Sender: TObject);
begin
  if not Cl or not Cl2 then
    Showmessage('Please calculate the day before saving')
  else
  begin
  DateEdit1.TodayDefault:=True;
    Day := Day + 1;
    ListBox1.Items.Add(Format('%s',[FormatDateTime('dddd, mmmm d,yyyy', DateEdit1.Date)]));
    Memo1.Lines.SaveToFile(IncludeTrailingBackslash(TPath.GetHomePath) + '' +
      inttostr(Day) + '.txt');
    ListBox1.Items.SaveToFile(IncludeTrailingBackslash(TPath.GetHomePath) +
      'List.txt');
    Showmessage('Saved');
  end;
end;

procedure TTabbedForm.Button3Click(Sender: TObject);
begin
  if Fileexists(IncludeTrailingBackslash(TPath.GetHomePath) + '' +
    inttostr(ListBox1.ItemIndex + 1) + '.txt') then
    Memo2.Lines.LoadFromFile(IncludeTrailingBackslash(TPath.GetHomePath) + '' +
      inttostr(ListBox1.ItemIndex + 1) + '.txt');
end;

procedure TTabbedForm.Button4Click(Sender: TObject);
var
  T: integer;
begin
  T := 0;
  Cl2 := True;
  if not(Edit1.Text = '') then
    T := T + strtoint(Edit1.Text);
  if not(Edit2.Text = '') then
    T := T + strtoint(Edit2.Text);
  if not(Edit3.Text = '') then
    T := T + strtoint(Edit3.Text);
  if not(Edit4.Text = '') then
    T := T + strtoint(Edit4.Text);
  if not(Edit5.Text = '') then
    T := T + strtoint(Edit5.Text);
  if not(Edit6.Text = '') then
    T := T + strtoint(Edit6.Text);
  if not(Edit7.Text = '') then
    T := T + strtoint(Edit7.Text);
  if not(Edit8.Text = '') then
    T := T + strtoint(Edit8.Text);
  if not(Edit9.Text = '') then
    T := T + strtoint(Edit9.Text);
  Memo1.Lines.Add(Button4.Text + ': ' + inttostr(T));
end;

procedure TTabbedForm.Button5Click(Sender: TObject);
begin

  FMX.DialogService.Async.TDialogServiceAsync.MessageDialog('Delete this day?',
    System.UITypes.TMsgDlgType.mtConfirmation, [System.UITypes.TMsgDlgBTN.mbYes,
    System.UITypes.TMsgDlgBTN.mbNo], System.UITypes.TMsgDlgBTN.mbNo, 0,
    procedure(const AResult: TModalResult)
    begin
      if AResult = 6 then
      begin
        if Fileexists(IncludeTrailingBackslash(TPath.GetHomePath) + '' +
      inttostr(ListBox1.ItemIndex + 1) + '.txt') then
      TFile.Delete(IncludeTrailingBackslash(TPath.GetHomePath) + '' +
      inttostr(ListBox1.ItemIndex + 1) + '.txt');
      end;
    end);
end;

procedure TTabbedForm.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TabControl1.ActiveTab := TabItem1;
  if Fileexists(IncludeTrailingBackslash(TPath.GetHomePath) + 'List.txt') then
    ListBox1.Items.LoadFromFile(IncludeTrailingBackslash(TPath.GetHomePath) +
      'List.txt');
  Day := ListBox1.Items.Count;
  DateEdit1.TodayDefault:=True;
end;

procedure TTabbedForm.FormGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
{$IFDEF ANDROID}
  case EventInfo.GestureID of
    sgiLeft:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[TabControl1.TabCount - 1]
        then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex + 1];
        Handled := True;
      end;

    sgiRight:
      begin
        if TabControl1.ActiveTab <> TabControl1.Tabs[0] then
          TabControl1.ActiveTab := TabControl1.Tabs[TabControl1.TabIndex - 1];
        Handled := True;
      end;
  end;
{$ENDIF}
end;

end.
