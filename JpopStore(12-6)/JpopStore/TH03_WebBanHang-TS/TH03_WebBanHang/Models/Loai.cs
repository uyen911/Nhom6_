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
    
    public partial class Loai
    {
        public Loai()
        {
            this.SanPhams = new HashSet<SanPham>();
            this.SanPhams1 = new HashSet<SanPham>();
        }
    
        public string MaLoai { get; set; }
        public string TenLoai { get; set; }
    
        public virtual ICollection<SanPham> SanPhams { get; set; }
        public virtual ICollection<SanPham> SanPhams1 { get; set; }
    }
}