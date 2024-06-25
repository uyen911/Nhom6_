using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class DeleteOrder : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        protected void btDel_Click(object sender, EventArgs e)
        {
          
            string don = HttpContext.Current.Request.QueryString.Get("MaDH");


            DonHang chitet = dbcontext.DonHangs.FirstOrDefault(p => p.MaDH == don);
            ChiTietDonHang chitietDon = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == don);

            if (chitet != null)
            {
                try
            {
                    // Retrieve and delete all related ChiTietDonHang records
                    var relatedChiTietDonHangs = dbcontext.ChiTietDonHangs.Where(p => p.MaDH == don).ToList();
                    foreach (var chiTietDonHang in relatedChiTietDonHangs)
                    {
                        dbcontext.ChiTietDonHangs.Remove(chiTietDonHang);
                    }

                    // Delete the DonHang record
                    dbcontext.DonHangs.Remove(chitet);

                    // Save changes to the database
                    dbcontext.SaveChanges();


                    //if (chitet.MaDH == lbDeptid.Text && chitietDon.MaDH == lbDeptid.Text)
                    //{

                    //    ICollection<ChiTietDonHang> eTCTD = chitietDon.CTD;
                    //    foreach (var employeeTCTD in eTCTD.ToList())
                    //    {

                    //        dbcontext.ChiTietDonHangs.Remove(employeeTCTD);


                    //    }
                    //    ICollection<DonHang> eMDH = chitet.DHs;
                    //    foreach (var employeeMDH in eMDH.ToList())
                    //    {

                    //        dbcontext.DonHangs.Remove(employeeMDH);


                    //    }
                    //    dbcontext.ChiTietDonHangs.Remove(chitietDon);
                    //    dbcontext.DonHangs.Remove(chitet);

                    //    dbcontext.SaveChanges();

                    //}



                    //dbcontext.SaveChanges();



                }
            catch (Exception)
            {
                throw;
            }
            }
            Response.Redirect("ManagerOrder.aspx");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" || p.Quyen == "Manager") && p.TrangThai == true && p.Email == SignIn.email))
            {

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
                string don = HttpContext.Current.Request.QueryString.Get("MaDH");

                //var str = Request.QueryString["MaDH"].ToString();
                //var SP = Request.QueryString["SP"].ToString();
                //var maD = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == don && p.TenSP == SP);
                DonHang chitet = dbcontext.DonHangs.FirstOrDefault(p => p.MaDH == don);
                ChiTietDonHang chitietDon = dbcontext.ChiTietDonHangs.FirstOrDefault(p => p.MaDH == don);

                lbDeptid.Text = chitet.MaDH;


            }
        }
    }
}