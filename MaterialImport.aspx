<%@ Page Title="" Language="C#" MasterPageFile="~/hand_server.Master" AutoEventWireup="true" CodeBehind="MaterialImport.aspx.cs" Inherits="hand_shaken_webform.MaterialImport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>原物料請購單</h3>
    <div class="container">
	  <div class="row">              
          <div class="col-md-6" >

                  <table class="table table-bordered">
                      <tr>
                          <td>品名</td>
                          <td>
                               <asp:Dropdownlist ID="MaterialList"  DataTextField='Mat_Name'  DataValueField="Mat_Id"  AutoPostBack="true" runat="server"  CssClass="fulltext"  width="100%"  OnSelectedIndexChanged="MaterialList_SelectedIndexChanged" />
                           </td>
                      </tr>
                        <tr>
                          <td>數量</td>
                          <td>
                                <asp:textbox ID="qty" runat="server" text="1"   CssClass="fulltext" width="99%"  />
                          </td>
                        </tr>
                        <tr>
                          <td>預估金額</td>
                          <td>
                                <asp:textbox ID="Price_Est" runat="server" TextMode="SingleLine"  CssClass="fulltext" width="99%"  />
                          </td>
                       </tr>
                       <tr>
                          <td>備註</td>
                          <td>
                                <asp:textbox ID="mat_comment" runat="server" TextMode="SingleLine"  CssClass="fulltext" width="99%"  />
                          </td>
                       </tr>
                        <tr>                         
                          <td colspan="2" style="text-align:right">
                               <asp:Button ID="addItem"  Text="增加"  runat="server"  Width="15%" CssClass="btn btn-info" OnClick="addItem_Click" />
                          </td>
                       </tr>
                       <tr>                         
                          <td colspan="2" style="text-align:center">
                               <asp:GridView ID="MatGrid" runat="server" BackColor="white"
                                     BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" 
                                     AutoGenerateColumns="False" Width="100%" CellSpacing="5"  OnRowCommand="MatGrid_RowCommand" 
                                     CaptionAlign="Top" ForeColor="Black" GridLines="Vertical" HeaderStyle-Font-Bold='false'  >
                                          <Columns>
                                              <asp:TemplateField HeaderText="序號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
                                                   <HeaderStyle Font-Bold="False" />
                                                   <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                   <ItemTemplate>
                                                      <asp:label ID="item_no"  Text='<%# Eval("item_no") %>'  runat="server" />             
                                                   </ItemTemplate>
                                              </asp:TemplateField>
	                                         <asp:TemplateField HeaderText="料號"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
                                                   <HeaderStyle Font-Bold="False" />
                                                   <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                   <ItemTemplate>
                                                      <asp:label ID="mat_id"  Text='<%# Eval("mat_id") %>'  runat="server" />             
                                                   </ItemTemplate>
                                               </asp:TemplateField>
	                                         <asp:TemplateField HeaderText="料名"  ItemStyle-Width="20%" HeaderStyle-Font-Bold='false'>
       	                                        <HeaderStyle Font-Bold="False" />
                                                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                          <asp:label ID="mat_name"  Text='<%# Eval("mat_name") %>'  runat="server" />
                                                    </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="數量"  ItemStyle-Width="10%" HeaderStyle-Font-Bold='false'>
       	                                        <HeaderStyle Font-Bold="False" />
                                                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                        <asp:label ID="qty"  Text='<%# Eval("qty") %>'  runat="server" />
                                                    </ItemTemplate>
                                               </asp:TemplateField>
                                              <asp:TemplateField HeaderText="預估金額"  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
       	                                        <HeaderStyle Font-Bold="False" />
                                                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                            <asp:label ID="price_est"  Text='<%# Eval("price_est") %>'  runat="server" />
                                                    </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText="備註"  ItemStyle-Width="40%" HeaderStyle-Font-Bold='false'>
       	                                        <HeaderStyle Font-Bold="False" />
                                                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                        <asp:label ID="comment"  Text='<%# Eval("comment") %>'  runat="server" />
                                                    </ItemTemplate>
                                               </asp:TemplateField>
                                               <asp:TemplateField HeaderText=""  ItemStyle-Width="15%" HeaderStyle-Font-Bold='false'>
      	                                        <HeaderStyle Font-Bold="False" />
                                                    <ItemStyle HorizontalAlign='Center' VerticalAlign="Top" />
                                                    <ItemTemplate>
                                                         <asp:LinkButton ID="Del" runat="server" CssClass="btn btn-danger" Text="刪除"  CommandName="delItem"  CommandArgument='<%# Eval("item_no") %>'/>
                                                         
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
                          </td>
                       </tr>
                  </table>
              </div>
          <div class="col-md-6" >

                    <table class="table table-bordered;" style=" width:500px">
                        <tr>
                            <td class="width:30%">單號</td>
                            <td>
                                送出後產生
                            </td>
                        </tr>
                        <tr>
                            <td>填單人</td>
                            <td>
                                <asp:Label ID="Form_Man" runat="server" BorderStyle="Inset"  Width="95%"  >&nbsp;</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>送單日期</td>
                            <td>
                                  送出後產生
                            </td>
                        </tr>
                         <tr>
                            <td>預期進貨日期</td>
                            <td>
                                <asp:TextBox ID ="import_date_est" TextMode="Date"  runat="server" />
                                
                            </td>
                        </tr>
                        <tr>
                            <td>廠商</td>
                            <td>
                                 <asp:Dropdownlist ID="VendorList"  DataTextField='Vendor_Name'  DataValueField="Vendor_Id"  AutoPostBack="true" runat="server"  CssClass="fulltext"  width="100%"   />
                            </td>
                        </tr>
                        <tr>
                            <td>備註</td>
                            <td>
                                 <asp:textbox ID="comment" runat="server" TextMode="MultiLine" Rows="10" Columns="80"   CssClass="fulltext" width="99%"  />
                            </td>
                        </tr>
       
                        <tr>
                            <td></td>
                            <td style="text-align:left">
                                <asp:Button ID="confirm"  Text="送單"  runat="server"  Width="95%" CssClass="btn btn-primary" OnClick="confirm_Click" />
                            </td>
                        </tr>
                    </table>
              </div>
           

          </div>
        </div>
</asp:Content>
