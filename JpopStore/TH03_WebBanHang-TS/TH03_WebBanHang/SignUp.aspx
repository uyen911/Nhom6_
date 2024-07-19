<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TH03_WebBanHang.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>JPopStore</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" /> <link href="Content/logo/favicon-32x32.png" rel="shortcut icon" type="image/x-icon" />
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
            width: 380px;
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
                #btnSignUp {
            background-color:#518ee0;
        }
        #btnSignUp:hover {
            background-color:#a49ccb;
            color:#636161;
        }#img-maid1 {
            position: absolute;
            right: 0;
            width:18.5rem;
                        bottom: 0;


        }#img-maid2 {
            position: absolute;
            left: 0;
            bottom: 0;
            width:18.5rem;

        }
    </style>
</head>
<body>
        <img loading="lazy" style=" filter: brightness(50%); height:100%; width:100%; position:absolute; z-index:0;" src="Content/image-bg/galaxy.png" />

    <form id="form1" runat="server" style="z-index:1;"><%--    <img loading="lazy" src="Content/image-bg/maid1.png" id="img-maid1"/>--%>
        <%--         <img loading="lazy" src="Content/image-bg/maid2.png" id="img-maid2"/>--%>

        <div class="container">
            <div class="form-container sign-up">
               <%-- <img src="Content/icon/ag.gif" style="max-width: 100%; border-radius: 2rem; margin-bottom: 1.5rem;" />
                <h1>Đăng Ký</h1>--%>
                <%--                <span>or use your email for registration</span>--%>
                               <a href="Default.aspx" style="text-decoration:none; color:#518ee0;">
                                   <%--<h1 style="text-align:center; font-weight:bolder; font-family:'Edwardian Script ITC'; font-size:4rem; margin-bottom:1rem;border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;"> JPopStore</h1>--%>
                                                     <img style="width:100%;" src="Content/logo/jshop.gif"/>

                               </a>

                <asp:TextBox ID="txtEmailSignUp" runat="server" placeholder="Email" CssClass="input-field"></asp:TextBox>
                <asp:TextBox ID="txtPasswordSignUp" runat="server" TextMode="Password" placeholder="Mật Khẩu" CssClass="input-field"></asp:TextBox>
                <asp:TextBox ID="txtName" runat="server" placeholder="Họ Và Tên" CssClass="input-field"></asp:TextBox>
                <asp:DropDownList ID="ddlGT" runat="server" CssClass="input-field" OnSelectedIndexChanged="ddlGT_SelectedIndexChanged" AutoPostBack="True" Width="100%" Font-Size="small">
                    <asp:ListItem ID="txtGTNam" Text="Nam" Value="Nam"></asp:ListItem>
                    <asp:ListItem ID="txtGTNu" Text="Nữ" Value="Nữ"></asp:ListItem>
                    <asp:ListItem ID="txtGTKhac" Text="Khác" Value="Khác"></asp:ListItem>

                </asp:DropDownList>
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
            color: #666;
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
            }
                </style>
                              
<asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CssClass="input-field" style="padding:  8px 5px; width:100%">
</asp:DropDownList>
<div class=" d-flex" >

    <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" CssClass="input-field" style="padding: 8px 5px; width:10rem;margin-top:0.4rem ;float:left;">
</asp:DropDownList>

<asp:DropDownList ID="ddlW" runat="server" AutoPostBack="True" CssClass="input-field" style="padding: 8px 5px; width:10rem; margin-top:0.4rem; float:right;" >
</asp:DropDownList>
</div>

<%--<asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CssClass="input-field" style="padding:  8px 5px; width:45%">
</asp:DropDownList>

<asp:DropDownList ID="ddlDistrict" runat="server" CssClass="input-field" style="padding: 8px 5px; width:45%">
</asp:DropDownList>--%>
            <asp:TextBox ID="txtDiachi" runat="server" placeholder="Địa Chỉ" CssClass="input-field " Style ="margin-top:1rem" ></asp:TextBox>

                <asp:TextBox ID="TextPhone" runat="server" placeholder="Số Điện Thoại" CssClass="input-field"></asp:TextBox>
                <asp:Button ID="btnSignUp" runat="server" Text="Đăng Ký" CssClass="submit-button" OnClick="btnSignUp_Click" />
                <ul class="ul-sg-fg">
                    <li id="sgin-li">
                        <asp:LinkButton ID="LinkSignIn" runat="server" Text="Đăng Nhập" CssClass="signin-password" href="/SignIn"></asp:LinkButton>
                    </li>
                    <li id="fg-li">
                        <asp:LinkButton ID="lnkForgetPassword" runat="server" Text="Quên Mật Khẩu?" CssClass="forgot-password" href="/Forgot"></asp:LinkButton></li>

                </ul>
            </div>
        </div>
    </form>
</body>
</html>
