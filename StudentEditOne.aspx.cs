using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace hand_shaken_webform
{
    public partial class StudentEditOne : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable depSet;
        public DataTable ReligionSet;
        public DataTable clubSet;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {     if (Request.QueryString["Std_Id"] != null)
                        Std_Id.Text = Request.QueryString["Std_Id"].ToString().Trim();
                    else
                        Response.Redirect("~/Student");

                prepareDepartment(); DepList.DataSource = depSet; DepList.DataBind();
                prepareReligion(); ReligionList.DataSource = ReligionSet; ReligionList.DataBind();
                prepareClub(); ClubList.DataSource = clubSet; ClubList.DataBind();
                
                  
                
                Std_Id_Old.Value = Std_Id.Text;
                
                    
                getDetail();

            }
            //for (int idx = 0; idx < mySet.Rows.Count; idx++) 
            //      Response.Write(mySet.Rows[idx]["std_id"].ToString() + "-" + mySet.Rows[idx]["std_name"].ToString() + "<hr>");
        }
        void getDetail()
        {
            string sqlstr = " select std_name, sex, dep_id, club_id, religion from student where std_id = " + mydb.qo(Std_Id.Text);
            DataTable myTable = mydb.GetDataTable(sqlstr);
            Std_Name.Text = myTable.Rows[0][0].ToString();
            //Sex
            if(myTable.Rows[0][1].ToString() == "True")
            {
                SexList.Items[0].Selected = true;
            }
            else
                SexList.Items[1].Selected = true;
            //Department
            int selected = 0;
            string Qdep_Id = myTable.Rows[0][2].ToString().Trim(); //Response.Write("Qdep_Id=" + Qdep_Id);
            foreach (DataRow row in depSet.Rows)
            {
                if (row["dep_id"].ToString().Trim() == Qdep_Id)
                {
                    DepList.SelectedIndex = selected; //Response.Write("Selected=" + selected.ToString());
                    break;
                }

                selected++;
            }
            //Club
            selected = 0;
            string Qclub_Id = myTable.Rows[0][3].ToString().Trim();
            foreach (DataRow row in clubSet.Rows)
            {
                if (row["club_id"].ToString().Trim() == Qclub_Id)
                {
                    ClubList.SelectedIndex = selected;
                    break;
                }

                selected++;
            }
            //Religion
            selected = 0;
            string Qreligion = myTable.Rows[0][4].ToString().Trim();
            foreach (DataRow row in ReligionSet.Rows)
            {
                if (row["rel_id"].ToString().Trim() == Qreligion)
                {
                   ReligionList.SelectedIndex = selected;
                    break;
                }

                selected++;
            }
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
            string sqlstr = " update student set ";
            sqlstr += " std_id = " + mydb.qo(Std_Id.Text.Trim());
            sqlstr += ", std_name = " + mydb.qo(Std_Name.Text.Trim());
            sqlstr += ", sex= " + SexList.SelectedValue;
            sqlstr += " , dep_id=" + mydb.qo(DepList.SelectedValue.Trim());
            sqlstr += ", club_id = " + mydb.qo(ClubList.SelectedValue.Trim());
            sqlstr += " , religion=" + mydb.qo(ReligionList.SelectedValue.Trim());
            sqlstr += " where std_id = " + mydb.qo(Std_Id_Old.Value.Trim());
            
            mydb.execSQL(sqlstr);
            //Response.Write(sqlstr);
            Response.Redirect("student.aspx");

        }
        string getDepName(string std_id)
        {
            string sqlstr = "select dep_name from department where dep_id = " + mydb.qo(std_id);
            return mydb.getSingleData(0, sqlstr);
        }
    }

}