using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public string fileimgMT;
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email))
            {

            }
            // Otherwise, display an error message

            else
            {
                //Response.Write("<script>alert('Bạn không có quyền truy cập');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn không có quyền truy cập!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

                Response.Redirect("Error.aspx");

            }
            if (!IsPostBack)
            {

                PopulateDropDownLists();


            }

        }
        private void PopulateDropDownLists()
        {
            using (var context = new QL_JPOPStoreEntities())
            {
                // Populate ddlCity
                var queryTP = from tp in context.Nhoms
                              select new { tp.MaNhom, tp.TenNhom };

                ddlMaNhom.DataSource = queryTP.ToList();
                ddlMaNhom.DataTextField = "TenNhom";
                ddlMaNhom.DataValueField = "MaNhom";
                ddlMaNhom.DataBind();
                ddlMaNhom.Items.Insert(0, new ListItem("Khác", "Khac"));


                ViewState["DropDownListsPopulated"] = true;
            }
        }

        protected void ddlMaNhom_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ddlMaNhom.SelectedValue == "Khac")
            {

                txtNewMaNhom.Visible = true;
                txtNewNhomName.Visible = true;
                fileUploadGPLogo.Visible = true;
                fileUploadGPmem.Visible = true;
                lbGpImage.Visible = true;
                lbLG.Visible = true;
                lbnameGp.Visible = true;


            }
            else
            {
                txtNewMaNhom.Visible = false;
                txtNewNhomName.Visible = false;
                fileUploadGPLogo.Visible = false;
                fileUploadGPmem.Visible = false;
                lbGpImage.Visible = false;
                lbLG.Visible = false;
                lbnameGp.Visible = false;
            }

        }

        //private void CreateProduct(string imagePath, List<string> additionalImagePaths)
        //{
        //    using (var db = new QL_JPOPStoreEntities())
        //    {
        //        string maSP = txtMaSP.Text.Trim();
        //        string tenSP = txtTenSP.Text.Trim();
        //        float gia;
        //        if (!float.TryParse(txtGia.Text, out gia))
        //        {
        //            // Handle invalid price format
        //            Console.WriteLine("Invalid price format.");
        //            return;
        //        }
        //        string moTa = txtMoTa.Text.Trim();
        //        string maLoai = ddlMaLoai.SelectedValue;
        //        string MaNhom;

        //        if (ddlMaNhom.SelectedValue == "Khac")
        //        {
        //            MaNhom = txtNewMaNhom.Text.Trim();
        //        }
        //        else
        //        {
        //            MaNhom = ddlMaNhom.SelectedValue;
        //        }
        //        DateTime NgaySX;
        //        if (!DateTime.TryParseExact(txtNgay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out NgaySX))
        //        {
        //            // Handle invalid date format
        //            Console.WriteLine("Invalid date format.");
        //            return;
        //        }
        //        int SLKho;
        //        if (!int.TryParse(txtGia.Text, out SLKho))
        //        {
        //            // Handle invalid stock quantity format
        //            Console.WriteLine("Invalid stock quantity format.");
        //            return;
        //        }


        //            var product = new SanPham
        //            {
        //                MaSP = maSP,
        //                TenSP = tenSP,
        //                Gia = gia,
        //                MoTa = moTa,
        //                MaLoai = maLoai,
        //                MaNhom = MaNhom,
        //                NgaySX = NgaySX,
        //                NgayNhap = DateTime.Now,
        //                DoanhSo = 0,
        //                SoLuongKho = SLKho,
        //                DuongDan = imagePath
        //            };
        //            var sanPhamData = new SanPhamData
        //            {
        //                MaSP = product.MaSP,
        //                AnhNote = fileimgMT,
        //                DuongDan1= imagePath
        //            };

        //        sanPhamData.DuongDan2 = null;
        //        sanPhamData.DuongDan3 = null;
        //        sanPhamData.DuongDan4 = null;
        //        sanPhamData.DuongDan5 = null;

        //        //for (int i = 0; i < additionalImagePaths.Count; i++)
        //        //{
        //        //    switch (i)
        //        //    {
        //        //        case 0:
        //        //            sanPhamData.DuongDan1 = additionalImagePaths[i];
        //        //            break;
        //        //        case 1:
        //        //            sanPhamData.DuongDan2 = additionalImagePaths[i];
        //        //            break;
        //        //        case 2:
        //        //            sanPhamData.DuongDan3 = additionalImagePaths[i];
        //        //            break;
        //        //        case 3:
        //        //            sanPhamData.DuongDan4 = additionalImagePaths[i];
        //        //            break;
        //        //        case 4:
        //        //            sanPhamData.DuongDan5 = additionalImagePaths[i];
        //        //            break;
        //        //    }
        //        //}


        //        db.SanPhams.Add(product);                
        //        db.SanPhamDatas.Add(sanPhamData);
        //        db.SaveChanges();


        //    }
        //}

        //private void CreateSanPhamData(List<string> additionalImagePaths)
        //{
        //    using (var db = new QL_JPOPStoreEntities())
        //    {

        //            string maSP = txtMaSP.Text;
        //            var sanPhamData = new SanPhamData
        //            {
        //                MaSP = maSP,
        //                AnhNote = fileimgMT,
        //            };

        //            // Đặt tất cả các đường dẫn hình ảnh không sử dụng thành null
        //            sanPhamData.DuongDan1 = null;
        //            sanPhamData.DuongDan2 = null;
        //            sanPhamData.DuongDan3 = null;
        //            sanPhamData.DuongDan4 = null;
        //            sanPhamData.DuongDan5 = null;

        //            // Sử dụng vòng lặp để thêm các đường dẫn hình ảnh vào đối tượng
        //            for (int i = 0; i < additionalImagePaths.Count; i++)
        //            {
        //                switch (i)
        //                {
        //                    case 0:
        //                        sanPhamData.DuongDan1 = additionalImagePaths[i];
        //                        break;
        //                    case 1:
        //                        sanPhamData.DuongDan2 = additionalImagePaths[i];
        //                        break;
        //                    case 2:
        //                        sanPhamData.DuongDan3 = additionalImagePaths[i];
        //                        break;
        //                    case 3:
        //                        sanPhamData.DuongDan4 = additionalImagePaths[i];
        //                        break;
        //                    case 4:
        //                        sanPhamData.DuongDan5 = additionalImagePaths[i];
        //                        break;
        //                }
        //            }

        //            db.SanPhamDatas.Add(sanPhamData);
        //            db.SaveChanges();


        //    }

        //}


        //protected void btnAddProduct_Click(object sender, EventArgs e)
        //{

        //    QL_JPOPStoreEntities sp = new QL_JPOPStoreEntities();
        //    if(ddlMaNhom.SelectedValue == "Khac")
        //    {
        //        string uploadFolderPathIconKPOP = Server.MapPath("~/Content/icon-group-kpop/");
        //        string uploadFolderPathImageKPOP = Server.MapPath("~/Content/image-group-kpop/");
        //        string srcLogo= string.Empty;
        //        string srcGpImg= string.Empty;
        //        if (fileUploadGPLogo.HasFile)
        //        {
        //            string fileName = Path.GetFileName(fileUploadGPLogo.FileName);
        //            string filePath = Path.Combine(uploadFolderPathIconKPOP, fileName);
        //            fileUploadGPLogo.SaveAs(filePath);
        //            srcLogo = filePath;
        //            // Xử lý ảnh đã lưu
        //        }

        //        if (fileUploadGPmem.HasFile)
        //        {
        //            string fileName = Path.GetFileName(fileUploadGPmem.FileName);
        //            string filePath = Path.Combine(uploadFolderPathImageKPOP, fileName);
        //            fileUploadGPmem.SaveAs(filePath);
        //            srcGpImg = filePath;


        //        }
        //        using (var db = new QL_JPOPStoreEntities())
        //        {
        //            string maNhom = txtNewMaNhom.Text;

        //            var newNhom = new Nhom
        //            {
        //                MaNhom = maNhom,
        //                TenNhom = txtNewNhomName.Text,
        //                DuongDan = srcLogo,
        //                AnhNhom = srcGpImg,

        //            };

        //            db.Nhoms.Add(newNhom);
        //            db.SaveChanges();
        //        }


        //    }
        //    else
        //    {
        //        if (sp.SanPhams.Any(p => p.MaSP == txtMaSP.Text))
        //        {

        //        //Response.Write("<script>alert('Sản phẩm đã tồn tại');</script>");
        //        Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Sản phẩm đã tồn tại!</div>");
        //        Response.Write("<script type=\"text/javascript\">");
        //        Response.Write("setTimeout(function() {");
        //        Response.Write("var elements = document.getElementsByClassName('alert');");
        //        Response.Write("for (var i = 0; i < elements.length; i++) {");
        //        Response.Write("elements[i].style.display = 'none';");
        //        Response.Write("}");
        //        Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
        //        Response.Write("</script>");

        //        }
        //        else
        //        {
        //        string uploadFolderPath = Server.MapPath("~/Content/items/");
        //        string loaiFolder = "";
        //        switch (ddlMaLoai.SelectedValue)
        //        {
        //            case "1":
        //                loaiFolder = "alb";
        //                break;
        //            case "2":
        //                loaiFolder = "ssg";
        //                break;
        //            case "3":
        //                loaiFolder = "blr&cd";
        //                break;
        //            case "4":
        //                loaiFolder = "md";
        //                break;
        //        }

        //        string nhomFolder = ddlMaNhom.SelectedItem.Text.ToLower().Replace(" ", "");

        //        string finalFolderPath = Path.Combine(uploadFolderPath, nhomFolder, loaiFolder);

        //        if (Request.Files.Count > 0)
        //        {
        //            string mainImagePath = null;
        //            List<string> additionalImagePaths = new List<string>();

        //            if (!Directory.Exists(finalFolderPath))
        //            {
        //                Directory.CreateDirectory(finalFolderPath);
        //            }

        //            for (int i = 0; i < Request.Files.Count; i++)
        //            {
        //                HttpPostedFile file = Request.Files[i];
        //                if (file != null && file.ContentLength > 0)
        //                {
        //                    string fileName = Path.GetFileName(file.FileName);
        //                    string filePath = Path.Combine(finalFolderPath, fileName);
        //                    file.SaveAs(filePath);

        //                    if (i == 0) // Ảnh chính
        //                    {
        //                        mainImagePath = filePath;
        //                    }
        //                    else // Ảnh phụ
        //                    {
        //                        additionalImagePaths.Add(filePath);
        //                    }
        //                }
        //            }
        //                if (fileImageMoTa.HasFile)
        //                {

        //                    if (!Directory.Exists(finalFolderPath))
        //                    {
        //                        Directory.CreateDirectory(finalFolderPath);
        //                    }

        //                    string fileName = Path.GetFileName(fileImageMoTa.FileName);
        //                    string filePath = Path.Combine(finalFolderPath, fileName);
        //                    fileImageMoTa.SaveAs(filePath);

        //                    fileimgMT = filePath;

        //                }
        //                using (var db = new QL_JPOPStoreEntities())
        //                {
        //                    string maSP = txtMaSP.Text.Trim();
        //                    string tenSP = txtTenSP.Text.Trim();
        //                    float gia;
        //                    if (!float.TryParse(txtGia.Text, out gia))
        //                    {
        //                        // Handle invalid price format
        //                        Console.WriteLine("Invalid price format.");
        //                        return;
        //                    }
        //                    string moTa = txtMoTa.Text.Trim();
        //                    string maLoai = ddlMaLoai.SelectedValue;
        //                    string MaNhom;

        //                    if (ddlMaNhom.SelectedValue == "Khac")
        //                    {
        //                        MaNhom = txtNewMaNhom.Text.Trim();
        //                    }
        //                    else
        //                    {
        //                        MaNhom = ddlMaNhom.SelectedValue;
        //                    }
        //                    DateTime NgaySX;
        //                    if (!DateTime.TryParseExact(txtNgay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out NgaySX))
        //                    {
        //                        // Handle invalid date format
        //                        Console.WriteLine("Invalid date format.");
        //                        return;
        //                    }
        //                    int SLKho;
        //                    if (!int.TryParse(txtGia.Text, out SLKho))
        //                    {
        //                        // Handle invalid stock quantity format
        //                        Console.WriteLine("Invalid stock quantity format.");
        //                        return;
        //                    }


        //                    var product = new SanPham
        //                    {
        //                        MaSP = maSP,
        //                        TenSP = tenSP,
        //                        Gia = gia,
        //                        MoTa = moTa,
        //                        MaLoai = maLoai,
        //                        MaNhom = MaNhom,
        //                        NgaySX = NgaySX,
        //                        NgayNhap = DateTime.Now,
        //                        DoanhSo = 0,
        //                        SoLuongKho = SLKho,
        //                        DuongDan = mainImagePath
        //                    };
        //                    var sanPhamData = new SanPhamData
        //                    {
        //                        MaSP = product.MaSP,
        //                        AnhNote = fileimgMT,
        //                        DuongDan1 = mainImagePath
        //                    };

        //                    sanPhamData.DuongDan2 = null;
        //                    sanPhamData.DuongDan3 = null;
        //                    sanPhamData.DuongDan4 = null;
        //                    sanPhamData.DuongDan5 = null;

        //                    for (int i = 0; i < additionalImagePaths.Count; i++)
        //                    {
        //                        switch (i)
        //                        {
        //                            case 0:
        //                                sanPhamData.DuongDan1 = additionalImagePaths[i];
        //                                break;
        //                            case 1:
        //                                sanPhamData.DuongDan2 = additionalImagePaths[i];
        //                                break;
        //                            case 2:
        //                                sanPhamData.DuongDan3 = additionalImagePaths[i];
        //                                break;
        //                            case 3:
        //                                sanPhamData.DuongDan4 = additionalImagePaths[i];
        //                                break;
        //                            case 4:
        //                                sanPhamData.DuongDan5 = additionalImagePaths[i];
        //                                break;
        //                        }
        //                    }


        //                    db.SanPhams.Add(product);
        //                    db.SanPhamDatas.Add(sanPhamData);
        //                    db.SaveChanges();


        //                }

        //                // Tạo sản phẩm với đường dẫn ảnh chính
        //                //CreateProduct(mainImagePath, additionalImagePaths);

        //                // Tạo SanPhamData với đường dẫn ảnh phụ
        //                //CreateSanPhamData(additionalImagePaths);

        //                //string dataSource = "LAPTOP-229FFV57\\PU";
        //                //string initialCatalog = "QL_JPOPStore";
        //                //string sqlTK = "sa";
        //                //string sqlMK = "1";
        //                ////string dataSource = "SQL9001.site4now.net";
        //                ////string initialCatalog = "db_aa6a91_sa";
        //                ////string sqlTK = "db_aa6a91_sa";
        //                ////string sqlMK = "26072003Duc";
        //                //string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";

        //                //using (SqlConnection connection = new SqlConnection(connectionString))
        //                //{
        //                //    using (SqlCommand command = new SqlCommand("Product_Add", connection))
        //                //    {
        //                //        command.CommandType = CommandType.StoredProcedure;

        //                //        command.Parameters.AddWithValue("@MaSP", maSP);
        //                //        command.Parameters.AddWithValue("@TenSP", tenSP);
        //                //        command.Parameters.AddWithValue("@Gia", gia);
        //                //        command.Parameters.AddWithValue("@MoTa", moTa);
        //                //        command.Parameters.AddWithValue("@MaLoai", maLoai);
        //                //        command.Parameters.AddWithValue("@MaNhom", MaNhom);
        //                //        if (fileUpload.HasFile)
        //                //        {
        //                //            string uploadFolderPath = Server.MapPath("Content/img/");
        //                //            string fileName = Path.GetFileName(fileUpload.FileName);
        //                //            string fileExtension = Path.GetExtension(fileUpload.FileName);

        //                //            string filePath = Path.Combine(uploadFolderPath, fileName);

        //                //            // Lấy đường dẫn từ "Content" trở đi
        //                //            string relativePath = filePath.Substring(filePath.IndexOf("Content"));

        //                //            command.Parameters.AddWithValue("@DuongDan", relativePath);

        //                //            fileUpload.SaveAs(filePath);

        //                //        }
        //                //        connection.Open();
        //                //        command.ExecuteNonQuery();
        //                //    }
        //                //}
        //            }



        //    }
        //    }





        //}

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            // Xác định chuỗi kết nối
            string dataSource = "LAPTOP-229FFV57\\PU";
            string initialCatalog = "QL_JPOPStore";
            string sqlTK = "sa";
            string sqlMK = "1";
            string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";

            // Thông tin sản phẩm
            string maSP = txtMaSP.Text;
            string tenSP = txtTenSP.Text.Trim();
            float gia = float.Parse(txtGia.Text);
            string moTa = txtMoTa.Text;
            string maLoai = ddlMaLoai.SelectedValue;
            string maNhom = ddlMaNhom.SelectedValue == "Khac" ? txtNewMaNhom.Text.Trim() : ddlMaNhom.SelectedValue;
            DateTime NgaySX;
            DateTime.TryParseExact(txtNgay.Text, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out NgaySX);
            int slKho = int.Parse(txtSLKho.Text); // Giả định txtGia.Text chứa số lượng kho

            // Đường dẫn lưu ảnh
            string uploadFolderPath = Server.MapPath("Content/items/");
            string loaiFolder = ddlMaLoai.SelectedValue; // Giả định ddlMaLoai.SelectedValue chứa tên thư mục
            string nhomFolder = ddlMaNhom.SelectedItem.Text.ToLower().Replace(" ", "");
            string finalFolderPath = Path.Combine(uploadFolderPath, nhomFolder, loaiFolder);

            // Kiểm tra và lưu ảnh
            if (!Directory.Exists(finalFolderPath))
            {
                Directory.CreateDirectory(finalFolderPath);
            }

            string mainImagePath = null;
            List<string> additionalImagePaths = new List<string>();

            for (int i = 0; i < Request.Files.Count; i++)
            {
                HttpPostedFile file = Request.Files[i];
                if (file != null && file.ContentLength > 0)
                {
                    string fileName = Path.GetFileName(file.FileName);
                    string filePath = Path.Combine(finalFolderPath, fileName);
                    file.SaveAs(filePath);

                    string relativeFilePath = "Content" + filePath.Substring(Server.MapPath("Content").Length).Replace("\\", "/");

                    if (i == 0) // Ảnh chính
                    {
                        mainImagePath = relativeFilePath;
                    }
                    else // Ảnh phụ
                    {
                        additionalImagePaths.Add(relativeFilePath);
                    }
                }
            }

            string fileimgMT = null;
            if (fileImageMoTa.HasFile)
            {
                string fileNameMT = Path.GetFileName(fileImageMoTa.FileName);
                string filePathMT = Path.Combine(finalFolderPath, fileNameMT);
                fileImageMoTa.SaveAs(filePathMT);

                fileimgMT = "Content" + filePathMT.Substring(Server.MapPath("Content").Length).Replace("\\", "/");
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlTransaction transaction = connection.BeginTransaction())
                {
                    try
                    {
                        using (SqlCommand command = new SqlCommand("Product_Add", connection, transaction))
                        {
                            command.CommandType = CommandType.StoredProcedure;

                            // Thêm các tham số vào SqlCommand
                            command.Parameters.AddWithValue("@MaSP", maSP);
                            command.Parameters.AddWithValue("@TenSP", tenSP);
                            command.Parameters.AddWithValue("@Gia", gia);
                            command.Parameters.AddWithValue("@MoTa", moTa);
                            command.Parameters.AddWithValue("@MaLoai", maLoai);
                            command.Parameters.AddWithValue("@MaNhom", maNhom);
                            command.Parameters.AddWithValue("@NgaySX", NgaySX);
                            command.Parameters.AddWithValue("@SoLuongKho", slKho);
                            command.Parameters.AddWithValue("@DuongDan", mainImagePath);
                            command.Parameters.AddWithValue("@NgayNhap", DateTime.Now);
                            command.Parameters.AddWithValue("@DoanhSo", 0);

                            command.ExecuteNonQuery();
                        }

                        using (SqlCommand command = new SqlCommand("ProductData_Add", connection, transaction))
                        {
                            command.CommandType = CommandType.StoredProcedure;

                            // Thêm các tham số cần thiết
                            command.Parameters.AddWithValue("@MaSP", maSP);
                            command.Parameters.AddWithValue("@AnhNote", fileimgMT);

                            // Kiểm tra số lượng ảnh phụ và thêm các tham số tương ứng
                            for (int x = 0; x < additionalImagePaths.Count; x++)
                            {
                                string paramName = "@DuongDan" + (x + 1).ToString();
                                command.Parameters.AddWithValue(paramName, additionalImagePaths[x]);
                            }

                            // Nếu số lượng ảnh phụ nhỏ hơn 5, thêm các giá trị null cho các tham số còn thiếu
                            for (int x = additionalImagePaths.Count; x < 5; x++)
                            {
                                string paramName = "@DuongDan" + (x + 1).ToString();
                                command.Parameters.AddWithValue(paramName, DBNull.Value);
                            }

                            // Thực thi Stored Procedure
                            command.ExecuteNonQuery();
                        }

                        transaction.Commit();
                    }
                    catch (Exception)
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }




        //protected void btnAddProduct_Click(object sender, EventArgs e)
        //{
        //    // Xác định chuỗi kết nối
        //    string dataSource = "LAPTOP-229FFV57\\PU";
        //    string initialCatalog = "QL_JPOPStore";
        //    string sqlTK = "sa";
        //    string sqlMK = "1";
        //    string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";

        //    // Thông tin sản phẩm
        //    string maSP = txtMaSP.Text;
        //    string tenSP = txtTenSP.Text.Trim();
        //    float gia = float.Parse(txtGia.Text);
        //    string moTa = txtMoTa.Text ;
        //    string maLoai = ddlMaLoai.SelectedValue;
        //    string MaNhom = ddlMaNhom.SelectedValue == "Khac" ? txtNewMaNhom.Text.Trim() : ddlMaNhom.SelectedValue;
        //    DateTime NgaySX;
        //    //DateTime.TryParseExact(txtNgay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out NgaySX); /*DateTime.ParseExact(txtNgay.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);*/
        //    DateTime.TryParseExact(txtNgay.Text, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out NgaySX);
        //    int SLKho = int.Parse(txtSLKho.Text); // Giả định txtGia.Text chứa số lượng kho
        //    string DuongDan = string.Empty; // Đường dẫn ảnh chính

        //    // Đường dẫn lưu ảnh
        //    string uploadFolderPath = Server.MapPath("Content/items/");
        //    string loaiFolder = ddlMaLoai.SelectedValue; // Giả định ddlMaLoai.SelectedValue chứa tên thư mục
        //    string nhomFolder = ddlMaNhom.SelectedItem.Text.ToLower().Replace(" ", "");
        //    string finalFolderPath = Path.Combine(uploadFolderPath, nhomFolder, loaiFolder);

        //    // Kiểm tra và lưu ảnh
        //    if (fileUploadGPLogo.HasFile)
        //    {
        //        string fileName = Path.GetFileName(fileUploadGPLogo.FileName);
        //        string filePath = Path.Combine(finalFolderPath, fileName);
        //        fileUploadGPLogo.SaveAs(filePath);

        //    }

        //    // Sử dụng SqlConnection và SqlCommand để gọi Stored Procedure
        //    using (SqlConnection connection = new SqlConnection(connectionString))
        //    {
        //        string mainImagePath = null;
        //        List<string> additionalImagePaths = new List<string>();

        //        if (!Directory.Exists(finalFolderPath))
        //        {
        //            Directory.CreateDirectory(finalFolderPath);
        //        }

        //        for (int i = 0; i < Request.Files.Count; i++)
        //        {
        //            HttpPostedFile file = Request.Files[i];
        //            if (file != null && file.ContentLength > 0)
        //            {
        //                string fileName = Path.GetFileName(file.FileName);
        //                string filePath = Path.Combine(finalFolderPath, fileName);
        //                file.SaveAs(filePath);

        //                if (i == 0) // Ảnh chính
        //                {
        //                    mainImagePath = filePath;

        //                }
        //                else // Ảnh phụ
        //                {
        //                    additionalImagePaths.Add(filePath);
        //                }
        //                connection.Open();
        //                using (SqlCommand command = new SqlCommand("Product_Add", connection))
        //                {
        //                    command.CommandType = CommandType.StoredProcedure;

        //                    // Thêm các tham số vào SqlCommand
        //                    command.Parameters.AddWithValue("@MaSP", maSP);
        //                    command.Parameters.AddWithValue("@TenSP", tenSP);
        //                    command.Parameters.AddWithValue("@Gia", gia);
        //                    command.Parameters.AddWithValue("@MoTa", moTa);
        //                    command.Parameters.AddWithValue("@MaLoai", maLoai);
        //                    command.Parameters.AddWithValue("@MaNhom", MaNhom);
        //                    command.Parameters.AddWithValue("@NgaySX", NgaySX);
        //                    command.Parameters.AddWithValue("@SoLuongKho", SLKho);
        //                    command.Parameters.AddWithValue("@DuongDan", mainImagePath);
        //                    command.Parameters.AddWithValue("@NgayNhap", DateTime.Now);
        //                    command.Parameters.AddWithValue("@DoanhSo", 0);

        //                }
        //                string DuongDan1 = DuongDan;
        //                string DuongDan2 = null;
        //                string DuongDan3 = null;
        //                string DuongDan4 = null;
        //                string DuongDan5 = null;

        //                for (int a = 0; i <= additionalImagePaths.Count; i++)
        //                {
        //                    switch (a)
        //                    {
        //                        case 0:
        //                            DuongDan1 = mainImagePath;
        //                            break;
        //                        case 1:
        //                            DuongDan2 = additionalImagePaths[a];
        //                            break;
        //                        case 2:
        //                            DuongDan3 = additionalImagePaths[a];
        //                            break;
        //                        case 3:
        //                            DuongDan4 = additionalImagePaths[a];
        //                            break;
        //                        case 4:
        //                            DuongDan5 = additionalImagePaths[a];
        //                            break;
        //                    }
        //                }
        //                if (fileImageMoTa.HasFile)
        //                {

        //                    if (!Directory.Exists(finalFolderPath))
        //                    {
        //                        Directory.CreateDirectory(finalFolderPath);
        //                    }

        //                    string fileNameMT = Path.GetFileName(fileImageMoTa.FileName);
        //                    string filePathMT = Path.Combine(finalFolderPath, fileNameMT);
        //                    fileImageMoTa.SaveAs(filePathMT);

        //                    fileimgMT = filePathMT;

        //                }
        //                using (SqlCommand command = new SqlCommand("ProductData_Add", connection))
        //                {
        //                    command.CommandType = CommandType.StoredProcedure;

        //                    // Thêm các tham số cần thiết
        //                    command.Parameters.AddWithValue("@MaSP", maSP);
        //                    command.Parameters.AddWithValue("@AnhNote", fileimgMT);

        //                    // Kiểm tra số lượng ảnh phụ và thêm các tham số tương ứng
        //                    for (int x = 0; x < additionalImagePaths.Count; x++)
        //                    {
        //                        string paramName = "@DuongDan" + (x + 1).ToString();
        //                        command.Parameters.AddWithValue(paramName, additionalImagePaths[x]);
        //                    }

        //                    // Nếu số lượng ảnh phụ nhỏ hơn 5, thêm các giá trị null cho các tham số còn thiếu
        //                    for (int x = additionalImagePaths.Count; x < 5; x++)
        //                    {
        //                        string paramName = "@DuongDan" + (x + 1).ToString();
        //                        command.Parameters.AddWithValue(paramName, DBNull.Value);
        //                    }


        //                    // Thực thi Stored Procedure
        //                    command.ExecuteNonQuery();
        //                }

        //                connection.Close();
        //            }
        //        }


        //    }
        //}

    }
}