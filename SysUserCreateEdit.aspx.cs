using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class SysUserCreateEdit : System.Web.UI.Page
    {
        dbClass myDatabase = new dbClass();
        DataTable dataTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Session["edit_user_id"].ToString(); ;
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(id))
                {
                    string sqlStr = "  select " +
                                "  id," +
                                "  account,  " +
                                "  hash,  " +
                                "  name," +
                                "  mobile," +
                                "  address," +
                                "  email," +
                                "  position " +
                                "  from  " +
                                "  sys_user  " +
                                " where  id = " + id;
                    dataTable = myDatabase.GetDataTable(sqlStr);
                    if (dataTable.Rows.Count > 0)
                    {
                        account.Text = dataTable.Rows[0]["account"].ToString();
                        hash.Text = dataTable.Rows[0]["hash"].ToString();
                        name.Text = dataTable.Rows[0]["name"].ToString();
                        position.Text = dataTable.Rows[0]["position"].ToString();
                        mobile.Text = dataTable.Rows[0]["mobile"].ToString();
                        address.Text = dataTable.Rows[0]["address"].ToString();
                        email.Text = dataTable.Rows[0]["email"].ToString();
                    };
                }
            }



        }

        protected void Save_User(object sender, EventArgs e)
        {

            string id = Session["edit_user_id"].ToString();
            string sqlStr = "";

            if (string.IsNullOrEmpty(id))
            {
                sqlStr = " insert sys_user (account,hash,name,position,mobile,address,email,post_time) values(" +
                            myDatabase.qo(account.Text) + "," +
                            myDatabase.qo(hash.Text) + "," +
                            myDatabase.qo(name.Text) + "," +
                            myDatabase.qo(position.Text) + "," +
                            myDatabase.qo(mobile.Text) + "," +
                            myDatabase.qo(address.Text) + "," +
                            myDatabase.qo(email.Text) + ", getDate() )";
                myDatabase.execSQL(sqlStr);
                DialogClass.MessageSimple("新增成功");
                Response.Redirect("~/SysUser");

            }
            else
            {
                sqlStr = " update sys_user " +
                            " set account = " + myDatabase.qo(account.Text) + "," +
                            "  hash = " + myDatabase.qo(hash.Text) + "," +
                            "  name = " + myDatabase.qo(name.Text) + "," +
                            "  position = " + myDatabase.qo(position.Text) + "," +
                            "  mobile = " + myDatabase.qo(mobile.Text) + "," +
                            "  address = " + myDatabase.qo(address.Text) + "," +
                            "  email = " + myDatabase.qo(email.Text) +
                            "where id = " + myDatabase.qo(id);
                Response.Write(sqlStr);
                myDatabase.execSQL(sqlStr);
                DialogClass.MessageSimple("更新成功");
                Response.Redirect("~/SysUser");


            }


        }

    }
}