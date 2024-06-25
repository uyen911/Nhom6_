<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="DetailOrder.aspx.cs" Inherits="TH03_WebBanHang.DetailOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<div>
<h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p">Chi Tiết Đơn</p></h2>
            <style>
                .tenSP-ls-h3 {
                padding-bottom: 1.5rem;
                text-align: center;
                font-weight: bolder;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #518ee0 !important;
                width: 100%;
            }
                body{
				text-align:center;
				justify-content:center;	background: #A0E3F2;
               
			}
            .tenSP-ls-p {            color: #518ee0 !important;
                width: max-content;
                padding: 8px;
                margin: auto;
                border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;
            }
            .tenSP-ls-p-name {
    width: max-content;
    padding: 8px;
  
    border-bottom-color:#000 ;
    border:1px solid;
    border-top-style:none;
    border-left-style:none;
    border-right:none;
}
          

            
            .w-more{
                width:100%;
                text-align:center;
            }
            
           
            

             
       
        .container-detail {
   display:flex;
    justify-content: center;
   
   
    text-align:left;
    margin-bottom:4rem;
    gap:1rem;
   
}


.tenSP-ls-h6 {
           
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0 !important;
            width: 100%;
        
        }
.content-container{
    padding-top:3rem;
    
}

.text-gd{
    font-weight:bolder;
}


            #btDone {
            background-color:#518ee0;
        }

            
            .w-more{
                width:100%;
                text-align:center;
            }
            
            .btn-done{
                width:max-content !important;
                padding:0.5rem 2rem !important;
                                            border: 1px solid #ccc;

            }
            

                #btDone,.btn-done {
            background-color:#518ee0 !important;
        }
        #btDone:hover,.btn-done:hover {
            background-color:#a49ccb !important;
            color:#ccc !important;
        }
            </style>	
 <div class="container-detail fade-out" style="background:linear-gradient(to right,#000, #518ee0)">
        <div></div>
       <div class="image-container">
    <asp:Image ID="lbImg" runat="server" CssClass="fade-out" style="padding: 20px; height: max-content; width:20rem; border-radius:20px;"/>
</div>
        <div class="content-container">
        <div></div>
                        <h6 class="fw-bolder tenSP-ls-h6"><%--Related products--%> <p class="tenSP-ls-p-name">Thông Tin Đơn Hàng</p></h6>

             <span>Mã Khách Hàng: <b>
			<asp:Label ID="lbDeptid" runat="server" Text=""></asp:Label></b></span>
		
        <div></div>
        <span>Ma Đơn: <asp:Label ID="lbMD" runat="server"
			Text="1"></asp:Label></span>
        <div></div>
		<span>Sản Phẩm: <asp:Label ID="lbSP" runat="server"
			Text="1"></asp:Label></span>
        <div></div>
            <span>Cá sĩ / Nhóm nhạc: <asp:Label ID="lbSize" runat="server"
	Text="1"></asp:Label></span>
<div></div>
		<span>Số Lượng: <asp:Label ID="lbSL" runat="server"
			Text="1"></asp:Label></span>
        <div></div>
		<span>Giá: <asp:Label ID="lbGia" runat="server"
			Text="1"></asp:Label></span>
        <div></div>
		<span>Thành Tiền: <asp:Label ID="lbThanhTien" runat="server"
			Text="1"></asp:Label></span>
                <div></div>
       <span>Giao Dịch: <asp:Label ID="lbGiaoDich" CssClass="text-gd" runat="server" ForeColor="Black"
	Text="1"></asp:Label></span>
        <div></div>
           
            <div id="btnXN">           		<asp:Button ID="btDone" runat="server" Text="Xác Nhận" OnClick="btDone_Click" CssClass="btn-done"/>
</div>

	</div>
      <div class="container-detail">
        <div></div>
     <div class="content-container">
         <div></div>
             <h6 class="fw-bolder tenSP-ls-h6"><%--Related products--%> <p class="tenSP-ls-p-name">Thông Tin Giao Hàng</p></h6>

<span>Số Điện Thoại: <asp:Label ID="lbPhone" runat="server"
	Text="1"></asp:Label></span><div></div>
<span>Họ Tên: <asp:Label ID="lbName" runat="server"
	Text="1"></asp:Label></span><div></div>
<span>Địa Chỉ: <asp:Label ID="lbLocate" runat="server"
	Text="1"></asp:Label></span>
<div></div>
<span>Email: <asp:Label ID="lbEmail" runat="server"
	Text="1"></asp:Label></span>
     </div>
     </div>
        </div>
        </div>
    
</asp:Content>
