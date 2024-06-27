<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="AccountOrder.aspx.cs" Inherits="TH03_WebBanHang.AccountOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
        <p class="tenSP-ls-p">Đơn Hàng</p>
    </h2>
    <style>
        .tenSP-ls-h3 {
            padding-bottom: 1.5rem;
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0 !important;
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
            color: #518ee0 !important;
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
            
            text-align: center;
        }

        .ListView1 {
            display: flex;
            text-align: center;
            justify-content: center;
        }
    </style>

                              <div class="container" style=" width:80%;  text-align:left; margin-bottom:0.4rem;">
				<div class="search-container-table" style="position:relative; ">
    <asp:TextBox ID="searchinputA" Text="" runat="server" Style=" touch-action: none; border-top-left-radius:10px; background:#000;
border-bottom-left-radius:10px; border:1px solid #518ee0; padding-left:1rem;"></asp:TextBox>
			  <div style="border:1px solid #518ee0; padding:5px; border-top-right-radius:10px; background:#000;
border-bottom-right-radius:10px;">    <asp:Button runat="server" ID="btnSearch" CssClass="searchbutton" OnClick="SearchButton_Click" Text="" />
</div>
    <style>
        .searchbutton {
            background-image: url('Content/icon/search.png');
            background-repeat: no-repeat;
            background-size: contain; /* Thay đổi kích thước ảnh nếu cần */
            width: 18px; /* Độ rộng của nút */
            height: 18px; /* Độ cao của nút */
            cursor: pointer; /* Biểu tượng con trỏ khi rê chuột vào nút */
            margin-top: 4%;
            margin-left: 2%;
			padding:8px;

			
		
        }
		.search-container-table{
			left:0;
		}
    </style>
</div>   </div>
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
         <%--  <td><%#:Item.KH%></td>--%>

        <%--   <td><%#:Item.MaCN%></td>--%>

           <td class="td-longer justify-content-center align-content-center"><%#:Item.Ngay%></td>
                       <td class="justify-content-center align-content-center"><%#:Item.ChiTietDonHangs.Sum(s=>s.SoLuong)%></td>

         <%--  <td>--%>
<%--<asp:Repeater ID="Repeater1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang" SelectMethod="GetDeparments2">
                   <HeaderTemplate>
                       <table class="order-item-table" style="width:100%;">
                           <thead>
                               <tr>
                                   <th class="son-table" style="width:16rem">Tên Sản Phẩm</th>
                                   <th class="son-table">Số Lượng</th>
                                   <th class="son-table">Giá</th>
                                   <th  style="width:16rem;" class="son-table">Thành Tiền</th>
                               </tr>
                           </thead>
                           <tbody >
                   </HeaderTemplate>
                   <ItemTemplate>
                       <tr>
                           <td class="son-table" style="text-align:left;"><%#:Item.TenSP %></td>
                           <td class="son-table"><%#:Item.SoLuong%></td>
                           <td class="son-table" style="text-align:center;"><%# string.Format("{0:N0}", Item.Gia) %>đ</td>
                           <td class="son-table" style="text-align:center; "><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>
                           <td class="son-table"><a class="btn btn-default btn-color btn-w" href="DetailOrder.aspx?MaDH=<%#:Item.MaDH%>&SP=<%#:Item.MaSP%>">Chi tiết</a></td>
                                      <%-- <td>
								<a class="btn btn-default btn-color btn-w" href="DetailOrder.aspx?Order=<%#:Item.MaDH%>&SP=<%#:Item.MaSP%>">Chi tiết</a>

                <%--<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>--%>
<%--                <a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>--%>
     <%--       </td>--%>
                       <%--</tr>
                   </ItemTemplate>
                   <FooterTemplate>
                               </tbody>
                           </table>
                   </FooterTemplate>
               </asp:Repeater>       --%>   <%--   </td>--%>
           <td class="justify-content-center align-content-center">
               <%# string.Format("{0:N0}", Item.ChiTietDonHangs.Sum(p=>p.ThanhTien)) %>đ
           </td>
               <td class="justify-content-center align-content-center">
                       <a class="btn btn-default btn-color btn-w" href="DetailOrderAll.aspx?MaDH=<%#:Item.MaDH%>">Chi tiết</a>

<%--       <a class="btn btn-default btn-color btn-w" href="DeleteOrder.aspx?MaDH=<%#:Item.MaDH%>">Xóa</a>--%>

	<%--<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>
	<a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>--%>
</td>
            <%--						<td><%#:TH03_WebBanHang.Pay.kh%></td>--%>
          <%--  <td><%#:Item.MaCTDH%></td>


            <td class="td-longer"><%#:Item.Ngay%></td>
            <td class="td-longer" style="text-align:left;"> <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"> <%#:Item.TenSP%></a></td>
            <td style="width:max-content;"><%#:Item.SoLuong%></td>
            <td><%# string.Format("{0:N0}", Item.Gia) %>đ</td>
            <td><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>
--%>


           <%-- <td>
								<a class="btn btn-default btn-color btn-w" href="DetailOrder.aspx?Order=<%#:Item.MaDH%>&SP=<%#:Item.MaSP%>">Chi tiết</a>

                <%--<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>--%>
<%--                <a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>--%>
          <%--  </td>--%>
        </ItemTemplate>

        <LayoutTemplate><div class="d-flex justify-content-center align-content-center fade-out">
            <table class="table" id="groupPlaceholderContainer" runat="server" style="width: 80%;">
                <thead>
                    <tr>
                         <th class="justify-content-center align-content-center">Mã Đơn</th>
 <th class="justify-content-center align-content-center">Thời Gian</th>

<%-- <th class="justify-content-center align-content-center">Chi Tiết</th>--%>
<th class="justify-content-center align-content-center">Số Sản Phẩm</th>

 <th class="justify-content-center align-content-center">Tổng Tiền</th>
                      <%--  <th>Mã Đơn</th>

                        <th>Thời Gian</th>
                        <th>Chi Tiết</th>--%>
                        <%--<th>Số Lượng</th>
                        <th>Giá</th>
                        <th>Thành Tiền</th>--%>


                        <%--						<th>Mã Khách Hàng</th>--%>

                      <%--  <th></th>--%>
                    </tr>
                </thead>
                <tbody>
                    <tr id="groupPlaceholder"></tr>
                </tbody>
            </table></div>
        </LayoutTemplate>
    </asp:ListView>
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
</asp:Content>
