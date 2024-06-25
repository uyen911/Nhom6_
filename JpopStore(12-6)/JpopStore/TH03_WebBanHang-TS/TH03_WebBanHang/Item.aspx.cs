using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class Item : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    string MaSP = Request.QueryString["sp"];
        //    string sp = HttpContext.Current.Request.QueryString.Get("sp");
        //    var maSPsameSP = dbcontext.SanPhams.Any(s => s.MaSP == sp || s.MaSP == MaSP);
        //    if (IsPostBack)
        //    {
        //        // Kiểm tra xem txtSoLuong có giá trị không
        //        if (!string.IsNullOrEmpty(txtSoLuong.Text))
        //        {
        //            // Thêm CSS vào trang
        //            Page.ClientScript.RegisterStartupScript(this.GetType(), "AddCSS", "<style>#divDetailProduct{background:linear-gradient(to right,#3775ca,#336699) !important;}</style>");
        //        }
        //    }
        //    if (!IsPostBack)
        //    {

        //        if (maSPsameSP)
        //        {

        //            txtSoLuong.Visible = true;
        //            txtSoLuong.Text = "1";
        //            btnChange.Visible = true;
        //            btnDelete.Visible = true;
        //            var saP = dbcontext.SanPhams.FirstOrDefault(p => (p.MaSP == sp||p.MaSP==MaSP));
        //            int soLuongCoThe;
        //            soLuongCoThe = saP.SoLuongKho.Value - 1;
        //            if (int.TryParse(txtSoLuong.Text, out int currentValue))
        //            {   
        //                if (currentValue > soLuongCoThe)
        //                {
        //                    int soluongCon = saP.SoLuongKho.Value;
        //                    txtSoLuong.Text = soluongCon.ToString();

        //                }
        //                else if (currentValue == saP.SoLuongKho)
        //                {
        //                    txtSoLuong.Text = saP.SoLuongKho.ToString();
        //                }
        //                else
        //                {
        //                    txtSoLuong.Text = "1";
        //                }


        //                Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #3775ca,#336699) !important;}</style>");


        //            }
        //            Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #3775ca,#336699) !important;}</style>");



        //        }








        //    }

        //}
        //// The return type can be changed to IEnumerable, however to support
        //// paging and sorting, the following parameters must be added:
        ////     int maximumRows
        ////     int startRowIndex
        ////     out int totalRowCount
        ////     string sortByExpression


        protected void Page_Load(object sender, EventArgs e)
        {
            string MaSP = Request.QueryString["sp"];
            string sp = HttpContext.Current.Request.QueryString.Get("sp");
            var maSPsameSP = dbcontext.SanPhams.Any(s => s.MaSP == sp || s.MaSP == MaSP);
            if (IsPostBack)
            {

                // Kiểm tra xem txtSoLuong có giá trị không
                if (!string.IsNullOrEmpty(txtSoLuong.Text))
                {
                    // Thêm CSS vào trang
                    if (maSPsameSP)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AddCSS", "<style>#divDetailProduct{background:linear-gradient(to right,#3775ca,#336699) !important;}.widget-container{display:grid !important;}</style>");

                    }
                }
            }
            if (!IsPostBack)
            {
                BindLoaiListView();
                var khach = dbcontext.KhachHangs.Any(s => s.Email == SignIn.email);

                var danhGia = dbcontext.DanhGias.Where(s => (s.MaSP == sp || s.MaSP == MaSP)).Select(s => s.RatingValue.Value);


                txtComment.Text = string.Empty;
                LoadComments();

                if (maSPsameSP)
                {
                    if (khach)
                    {
                        KhachHang khachHang = dbcontext.KhachHangs.FirstOrDefault(s => s.Email == SignIn.email);
                        var hadRating = dbcontext.DanhGias.Any(s => s.DienThoai == khachHang.DienThoai || s.Email == khachHang.Email);

                        txtDienThoai.Visible = false;
                        txtHoTen.Visible = false;
                        //lbHoTen.Visible = false;
                        //lbSoDT.Visible = false;
                        //lbEmail.Visible = false;
                        txtEmail.Visible = false;



                        //if (hadRating)
                        //{
                        //    ratingForm.Visible = false;
                        //    txtComment.Visible = false;
                        //    btnSubmitCommentIMG.Visible = false;


                        //}
                    }
                    else
                    {
                        KhachHang khachHang = new KhachHang();
                        var hasRating = dbcontext.DanhGias.Any(s => s.DienThoai == khachHang.DienThoai || s.Email == khachHang.Email);
                        txtDienThoai.Visible = true;
                        txtHoTen.Visible = true;
                        //lbHoTen.Visible = true;
                        //lbSoDT.Visible = true;
                        //lbEmail.Visible = true;
                        txtEmail.Visible = true;
                        //if (hasRating)
                        //{
                        //    ratingForm.Visible = false;
                        //    txtComment.Visible = false;
                        //    btnSubmitCommentIMG.Visible = false;


                        //}
                    }
                    ratingForm.Visible = true;
                    //toggleRating.Visible = true;
                    txtComment.Visible = true;
                    btnSubmitComment.Visible = true;
                    txtComment.Visible = true;
                    Response.Write(" <style>\r\n #DGshow{display:grid !important;}   #idRating{display:block !important;}    .custom-file-label{\r\n            display:block !important;\r\n        }\r\n    </style>");
                    ListViewComments.Visible = true;
                    txtSoLuong.Visible = true;
                    txtSoLuong.Text = "1";
                    btnChange.Visible = true;
                    btnDelete.Visible = true;
                    ddlRatingFilter.Visible = true;

                    SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(s => s.MaSP == sp || s.MaSP == MaSP);

                    //Response.Write("  <style>\r\n                    .widget-container{\r\n                        display:grid !important;\r\n                    }\r\n                </style>");

                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AddCSS", "<style>#divDetailProduct{background:linear-gradient(to right,#3775ca,#336699) !important;}.widget-container{display:grid !important;}</style>");




                    var hadRate = dbcontext.DanhGias.Any(s => s.MaSP == sp);

                    if (hadRate)
                    {
                        lblMostRatedStar.Visible = true;
                    }
                    else
                    {
                        lblMostRatedStar.Visible = false;

                    }
                    Response.Write("<style>#divDetailProduct{background:linear-gradient(to right,#3775ca,#336699) !important;}</style>");

                    ddlRatingFilter.SelectedValue = "0";
                    DisplayMostRatedStar();

                    var saP = dbcontext.SanPhams.FirstOrDefault(p => (p.MaSP == sp || p.MaSP == MaSP));




                    lsItemRatingAll.Text = "Tất cả (" + danhGia.Count() + ")";

                    for (int i = 1; i <= 5; i++)
                    {
                        var dg = dbcontext.DanhGias.Where(s => (s.MaSP == sp || s.MaSP == MaSP) && s.RatingValue.Value == i);
                        var count = dg.Count();

                        // Thêm giá trị đếm vào các control tương ứng
                        switch (i)
                        {
                            case 1:
                                lsItemRating1.Text = "1★ (" + count + ")";
                                break;
                            case 2:
                                lsItemRating2.Text = "2★ (" + count + ")";
                                break;
                            case 3:
                                lsItemRating3.Text = "3★ (" + count + ")";
                                break;
                            case 4:
                                lsItemRating4.Text = "4★ (" + count + ")";
                                break;
                            case 5:
                                lsItemRating5.Text = "5★ (" + count + ")";
                                break;
                        }
                    }





                    int soLuongCoThe;
                    soLuongCoThe = saP.SoLuongKho.Value - 1;
                    if (int.TryParse(txtSoLuong.Text, out int currentValue))
                    {
                        if (currentValue > soLuongCoThe)
                        {
                            int soluongCon = saP.SoLuongKho.Value;
                            txtSoLuong.Text = soluongCon.ToString();

                        }
                        else if (currentValue == saP.SoLuongKho)
                        {
                            txtSoLuong.Text = saP.SoLuongKho.ToString();
                        }
                        else
                        {
                            txtSoLuong.Text = "1";
                        }


                        //Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #522A77,#2a2e77) !important;}</style>");


                    }
                    //Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #522A77,#2a2e77) !important;}</style>");



                }






                //if (MaSP != null || sp != null)
                //{
                //    Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #522A77,#2a2e77) !important;}</style>");

                //}

                if (khach)
                {
                    KhachHang khachHang = dbcontext.KhachHangs.FirstOrDefault(s => s.Email == SignIn.email);



                }
                else
                {
                    if (txtDienThoai.Text != string.Empty)
                    {
                        var K = dbcontext.KhachHangs.Any(s => s.DienThoai == txtDienThoai.Text || s.Email == txtEmail.Text);
                        if (K)
                        {
                            KhachHang khachHang = dbcontext.KhachHangs.FirstOrDefault(s => s.DienThoai == txtDienThoai.Text || s.Email == txtEmail.Text);

                        }
                        else;

                    }




                }

            }

        }
        private void LoadComments()
        {
            string sp = HttpContext.Current.Request.QueryString.Get("sp");
            if (dbcontext.SanPhams.Any(s => s.MaSP == sp))
            {
                string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
                string initialCatalog = "QL_JPOPStore";
                string sqlTK = "sa";
                string sqlMK = "1";
                string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";
                string productId = sp;
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string sql = "SELECT AvatarUser, MaSP, TenKH, NoiDung, NgayDG, RatingValue, DienThoai , Email, LuotThich, Anh1, Anh2, Anh3, Anh4, Anh5, Video FROM DanhGia WHERE MaSP = @MaSP";

                    using (SqlCommand cmd = new SqlCommand(sql, conn))
                    {
                        cmd.Parameters.AddWithValue("@MaSP", productId);

                        DataTable dt = new DataTable();
                        dt.Load(cmd.ExecuteReader());
                        ListViewComments.DataSource = dt;
                        ListViewComments.DataBind();
                    }
                }
            }
        }
        private void BindLoaiListView()
        {
            string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
            string initialCatalog = "QL_JPOPStore";
            string sqlTK = "sa";
            string sqlMK = "1";
            string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand("SELECT MaLoai, TenLoai FROM Loai", connection))
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);

                }
            }
        }
        protected void ddlRatingFilter_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedRating = int.Parse(ddlRatingFilter.SelectedValue);
            if (selectedRating == 0)
            {
                // Xử lý việc hiển thị tất cả các đánh giá
                LoadComments();
            }
            else
            {
                // Xử lý việc lọc đánh giá dựa trên số sao
                FilterListViewByRating(selectedRating);
            }
        }
        private void FilterListViewByRating(int rating)
        {

            string sp = HttpContext.Current.Request.QueryString.Get("sp");

            // Giả sử bạn đã có một DataTable dtComments để lưu trữ dữ liệu đánh giá
            var dtComments = dbcontext.DanhGias.Where(s => s.RatingValue == rating && s.MaSP == sp).ToList();



            // Gán dữ liệu đã lọc cho ListViewComments
            ListViewComments.DataSource = dtComments;
            ListViewComments.DataBind();
        }
        private void DisplayMostRatedStar()
        {
            string sp = HttpContext.Current.Request.QueryString.Get("sp");

            // Lấy danh sách đánh giá từ bảng DanhGias
            var ratings = dbcontext.DanhGias.Where(s => s.MaSP == sp).Select(d => d.RatingValue).ToList();

            // Kiểm tra xem danh sách đánh giá có rỗng không
            if (!ratings.Any())
            {
                // Nếu không có đánh giá nào, đặt lblMostRatedStar.Text thành null hoặc một thông báo tương ứng
                lblMostRatedStar.Text = null;
                return; // Thoát khỏi hàm để không thực hiện các bước tiếp theo
            }

            //// Tính số lượng đánh giá cho mỗi sao
            //Dictionary<double, double> starRatingsCount = new Dictionary<double, double>();
            //for (double i = 1; i <= 5; i++)
            //{
            //    starRatingsCount[i] = ratings.Count(rating => rating == i);
            //}

            //// Tìm sao có số lượng đánh giá nhiều nhất
            //double mostRatedStar = 0;
            //double maxCount = 0;
            //List<double> maxStars = new List<double>();

            //foreach (var star in starRatingsCount)
            //{
            //    if (star.Value > maxCount)
            //    {
            //        //mostRatedStar = star.Key;
            //        maxCount = star.Value;
            //        maxStars.Clear();
            //        maxStars.Add(star.Key);
            //    }
            //    else if (star.Value == maxCount)
            //    {
            //        //mostRatedStar = Math.Max(mostRatedStar, star.Key);
            //        maxStars.Add(star.Key);
            //    }
            //}
            //// Xử lý khi có nhiều sao có số lượng đánh giá bằng nhau
            //if (maxStars.Count > 1)
            //{
            //    // Lấy sao ở giữa
            //    mostRatedStar = (maxStars[0] + maxStars[maxStars.Count - 1]) / 2;
            //}
            //else
            //{
            //    mostRatedStar = maxStars[0];
            //}



            //lblMostRatedStar.Text = $"{mostRatedStar}★";


            // Tính tổng số lượng sao nhận được và tổng số lượng bài đánh giá
            double totalStars = (double)ratings.Sum();
            double totalReviews = ratings.Count;

            // Tính rating
            double rating = totalStars / totalReviews;

            // Làm tròn rating đến một số thập phân thứ hai
            rating = Math.Round(rating, 1);

            // Đặt giá trị cho lblMostRatedStar.Text
            lblMostRatedStar.Text = $"{rating}★";

        }
        private bool IsVideoSizeValid(HttpPostedFile videoFile)
        {
            // Giới hạn dung lượng video là 10MB
            const int maxSize = 10 * 1024 * 1024; // 10MB
            return videoFile.ContentLength <= maxSize;
        }
        private double GetVideoDuration(string videoPath)
        {

            return 0;
        }
        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            string sp = HttpContext.Current.Request.QueryString.Get("sp");
            var khach = dbcontext.KhachHangs.Any(s => s.Email == SignIn.email);


            //string tenKH = ddlMaNhom.SelectedItem.Text.ToLower().Replace(" ", "");

            string tenKH = (khach ? dbcontext.KhachHangs.Where(s => s.Email == SignIn.email).Select(s => s.HoTen).FirstOrDefault() : txtHoTen.Text).Replace(" ", ""); ;
            // Thay thế các dấu tiếng Việt bằng ký tự tương ứng không dấu
            tenKH = tenKH.Replace("á", "a").Replace("à", "a").Replace("ả", "a").Replace("ã", "a").Replace("ạ", "a").Replace("ă", "a").Replace("ắ", "a").Replace("ằ", "a").Replace("ẳ", "a").Replace("ẵ", "a").Replace("ặ", "a").Replace("â", "a").Replace("ấ", "a").Replace("ầ", "a").Replace("ẩ", "a").Replace("ậ", "a").Replace("é", "e").Replace("è", "e").Replace("ẻ", "e").Replace("ẽ", "e").Replace("ẹ", "e").Replace("ê", "e").Replace("ế", "e").Replace("ề", "e").Replace("ể", "e").Replace("ễ", "e").Replace("ệ", "e").Replace("í", "i").Replace("ì", "i").Replace("ỉ", "i").Replace("ĩ", "i").Replace("ị", "i").Replace("ó", "o").Replace("ò", "o").Replace("ỏ", "o").Replace("õ", "o").Replace("ọ", "o").Replace("ô", "o").Replace("ố", "o").Replace("ồ", "o").Replace("ổ", "o").Replace("ỗ", "o").Replace("ộ", "o").Replace("ơ", "o").Replace("ớ", "o").Replace("ờ", "o").Replace("ở", "o").Replace("ỡ", "o").Replace("ợ", "o").Replace("ú", "u").Replace("ù", "u").Replace("ủ", "u").Replace("ũ", "u").Replace("ụ", "u").Replace("ư", "u").Replace("ứ", "u").Replace("ừ", "u").Replace("ử", "u").Replace("ữ", "u").Replace("ự", "u").Replace("ý", "y").Replace("ỳ", "y").Replace("ỷ", "y").Replace("ỹ", "y").Replace("ỵ", "y");


            string sdtKH = (khach ? dbcontext.KhachHangs.Where(s => s.Email == SignIn.email).Select(s => s.DienThoai).FirstOrDefault() : txtDienThoai.Text).ToLower().Replace(" ", "");
            string emailKH = (khach ? dbcontext.KhachHangs.Where(s => s.Email == SignIn.email).Select(s => s.Email).FirstOrDefault() : txtEmail.Text).ToLower().Replace(" ", "");
            //string dateRating = DateTime.Now.ToString();
            string format = "ddMMyyyy-HH-mm";

            string wwRatingProfile = DateTime.Now.ToString(format) + "-" + emailKH + "-" + sdtKH + '/';


            string path = Server.MapPath("Content/rating-data/");
            string fullPath = System.IO.Path.Combine(path, wwRatingProfile);

            if (!Directory.Exists(fullPath))
            {
                Directory.CreateDirectory(fullPath);

            }


            string[] imagePaths = new string[fileUploadImages.PostedFiles.Count];
            string video = null;
            if (fileUploadImages.HasFiles)
            {
                for (int i = 0; i < fileUploadImages.PostedFiles.Count; i++)
                {
                    HttpPostedFile file = fileUploadImages.PostedFiles[i];

                    string fileName = System.IO.Path.GetFileName(file.FileName);


                    string pathimgDG = System.IO.Path.Combine(fullPath, fileName);



                    file.SaveAs(pathimgDG);
                    imagePaths[i] = "Content/rating-data/" + wwRatingProfile + fileName;
                    //imagePaths[i] = fullPath + fileName;
                }
                string images = string.Join(",", imagePaths);

            }
            if (fileUploadVideo.HasFile)
            {
                HttpPostedFile videoFile = fileUploadVideo.PostedFile;
                string videoFileName = System.IO.Path.GetFileName(videoFile.FileName);

                string pathimgDGVideo = System.IO.Path.Combine(fullPath, videoFileName);
                videoFile.SaveAs(pathimgDGVideo);

                // Kiểm tra dung lượng video
                if (!IsVideoSizeValid(videoFile))
                {

                    Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Video quá lớn. Vui lòng chọn video có dung lượng dưới 10MB.</div>");
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("setTimeout(function() {");
                    Response.Write("var elements = document.getElementsByClassName('alert');");
                    Response.Write("for (var i = 0; i < elements.length; i++) {");
                    Response.Write("elements[i].style.display = 'none';");
                    Response.Write("}");
                    Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                    Response.Write("</script>");

                    video = null;
                    return;
                }
                double videoDuration = GetVideoDuration(pathimgDGVideo);

                if (videoDuration > 60) // Kiểm tra thời lượng video vượt quá 1 phút
                {

                    Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Video quá dài. Vui lòng chọn video dưới 1 phút.</div>");
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("setTimeout(function() {");
                    Response.Write("var elements = document.getElementsByClassName('alert');");
                    Response.Write("for (var i = 0; i < elements.length; i++) {");
                    Response.Write("elements[i].style.display = 'none';");
                    Response.Write("}");
                    Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                    Response.Write("</script>");

                    video = null;
                    return;
                }

                video = "Content/rating-data/" + wwRatingProfile + videoFileName;
            }


            //if (fileUploadVideo.HasFile)
            //{
            //    HttpPostedFile videoFile = fileUploadVideo.PostedFile;
            //    string videoFileName = System.IO.Path.GetFileName(videoFile.FileName);

            //    string pathimgDGVideo = System.IO.Path.Combine(fullPath, videoFileName);
            //    videoFile.SaveAs(pathimgDGVideo);


            //    double videoDuration = GetVideoDuration(pathimgDGVideo);
            //    if (videoDuration > 40)
            //    {

            //        Response.Write("Video quá dài.Xin hãy chọn video dưới 40s.");
            //        return;
            //    }

            //    video = "Content/rating-data/" + wwRatingProfile + videoFileName;


            //}







            if (khach)
            {
                KhachHang khachHang = dbcontext.KhachHangs.FirstOrDefault(s => s.Email == SignIn.email);

                var Rating = dbcontext.DanhGias.Any(s => (s.DienThoai == khachHang.DienThoai || s.Email == khachHang.Email) && s.MaSP == sp);
                if (Rating)
                {

                    using (var db = new QL_JPOPStoreEntities())
                    {
                        // Tìm DanhGia cần cập nhật
                        var danhGia = db.DanhGias.FirstOrDefault(d => (d.DienThoai == khachHang.DienThoai || d.Email == khachHang.Email) && d.MaSP == sp);
                        if (danhGia != null)
                        {
                            // Cập nhật các trường cần thiết
                            danhGia.NoiDung = txtComment.Text; // Ví dụ: cập nhật nội dung bình luận
                            danhGia.RatingValue = Convert.ToInt32(ratingValue.Value); // Ví dụ: cập nhật giá trị đánh giá
                            danhGia.AvatarUser = Account.urlAvt;
                            // Lưu thay đổi vào cơ sở dữ liệu

                            //danhGia.LuotThich = 0; // Đặt LuotThich bằng 0
                            if (fileUploadImages.HasFiles || fileUploadImages.HasFile)
                            {
                                // Lưu ảnh và video
                                if (imagePaths.Length > 0)
                                {
                                    danhGia.Anh1 = imagePaths[0];
                                    if (imagePaths.Length > 1) danhGia.Anh2 = imagePaths[1]; else danhGia.Anh2 = null;
                                    if (imagePaths.Length > 2) danhGia.Anh3 = imagePaths[2]; else danhGia.Anh3 = null;
                                    if (imagePaths.Length > 3) danhGia.Anh4 = imagePaths[3]; else danhGia.Anh4 = null;
                                    if (imagePaths.Length > 4) danhGia.Anh5 = imagePaths[4]; else danhGia.Anh5 = null;
                                }
                                else
                                {
                                    danhGia.Anh1 = null;
                                    danhGia.Anh2 = null;
                                    danhGia.Anh3 = null;
                                    danhGia.Anh4 = null;
                                    danhGia.Anh5 = null;
                                }
                            }
                            else
                            {
                                danhGia.Anh1 = null;
                                danhGia.Anh2 = null;
                                danhGia.Anh3 = null;
                                danhGia.Anh4 = null;
                                danhGia.Anh5 = null;
                            }
                            if (fileUploadVideo.HasFile)
                            {

                                danhGia.Video = video;



                            }
                            else
                            {
                                danhGia.Video = null;
                            }

                            db.SaveChanges();
                            dbcontext.SaveChanges();
                        }

                        db.SaveChanges();
                        dbcontext.SaveChanges();
                    }
                }
                else
                {


                    int ratingValueAcpt = Convert.ToInt32(ratingValue.Value);
                    string comment = txtComment.Text; // Lấy nội dung từ TextBox
                    string productId;
                    if (dbcontext.SanPhams.Any(s => s.MaSP == sp))
                    {
                        productId = sp; // Giả sử đây là ID của sản phẩm
                        string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
                        string initialCatalog = "QL_JPOPStore";
                        string sqlTK = "sa";
                        string sqlMK = "1";
                        string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";
                        // Tạo một kết nối đến cơ sở dữ liệu
                        using (SqlConnection conn = new SqlConnection(connectionString))
                        {
                            conn.Open();

                            // Tạo một câu lệnh SQL để thêm bình luận vào cơ sở dữ liệu
                            string sql = "INSERT INTO DanhGia (AvatarUser, MaSP, TenKH, NoiDung, NgayDG, RatingValue, DienThoai, Email, LuotThich, Anh1, Anh2, Anh3, Anh4, Anh5, Video) VALUES (@AvatarUser, @MaSP, @TenKH, @NoiDung, @NgayDG, @RatingValue, @DienThoai , @Email, @LuotThich, @Anh1, @Anh2, @Anh3, @Anh4, @Anh5, @Video)";

                            using (SqlCommand cmd = new SqlCommand(sql, conn))
                            {
                                cmd.Parameters.AddWithValue("@MaSP", productId);


                                cmd.Parameters.AddWithValue("@AvatarUser", Account.urlAvt);
                                cmd.Parameters.AddWithValue("@TenKH", khachHang.HoTen); // Giả sử tên khách hàng
                                cmd.Parameters.AddWithValue("@DienThoai", khachHang.DienThoai); // Giả sử tên khách hàng
                                cmd.Parameters.AddWithValue("@Email", khachHang.Email);

                                cmd.Parameters.AddWithValue("@LuotThich", 0);

                                //if (imagePaths.Length > 0)
                                //{
                                //    cmd.Parameters.AddWithValue("@Anh1", imagePaths[0]);

                                //    if (imagePaths.Length > 1) cmd.Parameters.AddWithValue("@Anh2", imagePaths[1]); ;
                                //    if (imagePaths.Length > 2) cmd.Parameters.AddWithValue("@Anh3", imagePaths[2]); ;
                                //    if (imagePaths.Length > 3) cmd.Parameters.AddWithValue("@Anh4", imagePaths[3]); ;
                                //    if (imagePaths.Length > 4) cmd.Parameters.AddWithValue("@Anh5", imagePaths[4]); ;
                                //}
                                //if (!string.IsNullOrEmpty(videoPath))
                                //{

                                //    cmd.Parameters.AddWithValue("@Video", videoPath);
                                //}

                                //if (imagePaths.Length > 0)
                                //{
                                //    cmd.Parameters.AddWithValue("@Anh1", imagePaths[0]);

                                //    if (imagePaths.Length > 1) cmd.Parameters.AddWithValue("@Anh2", imagePaths[1]);
                                //    else cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                //    if (imagePaths.Length > 2) cmd.Parameters.AddWithValue("@Anh3", imagePaths[2]);
                                //    else cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                //    if (imagePaths.Length > 3) cmd.Parameters.AddWithValue("@Anh4", imagePaths[3]);
                                //    else cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                //    if (imagePaths.Length > 4) cmd.Parameters.AddWithValue("@Anh5", imagePaths[4]);
                                //    else cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                //}
                                //else
                                //{
                                //    cmd.Parameters.AddWithValue("@Anh1", DBNull.Value);
                                //    cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                //    cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                //    cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                //    cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                //}
                                //if (!string.IsNullOrEmpty(videoPath))
                                //{

                                //    cmd.Parameters.AddWithValue("@Video", videoPath);
                                //}
                                //else
                                //{
                                //    cmd.Parameters.AddWithValue("@Video", DBNull.Value);
                                //}


                                if (fileUploadImages.HasFiles || fileUploadImages.HasFile)
                                {
                                    if (imagePaths.Length > 0)
                                    {
                                        cmd.Parameters.AddWithValue("@Anh1", imagePaths[0]);
                                        if (imagePaths.Length > 1) cmd.Parameters.AddWithValue("@Anh2", imagePaths[1]); else cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                        if (imagePaths.Length > 2) cmd.Parameters.AddWithValue("@Anh3", imagePaths[2]); else cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                        if (imagePaths.Length > 3) cmd.Parameters.AddWithValue("@Anh4", imagePaths[3]); else cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                        if (imagePaths.Length > 4) cmd.Parameters.AddWithValue("@Anh5", imagePaths[4]); else cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                    }
                                    else
                                    {
                                        cmd.Parameters.AddWithValue("@Anh1", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                    }
                                }
                                else
                                {
                                    cmd.Parameters.AddWithValue("@Anh1", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                    cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                }
                                if (fileUploadVideo.HasFile)
                                {

                                    cmd.Parameters.AddWithValue("@Video", video);




                                }
                                else
                                {
                                    cmd.Parameters.AddWithValue("@Video", DBNull.Value);
                                }



                                //cmd.Parameters.AddWithValue("@AvatarUser", "Content\\account-img\\KS.png");

                                //cmd.Parameters.AddWithValue("@TenKH", txtHoTen.Text); // Giả sử tên khách hàng
                                //imgClientCMT.ImageUrl = "Content\\account-img\\KS.png";
                                //cmd.Parameters.AddWithValue("@DienThoai", txtDienThoai.Text); // Giả sử tên khách hàng

                                cmd.Parameters.AddWithValue("@RatingValue", ratingValueAcpt);
                                cmd.Parameters.AddWithValue("@NoiDung", comment);
                                cmd.Parameters.AddWithValue("@NgayDG", DateTime.Now);

                                // Thực thi câu lệnh
                                cmd.ExecuteNonQuery();
                                LoadComments();

                            }
                        }
                        txtComment.Text = string.Empty; // Đặt giá trị của txtComment thành chuỗi trống

                        // Thông báo thành công
                        Response.Write("Bình luận của bạn đã được gửi!");

                    }
                }
            }
            else
            {
                if (txtEmail.Text.IsNullOrWhiteSpace() || txtDienThoai.Text.IsNullOrWhiteSpace() || txtHoTen.Text.IsNullOrWhiteSpace())
                {


                }
                else
                {
                    var hasRating = dbcontext.DanhGias.Any(s => (s.DienThoai == txtDienThoai.Text || s.Email == txtEmail.Text) && s.MaSP == sp);
                    if (hasRating)
                    {
                        using (var db = new QL_JPOPStoreEntities())
                        {
                            // Tìm DanhGia cần cập nhật
                            var danhGia = db.DanhGias.FirstOrDefault(d => (d.DienThoai == txtDienThoai.Text || d.Email == txtEmail.Text) && d.MaSP == sp);
                            if (danhGia != null)
                            {
                                danhGia.AvatarUser = "Content\\account-img\\admin.png";
                                // Cập nhật các trường cần thiết
                                danhGia.NoiDung = txtComment.Text; // Ví dụ: cập nhật nội dung bình luận
                                danhGia.RatingValue = Convert.ToInt32(ratingValue.Value); // Ví dụ: cập nhật giá trị đánh giá
                                if (fileUploadImages.HasFiles || fileUploadImages.HasFile)
                                {


                                    if (imagePaths.Length > 0)
                                    {
                                        danhGia.Anh1 = imagePaths[0];
                                        if (imagePaths.Length > 1) danhGia.Anh2 = imagePaths[1]; else danhGia.Anh2 = null;
                                        if (imagePaths.Length > 2) danhGia.Anh3 = imagePaths[2]; else danhGia.Anh3 = null;
                                        if (imagePaths.Length > 3) danhGia.Anh4 = imagePaths[3]; else danhGia.Anh4 = null;
                                        if (imagePaths.Length > 4) danhGia.Anh5 = imagePaths[4]; else danhGia.Anh5 = null;
                                    }
                                    else
                                    {
                                        danhGia.Anh1 = null;
                                        danhGia.Anh2 = null;
                                        danhGia.Anh3 = null;
                                        danhGia.Anh4 = null;
                                        danhGia.Anh5 = null;
                                    }
                                }
                                else
                                {
                                    danhGia.Anh1 = null;
                                    danhGia.Anh2 = null;
                                    danhGia.Anh3 = null;
                                    danhGia.Anh4 = null;
                                    danhGia.Anh5 = null;
                                }
                                if (fileUploadVideo.HasFile)
                                {

                                    danhGia.Video = video;

                                }
                                else
                                {
                                    danhGia.Video = null;
                                }




                                // Lưu thay đổi vào cơ sở dữ liệu
                                db.SaveChanges();
                            }
                        }
                    }
                    //Response.Redirect("Account.aspx");
                    else
                    {

                     
                        int ratingValueAcpt = Convert.ToInt32(ratingValue.Value);
                        string comment = txtComment.Text; // Lấy nội dung từ TextBox
                        string productId;
                        if (dbcontext.SanPhams.Any(s => s.MaSP == sp))
                        {
                            productId = sp; // Giả sử đây là ID của sản phẩm
                            string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
                            string initialCatalog = "QL_JPOPStore";
                            string sqlTK = "sa";
                            string sqlMK = "1";
                            string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";
                            // Tạo một kết nối đến cơ sở dữ liệu
                            using (SqlConnection conn = new SqlConnection(connectionString))
                            {
                                conn.Open();

                                // Tạo một câu lệnh SQL để thêm bình luận vào cơ sở dữ liệu
                                //string sql = "INSERT INTO DanhGia (AvatarUser, MaSP, TenKH, NoiDung, NgayDG, RatingValue, DienThoai, Email, LuotThich, Anh1, Anh2, Anh3, Anh4, Anh5, Video) VALUES (@AvatarUser, @MaSP, @TenKH, @NoiDung, @NgayDG, @RatingValue, @DienThoai, @Email, @LuotThich, @Anh1, @Anh2, @Anh3, @Anh4, @Anh5, @Video)";
                                string sql = "INSERT INTO DanhGia (AvatarUser, MaSP, TenKH, NoiDung, NgayDG, RatingValue, DienThoai, Email, LuotThich, Anh1, Anh2, Anh3, Anh4, Anh5, Video) VALUES (@AvatarUser, @MaSP, @TenKH, @NoiDung, @NgayDG, @RatingValue, @DienThoai, @Email, @LuotThich, @Anh1, @Anh2, @Anh3, @Anh4, @Anh5, @Video)";

                                using (SqlCommand cmd = new SqlCommand(sql, conn))
                                {
                                    cmd.Parameters.AddWithValue("@MaSP", productId);

                                    cmd.Parameters.AddWithValue("@AvatarUser", "Content\\account-img\\admin.png");

                                    cmd.Parameters.AddWithValue("@TenKH", txtHoTen.Text); // Giả sử tên khách hàng
                                    cmd.Parameters.AddWithValue("@DienThoai", txtDienThoai.Text); // Giả sử tên khách hàng
                                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                                    cmd.Parameters.AddWithValue("@RatingValue", ratingValueAcpt);
                                    cmd.Parameters.AddWithValue("@NoiDung", comment);
                                    cmd.Parameters.AddWithValue("@NgayDG", DateTime.Now);

                                    cmd.Parameters.AddWithValue("@LuotThich", 0);

                                    if (fileUploadImages.HasFiles || fileUploadImages.HasFile)
                                    {
                                        if (imagePaths.Length > 0)
                                        {
                                            cmd.Parameters.AddWithValue("@Anh1", imagePaths[0]);
                                            if (imagePaths.Length > 1) cmd.Parameters.AddWithValue("@Anh2", imagePaths[1]); else cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                            if (imagePaths.Length > 2) cmd.Parameters.AddWithValue("@Anh3", imagePaths[2]); else cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                            if (imagePaths.Length > 3) cmd.Parameters.AddWithValue("@Anh4", imagePaths[3]); else cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                            if (imagePaths.Length > 4) cmd.Parameters.AddWithValue("@Anh5", imagePaths[4]); else cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                        }
                                        else
                                        {
                                            cmd.Parameters.AddWithValue("@Anh1", DBNull.Value);
                                            cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                            cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                            cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                            cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                        }
                                    }
                                    else
                                    {
                                        cmd.Parameters.AddWithValue("@Anh1", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh2", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh3", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh4", DBNull.Value);
                                        cmd.Parameters.AddWithValue("@Anh5", DBNull.Value);
                                    }
                                    if (fileUploadVideo.HasFile)
                                    {

                                        cmd.Parameters.AddWithValue("@Video", video);


                                    }
                                    else
                                    {
                                        cmd.Parameters.AddWithValue("@Video", DBNull.Value);
                                    }



                                    // Thực thi câu lệnh
                                    cmd.ExecuteNonQuery();
                                    LoadComments();

                                }
                            }
                            txtComment.Text = string.Empty; // Đặt giá trị của txtComment thành chuỗi trống

                            // Thông báo thành công
                            Response.Write("Bình luận của bạn đã được gửi!");

                        }
                    }
                }

            }

            txtComment.Text = string.Empty;
            Response.Redirect(Request.RawUrl);
            //else
            //{
            //    productId = null;
            //}


        }


        public IQueryable<TH03_WebBanHang.Models.SanPham> GetPhones()
        {
            string url = HttpContext.Current.Request.Url.ToString();
            string sppopular = HttpContext.Current.Request.QueryString.Get("sp");
            string gp = HttpContext.Current.Request.QueryString.Get("gp");
            string ls = HttpContext.Current.Request.QueryString.Get("ls");

            string searchText = Request.QueryString["searchText"];

            // Kiểm tra xem searchText có giá trị hay không


            if (dbcontext.SanPhams.Any(p => p.SoLuongKho > 0 && p.MaNhom == gp || p.MaLoai == ls))
            {

                if (dbcontext.SanPhams.Any(p => p.SoLuongKho > 0 && p.MaNhom == gp && p.MaLoai == ls))
                {

                    return dbcontext.SanPhams.Where(p => p.MaLoai != "6" && p.MaNhom == gp && p.MaLoai == ls);

                }
                else if (gp != null && ls == "0")
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp);
                else if (gp != null && ls != null)
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp && p.MaLoai == ls);
                else if (dbcontext.SanPhams.Any(p => p.SoLuongKho > 0 && p.MaNhom == gp))
                {

                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp);
                }

                else if (dbcontext.SanPhams.Any(p => p.SoLuongKho > 0 && p.MaLoai == ls) && (gp == null || gp == ""))
                {
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls);
                }


                else if (ls == "0" && (gp != null || gp != ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp);
                else if (ls == "0" && (gp == null || gp == ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6");
                else if (ls == "0")
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6");
                else if (gp == null)
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6");

                else if (gp != null)
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp);
                else if (ls != null && (gp != null || gp != ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls && p.MaNhom == gp);
                else if (ls != null && (gp == null || gp == ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls);

                else
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6");

            }
            else
            {
                if (!string.IsNullOrEmpty(searchText))
                {
                    // Nếu có searchText, lọc sản phẩm theo MaLoai và TenSP
                    return dbcontext.SanPhams.Where(p => p.MaLoai != "6" && p.TenSP.Contains(searchText)).GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());
                }
                else if (sppopular == "popular")
                {
                    var chitietList = dbcontext.ChiTietDonHangs.Where(p => p.MaDH != null).ToList();
                    var maSPList = chitietList.Select(p => p.MaSP).ToList();

                    // Adjusted query to order by DoanhSo in descending order and take the top 5
                    var sanpham = dbcontext.SanPhams
                                           .Where(p => p.MaLoai != "6" && maSPList.Contains(p.MaSP))
                                           .OrderByDescending(p => p.DoanhSo)
                                           .Take(4);

                    return sanpham;
                }

                else if (sppopular == "new")
                {



                    var sanpham = dbcontext.SanPhams
                                           .Where(p => p.MaLoai != "6")
                                           .OrderByDescending(p => p.NgayNhap)
                                           .Take(4);

                    return sanpham;
                }

                else if (gp != null && ls != null)
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp && p.MaLoai == ls);
                else if (dbcontext.SanPhams.Any(p => p.SoLuongKho > 0 && p.MaLoai == ls))
                {
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls);
                }
                //else if (dbcontext.SanPhams.Any(p => p.SoLuongKho>0&& p.MaLoai == ls))
                //{

                //    return dbcontext.SanPhams.Where(p => p.MaLoai != "6" && p.MaLoai.Contains(ls) && p.MaNhom.Contains(gp));

                //}
                else if (gp != null && ls == "0")
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaNhom == gp);
                else if (ls == "0")
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6");
                else if (ls != null && (gp != null || gp != ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls && p.MaNhom == gp);
                else if (ls != null && (gp == null || gp == ""))
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && p.MaLoai == ls);

                //else if (ls != null)
                //    return dbcontext.SanPhams.Where(p => p.MaLoai != "6"&&p.MaLoai==ls);
                else
                {
                    return dbcontext.SanPhams.Where(p => p.SoLuongKho > 0 && p.MaLoai != "6" && (gp == "" || gp == null)).GroupBy(p => p.TenSP).Select(group => group.OrderBy(p => p.Gia).FirstOrDefault());

                }

            }

        }



        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<TH03_WebBanHang.Models.SanPham> GetDetails([QueryString("sp")] String sp)
        {

            IQueryable<SanPham> sanPhams = dbcontext.SanPhams.Where(p => p.MaSP == sp);

            //if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaLoai == "1" || p.MaLoai == "3"))
            //{
            //    Response.Write(" <style>\r\n                                #size{\r\n                                    display:flex;\r\n                                }\r\n                            </style>");
            //}
            //else Response.Write("<style>\r\n                                #size{\r\n                                    display:none;\r\n                                }\r\n                            </style>");
            //if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaNhom == "1")) { Response.Write(" <style>                                .sizeM {\r\n         background:#518ee0 !important;\r\n         border-color:#518ee0 !important;\r\n     }\r\n        .sizeL {\r\n         background:#fff0 !important;\r\n         border-color:#000 !important;\r\n     }\r\n </style>"); }
            //else if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaNhom == "2")) { Response.Write(" <style>                                .sizeL {\r\n         background:#518ee0 !important;\r\n         border-color:#518ee0 !important;\r\n     }\r\n        .sizeM {\r\n         background:#fff0 !important;\r\n         border-color:#000 !important;\r\n     }\r\n </style>"); }


            return sanPhams;
        }

        protected string IfNotNullOrEmpty(object value, string htmlIfNotNull)
        {
            if (value != null && !string.IsNullOrEmpty(value.ToString()))
            {
                return htmlIfNotNull;
            }
            return string.Empty;
        }

        public IQueryable<TH03_WebBanHang.Models.SanPhamData> GetImages([QueryString("sp")] String sp)
        {
            // Giả sử bạn muốn lấy tất cả các ảnh liên quan đến sản phẩm có MaSP tương ứng
            IQueryable<SanPhamData> sanPhamDatas = dbcontext.SanPhamDatas.Where(p => p.MaSP == sp);

            // Thực hiện các kiểm tra điều kiện nếu cần
            // Ví dụ: Kiểm tra xem sản phẩm có số lượng kho > 0 và thuộc loại hoặc nhóm nhất định
            // Lưu ý: Bạn cần đảm bảo rằng bạn có thể truy cập thông tin cần thiết từ SanPhamData
            // để thực hiện các kiểm tra này.

            // Trả về dữ liệu từ SanPhamData

            return sanPhamDatas;
        }

        public IQueryable<TH03_WebBanHang.Models.Nhom> GetGroups()
        {
            string gp = HttpContext.Current.Request.QueryString.Get("gp");

            IQueryable<Nhom> maGrp = dbcontext.Nhoms.Where(p => p.MaNhom == gp);

            //if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaLoai == "1" || p.MaLoai == "3"))
            //{
            //    Response.Write(" <style>\r\n                                #size{\r\n                                    display:flex;\r\n                                }\r\n                            </style>");
            //}
            //else Response.Write("<style>\r\n                                #size{\r\n                                    display:none;\r\n                                }\r\n                            </style>");
            //if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaNhom == "1")) { Response.Write(" <style>                                .sizeM {\r\n         background:#518ee0 !important;\r\n         border-color:#518ee0 !important;\r\n     }\r\n        .sizeL {\r\n         background:#fff0 !important;\r\n         border-color:#000 !important;\r\n     }\r\n </style>"); }
            //else if (SanPhams.Any(p => p.SoLuongKho>0&& p.MaNhom == "2")) { Response.Write(" <style>                                .sizeL {\r\n         background:#518ee0 !important;\r\n         border-color:#518ee0 !important;\r\n     }\r\n        .sizeM {\r\n         background:#fff0 !important;\r\n         border-color:#000 !important;\r\n     }\r\n </style>"); }


            return maGrp;
        }

        //public IQueryable<TH03_WebBanHang.Models.SanPham> GetTomping([QueryString("sp")] String sp)
        //{

        //        IQueryable<SanPham> Tomping = dbcontext.SanPhams.Where(p => p.MaLoai == "6");

        //    IQueryable<SanPham> TraSua = dbcontext.SanPhams.Where(p => p.MaLoai == "1");
        //    if (TraSua.Any(p => p.MaSP == sp))
        //    {
        //       masp = sp;
        //        return Tomping;
        //    }
        //    return null;


        //}
        //protected void cbTomping_CheckedChanged(object sender, EventArgs e)
        //{
        //    // Get the price of the selected topping
        //    CheckBox cb = (CheckBox)sender;
        //    SanPham topping = dbcontext.SanPhams.SingleOrDefault(p => p.MaLoai == "6");
        //    double toppingPrice = topping.Gia;

        //    // Get the price of the main product
        //    SanPham sanPhams = dbcontext.SanPhams.SingleOrDefault(p => p.MaSP == masp);
        //    double mainProductPrice = sanPhams.Gia;

        //    // Update the price of the main product
        //    if (cb.Checked)
        //    {
        //        // Add the price of the topping to the price of the main product
        //        mainProductPrice += toppingPrice;
        //    }
        //    else
        //    {
        //        // Subtract the price of the topping from the price of the main product
        //        mainProductPrice -= toppingPrice;
        //    }



        //        lbPrice.Text = string.Format("{0:N0}", mainProductPrice.ToString()) + "đ";


        //}

        /// <summary>
        /// Lấy giở hàng
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public List<ChiTietDonHang> LayGioHang()
        {
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<ChiTietDonHang>();
                Session["GioHang"] = lstGioHang;

            }
            return lstGioHang;


        }
        //int tomPing = 0;
        //protected void AddTomping_Click(object sender, EventArgs e)
        //{
        //    string idsp = HttpContext.Current.Request.QueryString.Get("sp");
        //    List<ChiTietDonHang> lstGioHang = LayGioHang();

        //    ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == idsp);
        //    SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
        //    tomPing  += 5000; 
        //}
        protected void AddToCart_Click(object sender, EventArgs e)
        {
            // Trở lại trang hiện tại
            string url = HttpContext.Current.Request.Url.ToString();
            //productDetail.DataItem.
            // Lấy giở hàng

            List<ChiTietDonHang> lstGioHang = LayGioHang();
            // 
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            var saP = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp && p.SoLuongKho > 0);
            var sanPhamCon1 = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp && p.SoLuongKho == 1);
            var saPA = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
            int soLuongCoThe;
            soLuongCoThe = saPA.SoLuongKho.Value - 1;
            ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == idsp);
            if (int.TryParse(txtSoLuong.Text, out int currentValue))
            {
                if (currentValue > soLuongCoThe)
                {
                    int soluongCon = saPA.SoLuongKho.Value;
                    txtSoLuong.Text = soluongCon.ToString();
                }
                else
                {
                    if (currentValue == 1)
                    {
                        if (chiTietDon == null && saP != null)
                        {
                            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
                            chiTietDon = new ChiTietDonHang();
                            chiTietDon.MaSP = idsp;
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong = 1;
                            }

                            chiTietDon.TenSP = sanPham.TenSP;
                            chiTietDon.DuongDan = sanPham.DuongDan;
                            chiTietDon.Gia = (double)sanPham.Gia;
                            chiTietDon.ThanhTien = (double)sanPham.Gia;
                            lstGioHang.Add(chiTietDon);
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;
                            Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                            Thread.Sleep(1500);

                            Response.Redirect(url);
                        }
                        else if (saP != null && sanPhamCon1 == null)
                        {
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong++;
                            }

                            chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;
                            Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                            Thread.Sleep(1500);

                            Response.Redirect(url);
                        }
                    }
                    else
                    {
                        if (chiTietDon == null && saP != null)
                        {
                            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
                            chiTietDon = new ChiTietDonHang();
                            chiTietDon.MaSP = idsp;
                            if (chiTietDon.SoLuong == soLuongCoThe || chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong = currentValue;
                            }

                            chiTietDon.TenSP = sanPham.TenSP;
                            chiTietDon.DuongDan = sanPham.DuongDan;
                            chiTietDon.Gia = (double)sanPham.Gia;
                            chiTietDon.ThanhTien = (double)sanPham.Gia;
                            lstGioHang.Add(chiTietDon);
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                            Thread.Sleep(1500);

                            Response.Redirect(url);
                        }
                        else if (saP != null && sanPhamCon1 == null)
                        {

                            if (chiTietDon.SoLuong == soLuongCoThe || chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong += currentValue;
                            }

                            chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Response.Write(" <script>\r\n        // Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click\r\n        const notification = document.getElementById('notification');\r\n\r\n       \r\n            // Hiển thị thông báo\r\n            notification.style.display = 'flex';\r\n\r\n            // Ẩn thông báo sau 2 giây\r\n            setTimeout(function () {\r\n                notification.style.display = 'none';\r\n            }, 2000);\r\n        \r\n    </script>");

                            Thread.Sleep(1500);

                            Response.Redirect(url);
                        }
                    }
                }


            }


        }

        protected void btnCart_Click(object sender, ImageClickEventArgs e)
        {
            // Trở lại trang hiện tại
            string url = HttpContext.Current.Request.Url.ToString();
            ImageButton btnCart = (ImageButton)sender;
            string itemMaSP = btnCart.CommandArgument;
            //productDetail.DataItem.
            // Lấy giở hàng
            var saP = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP && p.SoLuongKho > 0);


            List<ChiTietDonHang> lstGioHang = LayGioHang();
            // 
            //string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == itemMaSP);
            var sanPhamCon1 = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP && p.SoLuongKho == 1);

            if (chiTietDon == null && saP != null)
            {
                SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == itemMaSP);
                chiTietDon = new ChiTietDonHang();
                chiTietDon.MaSP = itemMaSP;
                chiTietDon.SoLuong = 1;
                chiTietDon.TenSP = sanPham.TenSP;
                chiTietDon.DuongDan = sanPham.DuongDan;
                chiTietDon.Gia = (double)sanPham.Gia;
                chiTietDon.ThanhTien = (double)sanPham.Gia;
                lstGioHang.Add(chiTietDon);
                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(url);
            }
            else if (saP != null && sanPhamCon1 == null)
            {
                chiTietDon.SoLuong++;
                chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                Session["GioHang"] = lstGioHang;
                Thread.Sleep(1500);

                Response.Redirect(url);
            }

        }

        protected void BuyNow_Click(object sender, EventArgs e)
        {
            // Trở lại trang hiện tại
            string url = HttpContext.Current.Request.Url.ToString();
            //productDetail.DataItem.
            // Lấy giở hàng
            List<ChiTietDonHang> lstGioHang = LayGioHang();
            // 
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            var saP = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp && p.SoLuongKho > 0);

            ChiTietDonHang chiTietDon = lstGioHang.Find(sp => sp.MaSP == idsp);
            var sanPhamCon1 = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp && p.SoLuongKho == 1);
            var saPA = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);

            int soLuongCoThe;
            soLuongCoThe = saPA.SoLuongKho.Value - 1;
            if (int.TryParse(txtSoLuong.Text, out int currentValue))
            {
                if (currentValue > soLuongCoThe)
                {
                    int soluongCon = saPA.SoLuongKho.Value;
                    txtSoLuong.Text = soluongCon.ToString();
                }
                else
                {
                    if (currentValue == 1)
                    {
                        if (chiTietDon == null && saP != null)
                        {
                            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
                            chiTietDon = new ChiTietDonHang();
                            chiTietDon.MaSP = idsp;
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong = 1;
                            }

                            chiTietDon.TenSP = sanPham.TenSP;
                            chiTietDon.DuongDan = sanPham.DuongDan;
                            chiTietDon.Gia = (double)sanPham.Gia;
                            chiTietDon.ThanhTien = (double)sanPham.Gia;
                            lstGioHang.Add(chiTietDon);
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Thread.Sleep(1500);
                            if (lstGioHang.Any(p => p.MaSP == idsp))
                            {
                                Response.Redirect("Pay.aspx");
                            }

                        }
                        else if (chiTietDon != null && saP != null && sanPhamCon1 == null)
                        {
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong++;
                            }

                            chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Thread.Sleep(1500);

                            Response.Redirect("Pay.aspx");

                        }
                    }
                    else
                    {
                        if (chiTietDon == null && saP != null)
                        {
                            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
                            chiTietDon = new ChiTietDonHang();
                            chiTietDon.MaSP = idsp;
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong = currentValue;
                            }

                            chiTietDon.TenSP = sanPham.TenSP;
                            chiTietDon.DuongDan = sanPham.DuongDan;
                            chiTietDon.Gia = (double)sanPham.Gia;
                            chiTietDon.ThanhTien = (double)sanPham.Gia;
                            lstGioHang.Add(chiTietDon);
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Thread.Sleep(1500);
                            if (lstGioHang.Any(p => p.MaSP == idsp))
                            {
                                Response.Redirect("Pay.aspx");
                            }

                        }
                        else if (chiTietDon != null && saP != null && sanPhamCon1 == null)
                        {
                            if (chiTietDon.SoLuong <= soLuongCoThe)
                            {
                                chiTietDon.SoLuong += currentValue;
                            }

                            chiTietDon.ThanhTien = chiTietDon.Gia * chiTietDon.SoLuong;
                            Session["GioHang"] = lstGioHang;
                            soLuongCoThe -= chiTietDon.SoLuong;

                            Thread.Sleep(1500);

                            Response.Redirect("Pay.aspx");

                        }
                    }
                }

            }


        }
        protected void SizeM_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.ToString();

            //Response.Write("<style>.sizeL{background-color:#fff;}.sizeM{background-color:red;}</style>");
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
            //SanPham sanPhamSize =dbcontext.SanPhams.FirstOrDefault(p=>p.MaSP != idsp&&p.TenSP==sanPham.TenSP&&p.Gia<=sanPham.Gia);
            //if (sanPhamSize != null)
            //{            SanPham sanPhamSL = dbcontext.SanPhams.Where(p => p.Gia <= sanPhamSize.Gia && p.TenSP == sanPhamSize.TenSP).FirstOrDefault();

            //    //Response.Write(" <style>                                .sizeM {\r\n         background:#518ee0 !important;\r\n         border-color:#518ee0 !important;\r\n     }\r\n        .sizeL {\r\n         background:#fff0 !important;\r\n         border-color:#000 !important;\r\n     }\r\n </style>");
            //    Response.Redirect("item.aspx?sp=" + sanPhamSL.MaSP);
            //}
            //else Response.Redirect(url);
            SanPham sanPhamSL = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP != idsp && p.TenSP == sanPham.TenSP && p.MaNhom == "1");
            if (sanPhamSL != null || sanPham.MaNhom != "1")
            {
                Response.Redirect("item.aspx?sp=" + sanPhamSL.MaSP);
            }
            else Response.Redirect(url);

        }
        protected void SizeL_Click(object sender, EventArgs e)
        {
            string url = HttpContext.Current.Request.Url.ToString();

            //Response.Write("<style>.sizeL{background-color:red;}.sizeM{background-color:#fff;}</style>");
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");
            SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
            //SanPham sanPhamSize = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP != idsp && p.TenSP == sanPham.TenSP && (p.Gia >= sanPham.Gia));
            //if (sanPhamSize != null)
            //{
            //SanPham sanPhamSL= dbcontext.SanPhams.Where(p => p.Gia>= sanPhamSize.Gia && p.TenSP == sanPhamSize.TenSP).FirstOrDefault();

            //    Response.Redirect("item.aspx?sp=" + sanPhamSL.MaSP);
            //}
            //else Response.Redirect(url);
            SanPham sanPhamSL = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP != idsp && p.TenSP == sanPham.TenSP && p.MaNhom == "2");
            if (sanPhamSL != null || sanPham.MaNhom != "2")
            {
                if (sanPhamSL != null)
                {
                    Response.Redirect("item.aspx?sp=" + sanPhamSL.MaSP);
                }
                else if (sanPhamSL == null)
                {
                    Response.Redirect(url); Response.Write("<script>alert('Sản phẩm không tồn tại');</script>");
                }
                else
                {
                    Response.Redirect(url); Response.Write("<script>alert('Sản phẩm không tồn tại');</script>");
                }

            }
            else
            {
                Response.Redirect(url); Response.Write("<script>alert('Sản phẩm không tồn tại');</script>");
            }
        }
        protected void productDetail_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {


            if (int.TryParse(txtSoLuong.Text, out int currentValue))
            {
                if (currentValue <= 0)
                {
                    int newValue = 1;
                    txtSoLuong.Text = newValue.ToString();
                }
                else
                {
                    int newValue = currentValue - 1;
                    txtSoLuong.Text = newValue.ToString();
                }


            }
            else
            {

                // Xử lý trường hợp không thể chuyển đổi giá trị
            }
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            string idsp = HttpContext.Current.Request.QueryString.Get("sp");

            var saPA = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == idsp);
            int soLuongCoThe;
            soLuongCoThe = saPA.SoLuongKho.Value - 1;
            if (int.TryParse(txtSoLuong.Text, out int currentValue))
            {
                if (currentValue > soLuongCoThe)
                {
                    int newValue = soLuongCoThe;
                    txtSoLuong.Text = newValue.ToString();
                    Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #3775ca,#336699) !important;}</style>");

                }
                else if (currentValue == saPA.SoLuongKho)
                {
                    txtSoLuong.Text = saPA.SoLuongKho.ToString();
                }
                else
                {
                    int newValue = currentValue + 1;
                    txtSoLuong.Text = newValue.ToString();
                    Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #3775ca,#336699) !important;}</style>");

                }


            }
            else
            {
                // Xử lý trường hợp không thể chuyển đổi giá trị
                Response.Write("<style>#divDetailProduct{background:linear-gradient(to right,#3775ca,#336699) !important;}</style>");

            }
        }
    }



}