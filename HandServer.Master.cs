using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class Hand_server_view : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        protected void Sing_Out(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Default");
        }

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {

        }
    }
}