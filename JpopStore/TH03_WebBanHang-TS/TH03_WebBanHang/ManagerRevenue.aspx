<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerRevenue.aspx.cs" Inherits="TH03_WebBanHang.ManagerRevenue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3" style="margin-top:7.5rem"><%--Related products--%> <p class="tenSP-ls-p">Quản Lý Doanh Thu</p></h2>
            <style>
                .tenSP-ls-h3 {
                padding-bottom: 1.5rem;
                text-align: center;
                font-weight: bolder;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #518ee0;
                width: 100%;
            }

            .tenSP-ls-p {            color: #518ee0;
                width: max-content;
                padding: 8px;
                margin: auto;
                border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;
            }
			body{
				text-align:center;
				justify-content:center;	background: #A0E3F2;
								

			}
			.btn-color:hover{
				color:#518ee0;
			}
			.td-longer{
				width:12rem;
				
			}
			
			.btn-w{
				width:6rem;
			}#linksContainer {
            display: none;
        }
			 td,tr,th{
				 
				 text-align:center;
			 }
			 .ListView1{
				 display:flex;
				text-align:center;
				justify-content:center;
			 }
            </style>
	<section style="display:flex; width:100%; gap:2rem; text-align:center; justify-content:center;" class=" fade-out">
<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang"
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
			
			<td class="justify-content-center align-content-center"><%#:Item.MaCTDH%></td>
			<td class="justify-content-center align-content-center"><%#:Item.Ngay%></td>			<td <%--class="td-longer"--%>> <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"> <%#:Item.TenSP%></a></td>

			<td class="justify-content-center align-content-center"><%#:Item.SoLuong%></td>
			<td class="justify-content-center align-content-center"><%#:string.Format("{0:N0}", Item.Gia)%>đ</td>
									<td class="justify-content-center align-content-center"><%# string.Format("{0:N0}", Item.ThanhTien) %>đ</td>


			<%--<td>
				<a class="btn btn-default btn-color btn-w" href="EditAccount.aspx?Deptid=<%#:Item.MaDH%>">Chỉnh sửa</a>
				<a class="btn btn-default btn-color btn-w" href="DeleteAccount.aspx?Deptid=<%#:Item.MaDH%>">Xóa</a>
			</td>--%>
		</ItemTemplate>
		<LayoutTemplate><div class="d-flex justify-content-center align-content-center  fade-out">
			<table class="table" id="groupPlaceholderContainer" runat="server" style="width:100%;">
			
				<thead>
					<tr>
						
						<th class="justify-content-center align-content-center">Mã Đơn</th>
						<th class="justify-content-center align-content-center">Ngày</th>
						<th class="justify-content-center align-content-center">Sản Phẩm</th>
						<th class="justify-content-center align-content-center">Số Lượng</th>
						<th class="justify-content-center align-content-center">Giá</th>
						<th class="justify-content-center align-content-center">Thành Tiền</th>
						<%--<th></th>--%>
					</tr>
				</thead>
				<tbody>
										<tr id="groupPlaceholder"></tr>
										<tr> <td colspan="5" style="text-align:left;" class="justify-content-center align-content-center" >	
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
	<div > <asp:GridView ID="GridViewMonthlyRevenue" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <Columns>
                <asp:BoundField HeaderStyle-ForeColor ="Black" ItemStyle-ForeColor="Black" DataField="Month" HeaderText="Tháng" />
                <asp:BoundField HeaderStyle-ForeColor ="Black" ItemStyle-ForeColor="Black" DataField="Revenue" HeaderText="Doanh thu (VNĐ)" DataFormatString="{0:N0}" />
            </Columns>
        </asp:GridView>
        <br />
<h6 style="color:black">Tổng Doanh Thu Năm <%#:Year %></h6>
        <asp:Label ID="LabelTotalRevenue" runat="server" Text="" style="font-size:20px; font-weight:bold;" ForeColor="Black"></asp:Label></div>
</section>
       
       
</asp:Content>
