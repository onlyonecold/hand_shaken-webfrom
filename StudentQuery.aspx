<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStudent.Master" AutoEventWireup="true" CodeBehind="StudentQuery.aspx.cs" Inherits="hand_shaken_webform.StudentQuery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<table class="table table-bordered;" style=" width:500px">
        <tr>
            <td>
                <asp:CheckBox ID="Flag_Std_Id" runat="server" />
            </td>
            <td class="width:30%">學號</td>
            <td>
                <asp:TextBox ID="Std_Id" runat="server" BorderStyle="Solid" Width="95%" ></asp:TextBox>
            </td>
        </tr>
        <tr>
             <td>
                <asp:CheckBox ID="Flag_Std_Name" runat="server" />
            </td>
            <td>姓名</td>
            <td>
                <asp:TextBox ID="Std_Name" runat="server" BorderStyle="Solid"  Width="95%"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
             <td>
                <asp:CheckBox ID="Flag_Sex" runat="server" />
            </td>
            <td>性別</td>
            <td>
                 <asp:RadioButtonList  ID="SexList" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="M" Value="1" ></asp:ListItem>
                    <asp:ListItem Text="F" Value="0" ></asp:ListItem> 
                 </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
             <td>
                <asp:CheckBox ID="Flag_Dep" runat="server" />
            </td>
            <td>學系</td>
            <td>
                 <asp:Dropdownlist ID="DepList"  DataTextField='Dep_Name'  DataValueField="Dep_Id" runat="server"  CssClass="fulltext" width="100%"  />
            </td>
        </tr>
        <tr>
             <td>
                <asp:CheckBox ID="Flag_Religion" runat="server" />
            </td>
            <td>宗教</td>
            <td>
                 <asp:Dropdownlist ID="ReligionList"  DataTextField='Rel_Name'  DataValueField="Rel_Id" runat="server"  CssClass="fulltext"  width="100%"  />
            </td>
        </tr>
        <tr>
             <td>
                <asp:CheckBox ID="Flag_Club" runat="server" />
            </td>
            <td>社團</td>
            <td>
                <asp:Dropdownlist ID="ClubList"  DataTextField='Club_Name'  DataValueField="Club_Id"  runat="server"  CssClass="fulltext"  width="100%"  />
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td style="text-align:left">
                <asp:Button ID="Query"  Text="查詢"  runat="server"  Width="95%" CssClass="btn btn-primary" OnClick="Query_Click"  />
            </td>
        </tr>
    </table>
    <h2>學生資料清單</h2>
   <hr>
    <div style="border:5px #669999 solid; border-top-left-radius:20pt;border-top-right-radius:20pt; padding:5px; background-color:#669999;">
    <asp:GridView ID="StdGrid" runat="server" BackColor="white" 
                          BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" OnRowCommand="StdGrid_RowCommand" 
                          AutoGenerateColumns="False" Width="100%" CellSpacing="5" AllowPaging="true" PagerSettings-Mode="Numeric" PageSize="10"
                           ForeColor="Black" GridLines="Vertical"  onpageindexchanging="StdGrid_PageIndexChanging"   >

  <Columns>
     
                     
	 <asp:TemplateField HeaderText="學號"  HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
           
           <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
           <ItemTemplate>
              <asp:LinkButton ID="Std_Id"  Text='<%# Eval("Std_Id") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
             
           </ItemTemplate>
       </asp:TemplateField>
	 <asp:TemplateField HeaderText="姓名"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                  <asp:LinkButton ID="Std_Name"  Text='<%# Eval("Std_Name") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>' />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="性別"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:LinkButton ID="Sex"  Text='<%# Eval("Sex") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
            </ItemTemplate>
       </asp:TemplateField>
      <asp:TemplateField HeaderText="科系"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                    <asp:LinkButton ID="Dep_Id"  Text='<%# Eval("Dep_Name") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="宗教"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:LinkButton ID="Religion"  Text='<%# Eval("Rel_Name") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="社團"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:LinkButton ID="Club_Id"  Text='<%# Eval("Club_Name") %>'  runat="server"  CommandName="editStd"  CommandArgument='<%# Eval("std_id") %>'  />
            </ItemTemplate>
       </asp:TemplateField>
     
                                                   
   </Columns>
   <FooterStyle BackColor="#CCCC99" />
   <HeaderStyle BackColor="#669999" Font-Bold="True" Font-Size="14pt" ForeColor="White" />
   <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#F7F7DE" />
   <RowStyle BackColor="#ffffff" />
   <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
   <SortedAscendingCellStyle BackColor="#FBFBF2" />
   <SortedAscendingHeaderStyle BackColor="#848384" />
   <SortedDescendingCellStyle BackColor="#EAEAD3" />
   <SortedDescendingHeaderStyle BackColor="#575357" />
</asp:GridView>
   
    </div>
</asp:Content>
