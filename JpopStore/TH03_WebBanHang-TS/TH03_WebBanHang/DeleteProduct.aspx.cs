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
    public partial class DeleteProduct : System.Web.UI.Page
    {

        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
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
                string str = Request.QueryString["Deptid"].ToString();
                SanPham deparments = dbcontext.SanPhams.SingleOrDefault(p => p.MaSP == str);
                lbDeptid.Text = deparments.MaSP;
                lbName.Text = deparments.TenSP;
                //imgSP.ImageUrl = deparments.DuongDan;
                lbMaSPV.Text = str;
            }
        }

        protected void btDel_Click(object sender, EventArgs e)
        {
            string deptId = lbMaSPV.Text;
            string deptName = lbName.Text;
            SanPham deparment = dbcontext.SanPhams.SingleOrDefault(p => p.MaSP == deptId);
            SanPham namesp = dbcontext.SanPhams.SingleOrDefault(p => p.TenSP == deptName && p.MaSP == deptId);

            if (namesp.TenSP == lbName.Text && lbMaSPV.Text == deparment.MaSP)
            {
                // Xóa các bản ghi liên quan trong SanPhamData bằng truy vấn SQL
                dbcontext.Database.ExecuteSqlCommand("DELETE FROM SanPhamData WHERE MaSP = {0}", deptId);

                // Xóa các bản ghi liên quan trong SanPhams
                if (deparment?.SPs != null)
                {
                    foreach (var employeeMSP in deparment.SPs.ToList())
                    {
                        dbcontext.SanPhams.Remove(employeeMSP);
                    }
                }

                if (namesp?.TSPs != null)
                {
                    foreach (var employeeTSP in namesp.TSPs.ToList())
                    {
                        dbcontext.SanPhams.Remove(employeeTSP);
                    }
                }

                // Xóa sản phẩm
                dbcontext.SanPhams.Remove(deparment);
                dbcontext.SanPhams.Remove(namesp);

                // Lưu thay đổi
                dbcontext.SaveChanges();
            }

            Response.Redirect("ManagerProduct.aspx");
        }
    }
}