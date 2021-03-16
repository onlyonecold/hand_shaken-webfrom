<%@ Page Title="About" Language="C#" MasterPageFile="~/SiteStudent.Master" AutoEventWireup="true" CodeBehind="StudentEdit.aspx.cs" Inherits="hand_shaken_webform.StudentEdit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>學生資料清單</h2>
   <hr>
    <div style="border:5px #669999 solid; border-top-left-radius:20pt;border-top-right-radius:20pt; padding:5px; background-color:#669999;">
    <asp:GridView ID="StdGrid" runat="server" BackColor="white"  BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="4" AutoGenerateColumns="False" Width="100%" CellSpacing="5" AllowPaging="true" PagerSettings-Mode="Numeric" PageSize="10"
        CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false' onpageindexchanging="StdGrid_PageIndexChanging"  >

  <Columns>
       <asp:TemplateField HeaderText="修改" ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
           <HeaderStyle Font-Bold="False" />
           <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" BackColor="white" />
           <ItemTemplate>
                    <asp:RadioButton ID="Flag_Del" groupname="op" runat="server" Text="刪除" />
                    <asp:RadioButton ID="Flag_Update"  groupname="op"  runat="server" Text="修改" Checked="true" />
           </ItemTemplate>
       </asp:TemplateField>
                     
	 <asp:TemplateField HeaderText="學號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
           <HeaderStyle Font-Bold="False" />
           <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
           <ItemTemplate>
              <asp:label ID="Std_Id_Old"  Text='<%# Eval("Std_Id") %>'  runat="server"  Visible="false" />
              <asp:Textbox ID="Std_Id"  Text='<%# Eval("Std_Id") %>'  runat="server"  CssClass="fulltext" />
           </ItemTemplate>
       </asp:TemplateField>
	 <asp:TemplateField HeaderText="姓名"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                 <asp:Textbox ID="Std_Name"  Text='<%# Eval("Std_Name") %>'  runat="server"  CssClass="fulltext" />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="性別"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false' HeaderStyle-HorizontalAlign="Center">
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                 <asp:HiddenField ID="Hsex" Value='<%# Eval("sex") %>'  runat="server"/>
                <asp:RadioButtonList  ID="SexList" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="M" Value="1" ></asp:ListItem>
                    <asp:ListItem Text="F" Value="0" ></asp:ListItem> 
                 </asp:RadioButtonList>

            </ItemTemplate>
       </asp:TemplateField>
      <asp:TemplateField HeaderText="科系"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:HiddenField ID="HDep_Id" Value='<%# Eval("Dep_Id") %>'  runat="server"/>
                 <asp:Dropdownlist ID="DepList"  DataTextField='Dep_Name'  DataValueField="Dep_Id" DataSource='<%# depSet %>' runat="server"  CssClass="fulltext" />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="社團"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:HiddenField ID="HClub_Id" Value='<%# Eval("Club_Id") %>'  runat="server"/>
                 <asp:Dropdownlist ID="ClubList"  DataTextField='Club_Name'  DataValueField="Club_Id" DataSource='<%# clubSet %>' runat="server"  CssClass="fulltext" />
            </ItemTemplate>
       </asp:TemplateField>
       <asp:TemplateField HeaderText="宗教"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	<HeaderStyle Font-Bold="False" />
            <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
            <ItemTemplate>
                <asp:HiddenField ID="Hrel_id" Value='<%# Eval("Religion") %>'  runat="server"/>
                 <asp:Dropdownlist ID="ReligionList"  DataTextField='Rel_Name'  DataValueField="Rel_Id" DataSource='<%# ReligionSet %>' runat="server"  CssClass="fulltext" />
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
        <div style="width:100%; margin-right:50px;margin-top:10px; text-align:right">
            <asp:Button ID="UpdateStudent" runat="server" CssClass="btn btn-danger" Text="更新" OnClick="UpdateStudent_Click" BorderStyle="Solid" BorderColor="White" BorderWidth="1px"/>
        </div>
    </div>
</asp:Content>
