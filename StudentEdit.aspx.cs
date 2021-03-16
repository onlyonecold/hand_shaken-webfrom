using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace hand_shaken_webform
{
    public partial class StudentEdit : Page
    {
        dbClass mydb = new dbClass();
        public DataTable depSet;
        public DataTable clubSet;
        public DataTable ReligionSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            prepareDepartment();
            prepareClub();
            prepareReligion();
            if (!Page.IsPostBack)
            {
               
                showGrid();
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

       

        void showGrid()
        {
            string sqlstr = " select std_id, std_name,sex,  dep_id, religion, club_id from student";

            StdGrid.DataSource = mydb.GetDataTable(sqlstr);
            StdGrid.DataBind();
            //park department at right position
            for(int idx=0; idx < StdGrid.Rows.Count; idx++)
            {   //Department
                int selected = 0;
                foreach (DataRow row in depSet.Rows)
                {   if (row["dep_id"].ToString() == ((HiddenField)StdGrid.Rows[idx].FindControl("HDep_Id")).Value)
                    {  ((DropDownList)StdGrid.Rows[idx].FindControl("DepList")).SelectedIndex = selected;
                        break;
                    }
                    
                    selected++;
                }
                //Department
                selected = 0;
                foreach (DataRow row in clubSet.Rows)
                {
                    if (row["club_id"].ToString() == ((HiddenField)StdGrid.Rows[idx].FindControl("HClub_Id")).Value)
                    {
                        ((DropDownList)StdGrid.Rows[idx].FindControl("ClubList")).SelectedIndex = selected;
                        break;
                    }

                    selected++;
                }
                //Religion
                selected = 0;
                foreach (DataRow row in ReligionSet.Rows)
                {
                    if (row["rel_id"].ToString() == ((HiddenField)StdGrid.Rows[idx].FindControl("Hrel_id")).Value)
                    {
                        ((DropDownList)StdGrid.Rows[idx].FindControl("ReligionList")).SelectedIndex = selected;
                        break;
                    }

                    selected++;
                }
                //Sex

                if ("True" == ((HiddenField)StdGrid.Rows[idx].FindControl("Hsex")).Value)
                    {
                            
                        ((RadioButtonList)StdGrid.Rows[idx].FindControl("SexList")).Items[0].Selected = true;
                        ((RadioButtonList)StdGrid.Rows[idx].FindControl("SexList")).Items[1].Selected = false;
                    }
                    else
                    {
                     
                    ((RadioButtonList)StdGrid.Rows[idx].FindControl("SexList")).Items[0].Selected = false;
                         ((RadioButtonList)StdGrid.Rows[idx].FindControl("SexList")).Items[1].Selected = true;
                    }
                
            }
            
        }

       



        protected void StdGrid_PageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            StdGrid.PageIndex = e.NewPageIndex;  //e.NewSelectedIndex;
            showGrid();
        }

        protected void UpdateStudent_Click(object sender, EventArgs e)
        {
           
            string sqlstr;
            for (int idx = 0; idx < StdGrid.Rows.Count; idx++)
            {
                if (((RadioButton)StdGrid.Rows[idx].FindControl("Flag_Del")).Checked)
                {
                    sqlstr = " delete from Student where std_id = " + mydb.qo(((Label)StdGrid.Rows[idx].FindControl("Std_Id_Old")).Text);
                    mydb.execSQL(sqlstr);
                }
                else
                {
                    sqlstr = "Update Student set Std_Name = " + mydb.qo(((TextBox)StdGrid.Rows[idx].FindControl("Std_Name")).Text);
                    sqlstr += " ,Std_Id = " + mydb.qo(((TextBox)StdGrid.Rows[idx].FindControl("Std_Id")).Text);
                    sqlstr += ", religion = " + mydb.qo(((DropDownList)StdGrid.Rows[idx].FindControl("ReligionList")).SelectedValue.Trim());
                    sqlstr += ", Dep_Id = " + mydb.qo(((DropDownList)StdGrid.Rows[idx].FindControl("DepList")).SelectedValue);
                    sqlstr += ", Club_Id = " + mydb.qo(((DropDownList)StdGrid.Rows[idx].FindControl("ClubList")).SelectedValue);
                    sqlstr += ", Sex = " + ((RadioButtonList)StdGrid.Rows[idx].FindControl("SexList")).SelectedValue;
                    sqlstr += " where Std_Id = " + mydb.qo(((Label)StdGrid.Rows[idx].FindControl("Std_Id_Old")).Text);
                    mydb.execSQL(sqlstr);
                }
            } // for
            showGrid();
        }
    }
}