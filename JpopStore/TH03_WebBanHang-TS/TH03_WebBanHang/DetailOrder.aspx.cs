using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class DetailOrder : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        //public string emailKH;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var str = Request.QueryString["MaDH"].ToString();
                ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str);
                if (chitet.GiaoDich == true)
                {
                    Response.Write("<style>.text-gd{color:green;}</style>");
                }
                else { Response.Write("<style>.text-gd{color:red;}</style>"); }
               
                KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == chitet.KH);

                lbDeptid.Text = chitet.KH.ToString();
                if (deparments != null) { 
                    lbEmail.Text = deparments.Email;
                lbName.Text = deparments.HoTen;
                lbPhone.Text = deparments.DienThoai;
                lbLocate.Text = deparments.DiaChi;
                }

                else 
                {
                    var MaDhKHnoDN = dbcontext.DonHangs;
                    ChiTietDonHang Madon = new ChiTietDonHang();
                    KhachHang khnoS = new KhachHang();


                    if (MaDhKHnoDN.Any(p => p.MaDH== Madon.MaDH&&p.KH== khnoS.MaKH))
                    {
                        lbEmail.Text = khnoS.Email;
                        lbName.Text = khnoS.HoTen;
                        lbPhone.Text = khnoS.DienThoai;
                        lbLocate.Text = khnoS.DiaChi;
                    }
                    
                }
                lbMD.Text = chitet.MaCTDH;
                lbSP.Text = chitet.TenSP;
                lbSL.Text = chitet.SoLuong.ToString();
                lbGia.Text = chitet.Gia.ToString("N0") + "đ";
                lbThanhTien.Text = chitet.ThanhTien.ToString("N0") + "đ";
                lbImg.ImageUrl = chitet.DuongDan;
                lbSize.Text = chitet.SanPham.Nhom.TenNhom;
                //emailKH = deparments.Email;
                if (chitet.GiaoDich == true)
                {

                    Response.Write(" <style>                #btnXN {\r\n                    display:none;\r\n                }\r\n            </style>");
                    lbGiaoDich.Text = "Đã Thanh Toán";
                    lbGiaoDich.Style.Add(HtmlTextWriterStyle.Color, "green");

                }
                else
                {
                    var user = from u in dbcontext.TKs
                               select u;
                    if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || ((p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email)))
                    {
                        Response.Write(" <style>                #btnXN {\r\n                    display:block;\r\n                }\r\n            </style>");

                    }
                    else Response.Write(" <style>                #btnXN {\r\n                    display:none;\r\n                }\r\n            </style>");

                    lbGiaoDich.Text = "Đợi Thanh Toán";
                    lbGiaoDich.Style.Add(HtmlTextWriterStyle.Color, "red");
                }
                SanPham sanPhamSL = dbcontext.SanPhams.Where(p => p.MaSP != chitet.MaSP && p.TenSP == chitet.TenSP).FirstOrDefault();


            }
        }
        public void SendEmail(string to, string subject, string body, string imagePath)
        {
            var str = Request.QueryString["MaDH"].ToString();

            ChiTietDonHang maDH = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str);

            try
            {
                // Tạo một đối tượng SmtpClient
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new System.Net.NetworkCredential("2105ct0027@dhv.edu.vn", "P.uyen911"),
                    EnableSsl = true
                };

                // Tạo một đối tượng MailMessage
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("2105ct0027@dhv.edu.vn");
                mailMessage.To.Add(new MailAddress(to));
                mailMessage.Subject = subject;

                // Thêm hình ảnh vào email
                LinkedResource inline = new LinkedResource(imagePath, MediaTypeNames.Image.Jpeg);
                inline.ContentId = Guid.NewGuid().ToString(); // Đặt ContentId để tham chiếu đến hình ảnh trong HTML
                string styleColor;
                if (maDH.GiaoDich == true)
                {
                    styleColor = "<p>Giao dịch: <span style=\"color: green;\">Đã Thanh Toán</span></p>";
                }
                else styleColor = "<p>Giao dịch: <span style=\"color: red;\">Đợi Thanh Toán</span></p>";
                // Tạo nội dung HTML tùy chỉnh
                string htmlBody = $"<html><body><img style=\"max-width: 100%; border-radius:20px;\" src='cid:{inline.ContentId}' alt='JPopStore' /><h1>Thông báo đơn hàng!</h1><p>Xin chào bạn đây là thông báo về đơn hàng với mã là <strong>{maDH.MaDH}</strong> đã được chúng tôi xác nhận.{styleColor}<p>Vào lúc: {maDH.Ngay}</p></p><p>Cảm ơn vì bạn đã mua hàng.</p></body></html>";

                AlternateView avHtml = AlternateView.CreateAlternateViewFromString(htmlBody, null, MediaTypeNames.Text.Html);
                avHtml.LinkedResources.Add(inline);
                mailMessage.AlternateViews.Add(avHtml);

                // Gửi email
                smtpClient.Send(mailMessage);
                Console.WriteLine("Đã gửi email.");
            }
            catch (Exception ex)
            {
                Console.WriteLine("Lỗi khi gửi email: " + ex.Message);
            }
        }

        protected void btDone_Click(object sender, EventArgs e)
        {
            var str = Request.QueryString["MaDH"].ToString();
            ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == str);
            List<ChiTietDonHang> chiTietDonHangs = dbcontext.ChiTietDonHangs.Where(p => p.MaDH == str).ToList();

            KhachHang deparments = dbcontext.KhachHangs.SingleOrDefault(p => p.MaKH == chitet.KH);

            var db = new QL_JPOPStoreEntities();
            string imagePath = Server.MapPath("Content\\logo\\jshop.png");
            foreach (var item in chiTietDonHangs)
            {
                if (item.GiaoDich == false)
                {
                    item.GiaoDich = true;
                    // Gửi email cho mỗi đơn hàng cần xác nhận
                }
            }
            dbcontext.SaveChanges();
            db.SaveChanges();
            
            SendEmail(deparments.Email, "JStore", str, imagePath);

        }


    }
}