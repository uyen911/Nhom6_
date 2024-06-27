<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ManagerBranch.aspx.cs" Inherits="TH03_WebBanHang.ManagerBranch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3" style="margin-top:7.5rem"><%--Related products--%> <p class="tenSP-ls-p">Danh Sách Chi Nhánh</p></h2>
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
			  td,tr{
	 
	 text-align:left;
 }
			 .ListView1{
				 display:flex;
				text-align:center;
				justify-content:center;
			 }
            </style>
	
	<asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.ChiNhanh"
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
			<td class="justify-content-center align-content-center"><%#:Item.MaCN%></td>
			<td class="justify-content-center align-content-center"><%#:Item.TenCN%></td>
			<td class="justify-content-center align-content-center"><%#:Item.DiaChiCN%></td>
			<td class="justify-content-center align-content-center" style="text-align:center;"><%#:Item.DonHangs.Count%></td>
			
			<td class="justify-content-center align-content-center">
				<a class="btn btn-default btn-color btn-w" href="BrandOrder.aspx?Deptid=<%#:Item.MaCN%>">Chi Tiết</a>
				<%--<a class="btn btn-default btn-color btn-w" href="DeleteBranch.aspx?Deptid=<%#:Item.MaCN%>">Xóa</a>--%>
			</td>
		</ItemTemplate>
		<LayoutTemplate>
			<div class="d-flex justify-content-center align-content-center fade-out"><table class="table" id="groupPlaceholderContainer" runat="server" style="width: 60%">
				<thead>
					<tr>
						<th class="justify-content-center align-content-center">Mã</th>
						<th class="justify-content-center align-content-center">Khu Vực</th>
						<th class="justify-content-center align-content-center">Địa Chỉ</th>
						<th class="justify-content-center align-content-center">Đơn Nhận</th>
						
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr id="groupPlaceholder"></tr>
				</tbody>
			</table></div>
			
		</LayoutTemplate>
	</asp:ListView>
</asp:Content>
