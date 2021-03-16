<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ASPControls.aspx.cs" Inherits="hand_shaken_webform.ASPControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="myBtn" runat="server" Text="myBtn" OnClick="myBtn_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                TextBox-MultiLine
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="myText" runat="server" TextMode="multiline" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                TextBox-SingleLine
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                TextBox-Date
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                TextBox-DateTimeLocal
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTimeLocal" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                TextBox-Phone
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Phone" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                TextBox-Password
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Width="100%" Height="100px"></asp:TextBox>
                
            </asp:TableCell>
            
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Label
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="myLabel" runat="server" text="myLabel"></asp:Label>
                
            </asp:TableCell>
            
        </asp:TableRow>
          <asp:TableRow>
            <asp:TableCell>
                下拉選單
                DropdownList
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="100%">
                    <asp:ListItem Text="一級" Value="1"></asp:ListItem>
                    <asp:ListItem Text="二級" Value="2"></asp:ListItem>
                    <asp:ListItem Text="三級" Value="3"></asp:ListItem>
                </asp:DropDownList>
                
            </asp:TableCell>
            
        </asp:TableRow>
           <asp:TableRow>
            <asp:TableCell>
                ListBox-開頁選單
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="ListBox1" runat="server" Width="100%">
                    <asp:ListItem Text="一級" Value="1"></asp:ListItem>
                    <asp:ListItem Text="二級" Value="2" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="三級" Value="3"></asp:ListItem>
                       <asp:ListItem Text="四級" Value="4"></asp:ListItem>
                       <asp:ListItem Text="五級" Value="5"></asp:ListItem>
                       <asp:ListItem Text="六級" Value="6"></asp:ListItem>
                </asp:ListBox>
               
            </asp:TableCell>
               </asp:TableRow>
            <asp:TableRow>
               <asp:TableCell>
                Image
                
                </asp:TableCell>
                <asp:TableCell>
                   
                    <asp:Image ID="Image1" runat="server"  src="img/tom.png"/>
                </asp:TableCell>   
        </asp:TableRow>
         <asp:TableRow>
               <asp:TableCell>
                ImageButton
                
                </asp:TableCell>
                <asp:TableCell>
                   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/tom.png" OnClick="myBtn_Click" />
               
                </asp:TableCell>   
        </asp:TableRow>
        <asp:TableRow>
               <asp:TableCell>
                FileUpload
                
                </asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </asp:TableCell>   
        </asp:TableRow>
        <asp:TableRow>
               <asp:TableCell>
                RadioButton
                
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButton ID="RadioButton1" GroupName="rdG" runat="server" Checked="False" Text="M"  />
                    <asp:RadioButton ID="RadioButton2" GroupName="rdG" runat="server"  Checked="True" Text="F" />
                </asp:TableCell>   
        </asp:TableRow>
        <asp:TableRow>
               <asp:TableCell>
                RadioButtonList
                
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                        <asp:ListItem Text="大學" Value="U" ></asp:ListItem>
                         <asp:ListItem Text="高中" Value="H" Selected="True" ></asp:ListItem>
                         <asp:ListItem Text="國中" Value="M" ></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>   
        </asp:TableRow>
        <asp:TableRow>
               <asp:TableCell>
                CheckBox              
                </asp:TableCell>
                <asp:TableCell>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked="True"  />
                </asp:TableCell>   
        </asp:TableRow>
        <asp:TableRow>
               <asp:TableCell>
                CheckBoxList
                
                </asp:TableCell>
                <asp:TableCell>
                  <asp:CheckBoxList ID="CheckBoxList1" AutoPostBack="true" runat="server"  >
            <asp:ListItem Value="1">Stackbuck</asp:ListItem>
            <asp:ListItem Value="2">CityCafe</asp:ListItem>
            <asp:ListItem Value="3">Let’s Cafe</asp:ListItem>
        </asp:CheckBoxList>

                </asp:TableCell>   
        </asp:TableRow>
    </asp:Table>



</asp:Content>
