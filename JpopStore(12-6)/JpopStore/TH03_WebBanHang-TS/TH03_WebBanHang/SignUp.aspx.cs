using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TH03_WebBanHang.Models;

namespace TH03_WebBanHang
{
    public partial class SignUp : System.Web.UI.Page
    {
        private QL_JPOPStoreEntities dbcontext = new QL_JPOPStoreEntities();

        string txtGT;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = txtEmailSignUp.Text;
            var user = from u in dbcontext.TKs
                       select u;
            var khachhang = from u in dbcontext.KhachHangs
                            select u;
            var db = new QL_JPOPStoreEntities();
            if (user.Any(p =>p.TrangThai == true && p.Email == SignIn.email))
            {
                Response.Redirect("Account.aspx");

            }
            //if (!IsPostBack)
            //{
            //    // Điền dữ liệu vào DropDownList chỉ khi trang được tải lần đầu tiên
            //    ddlCity.Items.Add(new ListItem("Chọn thành phố", ""));
            //    ddlCity.Items.Add(new ListItem("Hà Nội", "Hanoi"));
            //    ddlCity.Items.Add(new ListItem("TP. Hồ Chí Minh", "HCM"));
            //}

            if (!IsPostBack)
            {

                // Set the flag to indicate that the DropDownLists have not been populated yet
                ViewState["DropDownListsPopulated"] = false;
               
                PopulateDropDownLists();
            }
            else
            {
                // Retrieve selected values from ViewState on postback
                if (ViewState["SelectedCity"] != null)
                {
                    ddlCity.SelectedValue = ViewState["SelectedCity"].ToString();
                }
                if (ViewState["SelectedDistrict"] != null)
                {
                    ddlDistrict.SelectedValue = ViewState["SelectedDistrict"].ToString();
                }
                if (ViewState["SelectedWard"] != null)
                {
                    ddlW.SelectedValue = ViewState["SelectedWard"].ToString();
                }
            }

        }
        private void PopulateDropDownLists()
        {
            using (var context = new VNlocalEntities())
            {
                // Populate ddlCity
                var queryTP = from tp in context.devvn_tinhthanhpho
                              select new { tp.matp, tp.nameTP };

                ddlCity.DataSource = queryTP.ToList();
                ddlCity.DataTextField = "nameTP";
                ddlCity.DataValueField = "matp";
                ddlCity.DataBind();

                // Check if a city is selected
                string selectedCity = ddlCity.SelectedValue;
                if (!string.IsNullOrEmpty(selectedCity))
                {
                    // Populate ddlDistrict
                    var queryQH = from qh in context.devvn_quanhuyen
                                  where qh.matp == selectedCity
                                  select new { qh.maqh, qh.nameQH };

                    ddlDistrict.DataSource = queryQH.ToList();
                    ddlDistrict.DataTextField = "nameQH";
                    ddlDistrict.DataValueField = "maqh";
                    ddlDistrict.DataBind();

                    // Check if a district is selected
                    string selectedDis = ddlDistrict.SelectedValue;
                    if (!string.IsNullOrEmpty(selectedDis))
                    {
                        // Populate ddlW
                        var queryXH = from xp in context.devvn_xaphuongthitran
                                      where xp.maqh == selectedDis
                                      select new { xp.xaid, xp.nameXP };

                        ddlW.DataSource = queryXH.ToList();
                        ddlW.DataTextField = "nameXP";
                        ddlW.DataValueField = "xaid";
                        ddlW.DataBind();
                    }
                }

                // Set the flag to indicate that the DropDownLists have been populated
                ViewState["DropDownListsPopulated"] = true;
            }
        }
        protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        {
         
            
           
            using (var context = new VNlocalEntities())
            {

                string selectedCity = ddlCity.SelectedValue;
                if (!string.IsNullOrEmpty(selectedCity))
                {
                    // Filter districts based on the selected city
                    var queryQH = from qh in context.devvn_quanhuyen
                                  where qh.matp == selectedCity
                                  select new { qh.maqh, qh.nameQH };

                    ddlDistrict.DataSource = queryQH.ToList();
                    ddlDistrict.DataTextField = "nameQH";
                    ddlDistrict.DataValueField = "maqh";
                    ddlDistrict.DataBind();

                }

            }

        }

        protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var context = new VNlocalEntities())
            {
                string selectedDistrict = ddlDistrict.SelectedValue;
                if (!string.IsNullOrEmpty(selectedDistrict))
                {
                    var queryXH = from xp in context.devvn_xaphuongthitran
                                  where xp.maqh == selectedDistrict
                                  select new { xp.xaid, xp.nameXP };

                    ddlW.DataSource = queryXH.ToList();
                    ddlW.DataTextField = "nameXP";
                    ddlW.DataValueField = "xaid";
                    ddlW.DataBind();
                }
            }
        }
        protected void ddlW_SelectedIndexChanged(object sender, EventArgs e)
        {
            

        }
        protected void ddlGT_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlGT.SelectedValue == "Nam")
            {
                txtGT = "Nam";
            }
            else if (ddlGT.SelectedValue == "Nữ")
            {
                txtGT = "Nữ";
            }
            else if (ddlGT.SelectedValue == "Khác")
            {
                txtGT = "Khác";
            }
        }
        //protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    // Xóa tất cả các mục hiện có trong DropDownList quận huyện
        //    ddlDistrict.Items.Clear();

        //    // Điền dữ liệu vào DropDownList quận huyện dựa trên thành phố được chọn
        //    if (ddlCity.SelectedValue == "Hanoi")
        //    {
        //        ddlDistrict.Items.Add(new ListItem("Chọn quận huyện", ""));
        //        ddlDistrict.Items.Add(new ListItem("Quận Ba Đình", "BaDinh"));
        //        ddlDistrict.Items.Add(new ListItem("Quận Hoàn Kiếm", "HoanKiem"));
        //        // Thêm các quận huyện khác tại đây
        //    }
        //    else if (ddlCity.SelectedValue == "HCM")
        //    {
        //        ddlDistrict.Items.Add(new ListItem("Chọn quận huyện", ""));
        //        ddlDistrict.Items.Add(new ListItem("Quận 1", "Quan1"));
        //        ddlDistrict.Items.Add(new ListItem("Quận 2", "Quan2"));
        //        // Thêm các quận huyện khác tại đây
        //    }
           
        //}
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            QL_JPOPStoreEntities tk = new QL_JPOPStoreEntities();
            if (string.IsNullOrEmpty(txtEmailSignUp.Text) ||
                string.IsNullOrEmpty(txtPasswordSignUp.Text) ||
                string.IsNullOrEmpty(txtName.Text) ||
                string.IsNullOrEmpty(txtDiachi.Text))
            {
                // Thông báo cho người dùng nhập đầy đủ thông tin
                Response.Write("<script>alert('Vui lòng điền đầy đủ thông tin');</script>");

                return;
            }
           
            else if (TextPhone.Text.Length!=10)
            {

                Response.Write("<script>alert('Vui lòng nhập đúng số điện thoại');</script>");

            }
            else if (tk.KhachHangs.Any(p=>p.DienThoai==TextPhone.Text&&p.MatKhau!=null))
            {

                Response.Write("<script>alert('Số điện thoại đã tồn tại');</script>");

            }
            else if (tk.KhachHangs.Any(p => p.Email == txtEmailSignUp.Text && p.MatKhau != null))
            {

                Response.Write("<script>alert('Email đã tồn tại');</script>");

            }
            else if (txtDiachi.Text.Length<=4)
            {

                Response.Write("<script>alert('Vui lòng nhập địa chỉ cụ thể');</script>");

            }
            else {using (var db = new QL_JPOPStoreEntities())
            {
                    if (ddlGT.SelectedValue == "Nam")
                    {
                        txtGT = "Nam";
                    }
                    else if (ddlGT.SelectedValue == "Nữ")
                    {
                        txtGT = "Nữ";
                    }
                    else if (ddlGT.SelectedValue == "Khác")
                    {
                        txtGT = "Khác";
                    }
                    var hadUser = dbcontext.TKs.FirstOrDefault(p => p.Email == txtEmailSignUp.Text&&p.MatKhau==null);

                    if (hadUser != null)
                    {
                        var existingAccount = db.KhachHangs.FirstOrDefault(p => p.MaKH != 0 && p.MatKhau == null && (p.Email == txtEmailSignUp.Text || p.DienThoai == TextPhone.Text));
                        var existingAccountTK = db.TKs.FirstOrDefault(p => p.Email == txtEmailSignUp.Text && p.MatKhau == null);
                        if (existingAccount != null)
                        {
                            // If the account exists, only add missing or not yet entered parts
                            if (string.IsNullOrWhiteSpace(existingAccount.HoTen))
                            {
                                existingAccount.HoTen = txtName.Text;

                            }
                            if (string.IsNullOrWhiteSpace(existingAccount.DienThoai))
                            {
                                existingAccount.DienThoai = TextPhone.Text;
                            }
                            if (string.IsNullOrWhiteSpace(existingAccount.GioiTinh))
                            {
                                existingAccount.GioiTinh = txtGT;
                            }
                            if (string.IsNullOrWhiteSpace(existingAccount.DiaChi))
                            {
                                existingAccount.DiaChi = txtDiachi.Text + ", " + ddlDistrict.SelectedItem.Text + ", " + ddlCity.SelectedItem.Text;
                            }
                            if (string.IsNullOrWhiteSpace(existingAccount.Email))
                            {
                                existingAccount.Email = txtEmailSignUp.Text;
                                existingAccountTK.Email = txtEmailSignUp.Text;
                            }
                            if (string.IsNullOrWhiteSpace(existingAccount.MatKhau))
                            {
                                existingAccount.MatKhau = txtPasswordSignUp.Text;
                                existingAccountTK.MatKhau = txtPasswordSignUp.Text;
                            }
                            existingAccount.TrangThai = false;
                            existingAccountTK.TrangThai = false;
                            //db.TKs.Add(existingAccountTK);
                            //db.KhachHangs.Add(existingAccount);
                            db.SaveChanges();
                            Response.Redirect("Account.aspx");
                        }
                    }
                    
                    // input

                    if (tk.TKs.Any(p => p.Email == txtEmailSignUp.Text))
                    {

                        Response.Write("<script>alert('Tài khoản đã tồn tại');</script>");

                    }
                    else if (tk.KhachHangs.Any(p => p.DienThoai == TextPhone.Text))
                    {

                        Response.Write("<script>alert('Số điện thoại đã tồn tại');</script>");

                    }
                    if (string.IsNullOrWhiteSpace(txtEmailSignUp.Text) || string.IsNullOrWhiteSpace(txtPasswordSignUp.Text))
                    {
                    throw new Exception("All fields are required.");
                    }

                // Check if email already exists
                var existingUser = db.TKs.FirstOrDefault(u => u.Email == txtEmailSignUp.Text);
                    var existingUserKH = db.KhachHangs.FirstOrDefault(u => u.Email == txtEmailSignUp.Text);

                    var existingHoTen = db.KhachHangs.FirstOrDefault(t => t.HoTen == txtName.Text);
                var existingDiaChi = db.KhachHangs.FirstOrDefault(d => d.DiaChi == txtDiachi.Text);
                
                    var existingPhone = db.KhachHangs.FirstOrDefault(s => s.DienThoai == TextPhone.Text);
                    if (existingPhone != null)
                    {
                        Response.Write("<script>alert('Số điện thoại đã được sử dụng cho tài khoản khác.');</script>");

                    }



                    var existingGioiTinh = db.KhachHangs.FirstOrDefault(d => d.GioiTinh == txtGT);

                if (existingUser != null)
                {
                    throw new Exception("Email already exists.");
                }
                // Add new user to database
                var newUser = new TK
                {
                    Email = txtEmailSignUp.Text,
                    MatKhau = txtPasswordSignUp.Text,
                    TrangThai = true,
                    


                };
                var newClient = new KhachHang
                {
                    HoTen = txtName.Text,
                    DienThoai = TextPhone.Text,
                    GioiTinh = txtGT,
                    DiaChi = txtDiachi.Text + ", "+ddlW.SelectedItem.Text+ ", " + ddlDistrict.SelectedItem.Text + ", " + ddlCity.SelectedItem.Text,
                    Email = txtEmailSignUp.Text,
                    MatKhau = txtPasswordSignUp.Text,
                    TrangThai = true,
                    Diem =null,

                };

                db.TKs.Add(newUser);
                db.KhachHangs.Add(newClient);
                db.SaveChanges();

                // Redirect to login page
                Response.Redirect("Account.aspx");
            } }
            
        }
    }
}