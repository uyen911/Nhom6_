<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="TH03_WebBanHang.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JPopStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
     <link href="Content/logo/favicon-32x32.png" rel="shortcut icon" type="image/x-icon" />
    <style>
        /* Global CSS reset */
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
            z-index:1;
        }

        .form-container {
            margin-bottom: 20px;
        }

        .text-center {
            text-align: center;
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

        .forgot-password {
            font-size: 12px;
            color: #666;
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }

            .forgot-password:hover {
                text-decoration: underline;
            }

        .signup-password {
            font-size: 12px;
            color: #666;
            text-decoration: none;
            display: block;
            margin-top: 10px;
        }

            .signup-password:hover {
                text-decoration: underline;
            }

        .ul-sg-fg {
            display: flex;
            list-style: none;
            gap: 20%;
            justify-content: center;
            margin-bottom: 3%;
        }

        li {
            width: 40%;
        }
        #fg-li{text-align:right;}
        #sgup-li{text-align:left;}
        #btnSignIn {
            background-color:#518ee0;
        }
        #btnSignIn:hover {
            background-color:#a49ccb;
            color:#636161;
        }
         #img-maid1 {
            position: absolute;
            right: 0;
            width:18.5rem;
                        bottom: 0;


        }

        #img-maid2 {
            position: absolute;
            left: 0;
            bottom: 0;
            width:18.5rem;

        }
    </style>
</head>
<body>
    <img loading="lazy" style=" filter: brightness(50%); height:100%; width:100%; position:absolute; z-index:0;" src="Content/image-bg/galaxy.png" />
    <form id="form1" runat="server" style="z-index:1;">       
<%--    <img loading="lazy" src="Content/image-bg/maid1.png" id="img-maid1"/>--%>

        <div class="container">
            <div class="form-container sign-in">
                                <%--<img src="Content/icon/ag.gif" style="max-width:100%; border-radius:2rem; margin-bottom:1.5rem;"/>--%>
<%--                <img src="Content/logo/logo.png" id="img-logo-header"/><style>#img-logo-header{max-width:100%;}</style>--%>
              <a href="Default.aspx" style="text-decoration:none; color:#518ee0;"> 
                  <%--<h1 style="text-align:center; font-weight:bolder; font-family:'Edwardian Script ITC'; font-size:4rem; margin-bottom:1rem;border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;"> JPopStore</h1>--%>
                                    <img style="width:100%;" src="Content/logo/jshop.gif"/>


              </a>
<%--                <h1 class="text-center">Đăng Nhập</h1>--%>
                <%--                <span class="text-center">or use your email and password</span>--%>
                <asp:TextBox ID="txtEmailSignIn" runat="server" placeholder="Email" CssClass="input-field"></asp:TextBox>
                <asp:TextBox ID="txtPasswordSignIn" runat="server" TextMode="Password" placeholder="Mật Khẩu" CssClass="input-field"></asp:TextBox>


                <asp:Button ID="btnSignIn" runat="server" Text="Đăng Nhập" CssClass="submit-button" OnClick="btnSignIn_Click" />
                 <div class="checkbox">
                <label><asp:CheckBox ID="chkRemember" runat="server" Text="Ghi nhớ đăng nhập" style="font-size: 12px;
            color: #666;
            text-decoration: none;
            margin-top:0.5rem;"/></label>
            </div>
                <ul class="ul-sg-fg">
                    <li id="sgup-li">
                        <asp:LinkButton ID="LinkSignUp" runat="server" Text="Đăng Ký" CssClass="signup-password" href="/SignUp"></asp:LinkButton>
                    </li>
                    <li id="fg-li">
                        <asp:LinkButton ID="lnkForgetPassword" runat="server" Text="Quên Mật Khẩu?" CssClass="forgot-password" href="/Forgot"></asp:LinkButton></li>

                </ul>
            </div>
        </div>
<%--         <img loading="lazy" src="Content/image-bg/maid2.png" id="img-maid2"/>--%>
    </form>
</body>
</html>
