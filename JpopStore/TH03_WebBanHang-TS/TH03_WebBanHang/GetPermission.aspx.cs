using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class GetPermission : System.Web.UI.Page
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
                if (deparments.Quyen != null)
                {
                    lbQuyen.Text = deparments.Quyen;
                }
                else
                {
                    lbQuyen.Text = "None";
                }
            }

        }

        protected void btAdmin_Click(object sender, EventArgs e)
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




            var deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)
            KhachHang client = dbcontext.KhachHangs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (KH)
            try
            {
                if (client.Email == deparment.Email || client.Email == lbDeptid.Text || deparment.Email == lbDeptid.Text)
                {

                    if (deparment.Quyen == "Manager" || deparment.Quyen == "None" || deparment.Quyen == null) { 
                                        deparment.Quyen = "Admin";
                    dbcontext.SaveChanges();
                        deparment.Quyen.Clone();

                    }

                }

                dbcontext.SaveChanges();



            }
            catch (Exception)
            {
                throw;
            }
            Response.Redirect("ManagerAccount.aspx");
        }
        protected void btManager_Click(object sender, EventArgs e)
        {
            TK deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)
            KhachHang client = dbcontext.KhachHangs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (KH)
            try
            {
                if (client.Email == deparment.Email || client.Email == lbDeptid.Text || deparment.Email == lbDeptid.Text)
                {

                    if (deparment.Quyen == "Admin" || deparment.Quyen == "None" || deparment.Quyen == null)
                    {
                        deparment.Quyen = "Manager";
                        dbcontext.SaveChanges();
                        deparment.Quyen.Clone();

                    }

                }

                dbcontext.SaveChanges();



            }
            catch (Exception)
            {
                throw;
            }
            Response.Redirect("ManagerAccount.aspx");
        }
        protected void btNone_Click(object sender, EventArgs e)
        {
            var deparment = dbcontext.TKs.SingleOrDefault(p => p.Email == lbDeptid.Text); //lọc trong xem có email nào == lbDeptid đang được hiện (TK)
            try
            {
                if (deparment.Email == lbDeptid.Text)
                {

                    if (deparment.Quyen == "Admin" || deparment.Quyen == "Manager" || deparment.Quyen == null)
                    {
                        deparment.Quyen = "None";
                        dbcontext.SaveChanges();
                        deparment.Quyen.Clone();
                    }


                }

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