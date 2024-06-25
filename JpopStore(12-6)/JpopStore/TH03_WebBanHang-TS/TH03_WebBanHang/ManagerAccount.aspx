<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerAccount.aspx.cs" Inherits="TH03_WebBanHang.ManagerAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3" style="margin-top:7.5rem"><%--Related products--%> <p class="tenSP-ls-p">Danh Sách Tài Khoản</p></h2>
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
				justify-content:center;
				background: #A0E3F2;
								

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
			 }.btn-color:hover{
	 background:#518ee0 !important;
	 color:white;
 }
            </style>
		<div class="d-flex container fade-out"style="width:80%;">
		      <a class="btn btn-default btn-color fade-in" style="z-index:1;margin-left:-0.75rem; padding:5px;background:#7728C0; border:1px solid #D7D7D7; border-bottom-right-radius:0;border-bottom-left-radius:0; border-top-right-radius:10px;border-top-left-radius:10px;border:none; color:#fff; width:100%; justify-content:left"   href="AddAccount.aspx">Thêm</a> 
				<div class="search-container-table fade-in" style="margin-bottom:0.4rem;position:relative; right:0; width:max-content; height:40%; justify-content:right">
    <asp:TextBox ID="searchinputA" Text="" runat="server" Style=" touch-action: none; border-top-left-radius:10px;
border-bottom-left-radius:10px; border:1px solid #000; padding-left:1rem;"></asp:TextBox>
			  <div style="border:1px solid #000; padding:5px; border-top-right-radius:10px;
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

	<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.KhachHang"
		SelectMethod="GetDeparments" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" class="text-center ListView1">
		<EmptyDataTemplate>
			<table>
				<tr>
					<td><%--No data was returned.--%></td>
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
			<td class="td-longer justify-content-center align-content-center"><%#:Item.HoTen%></td>
			<td class="justify-content-center align-content-center"><%#:Item.DienThoai%></td>
			<td class="justify-content-center align-content-center"><%#:Item.GioiTinh%></td>
			<td class="td-longer justify-content-center align-content-center"><%#:Item.DiaChi%></td>
			<td class="justify-content-center align-content-center"><%#:Item.Email%></td>
			<td class="justify-content-center align-content-center"><%#:Item.MatKhau%></td>
						<td class="justify-content-center align-content-center"><%#:Item.Diem%></td>

			<td>
				<a class="btn btn-default btn-color btn-w justify-content-center align-content-center" href="GetPermission.aspx?Deptid=<%#:Item.Email%>">Quyền</a>
<%--				<a class="btn btn-default btn-color btn-w" href="ManagerOrder.aspx?Deptid=<%#:Item.Email %>">Đơn</a>--%>
				<a class="btn btn-default btn-color btn-w justify-content-center align-content-center" href="DeleteAccount.aspx?Deptid=<%#:Item.Email%>">Xóa</a>
			</td>
		</ItemTemplate>
		<LayoutTemplate><div class="d-flex justify-content-center align-content-center fade-out">
			<table class="table" id="groupPlaceholderContainer" runat="server" style="width: 80%; z-index:2;" >
				<thead>
					<tr>
						<th class="justify-content-center align-content-center">Họ Tên</th>
						<th class="justify-content-center align-content-center">Điện Thoại</th>
						<th class="justify-content-center align-content-center">Giới Tính</th>
						<th class="justify-content-center align-content-center">Địa Chỉ</th>
						<th class="justify-content-center align-content-center">Email</th>
						<th class="justify-content-center align-content-center">Mật Khẩu</th>
												<th class="justify-content-center align-content-center">Điểm</th>

						<th></th>
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
	 
<%--        <a class="btn btn-default btn-color" href="AddAccount.aspx">Thêm Tài Khoản</a>--%>
        
       
</asp:Content>
