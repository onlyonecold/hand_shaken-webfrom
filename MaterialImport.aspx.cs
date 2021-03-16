using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace hand_shaken_webform
{
    public partial class MaterialImport : System.Web.UI.Page
    {
        dbClass mydb = new dbClass();
        public  static DataTable tempItem ;
       
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!Page.IsPostBack)
            {
                if (Session["user_id"] == null)
                {
                    Response.Redirect("~/Default");
                }

                if (Session["user_id"] != null)
                {
                    Form_Man.Text = Session["user_name"].ToString();
                }
                else
                {
                    Response.Redirect("~/default");
                }
                import_date_est.Text = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
                tempItem = MakeTempTable(); //傳回 Table給tempItem; 新[增項目], 送資料庫前暫存用
               
               
                prepareMaterial();
                prepareVendorList();
                
             

            }
            //for (int idx = 0; idx < mySet.Rows.Count; idx++) 
            //      Response.Write(mySet.Rows[idx]["std_id"].ToString() + "-" + mySet.Rows[idx]["std_name"].ToString() + "<hr>");
        }
        void prepareMaterial()
        {
            string sqlstr = "select '' as mat_id, '' as mat_name union(select mat_id, mat_name from material) order by mat_id";
            MaterialList.DataSource = mydb.GetDataTable(sqlstr);
            MaterialList.DataBind();
        }
        void prepareVendorList()
        {
            string sqlstr = "select '' as vendor_id,  '' as vendor_name ";
                   sqlstr += " union( ";
                   sqlstr += " select vendor_id, vendor_name from vendor) ";
                   sqlstr += " order by vendor_id ";
            VendorList.DataSource = mydb.GetDataTable(sqlstr);
            VendorList.DataBind();
        }
      
        protected void confirm_Click(object sender, EventArgs e)
        {
            //沒填請購品不要送單
            if(tempItem.Rows.Count == 0)
            {
                mydb.ShowMessageBox(Page, "未填任何請購品");
                return;
            }
            //沒填請購品不要送單
            if (VendorList.SelectedValue.Trim() == "")
            {
                mydb.ShowMessageBox(Page, "未填[廠商]");
                return;
            }
            //========Header============
            string sqlstr = " Declare @Form_No int ";
            //sqlstr += " Begin Tran";
            sqlstr += " select @Form_No = isnull(max(form_No), 110000) + 1 ";
            sqlstr += " from Material_Import ";
            //Header    Material_Import
            sqlstr += " insert into Material_Import(Form_No, Form_Man,    Form_Date,   Status_Id,   Comment, Vendor_ID,   Verify_Man,  Verify_Date, Import_Date, Import_Date_est) values(";
            sqlstr += " @Form_No,";
            sqlstr += mydb.qo(Form_Man.Text.Trim()) + ","; 
            sqlstr += " getdate(),";   //getdate() 取得目前時間
            sqlstr += " '1', "; //default staus:  '1' 已送單
            sqlstr += mydb.qo(comment.Text.Trim()) + ",";
            sqlstr += mydb.qo(VendorList.SelectedValue.Trim()) + ",";
            sqlstr += mydb.qo(Form_Man.Text.Trim()) + ",";  //defalult verify_man = form_man
            sqlstr += "convert(datetime," + mydb.qo(import_date_est.Text) + "),";  //default verify_Date  = import_Date_est
            sqlstr += "convert(datetime," + mydb.qo(import_date_est.Text) + "),"; //default import_date  = import_Date_est
            sqlstr += "convert(datetime," + mydb.qo(import_date_est.Text) + ")) ";  //import_Date_est
            //Detail  Material_Import_Detail
            for(int idx = 0; idx < tempItem.Rows.Count; idx ++)
            {
                sqlstr += " insert into Material_Import_Detail (Form_No, Item_No,	Mat_Id,	Qty,	Price_Est,	Price_Real,	Comment)Values(";
                sqlstr += "@Form_No, ";
                sqlstr += tempItem.Rows[idx]["item_no"] + ",";
                sqlstr += mydb.qo(tempItem.Rows[idx]["mat_id"].ToString().Trim()) + ",";
                sqlstr += tempItem.Rows[idx]["qty"] + ",";
                sqlstr += tempItem.Rows[idx]["price_est"] + ",";
                sqlstr += tempItem.Rows[idx]["price_est"] + ","; //default  price_Real = price_est
                sqlstr += mydb.qo(tempItem.Rows[idx]["comment"].ToString().Trim()) + ")";
            }
            //Process
            sqlstr += " insert into process(Class,	Form_No,	Item_No,	Process_Date,	Process_Man,	Comment)values(";
            sqlstr += "'IMPORT', ";
            sqlstr += "@Form_No, ";
            sqlstr += "1,";
            sqlstr += " getdate(), ";
            sqlstr += mydb.qo(Form_Man.Text) + "," ;
            string opinion = "■" + Form_Man.Text + "於" + DateTime.Now.ToString() + "送單" ;
            sqlstr += mydb.qo(opinion) + ")";



            //sqlstr += " if @@ERROR <> 0 ";
            //sqlstr += " ROLLBACK TRAN ";
            //sqlstr += " else ";
            //sqlstr += "    Commit Tran";
            mydb.execSQL(sqlstr);
            Response.Redirect("~/Material");

        }

        //public static  void ShowMessageBox(Page page, string message)
        //{
        //    Type cstype = page.GetType();

        //    // Get a ClientScriptManager reference from the Page class.
        //    ClientScriptManager cs = page.ClientScript;

        //    // Find the first unregistered script number
        //    int ScriptNumber = 0;
        //    bool ScriptRegistered = false;
        //    do
        //    {
        //        ScriptNumber++;
        //        ScriptRegistered = cs.IsStartupScriptRegistered(cstype, "PopupScript" + ScriptNumber);
        //    } while (ScriptRegistered == true);

        //    //Execute the new script number that we found
        //    cs.RegisterStartupScript(cstype, "PopupScript" + ScriptNumber, "alert('" + message + "');", true);
        //}

        protected void MaterialList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string mat_id = MaterialList.SelectedValue.Trim();
            string sqlstr = "select price from material where mat_id = " + mydb.qo(mat_id);
            string price = mydb.getSingleData(0, sqlstr);
            Price_Est.Text = (float.Parse(price) * float.Parse(qty.Text)).ToString();
        }
        private DataTable MakeTempTable()
        {
            // Create a new DataTable titled 'Names.'
            DataTable tablex = new DataTable("Mat");

            // item_no
            DataColumn Citem_no = new DataColumn();
            Citem_no.DataType = System.Type.GetType("System.String");
            Citem_no.ColumnName = "item_no";
            tablex.Columns.Add(Citem_no);

            // Add three column objects to the table.
            DataColumn Cmat_id = new DataColumn();
            Cmat_id.DataType = System.Type.GetType("System.String");
            Cmat_id.ColumnName = "mat_id";
            tablex.Columns.Add(Cmat_id);

            DataColumn Cmat_name = new DataColumn();
            Cmat_name.DataType = System.Type.GetType("System.String");
            Cmat_name.ColumnName = "mat_name";
            //fNameColumn.DefaultValue = "Fname";
            tablex.Columns.Add(Cmat_name);

            DataColumn Cqty = new DataColumn();
            Cqty.DataType = System.Type.GetType("System.String");
            Cqty.ColumnName = "qty";
            tablex.Columns.Add(Cqty);

            DataColumn Cprice_est = new DataColumn();
            Cprice_est.DataType = System.Type.GetType("System.String");
            Cprice_est.ColumnName = "price_est";
            tablex.Columns.Add(Cprice_est);

            DataColumn Ccomment = new DataColumn();
            Ccomment.DataType = System.Type.GetType("System.String");
            Ccomment.ColumnName = "comment";
            tablex.Columns.Add(Ccomment);
            // create PK
            DataColumn[] keys = new DataColumn[1];
            keys[0] = Citem_no;
            tablex.PrimaryKey = keys;
            // Return the new DataTable.
            return tablex;
        }
        void showGrid()
        {
            MatGrid.DataSource = tempItem;
            MatGrid.DataBind();
        }
        protected void addItem_Click(object sender, EventArgs e)
        {
            
            DataRow myRow = tempItem.NewRow();
            myRow["item_no"] = (tempItem.Rows.Count+1).ToString();
            myRow["mat_id"] = MaterialList.SelectedValue.Trim();
            myRow["mat_name"] = MaterialList.SelectedItem.Text.Trim();
            myRow["qty"] = qty.Text.Trim();
            myRow["price_est"] = Price_Est.Text.Trim();
            myRow["comment"] = mat_comment.Text.Trim();
            tempItem.Rows.Add(myRow);


            showGrid();
        }
        //--------------------------------------------------------------------------
        //對暫存資料做 Delete
        protected void MatGrid_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            string item_no = e.CommandArgument.ToString().Trim();
            switch (e.CommandName)
            {
                case "delItem": //尋找DataTable內的資料, 找到後刪除用  datatableX.Rows.Find();  必須是PK欄位才可被搜尋
                    { DataRow rowCollection = tempItem.Rows.Find(item_no); //item_no is PK
                        rowCollection.Delete();  //刪除收尋到的PK 
                        //重新對PK 欄位編號\
                        for(int idx=0; idx < tempItem.Rows.Count; idx++)
                        {
                            tempItem.Rows[idx]["item_no"] = (idx+1).ToString();
                        }
                        showGrid();
                        break;
                    }
              
                default:
                    break;
            }
        }// End of StdGrid_RowCommand
    }






   
   
   
}