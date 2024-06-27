<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="TH03_WebBanHang.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <style>
        .container {
            background-color: #A0E3F2;
            border-radius: 8px;


        }

        .profile-picture {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            overflow: hidden;
            margin: 0 auto 20px;
        }

            .profile-picture .profile-image {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

        .profile-info {
            text-align: match-parent;
                        
        }

            .profile-info h5 {
                
                font-size: 18px;
                 color:white;
              
                 text-align:left;
            }

            .profile-info p {
                margin: 5px 0 0;
                padding: 0;
                font-size: 16px;
                 color:white;
            }

        #container-pr {
            padding: 0 0 5% 0;
            display: flex;
            flex-wrap: wrap;
                        
            
        }

        .centered-text {
            max-width: max-content; /* Thiết lập giá trị tối đa cho chiều rộng của các phần tử */
            text-align: left; /* Đảm bảo văn bản được căn trái bên trong phần tử */
            background-color: #0000000d;
            border-radius: 10px;
            padding: 5px 10px;
            margin-bottom: 1.5rem;
            color:white;
        }


        #item-pr {
            justify-content: center;
            text-align: center;
        }
        .search-container{
            border-radius: 20px;
             background-color: #92C7CF;
        }
        .tenSP-ls-h3 {
            padding-bottom: 1.5rem;
            text-align: center;
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0;
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
        .pr-info{
          
            width:max-content; 
            height:max-content; 

            
        }
       .h5-pr{
           width:8rem;
       }
    </style>

    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
        <p class="tenSP-ls-p">Thông Tin Tài Khoản</p>
    </h2>
    
    <div class="container-fluid py-5">
        <div id="container-pr" class="justify-content-center align-items-center fade-out">

            <img loading="lazy" class="fade-out" src="Content/image-bg/hinh-nen-phong-canh-anime-1.png" style="margin-top:8rem; position:absolute; z-index:0; height:auto; width:46rem; backdrop-filter:blur(20px);  filter: brightness(50%); border-radius:50px;border:1px solid #666;"/>
            <div class="fade-out" id="item-pr" style="z-index:1;">
                <div  class="pr-info" style=" border-top-right-radius:0;border-bottom-right-radius:0;border-top-left-radius:20px;border-bottom-left-radius:20px;  padding-left:10px; padding:1.18rem;"> <div class="profile-picture" style="position: relative; ">
                    <!-- Biểu tượng máy ảnh -->
                    <div id="camerai" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); z-index: 2;">
                        <img src="Content/icon/camera.png" style="width: 68px;" />
                    </div>
                    <!-- FileUploadProfilePic -->
                    <asp:FileUpload ID="FileUploadProfilePic" runat="server" Style="position: absolute; width: 5rem; margin: 0 3rem; height: 11rem; opacity: 0; z-index: 4;" />
                    <!-- ImageButton -->
                    <asp:ImageButton ID="ProfileImage" runat="server" CssClass="profile-image" OnClick="btnUpload_Click" AlternateText="Profile Picture" Style="position: relative; z-index: 0;" />
                </div></div>
                <asp:Label ID="lbDiem" runat="server" style="font-weight:bolder;"></asp:Label>
               
            </div>

            <style>
                /* Khi di chuột vào ảnh */
                .profile-picture:hover {
                    filter: brightness(50%); /* Độ sáng tăng lên */
                    transition: filter 0.3s ease; /* Hiệu ứng mượt */
                }

                #camerai {
                    display: none;
                }
                /* Hiển thị biểu tượng máy ảnh khi di chuột vào */
                .profile-picture:hover #camerai {
                    display: block;
                }
                .long-text{
                    width:20rem;
                    overflow-x:auto hidden;
                }
            </style>

            <asp:ListView ID="ListViewAccounts" runat="server">
                <ItemTemplate>
                    <div class="pr-info fade-out" style="z-index:1; border-top-right-radius:20px;border-bottom-right-radius:20px;border-top-left-radius:0;border-bottom-left-radius:0;             width:max-content; height:max-content; 
  padding:0 10px; margin-top:1rem;"><div class="profile-info centered-text">
    <!-- Thêm lớp CSS centered-text -->
     
      <h5 class="d-flex" ><p class="h5-pr">Họ tên:</p><p class="long-text"><%# Eval("HoTen") %></p></h5>
 <h5 class="d-flex" > <p class="h5-pr">Email:</p><p class="long-text"><asp:Label ID="EmailAddress" runat="server" Text='<%# Eval("Email") %>'></asp:Label></p></h5>
 <h5 class="d-flex" > <p class="h5-pr">Giới tính:</p><p class="long-text"><%# Eval("GioiTinh") %></p></h5>
 <h5 class="d-flex" > <p class="h5-pr">Địa chỉ:</p><p class="long-text"><%# Eval("DiaChi") %></p></h5>
 <h5 class="d-flex" > <p class="h5-pr">Số điện thoại:</p><p class="long-text"><%# Eval("DienThoai") %></p></h5>
