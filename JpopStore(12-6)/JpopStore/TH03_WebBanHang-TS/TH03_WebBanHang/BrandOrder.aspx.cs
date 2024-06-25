﻿using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class BrandOrder : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public int MaKH;
        public string CN;
        protected void Page_Load(object sender, EventArgs e)
        {

            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email))
            {




                if (!IsPostBack)
                {
                    var str = Request.QueryString["Deptid"].ToString();
                    CN = Request.QueryString["Deptid"].ToString();
                    int clientStr;
                    int.TryParse(str, out clientStr);


                    ChiNhanh deparments = dbcontext.ChiNhanhs.SingleOrDefault(p => p.MaCN == CN);
                    ChiTietDonHang chitet = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.KH == clientStr);
                    lbBranhName.Text = deparments.TenCN;
                }
            }
            // Otherwise, display an error message

            else
            {
                //Response.Write("<script>alert('Bạn không có quyền truy cập');</script>");
                Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Bạn không có quyền truy cập!</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");

                Response.Redirect("Error.aspx");

            }
            if (!IsPostBack)
            {

                var orders = dbcontext.ChiTietDonHangs.Where(s => s.DonHang.MaCN == CN);
                if(orders.Any(o=>o.ThanhTien!=0||o.ThanhTien!=null))
                {
                decimal totalRevenue = (decimal)orders.Sum(o => o.ThanhTien);
                LabelTotalRevenue.Text = totalRevenue.ToString("N0") + "đ";

                }
                else
                {
                    LabelTotalRevenue.Text = "0đ";
                }
                

            }

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public IQueryable<ChiTietDonHang> GetDeparments2()
        {
            var chinhanh = dbcontext.ChiNhanhs.OrderBy(p => p.MaCN);

            ChiNhanh deparments = dbcontext.ChiNhanhs.SingleOrDefault(p => p.MaCN == CN);



            //string kh = MaKH.ToString();
            var don = dbcontext.ChiTietDonHangs.Where(s => s.DonHang.MaCN == CN);

            return don.OrderBy(s => s.MaDH);



        }
        public IQueryable<DonHang> GetDeparments()
        {
            var chinhanh = dbcontext.ChiNhanhs.OrderBy(p => p.MaCN);

            ChiNhanh deparments = dbcontext.ChiNhanhs.SingleOrDefault(p => p.MaCN == CN);



            //string kh = MaKH.ToString();
            var don = dbcontext.DonHangs.Where(s => s.MaCN == CN);

            return don.OrderBy(s => s.MaDH);
            

        }
        //public IQueryable<ChiTietDonHang> GetDeparments()
        //{

        //    var chinhanh = dbcontext.ChiNhanhs.OrderBy(p => p.MaCN);

        //    ChiNhanh deparments = dbcontext.ChiNhanhs.SingleOrDefault(p => p.MaCN == CN);



        //    //string kh = MaKH.ToString();
        //    var don = dbcontext.ChiTietDonHangs.Where(s => s.DonHang.MaCN == CN);

        //    return don.OrderBy(s=>s.MaDH);
        //}
        public IQueryable<ChiTietDonHang> GetDeparmentsCN()
        {
            // Retrieve orders related to the branch
            var orders = dbcontext.ChiTietDonHangs.Where(s => s.DonHang.MaCN == CN);

            // Calculate total revenue
            decimal totalRevenue = (decimal)orders.Sum(o => o.ThanhTien);

            // Display the total revenue (you may want to display it in a label or another control)
            // For demonstration purpose, I'm just setting it to a session variable
            Session["TotalRevenue"] = totalRevenue;

            return orders;
        }

    }
}