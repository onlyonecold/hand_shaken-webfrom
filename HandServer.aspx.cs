using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class HandServer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("~/Default");
            }
            else
            {
                Form_Man.Text = Session["user_name"].ToString();
            }
        }

    }
}