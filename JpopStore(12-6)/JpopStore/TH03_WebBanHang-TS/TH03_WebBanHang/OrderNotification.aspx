﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="OrderNotification.aspx.cs" Inherits="TH03_WebBanHang.OrderNotification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div id="div-bd-dis"></div>
     <div class="dis-message">
        <h2>Không Thành Công!</h2>      
         <p>Đơn đặt hàng của bạn đã bị từ chối!<br />Xin hãy thử thanh toán lại lần nữa.</p>
      

    </div>
    <script type="text/javascript">
        setTimeout(function () {
            window.location.href = 'Default.aspx';
        }, 5000);
    </script>
  
    <style>
        .dis-message {
            
    background-color: #bd3838; 
    color: white; 
    padding: 20px;
    border-radius: 10px; 
    position: fixed; 
    top: 50%; 
    left: 50%; 
    transform: translate(-50%, -50%);
    text-align:center;
}
        #div-bd-dis{
            height:70vh;
        }
    </style>

    <div id="div-bd-sc"></div>
     <div class="success-message">
        <h2>Mua Thành Công!</h2>
        <p>Đơn đặt hàng <asp:Label ID="lbMaDon" runat="server" Text=""></asp:Label> của bạn đã được xác nhận!<br />JPopStore sẽ gửi mail thông báo về địa chỉ <asp:Label ID="lbMail" runat="server" Text=""></asp:Label>.</p>
      

    </div>
    <script type="text/javascript">
        setTimeout(function () {
            window.location.href = 'Default.aspx';
        }, 5000);
    </script>
    <style>
        .success-message {
            
    background-color: #38bd49; 
    color: white; 
    padding: 20px;
    border-radius: 10px; 
    position: fixed; 
    top: 50%; 
    left: 50%; 
    transform: translate(-50%, -50%);
    text-align:center;
}
        #div-bd-sc{
            height:70vh;
        }
    </style>
</asp:Content>