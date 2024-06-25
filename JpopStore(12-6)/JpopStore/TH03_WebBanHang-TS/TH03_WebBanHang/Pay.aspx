﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="TH03_WebBanHang.Pay" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"><style>
                                                                                 .menu-links {
    display: flex;
    justify-content: center;
}

.menu-link {
    text-align: center;
    margin: 0 10px; /* Khoảng cách giữa các liên kết */
    text-decoration: none;
    color: black;
    border:0.5px solid #518ee0;
    box-shadow:2px 2px 18px #518ee0;
    padding:10px;
    margin:8% 2%;
    border-radius:10px;
    --bs-btn-active-bg: #518ee0;
    --bs-btn-disabled-color: #518ee0;
    background-color:#eeeeee;
}
.menu-link:hover {
background-color:#FBF4F1;
                                color:#56157c;

}
.menu-link img {
    width: 160px; /* Kích thước của hình ảnh */
    height: 160px; /* Kích thước của hình ảnh */
    display: block; /* Để canh chỉnh hình ảnh */
    margin: 0 auto 5px; /* Canh chỉnh hình ảnh theo chiều dọc */
}

.menu-link h6 {
    margin: 0; /* Loại bỏ khoảng trắng xung quanh tiêu đề */
}
a{text-decoration:none;}
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
                margin-top:7.5rem;
            }
            .menu-link img{padding:1.5rem !important;}
</style>
        <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p">Thanh Toán</p></h2>

  <%--  <div class="menu-links">
        <a class="menu-link xn" href="#!" id="tm">
            <img src="Content/icon/money.png" alt="Image 1">
            <h6>Thanh Toán Tiền Mặt</h6>
        </a>
        <a class="menu-link" href="PayCard.aspx">
            <img src="Content/icon/operation.png" alt="Image 2">
            <h6>Thanh Toán Số Thẻ</h6>
        </a>
        <a class="menu-link qr" href="PayQR.aspx" id="qr">
            <img src="Content/icon/qr-code.png" alt="Image 3">
            <h6>Thanh Toán Mã QR</h6>
        </a>
    </div>
    <div id="confirmationBox" class="confirmation-box">
    <div class="confirmation-content">--%>

              
        <style>                    #ddlGT {
                padding:8px;
                text-align:center;
                margin-bottom:10px;
                border-radius:5px;
            } #fg-li{text-align:right;}
#sgin-li{text-align:left;}
#btnSignIn {
    background-color:#518ee0;
}.ul-sg-fg {
    display: flex;
    list-style: none;
    gap: 20%;
    justify-content: center;
    margin-bottom: 3%;
}.signin-password {
    font-size: 12px;
    color: #000;
    text-decoration: none;
    display: block;
    margin-top: 10px;
}

    .signin-password:hover {
        text-decoration: underline;
    }.forgot-password {
    font-size: 12px;
    color: #666;
    text-decoration: none;
    display: block;
    margin-top: 10px;
}

    .forgot-password:hover {
        text-decoration: underline;
    }.input-field{
         color:#000 !important;
         margin:0.4rem 0;
         border-radius:10px;
         padding:5px 8px;
         width:28rem;
         height:38px;
                  border:none;

     }
     .input-field-DiaChi{
         color:#000 !important;
         margin:0.4rem 0 0 0;
         border-radius:10px;
         padding:0 8px;
         border:none;
        height:38px;
        width:13rem;
     }
      .input-field-Phone{
     color:#000 !important;
     margin:0.4rem 0 0 0;
     border-radius:10px;
     padding:0 5px;
     border:none;
    height:38px;
     width:12rem;
     text-align:center;
 }

        </style>
   
    <div class="d-flex container fade-out" style="background:linear-gradient(to right,#518ee0, black)">        
        <div class=" d-grid p-5 text-center justify-content-center align-content-center" style="background:#0000007c; width:max-content; ">
                    <asp:TextBox ID="txtEmailSignUp" runat="server" placeholder="Email" CssClass="input-field"></asp:TextBox>
<asp:TextBox ID="txtName" runat="server" placeholder="Họ Và Tên" CssClass="input-field"></asp:TextBox>
<%--<asp:DropDownList ID="ddlGT" runat="server" CssClass="input-field" OnSelectedIndexChanged="ddlGT_SelectedIndexChanged" AutoPostBack="True" style="width:max-content;padding:5px;" Font-Size="small">
    <asp:ListItem ID="txtGTNam" Text="Nam" Value="Nam"></asp:ListItem>
    <asp:ListItem ID="txtGTNu" Text="Nữ" Value="Nữ"></asp:ListItem>
    <asp:ListItem ID="txtGTKhac" Text="Khác" Value="Khác"></asp:ListItem>

</asp:DropDownList>--%>

<%--<asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" style="width:12rem"  CssClass="input-field">
</asp:DropDownList>

<asp:DropDownList ID="ddlDistrict" runat="server" style="width:12rem" CssClass="input-field">
</asp:DropDownList>--%>
            <style>
                .input-field,#ddlCity,*{
                    color:#000;
                }
            </style>
           
<div class=" d-flex" style="gap:1rem;">
                <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CssClass="input-field" style="padding:  8px 5px;width:14rem; color:#000;">
</asp:DropDownList>
    <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" CssClass="input-field" style="padding: 8px 5px; width:13rem;margin-top:0.4rem ;float:left; color:#000;">
</asp:DropDownList>

     

