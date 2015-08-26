// Import necessary namespaces
using System;
using System.Data;
using System.Data.OleDb;

namespace PracticalDataLayer
{
    public class PracticalData
    {
        #region Fields - Instance variables
        private string _connectionString = "";
        private OleDbConnection _connection;
        private OleDbCommand _sqlCommand;
        private OleDbDataReader _reader;
        #endregion

        #region Properties - available properties of the class

        public string ConnectionString
        {
            get { return _connectionString; }
            set { _connectionString = value; }
        }

        public OleDbConnection Connection
        {
            get { return _connection; }
        }

        #endregion

        #region Constructors
        public PracticalData(string connectionString)
        {
            _connectionString = connectionString;
            _connection = new OleDbConnection(_connectionString);
            _sqlCommand = new OleDbCommand("", _connection);
        }
        #endregion

        #region Public methods

        /// <summary>
        /// Checks whether connection object exists
        /// and open new connection session
        /// </summary>
        public void OpenConnection()
        {
            if (_connection != null)
            {
                _connection.Open();
            }
        }

        /// <summary>
        /// Checks whether conecction object exists and if it exists whether the state is not closed.
        /// If all of the above is true, close the connection session
        /// </summary>
        public void CloseConnection()
        {
            if (_connection != null && _connection.State != ConnectionState.Closed)
            {
                _connection.Close();
            }
        }

        /// <summary>
        /// Checks whether reader object exists and if it exists, checks its state
        /// If state is not closed, then close reader
        /// </summary>
        public void CloseReader()
        {
            if (_reader != null && !_reader.IsClosed)
            {
                _reader.Close();
            }
        }

        /// <summary>
        /// If connection is open then the method executes specific query: "select * from Employees" 
        /// in the connected database.
        /// </summary>
        /// <returns>DataReader with data about employees</returns>
        public OleDbDataReader GetEmployees()
        {
            if (_connection.State == ConnectionState.Open)
            {
                string sqlQuery = "select * from Bag";
                _sqlCommand.CommandText = sqlQuery;
                _reader = _sqlCommand.ExecuteReader();
            }
            return _reader;
        }

        public OleDbDataReader GetCustomers()
        {
            if (_connection.State == ConnectionState.Open)
            {
                string sqlQuery = "select * from UserData";
                _sqlCommand.CommandText = sqlQuery;
                _reader = _sqlCommand.ExecuteReader();
            }
            return _reader;
        }



        /// <summary>
        /// If connection is open then the method executes query from sqlString parameter 
        /// </summary>
        /// <param name="sqlString">sql query that is to contain update employee command</param>
        public void UpdateEmployee(string sqlString)
        {
            if (_connection.State == ConnectionState.Open)
            {
                _sqlCommand.CommandText = sqlString;
                _sqlCommand.ExecuteNonQuery();
            }
        }

        #endregion


    }
}
