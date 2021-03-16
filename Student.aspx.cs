using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace hand_shaken_webform
{
    public partial class Student : Page
    {
        dbClass mydb = new dbClass();
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
               
                showGrid();
            }
           ;
        }
        string getDepName(string dep_id)
        {
            string sqlstr = "select dep_name from department where dep_id = " + mydb.qo(dep_id);
            return mydb.getSingleData(0,sqlstr);
        }
        string getReligion(string rel_id)
        {
            string sqlstr = "select rel_name from religion where rel_id = " + mydb.qo(rel_id);
            return mydb.getSingleData(0, sqlstr);
        }

       

        void showGrid()
        {
            string sqlstr = " select std_id, std_name,sex,  dep_id, religion from student";

            StdGrid.DataSource = mydb.GetDataTable(sqlstr);
            StdGrid.DataBind();
            //park department at right position
            for(int idx=0; idx < StdGrid.Rows.Count; idx++)
            {   //Department
                ((Label)StdGrid.Rows[idx].FindControl("Dep_Id")).Text = getDepName(((Label)StdGrid.Rows[idx].FindControl("Dep_Id")).Text.Trim());

                //Religion
                ((Label)StdGrid.Rows[idx].FindControl("Religion")).Text = getReligion(((Label)StdGrid.Rows[idx].FindControl("Religion")).Text.Trim());

                //Sex
                string sexS = ((Label)StdGrid.Rows[idx].FindControl("Sex")).Text;
                if (sexS == "True")
                    ((Label)StdGrid.Rows[idx].FindControl("Sex")).Text = "男";
                else
                    ((Label)StdGrid.Rows[idx].FindControl("Sex")).Text = "女";
               
            }
          
        }

        protected void StdGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            string Std_Id = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {
                case "delStd":
                    {
                        string sqlstr = "delete from student where std_id = " + mydb.qo(Std_Id);
                        mydb.execSQL(sqlstr);
                        showGrid();
                       
                        break;
                    }
                case "editStd":
                    {
                        Response.Redirect("StudentEditOne.aspx?Std_Id="+Std_Id);
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
        /*
        protected void AddStd_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentAdd.aspx");
        }

        protected void BatchUpdate_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentEdit.aspx");
        }
        */
    }
}