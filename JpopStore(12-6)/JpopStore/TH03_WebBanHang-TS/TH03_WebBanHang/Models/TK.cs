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

    public partial class TK
    {
        public TK()
        {
            this.DonHangs = new HashSet<DonHang>();
            this.KhachHangs = new HashSet<KhachHang>();
        }

        public int MaTK { get; set; }
        public string MatKhau { get; set; }
        public string Email { get; set; }
        public string Quyen { get; set; }
        public Nullable<bool> TrangThai { get; set; }

        public virtual ICollection<DonHang> DonHangs { get; set; }
        public virtual ICollection<KhachHang> KhachHangs { get; set; }
        public ICollection<TK> TKs { get; internal set; } = new List<TK>();
    }
}
