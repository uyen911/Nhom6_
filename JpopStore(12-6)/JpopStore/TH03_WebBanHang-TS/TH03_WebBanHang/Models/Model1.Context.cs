﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class QL_JPOPStoreEntities : DbContext
    {
        public QL_JPOPStoreEntities()
            : base("name=QL_JPOPStoreEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ChiNhanh> ChiNhanhs { get; set; }
        public DbSet<ChiTietDonHang> ChiTietDonHangs { get; set; }
        public DbSet<DanhGia> DanhGias { get; set; }
        public DbSet<DonHang> DonHangs { get; set; }
        public DbSet<KhachHang> KhachHangs { get; set; }
        public DbSet<Loai> Loais { get; set; }
        public DbSet<Nhom> Nhoms { get; set; }
        public DbSet<SanPham> SanPhams { get; set; }
        public DbSet<TK> TKs { get; set; }
        public DbSet<Banner> Banners { get; set; }
        public DbSet<SanPhamData> SanPhamDatas { get; set; }
    }
}
