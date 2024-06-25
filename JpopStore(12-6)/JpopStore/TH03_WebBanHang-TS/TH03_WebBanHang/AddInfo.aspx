<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="AddInfo.aspx.cs" Inherits="TH03_WebBanHang.AddInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container px-5 px-lg-5" style="text-align:center !important;  display:flex !important; padding:20px !important; margin:7rem auto auto auto !important; gap:10px !important; width:max-content; ">

         <div class="col-sm-2 div-updateInformation" style="width:620px; display:grid; padding: 10px;  height:max-content; overflow:auto;">
                 <table class="table" style="width:100%; margin:auto;">
                     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                     <script>
                         function previewImageBanner(event) {
                             var reader = new FileReader();
                             reader.onload = function () {
                                 var output = document.getElementById('preview');
                                 output.src = reader.result;
                             };
                             reader.readAsDataURL(event.target.files[0]);
                         }
                     </script>

                     <tr><th style="text-align:center;">
                         Thêm banner
                         </th></tr>
                     <tr>
                         <th>
                             <asp:FileUpload ID="fileUploadBanner" CssClass="div-add-input"  runat="server" onchange="previewImageBanner(event)" style=" /*border:1px solid #000;*/ outline:none;"/>
                                <img id="preview" src="" alt="Banner" style="width:100%;"/>
                         </th>
                         
                     </tr>

                     <tr>
                         <td>
                               <asp:Button ID="btnAddBanner" runat="server" Text="THÊM BANNER" CssClass="input btnUpBV" OnClick="btnAddBanner_Click" />

                         </td>
                     </tr>
                 </table>
            </div>
            <div class="col-sm-10 div-updateInformation" style="display:grid; width:586px; padding:0 10px;  height:540px; overflow:auto;">

                                <table class="table" style="width:100%; text-align:center; overflow:auto;">
            <tr>
                <th colspan="2" style="text-align:center;">Banner</th>
            </tr>
           <%-- <tr>
                             <th colspan="2"><%#ddlMaSP.SelectedItem.Text.ToString() %></th>
            </tr>--%>
                <asp:ListView ID="listView2" runat="server" ItemType="TH03_WebBanHang.Models.Banner"
		SelectMethod="GetDeparmentsBanner" OnSelectedIndexChanged="ListView1Banner_SelectedIndexChanged" class="text-center ListView1">
                    <ItemTemplate>
                         
                      <%--  <tr>
                       <%-- <td rowspan="2">
                            <img  src="<%#Item.MaSP %>" style="width:80px"/>
                        </td>--%>
                      <%--  <th><%#Item.MaSP %></th>
                                  </tr>--%>
                        <tr>
                            <th>
                                <img style="width:100%;" src="<%#Item.DuongDan %>"/>
                                </th>
                                       
                                                       

                        </tr>
                      <%--  <tr>
                            
                            <th colspan="2"><%#Item.NoiDungBV %></th>
                        </tr>--%>
                        <tr>
                              <td>

	                             <asp:Button ID="btnDelBanner" class="btnUpdate btn btn-default btn-color btn-w" runat="server" style="border:none; /*background-color:#0000;*/ /*background:linear-gradient(to right, #7c92ea,#4cff00);*/   /*font-size:14px;*/ /*width:max-content;*/ width: 6rem; background-color:#0000;" CommandArgument='<%# Eval("MaBanner")%>' OnClick="btnDelBanner_Click" Text="Xóa" CssClass="btn btn-primary" />
<%--	                            <a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaSP%>">Chỉnh sửa</a>--%>
	                            <%--<a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaSP%>">Xóa</a>--%>
                            </td>
                        </tr>
                        
                    </ItemTemplate>
                </asp:ListView>
            
        </table>


            </div>


    </div>

</asp:Content>
