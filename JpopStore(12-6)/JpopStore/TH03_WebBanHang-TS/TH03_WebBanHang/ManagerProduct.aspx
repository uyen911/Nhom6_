<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerProduct.aspx.cs" Inherits="TH03_WebBanHang.ManagerProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"  style="margin-top:7.5rem"><%--Related products--%> <p class="tenSP-ls-p">Danh Sách Sản Phẩm</p></h2>
                                                    <style>
                                    
                                    .btn-p-m{
                                        width:1.5rem;
                                        padding:0;
                                        background-color:#fff;
                                        border:none;
                                        border-radius:50%;
                                         margin:0 0.4rem;
                                         height:1.5rem;
                                        
                                    }
                                    .btn-p-m:hover{
  
                                        border:1px solid #000;
                                                                                background-color:#000;

    
}                                    .btn-p-m:active{
  
                                        border:1px solid #000;
                                        background-color:#000;
    
}
                                </style>        
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
				justify-content:center;}
			 		.btn-color:hover{
 background:#518ee0 !important;
 color:white;
}
            </style>
		<div class="d-flex container fade-out"style="width:80%">
		<a class="btn btn-default btn-color  fade-in" style="margin-left:-0.75rem; padding:5px;background:#7728C0; border:1px solid #D7D7D7; border-bottom-right-radius:0;border-bottom-left-radius:0; border-top-right-radius:10px;border-top-left-radius:10px;border:none; color:#fff; width:100%; justify-content:left" href="AddProduct.aspx">Thêm</a>

				<div class="search-container-table  fade-in" style=" margin-bottom:0.4rem;position:relative; right:0; width:82%; height:40%; justify-content:right">
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
	<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.SanPham"
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
			<td class="justify-content-center align-content-center"> <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"> <%#:Item.MaSP%></a></td>
			<td class="justify-content-center align-content-center"> <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"> <img  src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content; width:10rem;" /></a></td>
			<td class="justify-content-center align-content-center"> <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"> <%#:Item.TenSP%></a></td>
			<td class="justify-content-center align-content-center" ><%#:Item.MoTa%></td>
			<td class="justify-content-center align-content-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</td>
			<td class="justify-content-center align-content-center"><%#:Item.MaLoai%></td>
						<td class="justify-content-center align-content-center"><%#:Item.NgaySX%></td>
						<td class="justify-content-center align-content-center"><%#:Item.NgayNhap%></td>
						<td class="justify-content-center align-content-center" ><%#:Item.DoanhSo%></td>
						<td class="d-flex justify-content-center align-content-center" style="width:8rem; height:max-content; padding: 4.8rem 0;">
							
							<%--<div class="d-grid justify-content-center align-content-center" style="margin:2.25rem 0">--%>
<%--								<div class="d-flex justify-content-center align-content-center" style="">--%>
									<asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnDelete_Click" CssClass="btn btn-danger btn-p-m" ImageUrl="~/Content/icon/g-minus.png" />
<%--<%#:Item.SoLuongKho%>--%>
							
        <input id="txtSoLuongKho" runat="server" value="<%#:Item.SoLuongKho%>" style="background:#2E0D4C; border:none; width:3.5rem; text-align:center; height:1.5rem;" min="0" onchange="validateInput(this)" />

<script type="text/javascript">
	function validateInput(input) {
		var value = input.value;
        var hasNonNumeric = /[^0-9]/g.test(value);

        // Check if the input is empty
        if (input.value === '') {
            // Set the value to 0
            input.value = '0';
		}
        if (hasNonNumeric) {
            input.value = '';
        }
		var newValue = value.replace(/[^0-9]/g, '');
        input.value = newValue;
    }
</script>

  
           <script type="text/javascript">
               document.getElementById('txtSoLuongKho').addEventListener('input', function (e) {
        this.value = this.value.replace(/[^0-9]/g, '');
    });
           </script>
   
<asp:ImageButton ID="btnChange" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnChange_Click" CssClass="btn btn-warning btn-p-m" ImageUrl="~/Content/icon/g-plus.png" />
<%--</div>--%>
								<%--<style>
									.btnUpdate:hover{
										background-color:#518ee0;
									}
								</style>--%>
							<%--</div>--%>
							
						</td>


			<td class="justify-content-center align-content-center">
				 <asp:Button ID="btnUpdate" class="btnUpdate btn btn-default btn-color btn-w" runat="server" style="border:none; /*background-color:#0000;*/ /*background:linear-gradient(to right, #7c92ea,#4cff00);*/   /*font-size:14px;*/ /*width:max-content;*/ width: 6rem; background-color:#0000;" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnUpdate_Click" Text="Cập nhật" CssClass="btn btn-primary" />
				<a class="btn btn-default btn-color btn-w" href="EditProduct.aspx?Deptid=<%#:Item.MaSP%>">Chỉnh sửa</a>
				<a class="btn btn-default btn-color btn-w" href="DeleteProduct.aspx?Deptid=<%#:Item.MaSP%>">Xóa</a>
			</td>
		</ItemTemplate>
		<LayoutTemplate><div class="d-flex justify-content-center align-content-center  fade-out">
			<table class="table" id="groupPlaceholderContainer" runat="server" style="width: 80%;">
				<thead>
					<tr>
						<th class="justify-content-center align-content-center">Mã</th>
						<th class="justify-content-center align-content-center">Hình</th>
						<th class="justify-content-center align-content-center">Tên Sản Phẩm</th>
						<th class="justify-content-center align-content-center">Mô Tả</th>
						<th class="justify-content-center align-content-center">Giá</th>
						<th class="justify-content-center align-content-center">Loại</th>
						<th class="justify-content-center align-content-center">Ngày Sản Xuất</th>
						<th class="justify-content-center align-content-center">Ngày Nhập Kho</th>
						<th class="justify-content-center align-content-center">Doanh Số</th>
						<th class="justify-content-center align-content-center">Còn Trong Kho</th>
						<th class="justify-content-center align-content-center"></th>
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
	 
<%--        <a class="btn btn-default btn-color" href="AddProduct.aspx">Thêm Sản Phẩm</a>--%>
        
       
</asp:Content>
