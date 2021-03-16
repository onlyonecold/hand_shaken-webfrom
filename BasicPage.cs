using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;




using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace hand_shaken_webform
{
    public class BasicPage:Page
    {
        public SqlConnection myConn = new SqlConnection(@"Data Source=DESKTOP-7VJ993H;Database=student;uid=sa;pwd=summer2013;");
        //DESKTOP-7VJ993H   localhost
        public SqlCommand myCmd = new SqlCommand();
        public void execSQL(string sqlstr)
        {
            myConn.Open();
            myCmd.Connection = myConn;
            myCmd.CommandText = sqlstr;
            myCmd.ExecuteNonQuery();
            myConn.Close();

        }

        //void getallstd()
        //{
        //    string sqlstr = "SELECT std_id,  std_id +','+std_name as commentstr  ";
        //    sqlstr += " FROM student";
        //    StdList.DataSource = GetDataTable(sqlstr);
        //    StdList.DataBind();

        //}

        public string getSingleData(int item_no, string sqlstr)
        {
            string temp = "";
            myConn.Open();
            myCmd.Connection = myConn;
            myCmd.CommandText = sqlstr;
            SqlDataReader myreader = myCmd.ExecuteReader();
            while (myreader.Read())
            {
                temp = myreader[item_no].ToString();
            }
            myConn.Close();
            return temp;

            //myreader.Dispose();
        }
        public string qo(string instr)
        {
            return "'" + instr + "'";
        }
        public string getReader(string col_name, string sqlstr)
        {
            string retstring = "";
            myConn.Open();
            myCmd.Connection = myConn;
            myCmd.CommandText = sqlstr;
            SqlDataReader myreader = myCmd.ExecuteReader();
            if (myreader.Read())
                retstring = myreader[col_name].ToString();

            myConn.Close();
            return retstring;

        }
        public DataSet GetDataSet(string sqlstr)
        {

            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myCmd.Connection = myConn;
            myCmd.CommandText = sqlstr;

            myAdapter.SelectCommand = myCmd;
            DataSet mySet = new DataSet();
            myConn.Open();
            myAdapter.Fill(mySet);
            myConn.Close();
            return mySet;
        }

        public DataTable GetDataTable(string sqlstr)
        {

            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myCmd.Connection = myConn;
            myCmd.CommandText = sqlstr;

            myAdapter.SelectCommand = myCmd;
            DataTable myTable = new DataTable();
            myConn.Open();
            myAdapter.Fill(myTable);
            myConn.Close();
            return myTable;
        }

        public int Get_List_Index(string ExistedValue, DataSet ExistedSet, int item_no)
        {

            if (ExistedValue == "") return 0;
            for (int i = 0; i < ExistedSet.Tables[0].Rows.Count; i++)
            {
                if (ExistedValue.Trim() == ExistedSet.Tables[0].Rows[i][item_no].ToString().Trim())
                    return i; ;

            }
            return 0;
        }
    }
}