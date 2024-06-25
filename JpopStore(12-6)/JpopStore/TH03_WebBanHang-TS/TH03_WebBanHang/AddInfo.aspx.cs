using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class AddInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAddBanner_Click(object sender, EventArgs e)
        {
            string dataSource = "DUC-LAPTOP\\NGUYENHOANGDUC";
            string initialCatalog = "QL_JPOPStore";
            string sqlTK = "sa";
            string sqlMK = "1";
            string connectionString = $"Data Source={dataSource};Initial Catalog={initialCatalog};User ID={sqlTK};Password={sqlMK};";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string insertBVQuery = "INSERT INTO Banner (DuongDan) VALUES (@DuongDan)";
                string fileNameBanner = null;
                string filePathBanner = null;
                string fileimgBanner = null;
                string relativePathBanner;
                string uploadFolderPath = Server.MapPath("Content/image-banner");
                string finalFolderPath = Path.Combine(uploadFolderPath);

                if (!string.IsNullOrEmpty(fileUploadBanner?.FileName))
                {
                    fileNameBanner = Path.GetFileName(fileUploadBanner.FileName);
                    filePathBanner = Path.Combine(finalFolderPath, fileNameBanner);

                    // Lưu tệp ảnh
                    fileUploadBanner.SaveAs(filePathBanner);

                    // Tạo đường dẫn relative
                    relativePathBanner = filePathBanner.Substring(filePathBanner.IndexOf("Content"));
                    fileimgBanner = relativePathBanner;
                    using (SqlCommand insertPopCommand = new SqlCommand(insertBVQuery, connection))
                    {


                        insertPopCommand.Parameters.AddWithValue("@DuongDan", fileimgBanner);


                        connection.Open();
                        insertPopCommand.ExecuteNonQuery();

                        connection.Close();

                    }
                    Response.Redirect(Request.RawUrl);
                    Response.Write("<div class=\"alert alert-success\" role=\"alert\">Thêm nội dung thành công.</div>");
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("setTimeout(function() {");
                    Response.Write("var elements = document.getElementsByClassName('alert');");
                    Response.Write("for (var i = 0; i < elements.length; i++) {");
                    Response.Write("elements[i].style.display = 'none';");
                    Response.Write("}");
                    Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                    Response.Write("</script>");
                }

                else
                {
                    Response.Write("<div class=\"alert alert-danger\" role=\"alert\">Thêm nội dung không thành công.</div>");
                    Response.Write("<script type=\"text/javascript\">");
                    Response.Write("setTimeout(function() {");
                    Response.Write("var elements = document.getElementsByClassName('alert');");
                    Response.Write("for (var i = 0; i < elements.length; i++) {");
                    Response.Write("elements[i].style.display = 'none';");
                    Response.Write("}");
                    Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                    Response.Write("</script>");
                }
            }
        }


        protected void btnDelBanner_Click(object sender, EventArgs e)
        {

            QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();
            System.Web.UI.WebControls.Button btnXoa = (System.Web.UI.WebControls.Button)sender;

            // Lấy mã sản phẩm từ CommandArgument của nút
            int maBanner = int.Parse(btnXoa.CommandArgument);



            Banner banner = dbcontext.Banners.FirstOrDefault(s => s.MaBanner == maBanner);
            if (banner != null)
            {
                string sql = "DELETE FROM Banner WHERE MaBanner = @MaBanner";

                SqlParameter MaBanner = new SqlParameter("@MaBanner", maBanner);

                dbcontext.Database.ExecuteSqlCommand(sql, MaBanner);


                dbcontext.SaveChanges();

                Response.Redirect(Request.RawUrl);
                Response.Write("<div class=\"alert alert-success\" role=\"alert\">Xóa nội dung thành công.</div>");
                Response.Write("<script type=\"text/javascript\">");
                Response.Write("setTimeout(function() {");
                Response.Write("var elements = document.getElementsByClassName('alert');");
                Response.Write("for (var i = 0; i < elements.length; i++) {");
                Response.Write("elements[i].style.display = 'none';");
                Response.Write("}");
                Response.Write("}, 3000);"); // 1000 mili giây = 1 giây
                Response.Write("</script>");
            }
        }
        protected void ListView1Banner_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public IQueryable<Banner> GetDeparmentsBanner()
        {
            QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();



            IQueryable<Banner> product = dbcontext.Banners;


            return product;

        }
    }
}