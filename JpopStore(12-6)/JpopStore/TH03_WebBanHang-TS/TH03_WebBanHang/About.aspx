<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="TH03_WebBanHang.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <%--   <h2><%: Title %>.</h2>--%>
    <%--<h2><img src="Content/logo/logo.png" id="img-logo"/><style>#img-logo{width:180px;}</style></h2>--%>
   
   
                 
<%--     <h1 class="fw-bolder mb-4 tenSP-ls-h3"><p class="tenSP-ls-p">Thành Viên Thành Lập JPopStore</p></h1>--%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <style>
        .tenSP-ls-h3 {
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0;
          
        }

        .tenSP-ls-p {            color: #518ee0;
            width: max-content;
            padding-bottom:1.5rem;
            margin: auto;
            padding-top:1rem;
            border-bottom-color: #000;
            border: 1px solid;
            border-top-style: none;
            border-left-style: none;
            border-right: none;
            
        }
    </style>
   

    <section class="container py-5" style="background:#A0E3F2; color:#000000; overflow-x:hidden;">
        <div class=" d-grid px-5 px-lg-5">
            <div class="py-5 d-flex" style="gap:20px">
                <img style="width:100%;"  src="Content/logo/jshop.png"/>
                <div class="d-grid"> 
                <h3 style="margin-top:4rem; "><strong style="color:#000000;">Giới thiệu</strong></h3>
                <p style="color:#000000;"><strong style="color:#518ee0"><a href="Default.aspx" style="color:#000000;">JPopStore</a></strong> là đơn vị cung cấp những sản phẩm album, goods từ nền hoạt họa anime. <strong style="color:#518ee0"><a href="Default.aspx" style="color:#000000;">JPopStore</a></strong> tuy mới chỉ thành lập nhưng chúng tôi luôn đảm bảo chất lượng của sản phẩm và chính hãng tiêu chí hàng đầu. Các bạn đam mê thì hãy nhấp tay vào giỏ hàng  <strong style="color:#518ee0"><a href="Default.aspx" style="color:#000000;">JPopStore</a></strong>.</p></div>
               
            </div>


        </div>
    </section>

    <style>
      

     .element {
  transform: translateY(100%);
  transition: transform 0.5s ease; /* Áp dụng hiệu ứng cho transform */
}

.element.show {
  transform: translateY(0); /* Dịch chuyển lên trên khi hiển thị */
}
.single_advisor_profile {
    position: relative;
    margin-bottom: 50px;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    z-index: 1;
    border-radius: 15px;
    -webkit-box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
    box-shadow: 0 0.25rem 1rem 0 rgba(47, 91, 234, 0.125);
}
.single_advisor_profile .advisor_thumb {
    position: relative;
    z-index: 1;
    border-radius: 15px 15px 0 0;
    margin: 0 auto;
    padding: 30px 30px 0 30px;
    background-color: #518ee0;
    overflow: hidden;
}
.single_advisor_profile .advisor_thumb::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    width: 150%;
    height: 80px;
    bottom: -45px;
    left: -25%;
    content: "";
    background-color: #ffffff;
    -webkit-transform: rotate(-15deg);
    transform: rotate(-15deg);
}
@media only screen and (max-width: 575px) {
    .single_advisor_profile .advisor_thumb::after {
        height: 160px;
        bottom: -90px;
    }
}
.single_advisor_profile .advisor_thumb .social-info {
    position: absolute;
    z-index: 1;
    width: 100%;
    bottom: 0;
    right: 30px;
    text-align: right;
}
.single_advisor_profile .advisor_thumb .social-info a {
    font-size: 14px;
    color: #020710;
    padding: 0 5px;
}
.single_advisor_profile .advisor_thumb .social-info a:hover,
.single_advisor_profile .advisor_thumb .social-info a:focus {
    color: #3f43fd;
}
.single_advisor_profile .advisor_thumb .social-info a:last-child {
    padding-right: 0;
}
.single_advisor_profile .single_advisor_details_info {
    position: relative;
    z-index: 1;
    padding: 30px;
    text-align: right;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    border-radius: 0 0 15px 15px;
    background-color: #ffffff;
}
.single_advisor_profile .single_advisor_details_info::after {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    position: absolute;
    z-index: 1;
    width: 50px;
    height: 3px;
    background-color: #725535;
    content: "";
    top: 12px;
    right: 30px;
}
.single_advisor_profile .single_advisor_details_info h6 {
    margin-bottom: 0.25rem;
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info h6 {
        font-size: 14px;
    }
}
.single_advisor_profile .single_advisor_details_info p {
    -webkit-transition-duration: 500ms;
    transition-duration: 500ms;
    margin-bottom: 0;
    font-size: 14px;
}
@media only screen and (min-width: 768px) and (max-width: 991px) {
    .single_advisor_profile .single_advisor_details_info p {
        font-size: 12px;
    }
}
.single_advisor_profile:hover .advisor_thumb::after,
.single_advisor_profile:focus .advisor_thumb::after {
    background-color: #725535;
}
.single_advisor_profile:hover .advisor_thumb .social-info a,
.single_advisor_profile:focus .advisor_thumb .social-info a {
    color: #ffffff;
}
.single_advisor_profile:hover .advisor_thumb .social-info a:hover,
.single_advisor_profile:hover .advisor_thumb .social-info a:focus,
.single_advisor_profile:focus .advisor_thumb .social-info a:hover,
.single_advisor_profile:focus .advisor_thumb .social-info a:focus {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info,
.single_advisor_profile:focus .single_advisor_details_info {
    background-color: #725535;
}
.single_advisor_profile:hover .single_advisor_details_info::after,
.single_advisor_profile:focus .single_advisor_details_info::after {
    background-color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info h6,
.single_advisor_profile:focus .single_advisor_details_info h6 {
    color: #ffffff;
}
.single_advisor_profile:hover .single_advisor_details_info p,
.single_advisor_profile:focus .single_advisor_details_info p {
    color: #ffffff;
}
.advisor_thumb {
  
   height:20rem;
}
.advisor_thumb img{
  border-start-end-radius:20px;
   max-width:100%;
   
}
.designation{
    font-size:xx-large;
    font-weight:bolder;
}
    </style>
</asp:Content>
