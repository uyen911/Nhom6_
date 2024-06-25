<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="DetailOrderAll.aspx.cs" Inherits="TH03_WebBanHang.DetailOrderAll" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>
        <h2 class="fw-bolder mb-4 tenSP-ls-h3" style="margin-top:8rem;">Chi Tiết Đơn</h2>
        <style>
                  
                .tenSP-ls-h3 {
                padding-bottom: 1.5rem;
                text-align: center;
                font-weight: bolder;
                font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                color: #518ee0 !important;
                width: 100%;
            }
                body{
				text-align:center;
				justify-content:center;	background: #A0E3F2;
               
			}
            .tenSP-ls-p {            color: #518ee0 !important;
                width: max-content;
                padding: 8px;
                margin: auto;
                border-bottom-color:#000 ;
                border:1px solid;
                border-top-style:none;
                border-left-style:none;
                border-right:none;
            }
            .tenSP-ls-p-name {
    width: max-content;
    padding: 8px;
  
    border-bottom-color:#000 ;
    border:1px solid;
    border-top-style:none;
    border-left-style:none;
    border-right:none;
}
          

            
            .w-more{
                width:100%;
                text-align:center;
            }
            
           
            

             .tenSP-ls-h6{
                 margin-bottom:2rem;
             }
       
        .container-detail {
   display:flex;
    justify-content: center;
   
   
    text-align:left;
   
    gap:6rem;
   
}


.tenSP-ls-h6 {
           
            font-weight: bolder;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #518ee0 !important;
            width: 100%;
        
        }
/*.content-container{
    padding-top:3rem;
    
   

    
}*/

.text-gd{
    font-weight:bolder;
}


            #btDone {
            background-color:#518ee0;
        }

            
            .w-more{
                width:100%;
                text-align:center;
            }
            
            .btn-done{
                width:max-content !important;
                padding:0.5rem 2rem !important;
                                            border: 1px solid #ccc;

            }
            

                #btDone,.btn-done {
            background-color:#518ee0 !important;
        }
        #btDone:hover,.btn-done:hover {
            background-color:#a49ccb !important;
            color:#ccc !important;
        }

          .product-item {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}





.img-fluid {
    max-width: 50%;
    height: auto;
}

        </style>
        <div class="container-detail py-3" style="">
                            <div class="fade-out" style="width:max-content; padding:15px; border-radius:20px; background: linear-gradient(to right, #522A77, #2a2e77); display:flex;
 justify-content: center;
 gap:6rem;">

            <div class="content-container" style="width:50%;">
                    <h2 class="fw-bolder tenSP-ls-h6" style=""><%--Related products--%> <p class="tenSP-ls-p">Thông Tin Đơn Hàng</p></h2>

               <div style="height:60vh; overflow:auto; padding:0 15px; margin-top:2.5rem;">
                <asp:ListView ID="ListViewProducts" runat="server" ItemType="TH03_WebBanHang.Models.ChiTietDonHang"
    SelectMethod="GetDeparments" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" class="text-center ListView1">
    <LayoutTemplate>
        <div runat="server" id="itemPlaceholder" class="row"></div>
    </LayoutTemplate>
    <ItemTemplate>
        <div class="product-item">
            
            <div class="product-info d-flex" style="gap:1rem">
                      <img  style="width:160px; border-radius:10px" src='<%#:Item.DuongDan %>' alt="Product Image" class="img-fluid fade-out" />

                <div class="d-grid"><h5 class="card-title">  <a class="a-hadItems"  href="item.aspx?sp=<%#:Item.MaSP%>"><%#:Item.TenSP%></h5></a>
                <p class="card-text">
                    <strong>Giá: </strong><%# string.Format("{0:N0}", Item.Gia ) %>đ<br />
                      <strong>Số Lượng: </strong><%#:Item.SoLuong %><br />
                    <strong>Thành Tiền: </strong><%# string.Format("{0:N0}", Item.ThanhTien ) %>đ
                </p></div>
                
            </div>
        </div>
    </ItemTemplate>
</asp:ListView>
                    </div>
            </div>
                 <div class="content-container" style="width:50%; flex-wrap:wrap;">
         
                      
             <h2 class="fw-bolder tenSP-ls-h6"><%--Related products--%> <p class="tenSP-ls-p">Thông Tin Giao Hàng</p></h2>
                     <div class="d-flex" style=" gap:2.5rem;"> 
                         <style>
                            .card-text{
                               height:2.85rem;
                              
                            }
                            .tt-w{
                                margin-bottom:1rem;
                               
                            }
                            .tt-gh-left,.tt-gh-right{
                                
                            }
                             .tt-gh-left{
                                 display:grid;
                                 float:left;
                             
                                     width:max-content;
                             }
                             .tt-gh-right{
                                 display:grid;
    float:right;
    flex-wrap:wrap;
    width:20rem;
  
}
                         </style>
                     <div class="tt-gh-left">
                        <asp:Label ID="Label1" runat="server" Text="Mã Đơn:" class="card-text tt-w" style="padding:12px 0; width:max-content; "></asp:Label> 
                        <asp:Label ID="lbSDT" runat="server" Text="Số Điện Thoại:" class="card-text tt-w" style="padding:12px 0; width:max-content; "></asp:Label> 
                        <asp:Label ID="lbHT" runat="server"  Text="Họ Tên:"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
                        <asp:Label ID="lbDC" runat="server"   Text="Địa Chỉ:" class="card-text tt-w" style="padding:12px 0 "></asp:Label>
                        <asp:Label ID="lbMAIL" runat="server"  Text="Email:" class="card-text tt-w" style="padding:12px 0 "></asp:Label>
                         <asp:Label ID="lbGD" runat="server"  Text="Giao Dịch:" class="card-text tt-w" style="padding:12px 0 "></asp:Label>

                     </div>
                      <div class="tt-gh-right">
                      <asp:Label ID="lbMaDon" runat="server" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
                           <asp:Label ID="lbPhone" runat="server" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
 <asp:Label ID="lbName" runat="server" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
 <asp:Label ID="lbLocate" runat="server" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
 <asp:Label ID="lbEmail" runat="server" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
 <asp:Label ID="lbGiaoDich" CssClass="text-gd" runat="server" ForeColor="Black" Text="1"  class="card-text tt-w" style="padding:12px 0 "></asp:Label>
                      </div>
                     </div>
                     
<h3 class="card-text" style="padding:12px 0 ">Tổng Tiền: <asp:Label ID="lbTong" runat="server"
	Text="1"></asp:Label></h3>
<div></div>
                     <div id="btnXN">           		
                         <asp:Button ID="btDone" runat="server" Text="Xác Nhận" OnClick="btDone_Click" CssClass="btn-done"/>
</div>
     </div>
        </div>
        </div>
    </div>
</asp:Content>
