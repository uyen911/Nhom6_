using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Help;
using TH03_WebBanHang.Models;
using System.Data.Entity;
using System.Data.EntityClient;

namespace TH03_WebBanHang
{
    public partial class Shop : System.Web.UI.MasterPage
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
        public static string CH;

        protected void Page_Load(object sender, EventArgs e)
        {
            CH = ddlBranches.SelectedValue.ToString();

            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p => (p.Email == "Admin" &&SignIn.email=="Admin"&&p.Email==SignIn.email) || ((p.Quyen == "Admin" || p.Quyen == "Manager") && p.Email == SignIn.email)))
            {
            Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                var admin = document.getElementById(\"li-admin\");\r\n                                admin.style.display = \"block\";\r\n                            });\r\n                        </script>");
                //if (user.Any(p => p.Quyen == "Manager"&&p.Quyen!="Admin"))
                //{
                //    Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                                            var fa1 = document.getElementById(\"f-a1\");\r\n               var fa2 = document.getElementById(\"f-a2\");\r\n                    fa1.style.display = \"none\";\r\n          fa2.style.display = \"none\";\r\n                   });\r\n                        </script>");

                //}
                //else if (user.Any(p => p.Quyen == "Admin"|| (p.Email == "Admin" && SignIn.email == "Admin")))
                //{
                    Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                                            var fa1 = document.getElementById(\"f-a1\");\r\n       var fa2 = document.getElementById(\"f-a2\");\r\n                            fa1.style.display = \"block\";\r\n          fa2.style.display = \"block\";\r\n                   });\r\n                        </script>");
                //}
            }
            // Otherwise, display an error message

            else
            {
                Response.Write("<script>\r\n                            document.addEventListener(\"DOMContentLoaded\", function (event) {\r\n                                var admin = document.getElementById(\"li-admin\");\r\n                                admin.style.display = \"none\";\r\n                            });\r\n                        </script>");


            }

            List<ChiTietDonHang> lstGioHang = Session["GioHang"] as List<ChiTietDonHang>;
            Hepler hepler = new Hepler();
            lbCart.Text = hepler.TongSoLuong(lstGioHang).ToString(); 
            if (!IsPostBack)
            {

                // Load danh sách chi nhánh khi trang được tải lần đầu tiên
                LoadChiNhanh();
            }

            string searchText = Request.Form["searchinput"];



        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {

            string searchText = searchinput.Text;

            // Chuyển đổi searchText thành chuỗi để có thể sử dụng Contains()
            var DonHang = dbcontext.ChiTietDonHangs.Any(p => p.MaCTDH.Contains(searchText));
            var Don = dbcontext.DonHangs.Any(p => p.MaDH.Contains(searchText));
            var SanPham = dbcontext.SanPhams.Any(p => p.MoTa.Contains(searchText) || p.MaLoai.Contains(searchText) || p.Nhom.TenNhom.Contains(searchText) || p.Loai.TenLoai.Contains(searchText) || p.TenSP.Contains(searchText));
            var ChiNhanh = dbcontext.ChiNhanhs.Any(p => p.TenCN.Contains(searchText) || p.MaCN.Contains(searchText) || p.DiaChiCN.Contains(searchText));
            // Đối với các trường DateTime, chuyển đổi thành chuỗi và sử dụng Contains()
            // Giả sử bạn muốn tìm kiếm ngày trong một trường DateTime, ví dụ: p.Ngay
            // var Ngay = dbcontext.SanPhams.Any(p => p.Ngay.ToString("yyyy-MM-dd").Contains(searchText));

            if (DonHang) Response.Redirect("ManagerOrder.aspx?searchText=" + searchText);
            else if (Don) Response.Redirect("ManagerOrder.aspx?searchText=" + searchText);
            else if (SanPham) Response.Redirect("item.aspx?searchText=" + searchText);
            else if (ChiNhanh) Response.Redirect("About.aspx?searchText=" + searchText);
            else Response.Redirect("item.aspx?searchText=" + searchText);



        }
        protected void ddlBranches_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Store the selected value in a session
            Session["SelectedBranch"] = ddlBranches.SelectedValue;
            string MaSP = Request.QueryString["sp"];
            string sp = HttpContext.Current.Request.QueryString.Get("sp");
            

                

                if (MaSP != null || sp != null)
                {
                    Response.Write("<style>#divDetailProduct{background:linear-gradient(to right, #522A77,#2a2e77) !important;}</style>");
                }
            
        }

        private void LoadChiNhanh()
        {
            string query = "SELECT MaCN, TenCN FROM ChiNhanh";
            string efConnectionString = ConfigurationManager.ConnectionStrings["QL_JPOPStoreEntities"].ConnectionString;
            EntityConnectionStringBuilder efBuilder = new EntityConnectionStringBuilder(efConnectionString);
            string actualConnectionString = efBuilder.ProviderConnectionString;
            using (SqlConnection connection = new SqlConnection(actualConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ddlBranches.Items.RemoveAt(0);
                    while (reader.Read())
                    {
                        string maCN = reader["MaCN"].ToString();
                        string tenCN = reader["TenCN"].ToString();

                        ListItem listItem = new ListItem(tenCN, maCN);
                        ddlBranches.Items.Add(listItem);
                    }

                    // Check if there's a selected value stored in the session
                    if (Session["SelectedBranch"] != null)
                    {
                        // Set the selected value from the session
                        ddlBranches.SelectedValue = Session["SelectedBranch"].ToString();
                    }
                    else
                    {
                        // If no value is stored in the session, select the first item
                        ddlBranches.SelectedIndex = 0;
                    }

                    connection.Close();
                }
            }
        }

    }
}