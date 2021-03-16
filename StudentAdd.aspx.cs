using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace hand_shaken_webform
{
    public partial class StudentAdd : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable depSet;
        public DataTable ReligionSet;
        public DataTable clubSet;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {   prepareDepartment(); 
                DepList.DataSource = depSet; DepList.DataBind();

                prepareReligion(); 
                ReligionList.DataSource = ReligionSet; ReligionList.DataBind();

                prepareClub(); 
                ClubList.DataSource = clubSet; ClubList.DataBind();


            }
            //for (int idx = 0; idx < mySet.Rows.Count; idx++) 
            //      Response.Write(mySet.Rows[idx]["std_id"].ToString() + "-" + mySet.Rows[idx]["std_name"].ToString() + "<hr>");
        }
        void prepareDepartment()
        {
            string sqlstr = "select dep_id, dep_name from department order by dep_id";
            depSet = mydb.GetDataTable(sqlstr);
        }
        void prepareClub()
        {
            string sqlstr = "select club_id, club_name from club order by club_id";
            clubSet = mydb.GetDataTable(sqlstr);
        }
        void prepareReligion()
        {
            string sqlstr = "select rel_id, rel_name from religion order by rel_id";
            ReligionSet = mydb.GetDataTable(sqlstr);
        }
        protected void confirm_Click(object sender, EventArgs e)
        {
            if (Std_Id.Text.Trim() == "")
                return;
           

            string sqlstr = " insert into student(std_id, std_name, sex, dep_id, club_id, religion)values(";
            sqlstr += mydb.qo(Std_Id.Text.Trim()) + ",";
            sqlstr += mydb.qo(Std_Name.Text.Trim()) + ",";
            sqlstr += SexList.SelectedValue + ",";
            sqlstr += mydb.qo(DepList.SelectedValue.Trim()) + ",";
            sqlstr += mydb.qo(ClubList.SelectedValue.Trim()) + ",";
            sqlstr += mydb.qo(ReligionList.SelectedValue.Trim()) + ")";
            mydb.execSQL(sqlstr);
            
            Response.Redirect("student.aspx");

        }
        string getDepName(string std_id)
        {
            string sqlstr = "select dep_name from department where dep_id = " + mydb.qo(std_id);
            return mydb.getSingleData(0, sqlstr);
        }
    }






   
   
   
}