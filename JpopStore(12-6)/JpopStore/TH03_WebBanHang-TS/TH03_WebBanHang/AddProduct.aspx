<%@ Page Title="JPopStore"Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="TH03_WebBanHang.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
</head>--%>
<body>
    <div>
               

            </div>
    <form id="form1">            <h2 class="fw-bolder mb-4 tenSP-ls-h3"><%--Related products--%> <p class="tenSP-ls-p" style="font-size:30px;">Thêm Sản Phẩm</p></h2>

         <div class="form-container py-5" style="display: flex; margin-top:5rem;">
            <div style="flex: 1; text-align: left; padding-left:1rem; width:50%; float:left">
    <%--<label for="fileUpload" style="display:grid; width:max-content; grid-gap:10px;">Chọn Ảnh:
        <asp:FileUpload ID="fileUpload" runat="server" AllowMultiple="true"  onchange="previewImage(event)" style=" /*border:1px solid #000;*/ outline:none;"/>
</label>
         <div style="display:flex; justify-content: center; align-items: center; ">    
             <img id="imagePreview" src="#" alt="Preview Image" style="display: none; max-width: 240px; margin-top: 10px; text-align: center;" />
</div>--%>
                <label for="fileUpload" style="display:grid; width:max-content; grid-gap:10px;">Chọn Ảnh:</label>
<input type="file" id="fileUpload" name="fileUpload" multiple onchange="previewImages(event)" style="outline:none;"/>
<div id="imagePreviews" style="display:flex; justify-content: center; align-items: center; flex-wrap: wrap;"></div>
<div id="mainImagePreview" style="display:flex; justify-content: center; align-items: center;"></div>

<script>
    function previewImages(event) {
        var files = event.target.files;
        var imagePreviews = document.getElementById('imagePreviews');
        imagePreviews.innerHTML = ''; // Clear previous previews

        var mainImagePreview = document.getElementById('mainImagePreview');
        mainImagePreview.innerHTML = ''; // Clear main image preview

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            var reader = new FileReader();

            reader.onload = function (e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '240px';
                img.style.margin = '10px';
                img.style.display = 'block';
                img.onclick = function () {
                    mainImagePreview.innerHTML = ''; // Clear main image preview
                    var mainImg = document.createElement('img');
                    mainImg.src = this.src;
                    mainImg.style.maxWidth = '480px';
                    mainImg.style.margin = '10px';
                    mainImg.style.display = 'block';
                    mainImagePreview.appendChild(mainImg);
                };
                imagePreviews.appendChild(img);
            }

            reader.readAsDataURL(file);
        }
    }
</script>


</div>

            <div style="flex: 2; margin-top: 0.5rem;  text-align:left; display:inline; padding-left:5rem; width:50%; float:right">
            <div class="div-ls">
                <label for="txtMaSP">Mã Sản Phẩm:</label>
                <asp:TextBox ID="txtMaSP" runat="server" CssClass="full-width"></asp:TextBox>
            </div>
            <div class="div-ls"> 
                <label for="txtTenSP">Tên Sản Phẩm:</label>
                <asp:TextBox ID="txtTenSP" runat="server" CssClass="full-width"></asp:TextBox>
            </div>
                <div class="div-ls"> 
    <label for="txtNgay">Ngày Sản Xuất:</label>
    <asp:TextBox ID="txtNgay" runat="server" CssClass="full-width" onkeyup="formatDate(this)"></asp:TextBox>
</div>
            <div class="div-ls">
                <label for="txtGia">Giá:</label>
                <asp:TextBox ID="txtGia" runat="server" TextMode="Number" CssClass="full-width"></asp:TextBox>
            </div>
                <div class="div-ls">
    <label for="txtSL">Số Lượng:</label>
    <asp:TextBox ID="txtSLKho" runat="server" TextMode="Number" CssClass="full-width"></asp:TextBox>
</div>

            <div class="div-ls">
                <label for="txtMoTa">Mô Tả:</label>
                <asp:TextBox ID="txtMoTa" runat="server" TextMode="MultiLine" CssClass="full-width"></asp:TextBox>
                        <asp:FileUpload ID="fileImageMoTa" runat="server" AllowMultiple="true"  onchange="previewImage(event)" style=" /*border:1px solid #000;*/ outline:none;"/>

            </div>
                <div class="d-flex">
<div  style="margin-top:1rem; " class="d-grid">
    <div id="divAddGP" class="d-flex" style="">
<div class="div-ls"> <label for="ddlMaLoai">Loại:</label>
                <asp:DropDownList ID="ddlMaLoai" runat="server" CssClass="full-width div-ls" style="width:max-content; text-align:center;">
                    <asp:ListItem Text="Album" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Seasion Greeting" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Bluray / CD" Value="3"></asp:ListItem>
                    <asp:ListItem Text="MD" Value="4"></asp:ListItem>
                    <asp:ListItem Text="FM" Value="5"></asp:ListItem>

                </asp:DropDownList></div>
               <div class="div-ls"><label for="ddlMaLoai">Nhóm nhạc / Nghệ sĩ:</label>
    <asp:DropDownList ID="ddlMaNhom" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlMaNhom_SelectedIndexChanged" CssClass="full-width div-ls" style="width:max-content; text-align:center;">
