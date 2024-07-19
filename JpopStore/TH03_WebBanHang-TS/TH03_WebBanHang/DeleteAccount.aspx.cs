using Microsoft.Ajax.Utilities;
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
    public partial class DeleteAccount : System.Web.UI.Page
    {

        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || (p.Quyen == "Admin" && p.TrangThai == true && p.Email == SignIn.email)))
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
                string str = Request.QueryString["Deptid"].ToString();
                TK deparments = dbcontext.TKs.SingleOrDefault(p => p.Email == str);
                lbDeptid.Text = str;
                lbName.Text = deparments.MatKhau;
            }
        }

        protected void btDel_Click(object sender, EventArgs e)
        {
            //TK deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text);
            //try
            //{
            //    if (deparment.KhachHang.Count > 0)
            //    {
            //        ICollection<TK> employees = deparment.TKs;
            //        for (int i = 0; i < employees.Count; i++)
            //        {
            //            dbcontext.Employees.Remove(employees.ElementAt(i));
            //            dbcontext.SaveChanges();
            //        }
            //    }
            //    dbcontext.TKs.Remove(deparment);
            //    dbcontext.SaveChanges();
            //}
            //catch (Exception)
            //{
            //    throw;
            //}
            //Response.Redirect("Phong.aspx");

            TK deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)
            KhachHang client = dbcontext.KhachHangs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (KH)
            try
            {   

                if (client.Email == deparment.Email || client.Email == lbDeptid.Text || deparment.Email == lbDeptid.Text)
                {
                   
                    foreach (var employeeDonKH in client.DonHangs.ToList())
                    {
                        var donHangs = dbcontext.DonHangs.Where(d => d.KH == client.MaKH).ToList();
                        var chiTietDonKH = dbcontext.ChiTietDonHangs.Where(d => d.KH == client.MaKH).ToList();

                        foreach (var chitietDon in chiTietDonKH)
                        {
                            dbcontext.ChiTietDonHangs.Remove(chitietDon);
                        }
                        foreach (var donHang in donHangs)
                        {
                            dbcontext.DonHangs.Remove(donHang);
                        }
                        dbcontext.SaveChanges();

                    }
                    ICollection<TK> eTK = deparment.TKs;
                    foreach (var employeeTK in eTK.ToList())
                    {

                        dbcontext.TKs.Remove(employeeTK);
                        dbcontext.SaveChanges();

                    }
                    ICollection<KhachHang> eKH = client.KhachHangs;
                    foreach (var employeeKH in eKH.ToList())
                    {

                        dbcontext.KhachHangs.Remove(employeeKH);
                        dbcontext.SaveChanges();

                    }
                    

                    dbcontext.TKs.Remove(deparment);
                    dbcontext.KhachHangs.Remove(client);

                    dbcontext.SaveChanges();

                }
                dbcontext.KhachHangs.Any(p => p.MaKH == -1);
                dbcontext.TKs.Any(p => p.MaTK == -1);

                dbcontext.SaveChanges();



            }
            catch (Exception)
            {
                throw;
            }
            Response.Redirect("ManagerAccount.aspx");
        }
    }
}