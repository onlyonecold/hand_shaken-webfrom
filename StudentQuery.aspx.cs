using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace hand_shaken_webform
{
    public partial class StudentQuery : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public DataTable depSet;
        public DataTable ReligionSet;
        public DataTable ClubSet;


        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                prepareDepartment();
                prepareReligion();
                prepareClub();

            }
        }
        void prepareDepartment()
        {
            string sqlstr = "select dep_id, dep_name from department order by dep_id";
            depSet = mydb.GetDataTable(sqlstr);
            DepList.DataSource = depSet;
            DepList.DataBind();
        }
        void prepareReligion()
        {
            string sqlstr = "select rel_id, rel_name from religion order by rel_id";
            ReligionSet = mydb.GetDataTable(sqlstr);
            ReligionList.DataSource=ReligionSet;
            ReligionList.DataBind();

        }
        void prepareClub()
        {
            string sqlstr = "select club_id, club_name from club order by club_id";
            ClubSet = mydb.GetDataTable(sqlstr);
            ClubList.DataSource = ClubSet;
            ClubList.DataBind();
        }

        string getDepName(string dep_id)
        {
            string sqlstr = "select dep_name from department where dep_id = " + mydb.qo(dep_id);
            return mydb.getSingleData(0, sqlstr);
        }
        string getClubName(string club_id)
        {
            string sqlstr = "select club_name from club where club_id = " + mydb.qo(club_id);
            return mydb.getSingleData(0, sqlstr);
        }
        string getReligion(string rel_id)
        {
            string sqlstr = "select rel_name from religion where rel_id = " + mydb.qo(rel_id);
            return mydb.getSingleData(0, sqlstr);
        }
         void showGrid()
        {
            string sqlstr = "select s.std_id as Std_Id, s.std_name as Std_Name, s.sex as Sex, d.Dep_Name as Dep_Name, c.club_name as Club_Name, r.Rel_Name as rel_Name ";
            sqlstr += " from student  s , department d, club c, religion r ";
            sqlstr += " where s.dep_id = d.dep_id";
            sqlstr += "    and s.club_id = c.club_id";
            sqlstr += "   and s.religion = r.rel_id ";
            string Qstring = "";
            if (Flag_Std_Id.Checked)
            {
               
                    Qstring += " and s.std_id like " + mydb.qo("%" + Std_Id.Text.Trim() + "%");
            }
            if (Flag_Std_Name.Checked)
            {
               
                    Qstring += " and s.std_name like " + mydb.qo("%" + Std_Name.Text.Trim() + "%");
            }
            if (Flag_Dep.Checked)
            {
               
                    Qstring += " and s.dep_id = " + mydb.qo(DepList.SelectedValue.Trim());
            }
            if (Flag_Religion.Checked)
            {
                
                    Qstring += " and s.religion = " + mydb.qo(ReligionList.SelectedValue.Trim());
            }
            if (Flag_Club.Checked)
            {
                
                    Qstring += " and s.club_id = " + mydb.qo(ClubList.SelectedValue.Trim());
            }
            //string sexS = SexList.SelectedValue;
            if (Flag_Sex.Checked)
            {
               
                    Qstring += " and s.sex = " + SexList.SelectedValue;
            }
            sqlstr += Qstring;

            StdGrid.DataSource = mydb.GetDataTable(sqlstr);
            StdGrid.DataBind();
            //park department at right position
            for (int idx = 0; idx < StdGrid.Rows.Count; idx++)
            {  
                //Sex
                string sexS = ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text;
                if (sexS == "True")
                    ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text = "男";
                else
                    ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text = "女";

            }
            /*
            string Qstring = "";
            if(Flag_Std_Id.Checked)
            {  if (Qstring == "")
                    Qstring += " where std_id like" + mydb.qo("%" + Std_Id.Text.Trim() + "%");
               else
                    Qstring += " and std_id like " + mydb.qo("%" + Std_Id.Text.Trim() + "%");
            }
            if (Flag_Std_Name.Checked)
            {
                if (Qstring == "")
                    Qstring += " where std_name like " + mydb.qo("%" + Std_Name.Text.Trim()+ "%");
                else
                    Qstring += " and std_name like " + mydb.qo("%" + Std_Name.Text.Trim() + "%");
            }
            if (Flag_Dep.Checked)
            {
                if (Qstring == "")
                    Qstring += " where dep_id = " + mydb.qo(DepList.SelectedValue.Trim());
                else
                    Qstring += " and dep_id = " + mydb.qo(DepList.SelectedValue.Trim());
            }
            if (Flag_Religion.Checked)
            {
                if (Qstring == "")
                    Qstring += " where religion = " + mydb.qo( ReligionList.SelectedValue.Trim());
                else
                    Qstring += " and religion = " + mydb.qo(ReligionList.SelectedValue.Trim());
            }
            if (Flag_Club.Checked)
            {
                if (Qstring == "")
                    Qstring += " where club_id = " + mydb.qo(ClubList.SelectedValue.Trim());
                else
                    Qstring += " and club_id = " + mydb.qo(ClubList.SelectedValue.Trim());
            }
            //string sexS = SexList.SelectedValue;
            if (Flag_Sex.Checked)
            {
                if (Qstring == "")
                    Qstring += " where sex = " + SexList.SelectedValue;
                else
                    Qstring += " and sex = " + SexList.SelectedValue;
            }
            string sqlstr = "select * from student " + Qstring;
            
            StdGrid.DataSource = mydb.GetDataTable(sqlstr);
            StdGrid.DataBind();
            //park department at right position
            for (int idx = 0; idx < StdGrid.Rows.Count; idx++)
            {   //Department
                ((LinkButton)StdGrid.Rows[idx].FindControl("Dep_Id")).Text = getDepName(((LinkButton)StdGrid.Rows[idx].FindControl("Dep_Id")).Text.Trim());

                //Religion
                ((LinkButton)StdGrid.Rows[idx].FindControl("Religion")).Text = getReligion(((LinkButton)StdGrid.Rows[idx].FindControl("Religion")).Text.Trim());
                //Club
                ((LinkButton)StdGrid.Rows[idx].FindControl("Club_Id")).Text = getClubName(((LinkButton)StdGrid.Rows[idx].FindControl("Club_Id")).Text.Trim());
                
                //Sex
                string sexS = ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text;
                if (sexS == "True")
                    ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text = "男";
                else
                    ((LinkButton)StdGrid.Rows[idx].FindControl("Sex")).Text = "女";

            }  */

        }

        protected void StdGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            string Std_Id = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {
               
                case "editStd":
                    {
                        Response.Redirect("StudentEditOne.aspx?Std_Id="+ Std_Id);
                        break;
                    }
                default:
                    break;
            }
        }// End of StdGrid_RowCommand

        protected void StdGrid_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            StdGrid.PageIndex = e.NewPageIndex;  //e.NewSelectedIndex;
            showGrid();
        }



        protected void Query_Click(object sender, EventArgs e)
        {
 showGrid();
        }
    }
}