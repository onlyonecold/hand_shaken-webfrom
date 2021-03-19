using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
namespace hand_shaken_webform
{
    public class dbClass
    {
        public SqlConnection myConn = new SqlConnection(@"Data Source=MSI\SQL2019;Database=hand_shaken;uid=sa;pwd=1qaz2wsx;");
        //DESKTOP-7VJ993H   localhost
        public SqlCommand myCmd = new SqlCommand();
        public void execSQL(string sqlstr)
        {
            myConn.Open();
            myCmd.Connection = myConn;
            sqlstr = " Begin Tran " + sqlstr;
            sqlstr += " if @@ERROR <> 0 ";
            sqlstr += " ROLLBACK TRAN ";
            sqlstr += " else ";
            sqlstr += "    Commit Tran";
            myCmd.CommandText = sqlstr;
            myCmd.ExecuteNonQuery();
            myConn.Close();

        }

        public  void ShowMessageBox(Page page, string message)
        {
            Type cstype = page.GetType();

            // Get a ClientScriptManager reference from the Page class.
            ClientScriptManager cs = page.ClientScript;

            // Find the first unregistered script number
            int ScriptNumber = 0;
            bool ScriptRegistered = false;
            do
            {
                ScriptNumber++;
                ScriptRegistered = cs.IsStartupScriptRegistered(cstype, "PopupScript" + ScriptNumber);
            } while (ScriptRegistered == true);

            //Execute the new script number that we found
            cs.RegisterStartupScript(cstype, "PopupScript" + ScriptNumber, "alert('" + message + "');", true);
        }

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

        public string ToSexBooleanStr(string sex, int inValue)
        { if (sex == "M")
            {
                if (inValue == 1)
                    return "True";
                else
                    return "False";
            }
            else{
                if (inValue == 0)
                    return "True";
                else
                    return "False";
            }
        }

        public DataTable Get_Option_Item(int option_id)
        {
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myCmd.Connection = myConn;
            myCmd.CommandText = "select option_number as id ,option_name as optionName  from sys_options where sys_options.option_id ="+ option_id + "order by sys_options.option_number asc";
            myAdapter.SelectCommand = myCmd;
            DataTable myTable = new DataTable();
            myConn.Open();
            myAdapter.Fill(myTable);
            myConn.Close();
            return myTable;
        }
    }
}
