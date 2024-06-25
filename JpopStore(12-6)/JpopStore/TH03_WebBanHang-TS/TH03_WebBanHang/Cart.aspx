<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="TH03_WebBanHang.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Product section-->
    <section class="py-5" style="margin-top:5rem">
        <div class="container px-4 px-lg-5 my-5">
            <div class="row gx-4 gx-lg-5 align-items-center justify-content-center">
                <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang" SelectMethod="GetCart">


                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td style="text-align:center;"><%--No data was returned.--%>
                                   <%-- Giỏ hàng rỗng.--%>

                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>

                        <td />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <tr class="cart-list">
                            <td style="text-align:center;" class="justify-content-center align-content-center"> <a class="a-hadItems" href="item.aspx?sp=<%#:Item.MaSP%>"> <%#:Item.TenSP%></a></td>
                            <td style="text-align:center;" class="justify-content-center align-content-center">
                               <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>">  <img  style="width: 150px; border-radius:20px;" class="card-img-top h-100 fade-out" src="<%#:Item.DuongDan%>" alt="..." /></a></td>
                            <td style="text-align:center;" class="justify-content-center align-content-center"><%#:Item.SoLuong%></td>
                            <td style="text-align:center;" class="justify-content-center align-content-center"><%# string.Format("{0:N0}", Item.Gia) %></td>
                            <td style="text-align:center;" class="justify-content-center align-content-center"><%# string.Format("{0:N0}", Item.ThanhTien) %></td>
                            <!-- Add buttons for deleting and changing items -->
                            <td style="text-align:center;" class="justify-content-center align-content-center" style=" width:max-content; text-align:center;">
                                <style>
                                    
                                    .btn-p-m{
                                        width:1.8rem;
                                        padding:0;
                                        background-color:#fff;
                                        border:none;
                                        border-radius:50%;
                                         margin:0 0.4rem;
                                        
                                    }
                                    .btn-p-m:hover{
  
                                        border:1px solid #000;
                                                                                background-color:#000;

    
}                                    .btn-p-m:active{
  
                                        border:1px solid #000;
                                        background-color:#000;
    
}
                                </style>
                                <asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%#: Item.MaSP %>' OnClick="btnDelete_Click" CssClass="btn btn-danger btn-p-m" ImageUrl="~/Content/icon/g-minus.png" />

<asp:ImageButton ID="btnChange" runat="server" CommandArgument='<%#: Item.MaSP %>' OnClick="btnChange_Click" CssClass="btn btn-warning btn-p-m" ImageUrl="~/Content/icon/g-plus.png" />

                            </td>
                        </tr>
                    </ItemTemplate>

                    <LayoutTemplate>
                        <table class="table table-bordered fade-out" id="groupPlaceholderContainer" runat="server" style="width: 100%">
                            <thead>
                                <tr class="cart-list">

                                    <th style="text-align:center;" class="justify-content-center align-content-center">Tên</th>
                                    <th style="text-align:center;" class="justify-content-center align-content-center">Ảnh</th>
                                    <th style="text-align:center;" class="justify-content-center align-content-center">Số Lượng</th>
                                    <th style="text-align:center;" class="justify-content-center align-content-center">Đơn Giá</th>
                                    <th style="text-align:center;" class="justify-content-center align-content-center">Thành Tiền</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="groupPlaceholder"></tr>
                            </tbody>
                        </table>

                    </LayoutTemplate>
                </asp:ListView>
                <div style="display:flex; gap:8rem; background-color:#518ee0; padding: 0; width:max-content; border-radius:20px; border:1px solid #808080; margin-top:1rem;" class="justify-content-center fade-in">
                <div style="padding:1rem;">
                    <style>                        #tongtien {
                            border-top:none;
                            border-left:none;
                            border-right:none;
                            border-bottom:1px solid #000;
                        }
                    </style>
                    <div id="tongtien"> <b>Tổng tiền:</b>
                    <asp:Label ID="lbTongThanhToan" runat="server" Text="0"></asp:Label></div>
                   
                </div>
                <div>
                    <asp:Button ID="btnDathang" runat="server" Text="Đặt hàng" OnClick="btnDathang_Click" style="background:#7333af; border-radius:20px;  padding:1rem; outline-color:#fff0; border:1px solid #303030a0;"/>
                   <%-- <style>                        #btnDathang {
                            padding:10px;
                            border: 1px solid #ccc;
                            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
                            b
                        }
                        #btnDathang {
            background-color:#518ee0;
        }
        #btnDathang:hover {
            background-color:#a49ccb;
            color:#636161;
        }
                    </style>--%>

                </div>
            </div></div>
        </div>
    </section>

</asp:Content>
