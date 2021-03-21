<%@ Page Title="" Language="C#" MasterPageFile="~/HandServer.Master" AutoEventWireup="true" CodeBehind="SendBackOrderView.aspx.cs" Inherits="hand_shaken_webform.SendBackOrderView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>取消訂購單</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
         <div class="col-lg-3"></div>
        <div class="col-lg-6 breadcrumb">
            
            <div class="form-group">
                <label for="Order_Number" class="form-label">請輸入單號</label>
                <asp:TextBox runat="server" ID="Order_Number" class="form-control" Style="display: inline"></asp:TextBox>
                <asp:Button type="button" runat="server" Text="查詢" class="btn btn-primary" OnCommand="Show_Send_Back" />
            </div>
            <div class="form-group" style="margin-left: 20px;">
                <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color: cadetblue; color: white; margin-bottom: 5px; margin-top: 5px">訂購單內容</h3>
                <asp:GridView ID="Send_Back_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered" EmptyDataText="查詢無資料" EmptyDataRowStyle-HorizontalAlign="Center">
                    <Columns>
                        <asp:TemplateField HeaderText="單號" HeaderStyle-Width="10%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="prod_id" Text='<%# Eval("order_id") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="新增日期" HeaderStyle-Width="30%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="size" Text='<%# Eval("create_time") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="總金額" HeaderStyle-Width="30%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="price" Text='<%# Eval("total") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" HeaderStyle-Width="30%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button Text="檢視" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("order_id") %>' OnCommand="Order_Detail_View" />
                                <asp:Button Text="退單" runat="server" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("order_id") %>'  OnCommand="Send_Back"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div style="overflow: auto; height: 490px">
                <asp:GridView ID="Order_Item_Detail_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="商品名稱" HeaderStyle-Width="5%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="order_id" Text='<%# Eval("prod_ch_name") %>' runat="server" VerticalAlign='middle' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="尺寸" HeaderStyle-Width="25%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="create_time" Text='<%# Eval("size") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="甜度" HeaderStyle-Width="15%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="qty" Text='<%# Eval("sugur") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="冰塊" HeaderStyle-Width="10%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="status" Text='<%# Eval("ice") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="數量" HeaderStyle-Width="10%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="status" Text='<%# Eval("qty") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            </div>
        </div>
        <div class="col-lg-3"></div>
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
