<%@ Page Title="" Language="C#" MasterPageFile="~/HandServer.Master" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="hand_shaken_webform.AddOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>訂單管理/新增訂購單</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
        <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color: cadetblue; color: white; margin-bottom: 5px; margin-top: 0px">商品類別</h3>
        <div class="col-lg-2">
            <asp:Button ID="productClass1" Text="牧場鮮奶茶" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="1" OnCommand="Product_Item" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="productClass2" Text="愛喝的牛" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="2" OnCommand="Product_Item" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="productClass3" Text="六時韻" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="3" OnCommand="Product_Item" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="productClass4" Text="綠光牧場鮮奶" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="4" OnCommand="Product_Item" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="productClass5" Text="台灣鮮豆奶" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="5" OnCommand="Product_Item" />
        </div>
        <div class="col-lg-2">
            <asp:Button ID="productClass6" Text="手做特調" Style="width: 180px; height: 100px; font-size: 20px" runat="server" CssClass="btn btn-info" CommandArgument="6" OnCommand="Product_Item" />
        </div>
    </div>
    <div class="row" style="margin-top: 5px;">
        <div class="col-lg-6">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color: cadetblue; color: white; margin-bottom: 5px; margin-top: 5px">產品項目</h3>
            <div style="overflow: auto; height: 490px">
                <asp:GridView ID="product_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="商品名稱" HeaderStyle-Width="20%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="prod_id" Text='<%# Eval("prod_id") %>' runat="server" Visible="false" />
                                <asp:Label ID="prod_name" Text='<%# Eval("prod_name") %>' runat="server" VerticalAlign='middle' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="尺寸" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="size" Text='<%# Eval("size") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="冰塊" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemTemplate>
                                <asp:DropDownList ID="ice" runat="server" CssClass="form-control" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="甜度" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:DropDownList ID="suger" AutoPostBack="true" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="價格" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="price" Text='<%# Eval("price") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="數量" HeaderStyle-Width="15%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:TextBox ID="qty" runat="server" CssClass="form-control" type="number" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button Text="確認" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("prod_id") %>' OnCommand="Add_Item" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
        <div class="col-lg-6">
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color: cadetblue; color: white; margin-bottom: 5px; margin-top: 5px">選擇項目</h3>
            <div class="row" style="margin-bottom: 5px;">
                <div class="col-lg-6">
                    <label>客戶性別</label><asp:DropDownList ID="cust_Sex" AutoPostBack="true" runat="server" CssClass="form-control" Style="display: inline; width: 75%; margin-left: 5px"></asp:DropDownList>
                </div>
                <div class="col-lg-6">
                    <label>客戶年齡</label><asp:DropDownList ID="cust_Age" AutoPostBack="true" runat="server" CssClass="form-control" Style="display: inline; width: 75%; margin-left: 5px"></asp:DropDownList>
                </div>
            </div>
            <div style="overflow: auto; height: 450px">
                <asp:GridView ID="add_Product_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold="True" CssClass="table-bordered" ShowFooter="True">
                    <Columns>
                        <asp:TemplateField HeaderText="#" ItemStyle-Width="5%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("item_no") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="商品名稱" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="prod_id" Text='<%# Eval("prod_id") %>' runat="server" Visible="false" />
                                <asp:Label ID="prod_name" Text='<%# Eval("prod_name") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="尺寸" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("size") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="冰塊" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("ice_id") %>' runat="server" Visible="false" />
                                <asp:Label Text='<%# Eval("ice") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="甜度" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("suger_id") %>' runat="server" Visible="false" />
                                <asp:Label Text='<%# Eval("suger") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="數量" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("qty") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="單價" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("price") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:Button Text="刪除" runat="server" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Container.DataItemIndex %>' OnCommand="Del_Item" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="text-right">
                <asp:Button CssClass="btn btn-danger" runat="server" type="button" style="width: 200px; height: 50px; margin-top: 5px" PostBackUrl="SendBackOrderView" Text="取消訂購單" />
                <asp:Button Text="結帳" runat="server" CssClass="btn btn-success" Style="width: 200px; height: 50px; margin-top: 5px"  OnCommand="Submit_Order" />
            </div>
        </div>
    </div>
     <div class="modal bootstrap-dialog type-success fade in" id="resMsgDialog" tabindex="-1" role="dialog" aria-labelledby="resMsgDialog" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="resMsgModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblModalTitle" runat="server" Text=""></asp:Label></h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="lblModalBody" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">關閉</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
     </div>
</asp:Content>
