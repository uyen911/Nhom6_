using QRCoder;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class PayQR : System.Web.UI.Page
    {
        public static int countQR = 1;
        public static string maDHQR;
        public static string maDH;
        public static int maKH;
        public static DateTime Ngay;
        private int GetMaTKFromSomeSource()
        {
            // Ví dụ: Giả sử bạn lấy giá trị MaTK từ phiên đăng nhập của người dùng
            if (Session["MaKH"] != null)
            {
                int maKH;
                if (int.TryParse(Session["MaKH"].ToString(), out maKH))
                {
                    return maKH;
                }
            }

            // Trong trường hợp không có giá trị MaTK nào được tìm thấy hoặc không hợp lệ, bạn có thể trả về một giá trị mặc định hoặc thực hiện xử lý khác tùy thuộc vào yêu cầu của ứng dụng của bạn.
            return 0; // Ví dụ: Trả về -1 nếu không có giá trị MaTK được tìm thấy
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();
            int makh = GetMaTKFromSomeSource(); // Giả định rằng bạn đã có phương thức này để lấy giá trị MaTK

            // Chuyển đổi giá trị MaTK thành chuỗi
            string kh = makh.ToString();

            ChiNhanh chiNhanh = new ChiNhanh();
            // Tăng giá trị count




            string ma = GenerateRandomString(4);
            if (makh != 0 && lstGioHang != null && lstGioHang.Any())
            {
                // Tạo một đơn hàng mới
                DonHang donHang = new DonHang
                {
                    DiaChiNN = Pay.Diachi,
                    MaDH = ma,
                    KH = makh,
                    Ngay = DateTime.Now,
                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                };
                maKH = (int)donHang.KH;
                Ngay= donHang.Ngay;
                //    donHang.MaDH = ma;
                ////donHang.MaKH = makh;

                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                //    donHang.KH = kh;

                //    // Tiếp tục xử lý khác ở đây...

                //donHang.Ngay = DateTime.Now;
                //donHang.MaCN = Shop.CH;
                //donHang.ChiTietDonHangs = lstGioHang;
                //donHang.MaKH = Account.makh;

                maDHQR = donHang.MaCN;
                maDH = donHang.MaDH;
             

            }
        

        string tong = hepler.TongThanhTien(lstGioHang).ToString();
          
            int.TryParse(Regex.Replace(tong, @"[^0-9]+", ""), out int amountTo);
            
            
            string orderId = ma + countQR.ToString() + maDHQR;
            lbMaDH.Text = orderId;
            lbTTDH.Text = orderId;
            lbSoTienThanhToan.Text = string.Format("{0:N0}", hepler.TongThanhTien(lstGioHang).ToString());
lbGiaDonHang.Text = string.Format("{0:N0}", hepler.TongThanhTien(lstGioHang).ToString());
            lbSoTienThanhToanSmall.Text = lbSoTienThanhToan.Text;

            //        < add key = "vietQRapiKey" value = "c80d2dd7-13a5-4ab2-9d8d-745da3356fad" />

            //< add key = "vietQRclientKey" value = "f46c9c31-d300-46d5-80c6-a92fd4079891" />

            //< add key = "vietQRreturn" value = "http://localhost:52718/Success.asp?GD=QR" />
            string vietQRlink = $"https://api.vietqr.io/image/970454-9021053350473-BIsgDhE.jpg?accountName=NGUYEN%20HOANG%20DUC&amount={amountTo}&returnUrl=http://localhost:52718/Success.asp?GD=QR";
            //string vietQRlink = $"https://sandbox.vnpayment.vn/token_ui/create-token.html?vnp_app_user_id={SignIn.makh}&vnp_cancel_url=http://localhost:52718/Pay.aspx&vnp_card_type=01&vnp_command=token_create&vnp_create_date={DateTime.Now}&vnp_ip_addr=192:168:1:11&vnp_locale=vi&vnp_return_url=http://localhost:52718/Success.asp?GD=QR&vnp_tmn_code=B9KOCLN0&vnp_txn_desc=Tao moi token&vnp_txn_ref=286&vnp_version=2.0.1&vnp_secure_hash={{value}}\r\n";

            Bitmap qrCodeImage = GenerateMomoQRCode(vietQRlink);
            imgMomoQRCode.ImageUrl = vietQRlink;
            //Response.Redirect(vietQRlink);
        }
        public Bitmap GenerateMomoQRCode(string vietQRlink)
        {
            string paymentInfo = $"{vietQRlink}";
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(paymentInfo, QRCodeGenerator.ECCLevel.Q);
            QRCode qrCode = new QRCode(qrCodeData);
            Bitmap qrCodeImage = qrCode.GetGraphic(20);

            return qrCodeImage;
        }
        private string GenerateRandomString(int length)
        {
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var random = new Random();
            var result = new string(
                Enumerable.Repeat(chars, length)
                          .Select(s => s[random.Next(s.Length)])
                          .ToArray());
            return result;
        }
        public byte[] ImageToByte(System.Drawing.Image img)
        {
            using (var ms = new MemoryStream())
            {
                img.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                return ms.ToArray();
            }
        }

        protected void CancelPaymentButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

    }
}