</div></div>
                    
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div class="justify-content-center align-items-center d-flex fade-in" style="gap: 3rem; z-index:1;">
            <%--<a id="menulink" class="menulink"  href="AccountOrder.aspx?Deptid=<%# Eval("MaKH") %>">
                <h6 style=" width:8rem;">Đơn hàng</h6>
            </a>--%>
                                    <asp:Button ID="btnAccOrder" runat="server" Text="Đơn hàng" OnClick="btnAccOrder_Click" CssClass="btn-sign-out" Visible="true"/>

            <%-- <asp:ListView ID="ListViewClient" runat="server">
        <ItemTemplate>
            <div class="profile-info centered-text"> <!-- Thêm lớp CSS centered-text -->
                <h5>Họ Và Tên: <%# Eval("HoTen") %></h5>
                <h5>Giới Tính: <%# Eval("GioiTinh") %></h5>
                <h5>Địa Chỉ: <%# Eval("DiaChi") %></h5>
                <h5>Số Điện Thoại: <%# Eval("DienThoai") %></h5>
            </div>
        </ItemTemplate>
    </asp:ListView>--%>
             <asp:Button ID="btnControl" runat="server" Text="Quản trị" OnClick="btnControl_Click" CssClass="btn-sign-out" Visible="false"/>
                        <asp:Button ID="btnCPass" runat="server" Text="Đổi mật khẩu" OnClick="btnCPass_Click" CssClass="btn-sign-out" />

            <asp:Button ID="btnSignOut" runat="server" Text="Đăng xuất" OnClick="btnSignOut_Click" CssClass="btn-sign-out" />
        </div>

        <style>
            #menulink,
            .btn-sign-out {
                display: inline-block;
                width: 8rem;
                height: 3rem;
                text-align: center;
                line-height: 3rem;
                vertical-align: middle;
                background-color: #518ee0;
                outline: none;
                border: 1px solid transparent; /* Không có đường viền */
                border-radius: 10px;
                z-index:2;
                transition: background-color 0.8s ease, color 0.8s ease; /* Hiệu ứng chuyển động mượt */
            }

                #menulink h6 {
                    margin: 0;
                    padding: 1rem 0;
                    width: 6rem;
                    height: 3rem;
                    border-radius: 10px;
                                    transition: background-color 0.8s ease, color 0.8s ease; /* Hiệu ứng chuyển động mượt */

                }

                .btn-sign-out,
                #menulink h6 {
                    font-weight: bold;
                }

                    .btn-sign-out:hover,
                    #menulink:hover h6 {
                        color: #fff;
                        background-color: #8b8ba9;
                    }
        </style>

        <%--<asp:ListView ID="ListViewAccounts" runat="server">
        <ItemTemplate>
            <img src="Content/icon/user.png" style="width: 2%;" />
            <h5>Tài Khoản: <%# Eval("TenTaiKhoan") %></h5>
            <h5>Email: <%# Eval("Email") %></h5>
            
        </ItemTemplate>
    </asp:ListView>
         <ItemTemplate>
           
            <h5>Họ Và Tên: <%# Eval("HoTen") %></h5>
<h5>Giới Tính: <%# Eval("GioiTinh") %></h5>
<h5>Địa Chỉ: <%# Eval("DiaChi") %></h5>
<h5>Số Điện Thoại: <%# Eval("DienThoai") %></h5>
        </ItemTemplate>
   
<div id="f-kh" style="display:none;"><ItemTemplate>
            <h5>Họ Và Tên:</h5>
<asp:TextBox type="text" ID="txtHoTen" runat="server" value='<%# Eval("HoTen") %>' placeholder="Họ Và Tên" CssClass="input-field"/>
<h5>Giới Tính:</h5>
<asp:TextBox type="text" ID="txtGioiTinh" runat="server" value='<%# Eval("GioiTinh") %>' placeholder="Giới Tính" CssClass="input-field"/>
<h5>Địa Chỉ:</h5>
<asp:TextBox type="text" ID="txtDiaChi" runat="server" value='<%# Eval("DiaChi") %>' placeholder="Địa Chỉ" CssClass="input-field"/>
<h5>Số Điện Thoại:</h5>
<asp:TextBox type="text" ID="TextPhone" runat="server" value='<%# Eval("DienThoai") %>' placeholder="Số Điện Thoại" CssClass="input-field"/>



        </ItemTemplate></div> 
       <a id="a-change" href="#">Change</a>
    <script>var change = document.getElementById("a-change");            var formkh = document.getElementById("f-kh");
        var save = document.getElementById("btnSave");
        change.addEventListener('click', function () {
            if (formkh.style.display = "none") formkh.style.display = "block";
            else formkh.style.display = "none";
        });
        save.addEventListener('click', function () {
            formkh.style.display = "none";
        });
    </script>

    <asp:Button ID="btnSave" runat="server" Text="Lưu" OnClick="btnSave_Click" />
        <asp:Button ID="btnSignOut" runat="server" Text="SignOut" OnClick="btnSignOut_Click" />--%>
    </div>
  
</asp:Content>
