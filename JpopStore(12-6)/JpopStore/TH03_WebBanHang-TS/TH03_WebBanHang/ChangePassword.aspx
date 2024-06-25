<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="TH03_WebBanHang.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"style="margin-top:7.5rem"><%--Related products--%>
</h2>
<style>
    .tenSP-ls-h3 {
        padding-bottom: 1.5rem;
        text-align: center;
        font-weight: bolder;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        color: #518ee0;
        width: 100%;
    }

    body {
        text-align: center;
        justify-content: center;
        background: #A0E3F2;
            color: black;
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

    #div-content {
        text-align: center;
       
        width:100%;
       
    }
    .search-container-table,.search-container{
        display:none;
    }
</style>
<div id="div-content" class="justify-content-center  align-content-center fade-out">
    
    <div style="display: inline-grid; width: max-content; text-align: center; background:#a8a8a8c5; padding:10px; border-radius:10px;">
        <asp:Image ID="imgAVT" runat="server" style="width:100px; height:100px; border-radius:50%; border:4px solid green; margin:1rem auto;"/>
        <asp:Label ID="lbEmail" runat="server" placeholder="Email" CssClass="input-field w-more" style="margin-bottom:0.5rem; color:black;"></asp:Label>
        <asp:TextBox ID="txtPasswordSignUp" runat="server" TextMode="Password" placeholder="Nhập mật khẩu mới" CssClass="input-field w-more fade-out"></asp:TextBox>
         <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" placeholder="Xác nhận mật khẩu" CssClass="input-field w-more fade-out"></asp:TextBox>

       
        <style>
            #ddlGT {
                padding: 8px !important;
                text-align: center !important;
                margin-bottom: 10px !important;
                border-radius: 5px !important;
            }

            #btChange {
                background-color: #518ee0;
            }


            .w-more {
                width: 100%;
                text-align: center;
                
            }

            .btn-more {
                padding: 0.5rem 2rem !important;
                background-color:#6361617c;
                

            }


            input[type="text"],
            input[type="password"] {
                width: 12rem;
                padding:5px 10px !important;
                margin-bottom: 10px;
                border-radius: 50px;
                border: 1px solid #ccc;
                box-sizing: border-box;
                margin-top:0.6rem;
                color:#000;
            }

            input[type="submit"] {
                width: 100%;
                padding: 10px;
                border: none;
                background-color: #4CAF50;
                color: white;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

                input[type="submit"]:hover {
                    background-color: #518ee0;
                }

            #btChange, .btn-more {
                background-color: #518ee0 !important;
            }

                #btChange:hover, .btn-more:hover {
                    background-color: #a49ccb !important;
                    color: #636161;
                }
        </style>
        <asp:Button ID="btChange" runat="server" Text="Xác Nhận" OnClick="btChange_Click" class="btn-more fade-in" style="width:100%;"  />

    </div>
</div>

</asp:Content>
