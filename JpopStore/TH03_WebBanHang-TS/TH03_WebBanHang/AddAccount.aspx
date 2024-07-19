<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="TH03_WebBanHang.AddAccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%>
        <p class="tenSP-ls-p">Thêm Tài Khoản</p>
    </h2>
    <style>
        .search-container{
            display:none;
        }
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
        }.search-container-table{
             display:none;
         }
    </style>
    <div id="div-content" class="py-5">
        <div style="display: inline-grid; width: max-content; text-align: center;">
            <asp:TextBox ID="txtEmailSignUp" runat="server" placeholder="Email" CssClass="input-field w-more"></asp:TextBox>
            <asp:TextBox ID="txtPasswordSignUp" runat="server" TextMode="Password" placeholder="Mật Khẩu" CssClass="input-field w-more"></asp:TextBox>
            <asp:TextBox ID="txtName" runat="server" placeholder="Họ Và Tên" CssClass="input-field w-more"></asp:TextBox>
            <asp:DropDownList ID="ddlGT" runat="server" CssClass="input-field w-more" OnSelectedIndexChanged="ddlGT_SelectedIndexChanged" AutoPostBack="True" Font-Size="Medium" class="w-more" style="padding:5px 0;">
                <asp:ListItem ID="txtGTNam" Text="Nam" Value="Nam"></asp:ListItem>
                <asp:ListItem ID="txtGTNu" Text="Nữ" Value="Nữ"></asp:ListItem>
                <asp:ListItem ID="txtGTKhac" Text="Khác" Value="Khác"></asp:ListItem>

            </asp:DropDownList>
            <style>
                *,input-field{
                    color:#000;
                }
                input-field{
                   width:12rem;
                }
                #ddlGT {
                    padding: 8px !important;
                    text-align: center !important;
                    margin-bottom: 10px !important;
                    border-radius: 5px !important;
                }

                #btAdd {
                    background-color: #518ee0;
                }


                .w-more {
                    width: 100%;
                    text-align: center;
                }

                .btn-more {
                    width: max-content !important;
                    padding: 0.5rem 2rem !important;
                }


                input[type="text"],
                input[type="password"] {
                    width: 100%;
                    padding: 10px !important;
                    margin-bottom: 10px;
                    border-radius: 4px;
                    border: 1px solid #ccc;
                    box-sizing: border-box;
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

                #btAdd, .btn-more {
                    background-color: #518ee0 !important;
                }

                    #btAdd:hover, .btn-more:hover {
                        background-color: #a49ccb !important;
                        color: #636161;
                    }
            </style>
            <div  style=" margin-top:1rem">
               <%-- <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CssClass="input-field" style="padding:  8px 5px; width:12rem">
</asp:DropDownList>

<asp:DropDownList ID="ddlDistrict" runat="server" CssClass="input-field" style="padding: 8px 5px; width:12rem">
</asp:DropDownList>--%>
            <asp:DropDownList ID="ddlCity" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCity_SelectedIndexChanged" CssClass="input-field" style="padding:  8px 5px; width:100%">
</asp:DropDownList>
<div class=" d-flex" >

    <asp:DropDownList ID="ddlDistrict" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlDistrict_SelectedIndexChanged" CssClass="input-field" style="padding: 8px 5px; width:7rem;margin-top:0.4rem ;float:left;">
</asp:DropDownList>

<asp:DropDownList ID="ddlW" runat="server" AutoPostBack="True" CssClass="input-field" style="padding: 8px 5px; width:7rem; margin-top:0.4rem; float:right;" >
</asp:DropDownList>
</div>
</div>


            <asp:TextBox ID="txtDiachi" runat="server" placeholder="Địa Chỉ" CssClass="input-field w-more" Style="margin-top: 5%; "></asp:TextBox>
            <asp:TextBox ID="TextPhone" runat="server" placeholder="Số Điện Thoại" CssClass="input-field w-more"></asp:TextBox>
        </div>
    </div>

    <asp:Button ID="btAdd" runat="server" Text="Thêm" OnClick="btAdd_Click" class="btn-more" />

</asp:Content>
