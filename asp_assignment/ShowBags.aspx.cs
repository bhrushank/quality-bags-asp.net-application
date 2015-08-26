using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PracticalBusinessLayer;
using System.IO;
using WAHelpers;
using System.Data;
using System.Data.OleDb;
using System.Web.UI.WebControls;



using System.Text;
public partial class ShowBags : System.Web.UI.Page
{

    private OleDbDataAdapter _myAdapter;
    private DataSet _myDs = new DataSet();
    private string _orderItemsName = "Order Items";
    private string _orderName = "Order";

    protected void Page_Load(object sender, EventArgs e)
    {

        //Define connection
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("~/../uploads/db1.accdb");

        OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
        string sqlQuery = "SELECT [BagID],[BagName], [Quantity],[UserName], [Color], [Cost], [Status]FROM [Orders]";
        _myAdapter = new OleDbDataAdapter(sqlQuery, conn);

        //Event handlers
        dlstDataList.ItemCommand += new DataListCommandEventHandler(dlstDataList_ItemCommand);
        Save.Click += new EventHandler(Save_Click);
        Clear.Click += new EventHandler(Clear_Click);

        if (!this.IsPostBack)
        {
            this.LoadDelegates();

            //Load table
            //No need to open and close connection. DataAdapter does it.
            _myAdapter.Fill(_myDs, _orderItemsName);
            _myDs.Clear();
            this.Session[_orderName] = _myDs;
        }

    }

    public void LoadDelegates()
    {
        OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
        sb.Provider = "Microsoft.ACE.OLEDB.12.0";
        sb.DataSource = Server.MapPath("~/../uploads/db1.accdb");

        OleDbConnection conn = new OleDbConnection(sb.ConnectionString);
        string sqlQuery = "SELECT * FROM Bag";

        OleDbCommand command = new OleDbCommand(sqlQuery, conn);
        OleDbDataReader myReader;

        //Open connection
        conn.Open();

        //Retrieve the data and display by using a DataList
        myReader = command.ExecuteReader();
        dlstDataList.DataSource = myReader;
        dlstDataList.DataBind();

        myReader.Close();

        //Close connection
        conn.Close();
    }

    protected void dlstDataList_ItemCommand(object sender, System.Web.UI.WebControls.DataListCommandEventArgs e)
    {
        Double cost = 0;


        _myDs = this.Session[_orderName] as DataSet;

        DataRow newRow;
        Label lblProductName = e.Item.FindControl("PName") as Label;
        Label lblCost = e.Item.FindControl("PPrice") as Label;
       
        
        DropDownList ddlColor = e.Item.FindControl("ddlColor") as DropDownList;
        int rowNum = _myDs.Tables[_orderItemsName].Rows.Count;
        bool test = false;

        for (int i = 0; i < rowNum; i++)
        {
            if (Convert.ToInt32(_myDs.Tables[_orderItemsName].Rows[i]["BagID"]) == Convert.ToInt32(dlstDataList.DataKeys[e.Item.ItemIndex]) && 
                _myDs.Tables[_orderItemsName].Rows[i]["Color"] ==ddlColor.Text)
            {
                _myDs.Tables[_orderItemsName].Rows[i]["Quantity"] =
                    Convert.ToInt32(_myDs.Tables[_orderItemsName].Rows[i]["Quantity"]) + 1;
                _myDs.Tables[_orderItemsName].Rows[i]["Cost"] =
                    Convert.ToDouble(_myDs.Tables[_orderItemsName].Rows[i]["Cost"]) + Convert.ToDouble(lblCost.Text);
                test = true;
                break;

            }
        }

        if (!test)
        {
            //first time click
            newRow = _myDs.Tables[_orderItemsName].NewRow();
            newRow["BagID"] = dlstDataList.DataKeys[e.Item.ItemIndex];
            newRow["BagName"] = lblProductName.Text;
            newRow["Color"] = ddlColor.Text;
            newRow["Quantity"] = 1;
            newRow["Cost"] = lblCost.Text;
            newRow["Status"] = "Waiting";
            newRow["UserName"] = Session["UserName"];
            
            _myDs.Tables[_orderItemsName].Rows.Add(newRow);
            cost += Convert.ToDouble(lblCost.Text);

        }
        for (int i = 0; i < rowNum; i++)
        {
            cost += Convert.ToDouble(_myDs.Tables[_orderItemsName].Rows[i]["Cost"]);
        }

        lblGST.Text = (cost * 0.15).ToString();
        lblTotal.Text = cost.ToString();

        this.Session[_orderName] = _myDs;
        gvItems.DataSource = _myDs;
        gvItems.DataBind();

    }

    public void Save_Click(object sender, EventArgs e)
    {
        if (Session["UserName"] != null && Session["UserName"] !="")
        {
            
            //Create a command builder to generate the SQL statements
            OleDbCommandBuilder myCb = new OleDbCommandBuilder(_myAdapter);

            myCb.QuotePrefix = "[";
            myCb.QuoteSuffix = "]";
            _myDs = this.Session[_orderName] as DataSet;

            //    Update database
            _myAdapter.Update(_myDs, _orderItemsName);

            _myDs.Clear();
            this.Session[_orderName] = _myDs;
            gvItems.DataSource = _myDs;
            gvItems.DataBind();
        }
        else
        {
            Response.Redirect("UserLogin.aspx");
        }
    }

    protected void Clear_Click(object sender, EventArgs e)
    {
        _myDs = this.Session[_orderName] as DataSet;
        _myDs.Clear();
        this.Session[_orderName] = _myDs;
        gvItems.DataSource = _myDs;
        gvItems.DataBind();

        lblGST.Text = "";
        lblTotal.Text = "";


    }
}