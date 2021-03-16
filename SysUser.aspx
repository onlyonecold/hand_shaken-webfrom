<%@ Page Title="" Language="C#" MasterPageFile="~/HandServer.Master" AutoEventWireup="true" CodeBehind="SysUser.aspx.cs" Inherits="hand_shaken_webform.SysUser
    " %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>系統管理/員工管理</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
        <div>
            <h3 class="text-center col-lg-offset-0 thumbnail" style="background-color:cadetblue;color:white;margin-bottom:5px;margin-top:5px">員工列表</h3>
            <div class="text-right" style="margin-bottom:5px">
                <asp:Button Text="新增員工" runat="server" CssClass="btn btn-success btn-sm"  OnCommand="Create_User"/>
            </div>
            <div style="overflow: auto; height: 490px">
                <asp:GridView ID="Sys_User_Grid" runat="server" BackColor="white"
                    BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4"
                    AutoGenerateColumns="False" Width="100%" CellSpacing="5"
                    ForeColor="Black" GridLines="Both" HeaderStyle-Font-Bold="True" CssClass="table-bordered">
                    <Columns>
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <ItemTemplate>
                                <%#Sys_User_Grid.PageIndex * Sys_User_Grid.PageSize + Sys_User_Grid.Rows.Count + 1%>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" HeaderStyle-Width="10%" ItemStyle-Width="8%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="name" Text='<%# Eval("name") %>' runat="server" VerticalAlign='middle' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="帳號" HeaderStyle-Width="10%" ItemStyle-Width="20%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="account" Text='<%# Eval("account") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="職稱" HeaderStyle-Width="10%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="position" Text='<%# Eval("position") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="電話" HeaderStyle-Width="10%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="mobile" Text='<%# Eval("mobile") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="地址" HeaderStyle-Width="10%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="address" Text='<%# Eval("address") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="任職日期" HeaderStyle-Width="10%" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Label ID="post_time" Text='<%# Eval("post_time") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="功能" HeaderStyle-Width="30%" ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-BackColor="darkkhaki" HeaderStyle-Font-Size="15pt" HeaderStyle-CssClass="text-center" HeaderStyle-ForeColor="white">
                            <HeaderStyle Font-Bold="True" />
                            <ItemStyle HorizontalAlign='Center' VerticalAlign='Middle' BackColor="white" />
                            <ItemTemplate>
                                <asp:Button ID="edit" Text="編輯" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("id") %>' OnCommand="Edit_User"/>
                                <!--<asp:Button Text="檢視內容" runat="server" CssClass="btn btn-primary btn-sm" CommandArgument='<%# Eval("id") %>' />-->
                                <asp:Button Text="刪除" runat="server" CssClass="btn btn-danger btn-sm" CommandArgument='<%# Eval("id") %>' OnCommand="Delete_User" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
   
</asp:Content>
