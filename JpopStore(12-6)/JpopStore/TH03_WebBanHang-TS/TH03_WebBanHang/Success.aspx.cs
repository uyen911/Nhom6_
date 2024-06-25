﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.Mime;
using System.Security.Cryptography;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class Success : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public string mdh;
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
        //    Hepler hepler = new Hepler();
        //    var str = Request.QueryString["GD"].ToString();

        //    if (str == "TM")
        //    {
        //        mdh = Pay.madh;
        //    }
        //    else if (str == "Card") { mdh = PayCard.payOrder; }
        //    else if (str == "QR")
        //    {
        //        mdh = PayQR.payQR;
        //        foreach (var item in lstGioHang)
        //        {


        //            ChiTietDonHang chiTietDon = new ChiTietDonHang
        //            {
        //                KH = PayQR.maKH,
        //                MaDH = PayQR.payQR, // Sử dụng mã đơn hàng mới tạo
        //                MaCTDH = PayQR.payQR,
        //                MaSP = item.MaSP,
        //                TenSP = item.TenSP,
        //                DuongDan = item.DuongDan,
        //                SoLuong = item.SoLuong,
        //                Gia = item.Gia,
        //                ThanhTien = item.ThanhTien
        //            };

        //            //chiTietDon.KH = donHang.KH;
        //            //chiTietDon.MaDH = donHang.MaDH;
        //            //chiTietDon.MaCTDH = mact;
        //            //chiTietDon.MaSP = item.MaSP;
        //            //chiTietDon.TenSP = item.TenSP;
        //            //chiTietDon.DuongDan = item.DuongDan;
        //            //chiTietDon.SoLuong = item.SoLuong;
        //            //chiTietDon.Gia = item.Gia;
        //            //chiTietDon.ThanhTien = item.ThanhTien;
        //            chiTietDon.Ngay = PayQR.NgayQR;
        //            chiTietDon.GiaoDich = true;
        //            PayQR.countQR++;



        //            dbcontext.ChiTietDonHangs.Add(chiTietDon);

        //        }
        //    }
        //    ChiTietDonHang maDH = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == mdh);
        //    if (maDH != null)
        //    {
        //        lbMaDH.Text = maDH.MaCTDH;
        //        string madh = lbMaDH.Text;
        //        Session["MailMD"] = madh;
        //        string email = SignIn.email;
        //        var db = new QL_JPOPStoreEntities();
        //        var user = db.TKs.FirstOrDefault(u => u.Email == email);
        //        string imagePath = Server.MapPath("Content\\image-bg\\KS.png");


        //        Task.Run(() =>
        //        {

        //            System.Threading.Thread.Sleep(5000);


        //            SendEmail(user.Email, "JStore", madh, imagePath);
        //        });
        //    }
        //    else lbMaDH.Text = "";

        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            var str = Request.QueryString["GD"].ToString();
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();
            if (PayCard.maKH == null)
            {
                mdh = Pay.madh;
            }
            else { mdh = PayCard.payOrder; }

            if (str == "TM")
            {
                mdh = Pay.madh;
            }
            else if (str == "Card") { mdh = PayCard.payOrder; }
            else if (str == "QR")
            {
                mdh = PayQR.maDHQR;
                foreach (var item in lstGioHang)
                {


                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                    {
                        KH = PayQR.maKH,
                        MaDH = PayQR.maDH, // Sử dụng mã đơn hàng mới tạo
                        MaCTDH = PayQR.maDHQR,
                        MaSP = item.MaSP,
                        TenSP = item.TenSP,
                        DuongDan = item.DuongDan,
                        SoLuong = item.SoLuong,
                        Gia = item.Gia,
                        ThanhTien = item.ThanhTien
                    };

                    //chiTietDon.KH = donHang.KH;
                    //chiTietDon.MaDH = donHang.MaDH;
                    //chiTietDon.MaCTDH = mact;
                    //chiTietDon.MaSP = item.MaSP;
                    //chiTietDon.TenSP = item.TenSP;
                    //chiTietDon.DuongDan = item.DuongDan;
                    //chiTietDon.SoLuong = item.SoLuong;
                    //chiTietDon.Gia = item.Gia;
                    //chiTietDon.ThanhTien = item.ThanhTien;
                    chiTietDon.Ngay = PayQR.Ngay;
                    chiTietDon.GiaoDich = true;
                    PayQR.countQR++;



                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                }
            }
            ChiTietDonHang maDH = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == mdh);
            if (maDH != null)
            {
                
                lbMaDH.Text = maDH.MaCTDH;
                string madh = lbMaDH.Text;
                Session["MailMD"] = madh;
                string email = SignIn.email;
                lbMail.Text = email;
                var db = new QL_JPOPStoreEntities();
                var user = db.TKs.FirstOrDefault(u => u.Email == email);
                string imagePath = Server.MapPath("Content\\logo\\jshop.png");


                Task.Run(() =>
                {

                    System.Threading.Thread.Sleep(5000);

                    if(user!=null) SendEmail(user.Email, "JPopStore", madh, imagePath);
                    else SendEmail(Pay.emailKHnoSign, "JPopStore", madh, imagePath);
                });
            }
            else lbMaDH.Text = "";

        }
        public void SendEmail(string to, string subject, string body, string imagePath)
        {
            ChiTietDonHang maDH = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == mdh);

            ChiTietDonHang maCT = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == maDH.MaDH);
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
                string htmlBody = $"<html><body><img style=\"max-width: 100%; border-radius:20px;\" src='cid:{inline.ContentId}' alt='JPopStore' /><h1>Thông báo đơn hàng!</h1><p>Xin chào bạn đây là thông báo về đơn hàng với giá trị là {Pay.TongForMail}<p>Đơn hàng có mã <strong>{lbMaDH.Text}</strong> đã được chúng tôi xác nhận.{styleColor}<p>Vào lúc: {maDH.Ngay}</p></p><p>Cảm ơn vì bạn đã mua hàng.</p></body></html>";

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



    }
}