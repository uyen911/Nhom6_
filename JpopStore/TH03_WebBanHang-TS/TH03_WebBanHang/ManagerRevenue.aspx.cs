using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class ManagerRevenue : System.Web.UI.Page
    {
        public int Year { get; set; }
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
                Year = DateTime.Now.Year; // Sử dụng năm hiện tại làm mặc định
                BindData();
            }
        }

        protected void BindData()
        {
            DataTable dt = new DataTable();
            string dataSource = "LAPTOP-229FFV57\\PU";
            string initialCatalog = "QL_JPOPStore";
            string sqlTK = "sa";
            string sqlMK = "1";
            string connectionString = "Data Source=" + dataSource + ";Initial Catalog=" + initialCatalog + ";User ID=" + sqlTK + ";Password=" + sqlMK + ";";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT MONTH(ChiTietDonHang.Ngay) AS Month, SUM(ChiTietDonHang.ThanhTien) AS Revenue FROM ChiTietDonHang INNER JOIN SanPham ON ChiTietDonHang.MaSP = SanPham.MaSP WHERE YEAR(Ngay) = @Year GROUP BY MONTH(Ngay)", con);
                cmd.Parameters.AddWithValue("@Year", Year);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }

            GridViewMonthlyRevenue.DataSource = dt;
            GridViewMonthlyRevenue.DataBind();

            LabelTotalRevenue.Text = CalculateTotalRevenue(dt).ToString("N0") + "đ"; // Format as currency
        }

        protected decimal CalculateTotalRevenue(DataTable dt)
        {
            decimal totalRevenue = 0;
            foreach (DataRow row in dt.Rows)
            {
                totalRevenue += Convert.ToDecimal(row["Revenue"]);
            }
            return totalRevenue;
        }
        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private int startRowIndex, maximumRows;

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            ListView1.DataSource = null;
            ListView1.DataSourceID = null;
            ListView1.DataBind();
            GetDeparments();



        }
        public IQueryable<ChiTietDonHang> GetDeparments()
        {
            IQueryable<ChiTietDonHang> order = dbcontext.ChiTietDonHangs;

            return order.OrderBy(e => e.Ngay);
        }



    }
}