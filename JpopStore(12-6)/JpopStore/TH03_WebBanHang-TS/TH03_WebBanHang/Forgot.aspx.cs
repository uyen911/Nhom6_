using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;
using static System.Net.WebRequestMethods;

namespace TH03_WebBanHang
{
    public partial class Forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {




        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {

            //using (var db = new QL_JPOPStoreEntities())
            //{

            //    // input
            //    if (string.IsNullOrWhiteSpace(txtNameSignUp.Text) || string.IsNullOrWhiteSpace(txtEmailSignUp.Text) || string.IsNullOrWhiteSpace(txtPasswordSignUp.Text))
            //    {
            //        throw new Exception("All fields are required.");
            //    }

            //    // Check if email already exists
            //    var existingUser = db.TKs.FirstOrDefault(u => u.TenTaiKhoan == txtNameSignUp.Text);


            //    var existingPhone = db.KhachHangs.FirstOrDefault(s => s.DienThoai == TextPhone.Text);
            //    if (existingPhone != null)
            //    {
            //        throw new Exception("Phone already exists.");
            //    }



            //    if (existingUser != null)
            //    {
            //        throw new Exception("Email already exists.");
            //    }
            //    // Add new user to database
            //    var newUser = new TK
            //    {
            //        TenTaiKhoan = txtNameSignUp.Text,
            //        Email = txtEmailSignUp.Text,
            //        MatKhau = txtPasswordSignUp.Text,
            //        TrangThai = true,

            //    };


            //    db.SaveChanges();

            //    // Redirect to login page
            //    Response.Redirect("Default.aspx");
            //}


            string email = txtEmailSFogot.Text.Trim();

            using (var db = new QL_JPOPStoreEntities())
            {
                var user = db.TKs.FirstOrDefault(u => u.Email == email);

                if (user != null)
                {




                    if (txtMaKhoiPhuc.Text == Session["OTP"].ToString())
                    {
                        Response.Redirect("ChangePassword.aspx?Deptid=" + user.Email);

                    }
                    else if (txtMaKhoiPhuc.Text != Session["OTP"].ToString() || Session["OTP"].ToString() != txtMaKhoiPhuc.Text)
                    {
                        //Response.Write("<script>alert('Mã OTP không chính xác vui lòng thử lại!');</script>");
                        lbOTP.Text = "Mã OTP không chính xác vui lòng thử lại!";
                    }
                    else if (txtMaKhoiPhuc.Text == ""|| Session["OTP"]==null) lbOTP.Text = "Mã OTP không chính xác vui lòng thử lại!";

                    else
                    {

                        lbOTP.Text = "Mã OTP không chính xác vui lòng thử lại!";
                    }


                }
                else
                {

                    Response.Write("<script>alert('Tài khoản không tồn tại');</script>");
                }
            }

        }

        public string GenerateOTP(int length)
        {
            var random = new Random();
            var otp = new string(Enumerable.Repeat("0123456789", length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
            return otp;
        }
        public void SendEmail(string to, string subject, string body, string imagePath)
        {
            try
            {
                // Tạo một đối tượng SmtpClient
                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587)
                {
                    Credentials = new System.Net.NetworkCredential("2105ct0076@dhv.edu.vn", "emdeplam1"),
                    EnableSsl = true
                };

                // Tạo một đối tượng MailMessage
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("2105ct0076@dhv.edu.vn");
                mailMessage.To.Add(new MailAddress(to));
                mailMessage.Subject = subject;

                // Thêm hình ảnh vào email
                LinkedResource inline = new LinkedResource(imagePath, MediaTypeNames.Image.Jpeg);
                inline.ContentId = Guid.NewGuid().ToString(); // Đặt ContentId để tham chiếu đến hình ảnh trong HTML

                // Tạo nội dung HTML tùy chỉnh
                string htmlBody = $"<html><body><img style=\"max-width: 100%;  border-radius:20px; \" src='cid:{inline.ContentId}' alt='JPopStore' /><h1>Verify OTP</h1><p>Đây là mã OTP của bạn: <strong>{body}</strong>. Vui lòng không cung cấp mã này với bất kỳ ai!</p></body></html>";

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


        protected void btnGetOTP_Click(object sender, EventArgs e)
        {
            string otp = GenerateOTP(6);
            Session["OTP"] = otp;
            string email = txtEmailSFogot.Text.Trim();
            var db = new QL_JPOPStoreEntities();
            var user = db.TKs.FirstOrDefault(u => u.Email == email);
            string imagePath = Server.MapPath("Content\\logo\\jshop.png"); // Đường dẫn đến hình ảnh trên server

            if (user != null) SendEmail(user.Email, "OTP JPopStore", otp, imagePath);
            else {Response.Write("<script>alert('Tài khoản không tồn tại');</script>");}
        }
    }
}