</div>
            <div class=" d-flex" style="gap:1rem;">
            <asp:DropDownList ID="ddlW" runat="server" AutoPostBack="True" CssClass="input-field" style="padding: 8px 5px;width:14rem; margin-top:0.4rem; float:right; color:#000;" >
</asp:DropDownList>      
             <asp:TextBox ID="txtDiachi" runat="server" style="" placeholder="Địa Chỉ" CssClass="input-field-DiaChi"></asp:TextBox>
                </div>
            <div class="d-flex" style="gap:1rem">         <asp:TextBox ID="TextPhone" runat="server" placeholder="Số Điện Thoại" CssClass="input-field-Phone" style="width:14rem;"></asp:TextBox>

                            <asp:DropDownList ID="ddlPay" runat="server" CssClass="input-field" OnSelectedIndexChanged="ddlPay_SelectedIndexChanged" AutoPostBack="True" style="width:13rem;padding:5px; color:#000;" >
    <asp:ListItem ID="txtTM" Text="Tiền mặt" Value="TM" style="color:#000;"></asp:ListItem>
    <asp:ListItem ID="txtPayCard" Text="Thẻ tín dụng" Value="PAY" style="color:#000;"></asp:ListItem>
    <asp:ListItem ID="txtQR" Text="Quét QR" Value="QR" style="color:#000;"></asp:ListItem>
 
</asp:DropDownList>
               
                        

            </div>
             <asp:Label runat="server" ID="lbTong" style="font-size:x-large; padding-left:1rem; color:#fff; font-weight:bolder; margin:0.5rem 0"></asp:Label>

        <asp:Button ID="btnConfirm" runat="server" Text="Xác Nhận" OnClick="btnConfirm_Click" CssClass="btn-confirm" style="background:#518ee0; border:none; border-radius:10px; padding:5px 0; "/>
        <asp:Button ID="btnCancel" runat="server" Text="Hủy" OnClick="btnCancel_Click" CssClass="btn-cancel" style="background:#518ee0; border:none; border-radius:10px; padding:5px 0;" />
   <%-- </div>--%>
        
</div>
        <div class="d-grid fade-right" style="height:max-content; max-height:70vh; overflow:auto; color:#fff;">
            <asp:ListView ID="ListViewGioHang" runat="server">
    <ItemTemplate>
        <div class="d-flex p-5" style="gap:2rem; margin-left:8rem;">            
            <img src='<%# Eval("DuongDan") %>' alt='<%# Eval("TenSP") %>' style="width:100px;height:100px;" />
            <div class="d-grid"> 
                <h5 style="color:#fff;"><%# Eval("TenSP") %></h5>
            <%--<p>Số lượng: <%# Eval("SoLuong") %></p>--%>
                                <div class="d-flex" style="margin-top:0;">         
                     <p style="color:#fff;">Số lượng: <%# Eval("SoLuong") %></p>
<div style="position:relative; margin-left:4rem;">
<asp:ImageButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnDelete_Click" CssClass="btn btn-danger btn-p-m" ImageUrl="~/Content/icon/g-minus.png" />

<asp:ImageButton ID="btnChange" runat="server" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnChange_Click" CssClass="btn btn-warning btn-p-m" ImageUrl="~/Content/icon/g-plus.png" />


</div>
                    
</div>
            <p style="color:#fff;">Giá:  <%# string.Format("{0:N0}",Eval("Gia")) %>đ</p>
            <p style="color:#fff;">Thành tiền: <%# string.Format("{0:N0}", Eval("ThanhTien")) %>đ</p>
                                                <style>
                                    p{
                                        margin:0;
                                    }
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
                
                                                
            <asp:Button ID="btnXoa" runat="server" Text="Xóa" CommandArgument='<%# Eval("MaSP") %>' OnClick="btnXoa_Click" style=" background: linear-gradient(to left, #518ee0,black); color:#fff; border:none; border-radius:20px; width:100px; height:40px; padding:1px; margin:10px 0" />
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>



        </div>
</div>
   <%-- <div id="confirmationBox-QR" class="confirmation-box-QR">
        <div class="confirmation-content-QR">
        <%-- <img src="Content/icon/qr-thanh-toan.jpg" alt="Image QR" style=" width: 300px;">--%><asp:Image ID="imgMomoQRCode" runat="server" style=" width: 300px;"/>
       <%-- <asp:Button ID="Button2" runat="server" Text="Hủy" OnClick="btnCancel_Click" CssClass="btn-cancel"/>
    </div></div>--%>
    <style>.confirmation-box {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align:center;
}

.confirmation-content {
    text-align: center;
}

.btn-confirm, .btn-cancel {
    margin: 5px;
}.confirmation-box-QR {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: white;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.confirmation-content-QR {
    text-align: center;
    display:grid;
}
</style>
    <script>document.addEventListener('DOMContentLoaded', function () {
            var menuLinks = document.querySelectorAll('.xn');
            var confirmationBox = document.getElementById('confirmationBox');
            var tm = document.getElementById('tm');

            menuLinks.forEach(function (tm) {
                tm.addEventListener('click', function (event) {
                    event.preventDefault();

                    confirmationBox.style.display = 'block';
                });
            });


            var qrc = document.querySelectorAll('.qr');
            var confirmationBoxQR = document.getElementById('confirmationBox-QR');
            var qr = document.getElementById('qr');

            qrc.forEach(function (qr) {
                qr.addEventListener('click', function (event) {


                    confirmationBoxQR.style.display = 'block';
                });
            });

        });
    </script>
</asp:Content>

