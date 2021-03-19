using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace hand_shaken_webform
{
    public partial class AddOrder : System.Web.UI.Page
    {
        dbClass myDatabase = new dbClass();
        DataTable productTable = new DataTable();
        public static DataTable addItems;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                addItems = Order_TempTable();
            }
            else
            {

            }

        }

        protected void Product_Item(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            String classId = (string)button.CommandArgument;
            string sqlStr = "select prod_id, prod_ch_name as prod_name, size, price from product where product.class_id =" + classId;
            productTable = myDatabase.GetDataTable(sqlStr);
            product_Grid.DataSource = productTable;
            product_Grid.DataBind();

            Show_Option_Item(cust_Sex, Constant.OPTION_TYPE_SEX);
            Show_Option_Item(cust_Age, Constant.OPTION_TYPE_AGE);
            
            if (product_Grid.Rows.Count > 0)
            {
                for (int i = 0; i < product_Grid.Rows.Count; i++)
                {
                    DropDownList suger = (DropDownList)product_Grid.Rows[i].FindControl("suger");
                    Show_Option_Item(suger, Constant.OPTION_TYPE_SUGER);
                    DropDownList ice = (DropDownList)product_Grid.Rows[i].FindControl("ice");
                    Show_Option_Item(ice, Constant.OPTION_TYPE_ICE);
                }
            }
        }
        protected void Add_Item(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            String prod_id = (string)button.CommandArgument;
            for (int i = 0; i < product_Grid.Rows.Count; i++)
            {
                Label id = (Label)product_Grid.Rows[i].FindControl("prod_id");
                Label prodName = (Label)product_Grid.Rows[i].FindControl("prod_name");
                Label size = (Label)product_Grid.Rows[i].FindControl("size");
                Label price = (Label)product_Grid.Rows[i].FindControl("price");
                DropDownList ice = (DropDownList)product_Grid.Rows[i].FindControl("ice");
                DropDownList suger = (DropDownList)product_Grid.Rows[i].FindControl("suger");
                TextBox qty = (TextBox)product_Grid.Rows[i].FindControl("qty");
                if (id.Text == prod_id)
                {
                    if (qty.Text.Length > 0 && int.Parse(qty.Text) > 0) 
                    {
                        DataRow addRow = addItems.NewRow();
                        addRow["item_no"] = (addItems.Rows.Count + 1).ToString();
                        addRow["prod_id"] = id.Text;
                        addRow["prod_name"] = prodName.Text;
                        addRow["size"] = size.Text;
                        addRow["price"] = price.Text;
                        addRow["ice"] = ice.SelectedItem;
                        addRow["ice_id"] = ice.SelectedValue;
                        addRow["suger"] = suger.SelectedItem;
                        addRow["suger_id"] = suger.SelectedValue;
                        addRow["qty"] = qty.Text;
                        addItems.Rows.Add(addRow);
                        Show_Grid();
                    }
                    else
                    {
                        MessageBox.Show("請輸入數量", "溫馨提示");
                    }

                }
            }
        }
        protected void Del_Item(object sender, EventArgs e)
        {
            Button button = (Button)sender;
            int item_no = int.Parse((string)button.CommandArgument);
            addItems.Rows.Remove(addItems.Rows[item_no]);
            Show_Grid();
        }
        protected void Show_Grid()
        {
            int count = 0;
            int qtyCount = 0;
            for (int i = 0; i < addItems.Rows.Count; i++)
            {   
                addItems.Rows[i]["item_no"] = i + 1;
                int qty = int.Parse(addItems.Rows[i]["qty"].ToString());
                qtyCount += qty;
                count += (int.Parse(addItems.Rows[i]["price"].ToString())* qty);
            }
            add_Product_Grid.DataSource = addItems;
            add_Product_Grid.DataBind();
            add_Product_Grid.FooterRow.Cells[0].ColumnSpan = 5;
            add_Product_Grid.FooterRow.Cells[0].Text = "總計";
            add_Product_Grid.FooterRow.Cells[0].VerticalAlign = VerticalAlign.Middle;
            add_Product_Grid.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;

            add_Product_Grid.FooterRow.Cells[1].Text = qtyCount.ToString();
            add_Product_Grid.FooterRow.Cells[1].VerticalAlign = VerticalAlign.Middle;
            add_Product_Grid.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Center;

            add_Product_Grid.FooterRow.Cells[2].ColumnSpan = 2;
            add_Product_Grid.FooterRow.Cells[2].Text = count.ToString() + "元";
            add_Product_Grid.FooterRow.Cells[2].VerticalAlign = VerticalAlign.Middle;
            add_Product_Grid.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;

            add_Product_Grid.FooterRow.Cells[3].Visible = false;
            add_Product_Grid.FooterRow.Cells[4].Visible = false;
            add_Product_Grid.FooterRow.Cells[5].Visible = false;
            add_Product_Grid.FooterRow.Cells[6].Visible = false;
            add_Product_Grid.FooterRow.Cells[7].Visible = false;


        }

        protected void Submit_Order(object sender, EventArgs e)
        {
            if (addItems.Rows.Count > 0)
            {
                if (DialogClass.MessageChickSimple("確定完成結帳?", MessageBoxButton.OKCancel))
                {
                    string user_id = Session["user_name"].ToString();
                    string sqlstr = " Declare @Form_No int;";
                    //sqlstr += " Begin Tran";
                    sqlstr += " select @Form_No = isnull(max(order_id), 0) + 1 ";
                    sqlstr += " from order_form;";
                    sqlstr += " insert into order_form (order_id, created_id,status,create_time,cust_sex, cust_age) values(";
                    sqlstr += " @Form_No,"+ myDatabase.qo(user_id) + ",1,getDate(),";
                    sqlstr += myDatabase.qo(cust_Sex.SelectedValue.ToString()) + ",";
                    sqlstr += myDatabase.qo(cust_Age.SelectedValue.ToString()) + ");";
                    sqlstr += " insert into order_detail (order_id, prod_id,qty,sugur_type,ice_type) values";
                    for (int i = 0; i < addItems.Rows.Count; i++)
                    {
                        DataRow row = addItems.Rows[i];
                        string prod_id = row["prod_id"].ToString();
                        string qty = row["qty"].ToString();
                        string suger_id = row["suger_id"].ToString();
                        string ice_id = row["ice_id"].ToString();
                        sqlstr += "( @Form_No," + myDatabase.qo(prod_id) + "," + myDatabase.qo(qty) + "," + myDatabase.qo(suger_id) + "," + myDatabase.qo(ice_id) + ")";
                        if (i + 1 == addItems.Rows.Count)
                        {
                            sqlstr += ";";
                        }
                        else
                        {
                            sqlstr += ",";
                        }
                    }
                    myDatabase.execSQL(sqlstr);
                    addItems.Rows.Clear();
                    Show_Grid();
                    DialogClass.MessageSimple("訂單已送出");
                }
                
            }
            else
            {
                DialogClass.MessageSimple("請選擇欲結帳的商品");
            }

        }

        protected void GridViewResults_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void Show_Option_Item(DropDownList dropDownList,int optionId)
        {
            productTable = myDatabase.Get_Option_Item(optionId);
            dropDownList.DataTextField = "optionName";
            dropDownList.DataValueField = "id";
            dropDownList.DataSource = productTable;
            dropDownList.DataBind();
        }

        protected void Show_Send_Back(object sender, EventArgs e)
        {
            int order_id = int.Parse(Order_Number.Text);
            string sqlstr = " select o.order_id,o.create_time,sum(p.price) total from order_form o　";
            sqlstr += "  join order_detail od on o.order_id = od.order_id  ";
            sqlstr += "  join product p on p.prod_id = od.prod_id  ";
            sqlstr += "  where o.order_id = "+ order_id;
            sqlstr += "  group by o.order_id,o.create_time  ";
            productTable = myDatabase.GetDataTable(sqlstr);
            Send_Back_Grid.DataSource = productTable;
            Send_Back_Grid.DataBind();


        }

        private DataTable Order_TempTable()
        {
            // Create a new DataTable titled 'Names.'
            DataTable tablex = new DataTable("Order");

            // item_no
            DataColumn Citem_no = new DataColumn();
            Citem_no.DataType = System.Type.GetType("System.String");
            Citem_no.ColumnName = "item_no";
            tablex.Columns.Add(Citem_no);

            // Add three column objects to the table.
            DataColumn Cprod_id = new DataColumn();
            Cprod_id.DataType = System.Type.GetType("System.String");
            Cprod_id.ColumnName = "prod_id";
            tablex.Columns.Add(Cprod_id);

            DataColumn CprodName = new DataColumn();
            CprodName.DataType = System.Type.GetType("System.String");
            CprodName.ColumnName = "prod_name";
            //fNameColumn.DefaultValue = "Fname";
            tablex.Columns.Add(CprodName);

            DataColumn Csize = new DataColumn();
            Csize.DataType = System.Type.GetType("System.String");
            Csize.ColumnName = "size";
            tablex.Columns.Add(Csize);

            DataColumn Cice = new DataColumn();
            Cice.DataType = System.Type.GetType("System.String");
            Cice.ColumnName = "ice";
            tablex.Columns.Add(Cice);

            DataColumn Cice_id = new DataColumn();
            Cice_id.DataType = System.Type.GetType("System.String");
            Cice_id.ColumnName = "ice_id";
            tablex.Columns.Add(Cice_id);

            DataColumn Csuger = new DataColumn();
            Csuger.DataType = System.Type.GetType("System.String");
            Csuger.ColumnName = "suger";
            tablex.Columns.Add(Csuger);

            DataColumn Csuger_id = new DataColumn();
            Csuger_id.DataType = System.Type.GetType("System.String");
            Csuger_id.ColumnName = "suger_id";
            tablex.Columns.Add(Csuger_id);

            DataColumn Cprice = new DataColumn();
            Cprice.DataType = System.Type.GetType("System.String");
            Cprice.ColumnName = "price";
            tablex.Columns.Add(Cprice);

            DataColumn Cqty = new DataColumn();
            Cqty.DataType = System.Type.GetType("System.String");
            Cqty.ColumnName = "qty";
            tablex.Columns.Add(Cqty);

            return tablex;
        }
    }
}