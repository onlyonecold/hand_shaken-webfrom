using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class SendBackOrderView : System.Web.UI.Page
    {
        dbClass myDatabase = new dbClass();
        DataTable orderTable = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
            }
            else
            {

            }

        }

        
        protected void Show_Send_Back(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Order_Number.Text))
            {
                try
                {
                    int order_id = int.Parse(Order_Number.Text);
                    string sqlstr = " select o.order_id,format(o.create_time,'yyyy-MM-dd HH:mm:ss') create_time,sum((p.price * od.qty)) total from order_form o　";
                    sqlstr += "  join order_detail od on o.order_id = od.order_id  ";
                    sqlstr += "  join product p on p.prod_id = od.prod_id  ";
                    sqlstr += "  where o.status != 6 and o.order_id = " + order_id;
                    sqlstr += "  group by o.order_id,o.create_time  ";
                    orderTable = myDatabase.GetDataTable(sqlstr);
                    Send_Back_Grid.DataSource = orderTable;
                    Send_Back_Grid.DataBind();
                    if (orderTable.Rows.Count == 0) 
                    {
                        //showResMessage("查詢失敗，單號已退單或不存在，請重新查詢。");
                    }
                }
                catch (Exception)
                {
                    showResMessage("單號內容有誤，請重新輸入");
                }
                
            }
            else
            {
                showResMessage("請輸入單號");
            }
            
        }

        protected void Send_Back(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int order_id = int.Parse((string)button.CommandArgument);
            try
            {
                string sqlstr = " update  order_form set status = 6 , end_time = getdate()";
                sqlstr += "  where  order_id = " + order_id;
                myDatabase.execSQL(sqlstr);
                showResMessage("設定成功");
                Show_Send_Back(sender,e);
                orderTable.Rows.Clear();
                Order_Item_Detail_Grid.DataSource = orderTable;
                Order_Item_Detail_Grid.DataBind();
            }
            catch (Exception)
            {
                showResMessage("單號內容有誤，請重新輸入");
            }
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


        protected void showResMessage(string message)
        {
            lblModalTitle.Text = "溫馨提醒";
            lblModalBody.Text = message;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "resMsgDialog", "$('#resMsgDialog').modal();", true);
            resMsgModal.Update();
        }

        
    }
}