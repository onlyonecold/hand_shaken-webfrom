using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class OrderViewByFrontDesk : System.Web.UI.Page
    {
        dbClass myDatabase = new dbClass();
        DataTable orderTable = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Order_View(sender, e);
            }
            else
            {

            }

        }

        protected void Order_View(object sender, EventArgs e)
        {
            string sqlStr = "  select " +
                            "  order_form.order_id as order_id," +
                            "  format(create_time, 'yyyy-MM-dd HH:mm:ss') as create_time," +
                            "  dbo.getOptionNameById(" + Constant.OPTION_TYPE_ORDER_STSTUS + ",status) as status," +
                            "  sum(order_detail.qty) as qty from  " +
                            "  order_form join order_detail on order_form.order_id = order_detail.order_id  " +
                            "  where status = 3" +
                            "  group by order_form.order_id,create_time,status  " +
                            "  order by order_id asc  ";
            orderTable = myDatabase.GetDataTable(sqlStr);
            Order_Item_Grid.DataSource = orderTable;
            Order_Item_Grid.DataBind();
        }

        protected void Order_Detail_View(object sender, EventArgs e)
        {
            Button viewButton = (Button)sender;
            String order_id = (string)viewButton.CommandArgument;
            string sqlStr = "  select product.prod_ch_name,  " +
                            "  product.size,  " +
                            "  dbo.getOptionNameById(" + Constant.OPTION_TYPE_SUGER + ",sugur_type) as sugur,  " +
                            "  dbo.getOptionNameById(" + Constant.OPTION_TYPE_ICE + ",ice_type)as ice,qty  from order_detail " +
                            "  join product on product.prod_id = order_detail.prod_id  " +
                            "  where order_detail.order_id =   " + order_id;
            orderTable = myDatabase.GetDataTable(sqlStr);
            Order_Item_Detail_Grid.DataSource = orderTable;
            Order_Item_Detail_Grid.DataBind();
        }
        protected void Sumbit_Order(object sender, EventArgs e)
        {
            if (DialogClass.MessageChickSimple("確定此筆訂單已完成?", MessageBoxButton.OKCancel))
            {
                Button sumbitButton = (Button)sender;
                String order_id = (string)sumbitButton.CommandArgument;
                string sqlStr = "  update order_form set status = 4 , end_time = getDate() where order_form.order_id = " + order_id;
                myDatabase.execSQL(sqlStr);
                orderTable.Rows.Clear();
                Order_Item_Detail_Grid.DataSource = orderTable;
                Order_Item_Detail_Grid.DataBind();
                Order_View(sender, e);
            }
        }
    }
}