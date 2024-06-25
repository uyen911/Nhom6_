using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang.Help
{
    public class Hepler
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public int TongSoLuong(List<ChiTietDonHang> lstGioHang)
        {
            int tsl = 0;
            if (lstGioHang != null)
            {
                tsl = lstGioHang.Sum(sp => sp.SoLuong);
            }
            return tsl;
        }

        public string TongThanhTien(List<ChiTietDonHang> lstGioHang)
        {
            double ttt = 0;

            if (lstGioHang != null)
            {
                foreach (var chiTietDon in lstGioHang)
                {
                    SanPham sanPham = dbcontext.SanPhams.FirstOrDefault(p => p.MaSP == chiTietDon.MaSP);

                    ttt += chiTietDon.SoLuong * (double)sanPham.Gia;
                }
            }

            

            string tong = string.Format("{0:N0}", ttt) + "đ";
            return tong;
        }




    }
}