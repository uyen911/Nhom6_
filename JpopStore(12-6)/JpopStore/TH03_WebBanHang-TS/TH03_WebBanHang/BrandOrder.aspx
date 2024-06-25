﻿<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="BrandOrder.aspx.cs" Inherits="TH03_WebBanHang.BrandOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
        <p class="tenSP-ls-p">Doanh Thu Của Chi Nhánh <asp:Label ID="lbBranhName" runat="server" Text=""></asp:Label></p>
    </h2>
    <style>
        .tenSP-ls-h3 {
            padding-bottom: 1.5rem;
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0;
            width: 100%;
        }

        .tenSP-ls-p {            color: #518ee0;
            width: max-content;
            padding: 8px;
            margin: auto;
            border-bottom-color: #000;
            border: 1px solid;
            border-top-style: none;
            border-left-style: none;
            border-right: none;
        }

        body {
            text-align: center;
            justify-content: center;
        }

        .btn-color:hover {
            color: #518ee0;
        }

        .td-longer {
            width: 12rem;
        }

        .btn-w {
            width: 6rem;
        }

        #linksContainer {
            display: none;
        }

        td, tr, th {
            border: 0.8px solid #b8b8b84f;
            text-align: center;
        }

        .ListView1 {
            display: flex;
            text-align: center;
            justify-content: center;
        }
    </style>

             
    <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.DonHang"
        SelectMethod="GetDeparments" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" class="text-center ListView1">
        <EmptyDataTemplate>
            <table>
                <tr>
                    <td></td>
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
           <%--						<td><%#:TH03_WebBanHang.Pay.kh%></td>--%>
           <td class="justify-content-center align-content-center"><%#:Item.MaDH%></td>
           <td class="justify-content-center align-content-center"><%#:Item.KH%></td>

           <td class="justify-content-center align-content-center"><%#:Item.ChiNhanh.TenCN%></td>

           <td class="justify-content-center align-content-center" style="width:8rem"><%#:Item.Ngay%></td>
                       <td class="justify-content-center align-content-center"><%#:Item.ChiTietDonHangs.Sum(s=>s.SoLuong)%></td>

           <%--<td>
<asp:Repeater ID="Repeater1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang" SelectMethod="GetDeparments2">
                   <HeaderTemplate>
                       <table class="order-item-table">
                           <thead>
                               <tr>
                                   <th class="son-table">Tên Sản Phẩm</th>
                                   <th class="son-table" style=" text-align:center;">Số Lượng</th>
                                   <th class="son-table" style=" text-align:center;">Giá</th>
                                   <th class="son-table" style=" text-align:center;">Thành Tiền</th>
                               </tr>
                           </thead>
                           <tbody >
                   </HeaderTemplate>
                   <ItemTemplate>
                       <tr>
                           <td class="son-table" style="text-align:left;"><%#:Item.TenSP %></td>
                           <td class="son-table"><%#:Item.SoLuong%></td>
                           <td class="son-table" style="text-align:center;"><%# string.Format("{0:N0}", Item.Gia) %>đ</td>
                           <td class="son-table" style="text-align:center;"><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>
                           <td class="son-table"><a class="btn btn-default btn-color btn-w" href="DetailOrder.aspx?MaDH=<%#:Item.MaDH%>&SP=<%#:Item.MaSP%>">Chi tiết</a></td>

                       </tr>
                   </ItemTemplate>
                   <FooterTemplate>
                               </tbody>
                           </table>
                   </FooterTemplate>
               </asp:Repeater>                </td>--%>
           <td class="justify-content-center align-content-center">
               <%# string.Format("{0:N0}", Item.ChiTietDonHangs.Sum(p=>p.ThanhTien)) %>đ
           </td>
           <td class="justify-content-center align-content-center">
                               <a class="btn btn-default btn-color btn-w" href="DetailOrderAll.aspx?MaDH=<%#:Item.MaDH%>">Chi tiết</a>

               <a class="btn btn-default btn-color btn-w" href="DeleteOrder.aspx?MaDH=<%#:Item.MaDH%>">Xóa</a>

			<%--<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>
			<a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>--%>
		</td>
       

        </ItemTemplate>
        <LayoutTemplate><div class="fade-out d-flex justify-content-center align-content-center">
            <table class="table" id="groupPlaceholderContainer" runat="server" style="width: 80%;">
                <thead>
                    <tr>
                        <th class="justify-content-center align-content-center">Mã Đơn</th>
                        <th class="justify-content-center align-content-center">Mã Khách</th>

                        <th class="justify-content-center align-content-center">Chi Nhánh</th>
                        <th class="justify-content-center align-content-center">Ngày</th>
                        <th class="justify-content-center align-content-center">Số Sản Phẩm</th>
                         <th class="justify-content-center align-content-center">Tổng Tiền</th>
                      <%--  <th>Số Lượng</th>
                        <th>Giá</th>
                        <th>Thành Tiền</th>--%>


                        <%--						<th>Mã Khách Hàng</th>--%>

                      <%--  <th></th>--%>
                    </tr>
                </thead>
                <tbody>
                    <tr id="groupPlaceholder"></tr>
                    					<tr> <td colspan="5" style="text-align:left;" class="justify-content-center align-content-center" >	
                                                <style>
        .order-item-table  {
    display: block; /* Allows the tbody to be scrollable */
    max-height: 160px; /* Sets the maximum height */
    overflow-y: auto; /* Enables vertical scrolling */
    max-width:100%;
    
}
        .son-table{
            padding:10px
        }
    </style>
						<style>
    .pagerImage {
        width: 24px; /* Độ rộng mong muốn */
        height: 24px; /* Độ cao mong muốn */
	
	
    }
	
	.btn-num-page:hover{
		color:#518ee0;
	
	}
	
	.pagerGap {
    margin: 0 5px; /* Thêm khoảng cách giữa các phần tử */
}.numericPagerField a {
    margin-right: 10px;
		padding-bottom:2rem;


}

/* To ensure the last button doesn't have an extra margin on the right */
.numericPagerField a:last-child {
    margin-right: 0;
}.currentPage {
    font-weight: bold;
    color: #518ee0;
}


</style>
						<asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1" PageSize="5">
							<Fields>
													

								<asp:NextPreviousPagerField ButtonType="Image" PreviousPageImageUrl="~/Content/icon/previous-page.png" ShowFirstPageButton="false" ShowLastPageButton="false" ShowPreviousPageButton="true" ShowNextPageButton="false" ButtonCssClass="pagerImage pagerGap"/>
<asp:NumericPagerField ButtonCount="10" ButtonType="Link" CurrentPageLabelCssClass="currentPage numericPagerField"/>

								<asp:NextPreviousPagerField  ButtonType="Image" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" NextPageImageUrl="~/Content/icon/next-page.png" ButtonCssClass="pagerImage pagerGap"/>
							</Fields>
						</asp:DataPager>
					    </td></tr>
                </tbody>
            </table></div>
        </LayoutTemplate>
    </asp:ListView>
    
            <br />
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p">Tổng Doanh Thu</p></h2>
            <asp:Label ID="LabelTotalRevenue" runat="server" Text="" style="font-size:20px; font-weight:bold;"></asp:Label>
</asp:Content>
