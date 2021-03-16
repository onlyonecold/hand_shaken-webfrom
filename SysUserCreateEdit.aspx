<%@ Page Title="" Language="C#" MasterPageFile="~/HandServer.Master" AutoEventWireup="true" CodeBehind="SysUserCreateEdit.aspx.cs" Inherits="hand_shaken_webform.SysUserCreateEdit
    " %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>系統管理/新增員工</h3>
    <hr>
    <div class="row" style="margin-top: 5px;">
        <div style="width:500px">
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="account" class="form-label">帳號</label>
                <asp:TextBox runat="server" ID="account" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="hash" class="form-label">密碼</label>
                <asp:TextBox runat="server" ID="hash" type="password" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="name" class="form-label">姓名</label>
                <asp:TextBox runat="server" ID="name" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="position" class="form-label">職稱</label>
                <asp:TextBox runat="server" ID="position" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="mobile" class="form-label">電話</label>
                <asp:TextBox runat="server" ID="mobile" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="address" class="form-label">地址</label>
                <asp:TextBox runat="server" ID="address" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <label for="email" class="form-label">信箱</label>
                <asp:TextBox runat="server" ID="email" class="form-control" Style="display: inline" ></asp:TextBox>
            </div>
            <div class="row form-group text-center" style="margin-top: 20px;">
                <asp:Button runat="server" Text="取消" CssClass="btn btn-primary" />
               <asp:Button runat="server" Text="確認" CssClass="btn btn-success" OnCommand="Save_User"/>
            </div>
        </div>
        
    </div>
   
</asp:Content>
