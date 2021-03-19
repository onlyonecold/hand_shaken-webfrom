using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class OrderViewByBackstage : System.Web.UI.Page
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

        protected void Page_LoadComplete(object sender, EventArgs e)
        { 
            foreach (GridViewRow row in Order_Item_Grid.Rows)
            {
                Button pick_up = row.Cells[4].FindControl("pick_up") as Button;
                Button complete = row.Cells[4].FindControl("complete") as Button;
                Label status = row.Cells[3].FindControl("status") as Label;
                if (status.Text == "新訂單")
                {
                    pick_up.Visible = true;
                    complete.Visible = false;
                }
                else
                {
                    pick_up.Visible = false;
                    complete.Visible = true;
                }
            }

        }
        protected void Order_View(object sender, EventArgs e)
        {
            string sqlStr = "  select " +
                            "  order_form.order_id as order_id,"+
                            "  format(create_time, 'yyyy-MM-dd HH:mm:ss') as create_time,"+
	                        "  dbo.getOptionNameById("+Constant.OPTION_TYPE_ORDER_STSTUS+",status) as status,"+ 
	                        "  sum(order_detail.qty) as qty from  "+
                            "  order_form join order_detail on order_form.order_id = order_detail.order_id  "+
                            "  where status = 1 or status = 2"+
                            "  group by order_form.order_id,create_time,status  "+
                            "  order by order_id asc  ";
            orderTable = myDatabase.GetDataTable(sqlStr);
            Order_Item_Grid.DataSource = orderTable;
            Order_Item_Grid.DataBind();
            if (orderTable.Rows.Count == 0)
            {
                
            }
        }


        protected void Order_Detail_View(object sender, EventArgs e)
        {
            Button viewButton = (Button)sender;
            String order_id = (string)viewButton.CommandArgument;
            string sqlStr = "  select product.prod_ch_name,  " +
                            "  product.size,  " +
                            "  dbo.getOptionNameById("+ Constant .OPTION_TYPE_SUGER+ ",sugur_type) as sugur,  " +
                            "  dbo.getOptionNameById("+ Constant.OPTION_TYPE_ICE+",ice_type)as ice,qty  from order_detail " +
                            "  join product on product.prod_id = order_detail.prod_id  " +
                            "  where order_detail.order_id =   "+ order_id;
            orderTable = myDatabase.GetDataTable(sqlStr);
            Order_Item_Detail_Grid.DataSource = orderTable;
            Order_Item_Detail_Grid.DataBind();
        }
        protected void Pick_Up_Order(object sender, EventArgs e)
        {
            if (DialogClass.MessageChickSimple("確定要製作此筆定單商品?", MessageBoxButton.OKCancel))
            {
                string user_id = Session["user_name"].ToString();
                Button pickupButton = (Button)sender;
                String order_id = (string)pickupButton.CommandArgument;
                string sqlStr = "  update order_form set status = 2 , pick_up_time = getDate(), pick_up_id = "+myDatabase.qo(user_id)+" where order_form.order_id = " + order_id;
                myDatabase.execSQL(sqlStr);
                Order_View(sender, e);
                Order_Detail_View(sender, e);
            }
        }

        protected void Complete_Order(object sender, EventArgs e)
        {
            if (DialogClass.MessageChickSimple("確定此筆訂單商品已製作完成?", MessageBoxButton.OKCancel)) 
            {
                Button completeButton = (Button)sender;
                String order_id = (string)completeButton.CommandArgument;
                string sqlStr = "  update order_form set status = 3 , complete_time = getDate() where order_form.order_id = " + order_id;
                myDatabase.execSQL(sqlStr);
                Order_View(sender, e);
                orderTable = null;
                Order_Item_Detail_Grid.DataSource = orderTable;
                Order_Item_Detail_Grid.DataBind();
            }
        }

    }
}