unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FMX.Controls.Presentation, FMX.StdCtrls, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.IBDef, FireDAC.Phys.IBBase, FireDAC.Phys.IB,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs;

type
  TForm1 = class(TForm)
    ListView1: TListView;
    FDConnection1: TFDConnection;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
  VAR
  QUERY:TFDQUERY;
  ItenAdd: TListViewItem;

begin
QUERY:=TFDQuery.CREATE();
QUERY.CONNECTION:=FDCONNECTION1;
QUERY.SQL.CLEAR;
QUERY.SQL.ADD(' SELECT * FROM ORDERS');

query.OPEN();

query.first;
listview1.Items.clear;
listview1.BeginUpdate;
whie Not query.eof  do
begin
  ItemAdd:=listview1.Items.Add;
   ItemAdd.text:=query.FieldByName('Custno');

   query.next;
   end;
   litview1.EndUpdte;

   query.close;
    query.free;



end;

end.
