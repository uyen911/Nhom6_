//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TH03_WebBanHang.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ChiTietDonHang
    {
        public Nullable<int> KH { get; set; }
        public string MaCTDH { get; set; }
        public string MaDH { get; set; }
        public string MaSP { get; set; }
        public int SoLuong { get; set; }
        public string TenSP { get; set; }
        public string DuongDan { get; set; }
        public double Gia { get; set; }
        public double ThanhTien { get; set; }
        public System.DateTime Ngay { get; set; }
        public Nullable<bool> GiaoDich { get; set; }
    
        public virtual DonHang DonHang { get; set; }
        public virtual SanPham SanPham { get; set; }
        public virtual DonHang DonHang1 { get; set; }
        public virtual SanPham SanPham1 { get; set; }
    }
}
