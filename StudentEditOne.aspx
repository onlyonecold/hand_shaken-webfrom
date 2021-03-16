<%@ Page Title="" Language="C#" MasterPageFile="~/SiteStudent.Master" AutoEventWireup="true" CodeBehind="StudentEditOne.aspx.cs" Inherits="hand_shaken_webform.StudentEditOne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table class="table table-bordered;" style=" width:500px">
        <tr>
            <td class="width:30%">學號</td>
            <td>
                <asp:TextBox ID="Std_Id" runat="server" BorderStyle="Solid" Width="95%" ></asp:TextBox>
                <asp:Hiddenfield ID="Std_Id_Old" runat="server"></asp:Hiddenfield>
               
            </td>
        </tr>
        <tr>
            <td>姓名</td>
            <td>
                <asp:TextBox ID="Std_Name" runat="server" BorderStyle="Solid"  Width="95%"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>性別</td>
            <td>
                 <asp:RadioButtonList  ID="SexList" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem Text="M" Value="1" ></asp:ListItem>
                    <asp:ListItem Text="F" Value="0" ></asp:ListItem> 
                 </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>學系</td>
            <td>
                 <asp:Dropdownlist ID="DepList"  DataTextField='Dep_Name'  DataValueField="Dep_Id" runat="server"  CssClass="fulltext" width="100%"  />
            </td>
        </tr>
        <tr>
            <td>宗教</td>
            <td>
                 <asp:Dropdownlist ID="ReligionList"  DataTextField='Rel_Name'  DataValueField="Rel_Id" runat="server"  CssClass="fulltext"  width="100%"  />
            </td>
        </tr>
        <tr>
            <td>社團</td>
            <td>
                <asp:Dropdownlist ID="ClubList"  DataTextField='Club_Name'  DataValueField="Club_Id"  runat="server"  CssClass="fulltext"  width="100%"  />
            </td>
        </tr>
        <tr>
            <td>
                <a runat="server" href="~/Student">放棄</a>
            </td>
            <td style="text-align:left">
                <asp:Button ID="confirm"  Text="確認更新"  runat="server"  Width="95%" CssClass="btn btn-primary" OnClick="confirm_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
