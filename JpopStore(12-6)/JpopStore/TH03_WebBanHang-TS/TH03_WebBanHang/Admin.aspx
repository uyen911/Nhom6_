<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="TH03_WebBanHang.Admin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"><style>
                                                                                 .menu-links {
    display: flex;
    justify-content: center;
      flex-wrap: wrap; 
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
                                color:#212529;

}
.menu-link img {
    width: 160px; /* Kích thước của hình ảnh */
    height: 160px; /* Kích thước của hình ảnh */
    display: block; /* Để canh chỉnh hình ảnh */
    margin: 0 auto 5px; /* Canh chỉnh hình ảnh theo chiều dọc */
}

.menu-link h6 {
    margin: 0; /* Loại bỏ khoảng trắng xung quanh tiêu đề */
    color:#518ee0;
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
            }
            .menu-link img{padding:1.5rem !important;}
</style>
        <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p">Quản Trị Viên</p></h2>

    <div class="menu-links">
        <a class="menu-link" href="ManagerAccount.aspx">
            <img src="Content/icon/Maccount.png" alt="Image 1">
            <h6>Quản Lý Tài Khoản</h6>
        </a>
        <a class="menu-link" href="ManagerProduct.aspx">
            <img src="Content/icon/Mproduct-3.png" alt="Image 2">
            <h6>Quản Lý Sản Phẩm</h6>
        </a>
        <a class="menu-link" href="ManagerRevenue.aspx">
            <img src="Content/icon/Mrevenue.png" alt="Image 3">
            <h6>Quản Lý Doanh Thu</h6>
        </a>
         <a class="menu-link" href="ManagerBranch.aspx">
            <img src="Content/icon/branch.png" alt="Image 4">
            <h6>Quản Lý Chi Nhánh</h6>
        </a>
         <a class="menu-link" href="ManagerOrder.aspx">
            <img src="Content/icon/package.png" alt="Image 4">
            <h6>Quản Lý Đơn Hàng</h6>
        </a>  <a class="menu-link" href="AddInfo.aspx">
            <img src="Content/icon/OIP.jpg" alt="Image 5">
            <h6>Quản Lý banner</h6>
        </a>
    </div>
</asp:Content>
