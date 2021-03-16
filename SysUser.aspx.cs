using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class SysUser : System.Web.UI.Page
    {
        dbClass myDatabase = new dbClass();
        DataTable orderTable = new DataTable();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                User_View(sender, e);
            }
            else
            {

            }
        }
 
        protected void User_View(object sender, EventArgs e)
        {
            string sqlStr = "  select " +
                            "  id,"+
                            "  account,  "+
                            "  name," +
                            "  mobile," +
                            "  address," +
                            "  email," +
                            "  Format(post_time,'yyyy-MM-dd') post_time,  " +
                            "  position " +
                            "  from  " +
                            "  sys_User  "+
                            "  order by name asc  ";
            orderTable = myDatabase.GetDataTable(sqlStr);
            Sys_User_Grid.DataSource = orderTable;
            Sys_User_Grid.DataBind();
        }

        protected void Edit_User(object sender, EventArgs e)
        {
            Button editButton = (Button)sender;
            String user_id = (string)editButton.CommandArgument;
            Session["edit_user_id"] = user_id;
            Response.Redirect("~/SysUserCreateEdit");

        }

        protected void Create_User(object sender, EventArgs e)
        {
            Session["edit_user_id"] = "";
            Response.Redirect("~/SysUserCreateEdit");
        }

        protected void Delete_User(object sender, EventArgs e)
        {
            Button delButton = (Button)sender;
            String user_id = (string)delButton.CommandArgument;
            string sqlStr = "delete sys_user where id = " + myDatabase.qo(user_id);
            myDatabase.execSQL(sqlStr);
            DialogClass.MessageSimple("刪除成功");
            User_View(sender, e);
        }


    }
}