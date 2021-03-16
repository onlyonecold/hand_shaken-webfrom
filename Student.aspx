<%@ Page Title="About" Language="C#" MasterPageFile="~/SiteStudent.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="hand_shaken_webform.Student" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>學生資料清單</h2>
   <hr>
      <div style="width:100%; margin-right:50px;margin-top:10px; text-align:right">
           <a runat="server" href="~/StudentEdit">批次更新</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <a runat="server" href="~/StudentAdd">新增</a>
        </div>
    <div style="border:5px #669999 solid; border-top-left-radius:20pt;border-top-right-radius:20pt; padding:5px; background-color:#669999;">
    <asp:GridView ID="StdGrid" runat="server" BackColor="white"
                          BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" OnRowCommand="StdGrid_RowCommand" 
                          AutoGenerateColumns="False" Width="100%" CellSpacing="5" AllowPaging="true" PagerSettings-Mode="Numeric" PageSize="10"
                          CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false' onpageindexchanging="StdGrid_PageIndexChanging"  >

  <Columns>
     
                     
	 <asp:TemplateField HeaderText="學號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
           <HeaderStyle Font-Bold="False" />
           <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
           <ItemTemplate>
              <asp:label ID="Std_Id"  Text='<%# Eval("Std_Id") %>'  runat="server" />
             
           </ItemTemplate>
       </asp:TemplateField>
	 <asp:TemplateField HeaderText="姓名"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                  <asp:label ID="Std_Name"  Text='<%# Eval("Std_Name") %>'  runat="server" />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="性別"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:label ID="Sex"  Text='<%# Eval("Sex") %>'  runat="server" />
            </ItemTemplate>
       </asp:TemplateField>
      <asp:TemplateField HeaderText="科系"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                    <asp:label ID="Dep_Id"  Text='<%# Eval("Dep_Id") %>'  runat="server" />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="宗教"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:label ID="Religion"  Text='<%# Eval("Religion") %>'  runat="server" />
            </ItemTemplate>
       </asp:TemplateField>
      
      <asp:TemplateField HeaderText=""  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
      	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                 <asp:LinkButton ID="DelStd" runat="server" CssClass="btn btn-danger" Text="刪除"  CommandName="delStd"  CommandArgument='<%# Eval("std_id") %>'/>
                 <asp:LinkButton ID="EditStd" runat="server" CssClass="btn btn-info" Text="編輯"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
            </ItemTemplate>
       </asp:TemplateField>
                                                   
   </Columns>
   <FooterStyle BackColor="#CCCC99" />
   <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="12pt" ForeColor="White" />
   <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="#F7F7DE" />
   <RowStyle BackColor="#ffffff" />
   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
   <SortedAscendingCellStyle BackColor="#FBFBF2" />
   <SortedAscendingHeaderStyle BackColor="#848384" />
   <SortedDescendingCellStyle BackColor="#EAEAD3" />
   <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
      
    </div>
</asp:Content>
