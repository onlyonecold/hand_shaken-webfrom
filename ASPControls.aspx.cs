using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hand_shaken_webform
{
    public partial class ASPControls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        int get100()
        {
            return 100;
        }
        protected void myBtn_Click(object sender, EventArgs e)
        {
            //myText.Text = get100().ToString() + "\n";
            myClass myBody = new myClass();
            sonClass mySon = new sonClass();
            myText.Text += myBody.showBodyInfo(); //myClass內的public method
            //myText.Text += myBody.showAge(); //不可直接使用 protected 資源
            myText.Text += mySon.sonMethod2(); //間接使用了showAge()
        }
    }
    class myClass
    {
        public String showBodyInfo()
        {
            return "My Body is goood\r\n";
        }
        protected String showAge()
        {
            return "My age is 10\r\n";
        }
    }

    class sonClass : myClass
    {
        public String sonMethod1()
        {
            return showBodyInfo();  //使用繼承來的 方法
        }
        public String sonMethod2()
        {
            return showAge();
        }
    }

}