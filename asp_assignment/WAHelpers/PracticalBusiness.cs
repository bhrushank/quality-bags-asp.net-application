using System;
using PracticalDataLayer;
using System.Data.OleDb;
using System.Web;
using System.Web.UI.WebControls;
using System.IO;

namespace PracticalBusinessLayer
{
    public class PracticalBusiness
    {
        #region Fields
        private PracticalData _data;
        #endregion

        #region Constructors

        public PracticalBusiness()
        {
            OleDbConnectionStringBuilder sb = new OleDbConnectionStringBuilder();
            sb.Provider = "Microsoft.ACE.OLEDB.12.0";
            sb.DataSource = HttpContext.Current.Server.MapPath("~/../uploads/db1.accdb");

            _data = new PracticalData(sb.ConnectionString);
        }

        #endregion

        #region Open methods

        public void DisplayDelegates(DataList dlstDataList, DropDownList ddlRegID)
        {
            _data.OpenConnection();
            //Retrieve the data and display by using a Dropdown List
            ddlRegID.DataSource = _data.GetEmployees();
            ddlRegID.DataBind();
            _data.CloseReader();

            //Retrieve the data and display by using a DataList
            dlstDataList.DataSource = _data.GetEmployees();
            dlstDataList.DataBind();
            _data.CloseReader();

            _data.CloseConnection();
        }

        public void DisplayCustomers(DataList dlstDataList, DropDownList ddlRegID)
        {
            _data.OpenConnection();
            //Retrieve the data and display by using a Dropdown List
            ddlRegID.DataSource = _data.GetCustomers();
            ddlRegID.DataBind();
            _data.CloseReader();

            //Retrieve the data and display by using a DataList
            dlstDataList.DataSource = _data.GetCustomers();
            dlstDataList.DataBind();
            _data.CloseReader();

            _data.CloseConnection();
        }

       

        public string SaveFile(FileUpload fileObject, string virtualPath, string fieldName, int idNumber)
        {
            _data.OpenConnection();

            string sqlQuery = "Update Bag Set " + fieldName + " = '" + virtualPath + "' Where [BagID] = " + idNumber.ToString();
            _data.UpdateEmployee(sqlQuery);

            fileObject.PostedFile.SaveAs(HttpContext.Current.Server.MapPath(virtualPath));

            _data.CloseConnection();

            string result = "File uploaded successfully to <b>" + HttpContext.Current.Server.MapPath(virtualPath) +
                            "</b> on the Web server";
            return result;
        }

        public void SaveLog(string logLine)
        {
            StreamWriter streamWriter =
                System.IO.File.AppendText(HttpContext.Current.Server.MapPath("~/../uploads/UploadFiles/PracticalLog.txt"));
            streamWriter.WriteLine(DateTime.Now.ToString() + " : " + logLine);
            streamWriter.Close();
        }

        #endregion

    }
}
