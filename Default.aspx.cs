using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class _Default : Page
    {
        dbClass myDatabase = new dbClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Title = "手搖飲管理系統";
        }

        protected void Check_Login(object sender, EventArgs e) 
        {
            string user = account.Text;
            string hash = password.Text;
            if (!string.IsNullOrEmpty(user) && !string.IsNullOrEmpty(hash))
            {
                string sqlstr = "select id from sys_user where account = " + myDatabase.qo(user) + " and hash =" + myDatabase.qo(hash);
                String user_name = myDatabase.getSingleData(0, sqlstr).Trim();
                if (user_name == "")
                {
                    DialogClass.MessageSimple("帳號不存在或密碼錯誤");
                }
                else
                {
                    Session["user_id"] = account.Text.Trim();
                    Session["user_name"] = user_name;
                    Session["password"] = password.Text.Trim();
                    Response.Redirect("~/HandServer");
                }
            }
            else
            {
                DialogClass.MessageSimple("請輸入帳號或密碼");
            }
        }
    }
}