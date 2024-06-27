using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class SignIn : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public static string email;
        public static string pass;

        public static int makh;
        protected void Page_Load(object sender, EventArgs e)
        {
          
            Session["User"] = txtEmailSignIn.Text;
            Session["Password"] = txtPasswordSignIn.Text;

            email = Session["User"].ToString();
            pass = Session["Password"].ToString();

            //if (!IsPostBack)
            //{
            //// Connect to the database
            //QL_JPOPStoreEntities2 dbcontext = new QL_JPOPStoreEntities2();

            //// Query the database for all users
            //var users = from u in dbcontext.TKs
            //            select u;

            //    // Bind the query results to the DropDownList
            //    DDL_Username.DataSource = users;
            //    DDL_Username.DataTextField = "Username";
            //    DDL_Username.DataValueField = "UsernameID";
            //    DDL_Username.DataBind();
            //}
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => p.TrangThai == true&&p.Email== email && p.MatKhau == pass))
            {
                Response.Redirect("Account.aspx");

            }
        }
        public static string HashPassword(string value)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(value));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }


        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            // Connect to the database
            QL_JPOPStoreEntities db = QL_JPOPStoreEntities();

            Session["Password"] = txtPasswordSignIn.Text;
            Session["Email"] = txtEmailSignIn.Text;
            email = Session["Email"].ToString();
            pass = Session["Password"].ToString();
            string hashedPassword = HashPassword(pass);
            string hashedEmail = HashPassword(email);
            TK tK = dbcontext.TKs.FirstOrDefault(s => s.Email == email && s.MatKhau == pass);
            string SQLhashedPassword;
            string SQLhashedEmail;
            if (tK != null)
            {
                SQLhashedPassword = HashPassword(tK.MatKhau);
                SQLhashedEmail = HashPassword(tK.Email);
            }
            else
            {
                SQLhashedPassword = null;
                SQLhashedEmail = null;
                //Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");
                Session.Remove("Password");
                Session.Remove("Email");
            }

            if (/*db.TKs.Any(p => p.Email != email || p.MatKhau != pass) */ SQLhashedPassword != hashedPassword || SQLhashedEmail != hashedEmail)
            {

                Response.Write("<script>alert('Tài khoản hoặc mật khẩu không chính xác');</script>");
                SQLhashedPassword = null;
                SQLhashedEmail = null;
                Session.Remove("Password");
                Session.Remove("Email");

            }
            else
            {
                var user = from u in db.TKs
                           where u.Email == email && u.MatKhau == pass
                           select u;
                var client = from c in db.KhachHangs
                             where c.Email == email
                             select c;

                // If a user was found, redirect to the home page
                if (user.Any(p => p.Email == email) && SQLhashedEmail == hashedEmail && SQLhashedPassword == hashedPassword)
                {

                    var disabledTKs = user.Where(p => p.TrangThai == false && p.Email == email).ToList();
                    var disabledKHs = client.Where(p => p.TrangThai == false && p.Email == email).ToList();

                    foreach (var tk in disabledTKs)
                    {
                        tk.TrangThai = true;
                        Session["MaKH"] = tk.MaTK - 1;

                    }
                    foreach (var kh in disabledKHs)
                    {
                        kh.TrangThai = true;
                    }
                    db.SaveChanges(); Response.Redirect("Default.aspx");
                }
                // Otherwise, display an error message
                //else if (txtEmailSignIn.Text == "admin" && txtPasswordSignIn.Text == "123456")
                //{
                //    Response.Redirect("Admin.aspx");
                //}
                else
                {

                    ModelState.AddModelError("Password", "The password is incorrect.");
                }
            }
        }

        private QL_JPOPStoreEntities QL_JPOPStoreEntities()
        {
            return new QL_JPOPStoreEntities();
        }
    }


}