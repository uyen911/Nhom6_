using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class PayCard : System.Web.UI.Page
    {
        public static string payOrder;
        public static string maKH;
        public static string MaDHXNGD;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();

            amount.Text = string.Format("{0:N0}", hepler.TongThanhTien(lstGioHang).ToString());

            if (!IsPostBack)
            {

                // Khôi phục giá trị count từ session nếu có
                if (Session["Count"] != null)
                {
                    int count = (int)Session["Count"];
                    ViewState["Count"] = count;
                }


            }
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;

            var db = new QL_JPOPStoreEntities();

            if (user.Any(p => (p.TrangThai == true && p.Email == SignIn.email)) && Session["GioHang"] != null)
            {
                //user.SingleOrDefault(p => p.MaTK==makh); 



                // user.Any(p =>p.MaTK == makh);


            }
            // Otherwise, display an error message

            else
            {



            }
        }
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();

        public double DoanhThuNgay { get; private set; }

        // Phương thức giả định để lấy giá trị MaTK từ một nguồn nào đó
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
        protected void btnPay_Click(object sender, EventArgs e)
        {
            string MaDH = null;
            double ThanhTien = 0;

            if (string.IsNullOrEmpty(cardUser.Text) ||
        string.IsNullOrEmpty(cardNumber.Text) ||
        string.IsNullOrEmpty(cardCVC.Text) ||
        string.IsNullOrEmpty(cardExpiry.Text))
            {
                //Response.Write("<script>alert('Bạn chưa nhập đủ thông tin thẻ!');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn chưa nhập đủ thông tin thẻ!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

            }
            else
            {
                // Nếu tất cả các trường dữ liệu được nhập, tiếp tục xử lý thanh toán
                // Viết mã xử lý thanh toán ở đây

                int makh = GetMaTKFromSomeSource(); // Giả định rằng bạn đã có phương thức này để lấy giá trị MaTK

                // Chuyển đổi giá trị MaTK thành chuỗi
                string kh = makh.ToString();

                ChiNhanh chiNhanh = new ChiNhanh();
                // Tăng giá trị count


                // Lưu giá trị count vào session
                string url = HttpContext.Current.Request.Url.ToString();
                List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
                //DonHang donHang = new DonHang();

                string ma = GenerateRandomString(6);
                if (lstGioHang != null && lstGioHang.Any())
                {
                    var user = from u in dbcontext.KhachHangs
                               select u;

                    var tk = from u in dbcontext.TKs select u;

                    var hadUser = tk.Any(p => p.Email == Pay.emailKHnoSign && (p.MatKhau != null || p.MatKhau != ""));
                    var hadClient = user.Any(p => p.Email == Pay.emailKHnoSign && (p.MatKhau != null || p.MatKhau != ""));
                    var hadClientNonPass = user.Any(s => s.Email == Pay.emailKHnoSign && (s.MatKhau == null || s.MatKhau == ""));


                    if (SignIn.email == null)
                    {
                        using (var db = new QL_JPOPStoreEntities())
                        {
                            // Kiểm tra giá trị trước khi thêm vào cơ sở dữ liệu
                            if ((!hadUser && !hadClient && !hadClientNonPass) /*&& !string.IsNullOrEmpty(Pay.emailKHnoSign) && !string.IsNullOrEmpty(Pay.DienThoaiKHnoSign) && !string.IsNullOrEmpty(Pay.DiaChiKHnoSign) && !string.IsNullOrEmpty(Pay.emailKHnoSign)*/)
                            {
                                var newUser = new TK
                                {
                                    Email = Pay.emailKHnoSign,
                                    MatKhau = null,
                                    TrangThai = false,



                                };
                                var newClient = new KhachHang
                                {
                                    AvatarUser = null,
                                    HoTen = Pay.HotenKHnoSign,
                                    DienThoai = Pay.DienThoaiKHnoSign,
                                    DiaChi = Pay.DiaChiNN,
                                    Email = Pay.emailKHnoSign,
                                    GioiTinh = null, // Kiểm tra và đặt giá trị hợp lệ
                                    MatKhau = null, // Kiểm tra và đặt giá trị hợp lệ
                                    TrangThai = false,
                                    Diem = 0,
                                };
                                //db.TKs.Add(newUser);

                                //db.KhachHangs.Add(newClient);
                                //db.SaveChanges();
                                db.TKs.Add(newUser);

                                db.KhachHangs.Add(newClient);
                                db.SaveChanges();

                                //db.TKs.Add(newUser);

                                //db.KhachHangs.Add(newClient);
                                //db.SaveChanges();
                                // Tạo một đơn hàng mới
                                string makhno;
                                makhno = newClient.MaKH.ToString();
                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,


                                    DiaChiNN = Pay.Diachi,


                                    KH = newClient.MaKH,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };
                                //    donHang.MaDH = ma;
                                ////donHang.MaKH = makh;

                                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                                //    donHang.KH = kh;

                                //    // Tiếp tục xử lý khác ở đây...

                                //donHang.Ngay = DateTime.Now;
                                //donHang.MaCN = Shop.CH;
                                //donHang.ChiTietDonHangs = lstGioHang;
                                //donHang.MaKH = Account.makh;

                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,
                                        



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
                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong; var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh); double diem = chiTietDon.ThanhTien / 200000;
                                    if (khachmua != null)
                                    {

                                        khachmua.Diem = khachmua.Diem + (int)diem;
                                    }
                                    else
                                    {
                                        var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                        khachHad.Diem = khachHad.Diem + (int)diem;
                                    }
                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();


                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                                }
                                // Thêm thông báo thành công hoặc xử lý kết quả khác

                            }
                            else
                            {
                                var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);

                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,

                                    DiaChiNN = Pay.Diachi,

                                    KH = khachmua.MaKH,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };


                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,
                                        

                                    };

                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong;
                                    double diem = chiTietDon.ThanhTien / 200000;
                                    if (khachmua != null)
                                    {

                                        khachmua.Diem = khachmua.Diem + (int)diem;
                                    }
                                    else
                                    {
                                        var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                        khachHad.Diem = khachHad.Diem + (int)diem;
                                    }
                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();


                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);




                                }

                            }
                            db.SaveChanges();
                        }

                    }
                    else if (hadUser && hadClient && !hadClientNonPass)
                    {
                        using (var db = new QL_JPOPStoreEntities())
                        {
                            if (SignIn.email != null && user.Any(p => p.Email == SignIn.email))
                            {
                                // Tạo một đơn hàng mới
                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,
                                    DiaChiNN = Pay.Diachi,


                                    KH = makh,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };
                                //    donHang.MaDH = ma;
                                ////donHang.MaKH = makh;

                                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                                //    donHang.KH = kh;

                                //    // Tiếp tục xử lý khác ở đây...

                                //donHang.Ngay = DateTime.Now;
                                //donHang.MaCN = Shop.CH;
                                //donHang.ChiTietDonHangs = lstGioHang;
                                //donHang.MaKH = Account.makh;

                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,

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

                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong; var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh); double diem = chiTietDon.ThanhTien / 200000;
                                    if (khachmua != null)
                                    {

                                        khachmua.Diem = khachmua.Diem + (int)diem;
                                    }
                                    else
                                    {
                                        var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                        khachHad.Diem = khachHad.Diem + (int)diem;
                                    }
                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();


                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);




                                }
                            }
                            else
                            {
                                var khHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                string khHadMaKH = khHad.MaKH.ToString();
                                // Tạo một đơn hàng mới
                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,

                                    DiaChiNN = Pay.Diachi,

                                    KH = khHad.MaKH,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };
                                //    donHang.MaDH = ma;
                                ////donHang.MaKH = makh;

                                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                                //    donHang.KH = kh;

                                //    // Tiếp tục xử lý khác ở đây...

                                //donHang.Ngay = DateTime.Now;
                                //donHang.MaCN = Shop.CH;
                                //donHang.ChiTietDonHangs = lstGioHang;
                                //donHang.MaKH = Account.makh;

                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,

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
                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong;
                                    var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh);
                                    double diem = chiTietDon.ThanhTien / 200000;


                                    if (khHad.Diem != null)
                                        khHad.Diem = khHad.Diem + (int)diem;
                                    else
                                    {
                                        khHad.Diem = 0;
                                        khHad.Diem = khHad.Diem + (int)diem;

                                    }




                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();
                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                                }
                            }
                            db.SaveChanges();
                        }
                    }
                    else
                    {
                        using (var db = new QL_JPOPStoreEntities())
                        {
                            if (hadClientNonPass)
                            {
                                var khHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                string khHadMaKH = khHad.MaKH.ToString();
                                // Tạo một đơn hàng mới
                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,
                                    DiaChiNN = Pay.Diachi,


                                    KH = khHad.MaKH,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };
                                //    donHang.MaDH = ma;
                                ////donHang.MaKH = makh;

                                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                                //    donHang.KH = kh;

                                //    // Tiếp tục xử lý khác ở đây...

                                //donHang.Ngay = DateTime.Now;
                                //donHang.MaCN = Shop.CH;
                                //donHang.ChiTietDonHangs = lstGioHang;
                                //donHang.MaKH = Account.makh;

                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,
                                        
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
                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong;
                                    var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh);
                                    double diem = chiTietDon.ThanhTien / 200000;


                                    if (khHad.Diem != null)
                                        khHad.Diem = khHad.Diem + (int)diem;
                                    else
                                    {
                                        khHad.Diem = 0;
                                        khHad.Diem = khHad.Diem + (int)diem;

                                    }




                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();
                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                                }
                            }

                            else
                            {
                                var newUser = new TK
                                {
                                    Email = Pay.emailKHnoSign,
                                    MatKhau = null,
                                    TrangThai = false,



                                };
                                var newClient = new KhachHang
                                {
                                    AvatarUser = null,
                                    HoTen = Pay.HotenKHnoSign,
                                    DienThoai = Pay.DienThoaiKHnoSign,
                                    DiaChi = Pay.DiaChiNN,
                                    Email = Pay.emailKHnoSign,
                                    GioiTinh = null, // Kiểm tra và đặt giá trị hợp lệ
                                    MatKhau = null, // Kiểm tra và đặt giá trị hợp lệ
                                    TrangThai = false,
                                    Diem = 0,
                                };
                                //db.TKs.Add(newUser);

                                //db.KhachHangs.Add(newClient);
                                //db.SaveChanges();
                                db.TKs.Add(newUser);

                                db.KhachHangs.Add(newClient);
                                db.SaveChanges();

                                //db.TKs.Add(newUser);

                                //db.KhachHangs.Add(newClient);
                                //db.SaveChanges();
                                // Tạo một đơn hàng mới
                                string makhno;
                                makhno = newClient.MaKH.ToString();
                                DonHang donHang = new DonHang
                                {
                                    MaDH = ma,

                                    DiaChiNN = Pay.Diachi,



                                    KH = newClient.MaKH,
                                    Ngay = DateTime.Now,
                                    MaCN = Shop.CH // Shop.CH là mã chi nhánh
                                };
                                //    donHang.MaDH = ma;
                                ////donHang.MaKH = makh;

                                //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
                                //    donHang.KH = kh;

                                //    // Tiếp tục xử lý khác ở đây...

                                //donHang.Ngay = DateTime.Now;
                                //donHang.MaCN = Shop.CH;
                                //donHang.ChiTietDonHangs = lstGioHang;
                                //donHang.MaKH = Account.makh;

                                dbcontext.DonHangs.Add(donHang);

                                string maDonHang = donHang.MaDH;
                                MaDHXNGD = donHang.MaDH;
                                int count = 1;
                                foreach (var item in lstGioHang)
                                {
                                    string mact = maDonHang + count.ToString() + donHang.MaCN;

                                    ChiTietDonHang chiTietDon = new ChiTietDonHang
                                    {
                                        KH = donHang.KH,
                                        MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
                                        MaCTDH = mact,
                                        MaSP = item.MaSP,
                                        TenSP = item.TenSP,
                                        DuongDan = item.DuongDan,
                                        SoLuong = item.SoLuong,
                                        Gia = item.Gia,
                                        ThanhTien = item.ThanhTien,
                                        



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
                                    var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
                                    sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong; var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh); double diem = chiTietDon.ThanhTien / 200000;
                                    if (khachmua != null)
                                    {

                                        khachmua.Diem = khachmua.Diem + (int)diem;
                                    }
                                    else
                                    {
                                        var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
                                        khachHad.Diem = khachHad.Diem + (int)diem;
                                    }
                                    chiTietDon.Ngay = donHang.Ngay;
                                    chiTietDon.GiaoDich = true;
                                    ThanhTien = chiTietDon.ThanhTien;
                                    MaDH = chiTietDon.MaDH;
                                    count++;
                                    payOrder = donHang.MaDH;
                                    maKH = donHang.KH.ToString();


                                    dbcontext.ChiTietDonHangs.Add(chiTietDon);

                                }
                            }
                            db.SaveChanges();
                        }

                    }


                }

                
                

                dbcontext.SaveChanges();
                //lstGioHang.Clear();
                //Session["GioHang"] = lstGioHang;
                //Response.Redirect("Success.aspx?GD=Card");

                if (MaDHXNGD != null)
                {
                    lstGioHang.Clear();
                    Session["GioHang"] = lstGioHang;
                    Response.Redirect("OrderNotification.aspx?GD=Card");
                }
                else
                {
                    Response.Redirect("OrderNotification.aspx?GD=Refuse");
                }


            }
        }


        //protected void btnPay_Click(object sender, EventArgs e)
        //{
        //    string MaDH = null;
        //    double ThanhTien = 0;

        //    if (string.IsNullOrEmpty(cardUser.Text) ||
        //string.IsNullOrEmpty(cardNumber.Text) ||
        //string.IsNullOrEmpty(cardCVC.Text) ||
        //string.IsNullOrEmpty(cardExpiry.Text))
        //    {
        //        //Response.Write("<script>alert('Bạn chưa nhập đủ thông tin thẻ!');</script>");
        //        Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn chưa nhập đủ thông tin thẻ!</div>");
        //        Response.Write("<script type=\"text/javascript\">");
        //        Response.Write("setTimeout(function() {");
        //        Response.Write("var elements = document.getElementsByClassName('alert');");
        //        Response.Write("for (var i = 0; i < elements.length; i++) {");
        //        Response.Write("elements[i].style.display = 'none';");
        //        Response.Write("}");
        //        Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
        //        Response.Write("</script>");

        //    }
        //    else
        //    {
        //        // Nếu tất cả các trường dữ liệu được nhập, tiếp tục xử lý thanh toán
        //        // Viết mã xử lý thanh toán ở đây

        //        int makh = GetMaTKFromSomeSource(); // Giả định rằng bạn đã có phương thức này để lấy giá trị MaTK

        //        // Chuyển đổi giá trị MaTK thành chuỗi
        //        string kh = makh.ToString();

        //        ChiNhanh chiNhanh = new ChiNhanh();
        //        // Tăng giá trị count


        //        // Lưu giá trị count vào session
        //        string url = HttpContext.Current.Request.Url.ToString();
        //        List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
        //        //DonHang donHang = new DonHang();

        //        string ma = GenerateRandomString(4);
        //        if (lstGioHang != null && lstGioHang.Any())
        //        {
        //            var user = from u in dbcontext.TKs
        //                       select u;
        //            var hadUser = user.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
        //            if (SignIn.email == null && hadUser == null && user.Any(p => p.Email != Pay.emailKHnoSign))
        //            {
        //                using (var db = new QL_JPOPStoreEntities())
        //                {
        //                    // Kiểm tra giá trị trước khi thêm vào cơ sở dữ liệu
        //                    if (!string.IsNullOrEmpty(Pay.emailKHnoSign) && !string.IsNullOrEmpty(Pay.DienThoaiKHnoSign) && !string.IsNullOrEmpty(Pay.DiaChiKHnoSign) && !string.IsNullOrEmpty(Pay.emailKHnoSign))
        //                    {
        //                        var newUser = new TK
        //                        {
        //                            Email = Pay.emailKHnoSign,
        //                            MatKhau = null,
        //                            TrangThai = false,



        //                        };
        //                        var newClient = new KhachHang
        //                        {
        //                            HoTen = Pay.HotenKHnoSign,
        //                            DienThoai = Pay.DienThoaiKHnoSign,
        //                            DiaChi = Pay.DiaChiKHnoSign,
        //                            Email = Pay.emailKHnoSign,
        //                            GioiTinh = null, // Kiểm tra và đặt giá trị hợp lệ
        //                            MatKhau = null, // Kiểm tra và đặt giá trị hợp lệ
        //                            TrangThai = false,
        //                            Diem = 0,
        //                        };
        //                        //db.TKs.Add(newUser);

        //                        //db.KhachHangs.Add(newClient);
        //                        //db.SaveChanges();
        //                        db.TKs.Add(newUser);

        //                        db.KhachHangs.Add(newClient);
        //                        db.SaveChanges();
        //                        try
        //                        {
        //                            //db.TKs.Add(newUser);

        //                            //db.KhachHangs.Add(newClient);
        //                            //db.SaveChanges();
        //                            // Tạo một đơn hàng mới
        //                            string makhno;
        //                            makhno = newClient.MaKH.ToString();
        //                            DonHang donHang = new DonHang
        //                            {
        //                                MaDH = ma,


        //                                KH = newClient.MaKH,
        //                                Ngay = DateTime.Now,
        //                                MaCN = Shop.CH // Shop.CH là mã chi nhánh
        //                            };
        //                            //    donHang.MaDH = ma;
        //                            ////donHang.MaKH = makh;

        //                            //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
        //                            //    donHang.KH = kh;

        //                            //    // Tiếp tục xử lý khác ở đây...

        //                            //donHang.Ngay = DateTime.Now;
        //                            //donHang.MaCN = Shop.CH;
        //                            //donHang.ChiTietDonHangs = lstGioHang;
        //                            //donHang.MaKH = Account.makh;

        //                            dbcontext.DonHangs.Add(donHang);
        //                            dbcontext.SaveChanges();
        //                            string maDonHang = donHang.MaDH;
        //                            MaDHXNGD = donHang.MaDH;
        //                            int count = 1;
        //                            foreach (var item in lstGioHang)
        //                            {
        //                                string mact = maDonHang + count.ToString() + donHang.MaCN;

        //                                ChiTietDonHang chiTietDon = new ChiTietDonHang
        //                                {
        //                                    KH = donHang.KH,
        //                                    MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
        //                                    MaCTDH = mact,
        //                                    MaSP = item.MaSP,
        //                                    TenSP = item.TenSP,
        //                                    DuongDan = item.DuongDan,
        //                                    SoLuong = item.SoLuong,
        //                                    Gia = item.Gia,
        //                                    ThanhTien = item.ThanhTien
        //                                };

        //                                //chiTietDon.KH = donHang.KH;
        //                                //chiTietDon.MaDH = donHang.MaDH;
        //                                //chiTietDon.MaCTDH = mact;
        //                                //chiTietDon.MaSP = item.MaSP;
        //                                //chiTietDon.TenSP = item.TenSP;
        //                                //chiTietDon.DuongDan = item.DuongDan;
        //                                //chiTietDon.SoLuong = item.SoLuong;
        //                                //chiTietDon.Gia = item.Gia;
        //                                //chiTietDon.ThanhTien = item.ThanhTien;
        //                                var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
        //                                sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong; var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh); double diem = chiTietDon.ThanhTien / 200000;
        //                                if (khachmua != null)
        //                                {

        //                                    khachmua.Diem = khachmua.Diem + (int)diem;
        //                                }
        //                                else
        //                                {
        //                                    var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
        //                                    khachHad.Diem = khachHad.Diem + (int)diem;
        //                                }
        //                                chiTietDon.Ngay = donHang.Ngay;
        //                                chiTietDon.GiaoDich = true;
        //                                ThanhTien = chiTietDon.ThanhTien;
        //                                MaDH = chiTietDon.MaDH;
        //                                count++;
        //                                payOrder = donHang.MaDH;
        //                                maKH = donHang.KH.ToString();


        //                                dbcontext.ChiTietDonHangs.Add(chiTietDon);

        //                            }
        //                            // Thêm thông báo thành công hoặc xử lý kết quả khác
        //                        }
        //                        catch (Exception ex)
        //                        {
        //                            // Xử lý lỗi, ví dụ: hiển thị thông báo lỗi
        //                            Console.WriteLine("Lỗi khi thêm khách hàng: " + ex.Message);
        //                        }
        //                    }
        //                    else
        //                    {
        //                        // Xử lý trường hợp không có giá trị nhập vào
        //                    }
        //                }

        //            }
        //            else if (hadUser != null && ((user.Any(p => p.Email == Pay.emailKHnoSign && p.MatKhau != null)) || (SignIn.email != null && user.Any(p => p.Email == SignIn.email))))
        //            {
        //                if (SignIn.email != null && user.Any(p => p.Email == SignIn.email))
        //                {
        //                    // Tạo một đơn hàng mới
        //                    DonHang donHang = new DonHang
        //                    {
        //                        MaDH = ma,
        //                        KH = makh,
        //                        Ngay = DateTime.Now,
        //                        MaCN = Shop.CH // Shop.CH là mã chi nhánh
        //                    };
        //                    //    donHang.MaDH = ma;
        //                    ////donHang.MaKH = makh;

        //                    //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
        //                    //    donHang.KH = kh;

        //                    //    // Tiếp tục xử lý khác ở đây...

        //                    //donHang.Ngay = DateTime.Now;
        //                    //donHang.MaCN = Shop.CH;
        //                    //donHang.ChiTietDonHangs = lstGioHang;
        //                    //donHang.MaKH = Account.makh;

        //                    dbcontext.DonHangs.Add(donHang);
        //                    dbcontext.SaveChanges();
        //                    string maDonHang = donHang.MaDH;
        //                    MaDHXNGD = donHang.MaDH;
        //                    int count = 1;
        //                    foreach (var item in lstGioHang)
        //                    {
        //                        string mact = maDonHang + count.ToString() + donHang.MaCN;

        //                        ChiTietDonHang chiTietDon = new ChiTietDonHang
        //                        {
        //                            KH = donHang.KH,
        //                            MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
        //                            MaCTDH = mact,
        //                            MaSP = item.MaSP,
        //                            TenSP = item.TenSP,
        //                            DuongDan = item.DuongDan,
        //                            SoLuong = item.SoLuong,
        //                            Gia = item.Gia,
        //                            ThanhTien = item.ThanhTien
        //                        };

        //                        //chiTietDon.KH = donHang.KH;
        //                        //chiTietDon.MaDH = donHang.MaDH;
        //                        //chiTietDon.MaCTDH = mact;
        //                        //chiTietDon.MaSP = item.MaSP;
        //                        //chiTietDon.TenSP = item.TenSP;
        //                        //chiTietDon.DuongDan = item.DuongDan;
        //                        //chiTietDon.SoLuong = item.SoLuong;
        //                        //chiTietDon.Gia = item.Gia;
        //                        //chiTietDon.ThanhTien = item.ThanhTien;

        //                        var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
        //                        sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong; var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh); double diem = chiTietDon.ThanhTien / 200000;
        //                        if (khachmua != null)
        //                        {

        //                            khachmua.Diem = khachmua.Diem + (int)diem;
        //                        }
        //                        else
        //                        {
        //                            var khachHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
        //                            khachHad.Diem = khachHad.Diem + (int)diem;
        //                        }
        //                        chiTietDon.Ngay = donHang.Ngay;
        //                        chiTietDon.GiaoDich = true;
        //                        ThanhTien = chiTietDon.ThanhTien;
        //                        MaDH = chiTietDon.MaDH;
        //                        count++;
        //                        payOrder = donHang.MaDH;
        //                        maKH = donHang.KH.ToString();


        //                        dbcontext.ChiTietDonHangs.Add(chiTietDon);




        //                    }
        //                }
        //                else
        //                {
        //                    var khHad = dbcontext.KhachHangs.FirstOrDefault(p => p.Email == Pay.emailKHnoSign);
        //                    string khHadMaKH = khHad.MaKH.ToString();
        //                    // Tạo một đơn hàng mới
        //                    DonHang donHang = new DonHang
        //                    {
        //                        MaDH = ma,
        //                        KH = khHad.MaKH,
        //                        Ngay = DateTime.Now,
        //                        MaCN = Shop.CH // Shop.CH là mã chi nhánh
        //                    };
        //                    //    donHang.MaDH = ma;
        //                    ////donHang.MaKH = makh;

        //                    //    // Gán giá trị MaTK cho trường KH của đối tượng DonHang
        //                    //    donHang.KH = kh;

        //                    //    // Tiếp tục xử lý khác ở đây...

        //                    //donHang.Ngay = DateTime.Now;
        //                    //donHang.MaCN = Shop.CH;
        //                    //donHang.ChiTietDonHangs = lstGioHang;
        //                    //donHang.MaKH = Account.makh;

        //                    dbcontext.DonHangs.Add(donHang);
        //                    dbcontext.SaveChanges();
        //                    string maDonHang = donHang.MaDH;
        //                    MaDHXNGD = donHang.MaDH;
        //                    int count = 1;
        //                    foreach (var item in lstGioHang)
        //                    {
        //                        string mact = maDonHang + count.ToString() + donHang.MaCN;

        //                        ChiTietDonHang chiTietDon = new ChiTietDonHang
        //                        {
        //                            KH = donHang.KH,
        //                            MaDH = donHang.MaDH, // Sử dụng mã đơn hàng mới tạo
        //                            MaCTDH = mact,
        //                            MaSP = item.MaSP,
        //                            TenSP = item.TenSP,
        //                            DuongDan = item.DuongDan,
        //                            SoLuong = item.SoLuong,
        //                            Gia = item.Gia,
        //                            ThanhTien = item.ThanhTien
        //                        };

        //                        //chiTietDon.KH = donHang.KH;
        //                        //chiTietDon.MaDH = donHang.MaDH;
        //                        //chiTietDon.MaCTDH = mact;
        //                        //chiTietDon.MaSP = item.MaSP;
        //                        //chiTietDon.TenSP = item.TenSP;
        //                        //chiTietDon.DuongDan = item.DuongDan;
        //                        //chiTietDon.SoLuong = item.SoLuong;
        //                        //chiTietDon.Gia = item.Gia;
        //                        //chiTietDon.ThanhTien = item.ThanhTien;
        //                        var sanpham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);
        //                        sanpham.SoLuongKho -= chiTietDon.SoLuong; sanpham.DoanhSo += chiTietDon.SoLuong;
        //                        var khachmua = dbcontext.KhachHangs.FirstOrDefault(p => p.MaKH == makh);
        //                        double diem = chiTietDon.ThanhTien / 200000;


        //                        if (khHad.Diem != null)
        //                            khHad.Diem = khHad.Diem + (int)diem;
        //                        else
        //                        {
        //                            khHad.Diem = 0;
        //                            khHad.Diem = khHad.Diem + (int)diem;

        //                        }




        //                        chiTietDon.Ngay = donHang.Ngay;
        //                        chiTietDon.GiaoDich = true;
        //                        ThanhTien = chiTietDon.ThanhTien;
        //                        MaDH = chiTietDon.MaDH;
        //                        count++;
        //                        payOrder = donHang.MaDH;
        //                        maKH = donHang.KH.ToString();
        //                        dbcontext.ChiTietDonHangs.Add(chiTietDon);

        //                    }
        //                }
        //            }



        //        }

        //        dbcontext.SaveChanges();


        //        dbcontext.SaveChanges();
        //        //lstGioHang.Clear();
        //        //Session["GioHang"] = lstGioHang;
        //        //Response.Redirect("Success.aspx?GD=Card");

        //        if (MaDHXNGD != null)
        //        {
        //            lstGioHang.Clear();
        //            Session["GioHang"] = lstGioHang;
        //            Response.Redirect("Success.aspx?GD=Card");
        //        }
        //        else
        //        {
        //            Response.Redirect("Error.aspx");
        //        }


        //    }
        //}

    }
}