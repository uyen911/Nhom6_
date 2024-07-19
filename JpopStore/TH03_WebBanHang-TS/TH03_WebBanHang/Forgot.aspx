<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="TH03_WebBanHang.Forgot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JPopStore</title>
    <link href="Content/logo/favicon-32x32.png" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #518ee0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
        }

        .form-container {
            text-align: center;
            margin-bottom: 20px;
        }

            .form-container h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .form-container span {
                font-size: 14px;
                color: #666;
                display: block;
                margin-bottom: 10px;
            }

            .form-container input[type="text"],
            .form-container input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 10px;
                border-radius: 4px;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            .form-container input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #fff0;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

                .form-container input[type="submit"]:hover {
                    background-color: #518ee0;
                }

        #btnForgot,#btnGetOTP {
            background-color: #518ee0;
        }

            #btnForgot:hover,#btnGetOTP:hover {
                background-color: #a49ccb;
                color: #636161;
            }

        #img-maid1 {
            position: absolute;
            right: 0;
            width: 18.5rem;
            bottom: 0;
        }

        #img-maid1 {
            position: absolute;
            right: 0;
            width: 18.5rem;
            bottom: 0;
        }

        #img-maid2 {
            position: absolute;
            left: 0;
            bottom: 0;
            width: 18.5rem;
        }
    </style>
</head>
<body>
    <img loading="lazy" style="filter: brightness(50%); height: 100%; width: 100%; position: absolute; z-index: 0;" src="Content/image-bg/galaxy.png" />

    <form id="form1" runat="server" style="z-index: 1;">
       <%-- <img src="Content/image-bg/maid1.png" id="img-maid1" />
        <img src="Content/image-bg/maid2.png" id="img-maid2" />--%>

        <div class="container">
            <div class="form-container sign-up">
                <%--                <img src="Content/icon/ag.gif" style="max-width: 100%; border-radius: 2rem; margin-bottom: 1.5rem;" />--%>
                <%--                <h1>Forgot Account</h1>--%>
                <%--                <span>or use your email for registration</span>--%>

                <a href="Default.aspx" style="text-decoration: none; color: #518ee0;">
<%--                    <h1 style="text-align: center; font-weight: bolder; font-family: 'Edwardian Script ITC'; font-size: 4rem; margin-bottom: 1rem; border-bottom-color: #000; border: 1px solid; border-top-style: none; border-left-style: none; border-right: none;">JPopStore</h1>--%>
                                  <img style="width:100%;" src="Content/logo/jshop.gif"/>

                </a>

                <asp:TextBox ID="txtEmailSFogot" runat="server" placeholder="Email" CssClass="input-field" style="width:16rem;"></asp:TextBox>
                <div class="d-flex"> <asp:TextBox ID="txtMaKhoiPhuc" runat="server" placeholder="OTP" CssClass="input-field" style="width:12rem;"></asp:TextBox>
                 <asp:Button ID="btnGetOTP" runat="server" Text="Lấy Mã" CssClass="submit-button" OnClick="btnGetOTP_Click" style="font-size:12px; width:max-content;"/></div>
                 
                <p><asp:Label class="otp-p" runat="server" ID="lbOTP" style="font-size:12px;
color:red; height:12px;"></asp:Label></p>
<%--                <asp:TextBox ID="txtPasswordFogot" runat="server" placeholder="Mật Khẩu" CssClass="input-field" style="width:16rem;"></asp:TextBox>--%>
              
                <asp:Button ID="btnForgot" runat="server" Text="Xác Nhận" CssClass="submit-button" OnClick="btnForgot_Click" />
                <ul class="ul-sgin-sgup">
                    <li id="sgin-li">
                        <asp:LinkButton ID="LinkSignIn" runat="server" Text="Đăng Nhập" CssClass="signin-password" href="/SignIn"></asp:LinkButton>
                    </li>
                    <li id="sgup-li">
                        <asp:LinkButton ID="lnkSignUp" runat="server" Text="Đăng Ký" CssClass="sign-up" href="/SignUp"></asp:LinkButton></li>

                </ul>
                <style>
                    #sgup-li {
                        text-align: right;
                    }

                    #sgin-li,.otp-p {
                        text-align: left;
                    }

                    #btnSignIn {
                        background-color: #518ee0;
                    }

                    .ul-sgin-sgup {
                        display: flex;
                        list-style: none;
                        gap: 20%;
                        justify-content: center;
                        margin-bottom: 3%;
                    }

                    .signin-password {
                        font-size: 12px;
                        color: #666;
                        text-decoration: none;
                        display: block;
                        margin-top: 10px;
                    }
                   
                    /*.signin-password:hover {
                text-decoration: underline;
            }*/ .sign-up {
                        font-size: 12px;
                        color: #666;
                        text-decoration: none;
                        display: block;
                        margin-top: 10px;
                    }

                    /*.sign-up:hover {
                text-decoration: underline;
            }*/
                </style>
            </div>
        </div>
    </form>
</body>
    </html>