<%--        <asp:ListItem Text="Khác" Value="addNew"></asp:ListItem>--%>
<%--        <asp:ListItem Text="L" Value="2"></asp:ListItem>--%>
       
       
    </asp:DropDownList></div> 
    </div>
                        <div class="d-flex">
<div class="div-ls">
    <asp:Label ID="Label1" CssClass="div-add-Lb" runat="server" for="txtNewMaNhom" Text="Mã nhóm:" ></asp:Label>
    <asp:TextBox ID="txtNewMaNhom"  runat="server"  CssClass="full-width div-ls div-add-input" style="text-align:center;"></asp:TextBox>
</div>
                         <div class="div-ls">
      <asp:Label ID="lbLG"  runat="server" for="fileUploadGPLogo" CssClass="div-add-Lb" style="display:grid; width:max-content; grid-gap:10px;" Text="Logo nhóm:"></asp:Label>
          <asp:FileUpload ID="fileUploadGPLogo" CssClass="div-add-input"  runat="server" onchange="previewImage(event)" style=" /*border:1px solid #000;*/ outline:none;"/>

</div>
                
                    </div>
                    <div class="d-flex">
                 <div class="div-ls">
    <asp:Label ID="lbnameGp" runat="server" CssClass="div-add-Lb" for="txtNewNhomName" Text="Tên nhóm :" ></asp:Label>
    <asp:TextBox ID="txtNewNhomName" runat="server"  CssClass="full-width div-ls div-add-input" style=" text-align:center;" ></asp:TextBox>
</div>
                                            <div class="div-ls">
      <asp:Label ID="lbGpImage" runat="server" for="fileUploadGPmem" CssClass="div-add-Lb" style=" display:grid; width:max-content; grid-gap:10px;" Text="Ảnh nhóm:"></asp:Label>
          <asp:FileUpload ID="fileUploadGPmem" runat="server" onchange="previewImage(event)" style=" /*border:1px solid #000;*/ outline:none;" CssClass="div-add-input"/>

</div>
                    </div>
                
                <style>
                   
                </style>
              
                    <style>
                        .div-add-Lb{
                            color:#fff;
                        }
                        .div-add-input{
                            color:#000;
                            width:8rem;
                        }
                    </style>
                   
        
                                
                           
    
</div>
           

                </div> <div class="div-ls">
                <asp:Button ID="btnAddProduct" runat="server" Text="Thêm Sản Phẩm" OnClick="btnAddProduct_Click" CssClass="btnAddProduct"/>
                
            </div>
            
            
                </div>
</div>    </form>
    <style>
        
        .full-width {
    width: 100%;
    font-size:16px;
    text-align:center;
}
        body {
    display: grid;
  
    height: 100vh; /* Chiều cao của body sẽ chiếm toàn bộ viewport */
    margin: 0; /* Loại bỏ margin mặc định */
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #A0E3F2;
    
}
        .search-container{
            display:none;
        }
        *{
            color:black;

        }
        label{
            color:#fff;
        }
.form-container {
    padding: 20px; /* Padding để tạo khoảng cách xung quanh form */
    border: 1px solid #518ee0; /* Viền cho form */
    border-radius: 5px; /* Bo tròn góc cho form */
    height: max-content;
    max-width: 60%;
    margin: auto; /* Để căn giữa theo chiều ngang */
       background: linear-gradient(to right,#2A588A, #518ee0);
        background-size:cover;
        color:black;


   
   
}


        /* Căn giữa các label và input */
        label, input, select {
            display: block;
            margin-bottom: 10px;
        }

        /* Căn giữa nút thêm sản phẩm */
        .btnAddProduct {
            margin-top: 10px;
        }
        .btnAddProduct {
            background-color:#518ee0;
            max-width: 100%;
    padding: 10px;
    border: none;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    
        }
        .btnAddProduct:hover {
            background-color:#a49ccb;
            color:#636161;
        }
        /* Thiết lập định dạng cho tiêu đề */
        .tenSP-ls-h3 {
            font-weight: bold;
            color: #518ee0;
            text-align: center;
        }

        /* Thiết lập định dạng cho đoạn phụ tiêu đề */
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
        div {
            margin-bottom: 10px; /* Khoảng cách giữa các hàng */
        }
        .div-ls{
            display:inline-grid;
            width:fit-content;
            font-size:16px !important;
            margin:0 0.5rem;
            
        }
        
    </style>
     <script>
         function previewImage(event) {
             var reader = new FileReader();
             reader.onload = function () {
                 var imagePreview = document.getElementById('imagePreview');
                 imagePreview.src = reader.result;
                 imagePreview.style.display = 'block';
             };
             reader.readAsDataURL(event.target.files[0]);
         }
     </script>
</body>
<%--</html>--%>
    </asp:Content>