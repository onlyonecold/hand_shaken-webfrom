<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="hand_shaken_webform._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div style="margin-top: 25px;margin-left:400px">
            <div style="width:400px">
                <img class="center-block" src="img/icon2.png"/>
                <h1 class="text-center">手搖飲管理系統</h1>
                <asp:TextBox runat="server" ID="account" class="form-control center-block" placeholder="請輸入帳號" style="margin-top: 10px;"></asp:TextBox>
                <asp:TextBox runat="server" ID="password" type="password" class="form-control center-block" placeholder="請輸入密碼" style="margin-top: 10px;"></asp:TextBox>
                <asp:Button runat="server"  class="btn btn-lg btn-dark btn-success btn-block center-block" style="margin-top: 10px;" Text="登入" OnCommand="Check_Login" />
            </div>
        </div>
    </div>
</asp:Content>
