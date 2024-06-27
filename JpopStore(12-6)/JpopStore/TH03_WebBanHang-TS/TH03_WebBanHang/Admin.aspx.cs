using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class Admin : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" && p.TrangThai == true && p.Email == SignIn.email && SignIn.email == "Admin") || ((p.Quyen == "Admin"|| p.Quyen == "Manager")  && p.TrangThai == true && p.Email == SignIn.email)))
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
        }

        
       

    }
}