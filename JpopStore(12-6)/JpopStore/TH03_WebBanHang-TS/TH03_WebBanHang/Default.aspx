<%@ Page Title="JPopStore" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TH03_WebBanHang._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-image: url('Content/image-bg/6.jpg'); /*đổi hình*/
            background-size: cover;
            background-color: #000;
        }
    </style>
        <style>
        .notification {
            display: none;
            position: fixed;
            top: 15%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #212529;
            padding: 0 10px;
            border-radius: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            text-align: center;
            justify-content: center;
            align-items: center;
            gap:1rem;
            width:max-content;
            z-index:9999;
/*            flex-direction: column;
*/        }

            .notification img {
                width: 30%;
                height:auto;
            }
            .notification p {
    font-family:Baloo;
    padding-top:1rem;
    font-size:20px;
}
            
    </style>
    <div id="notification" class="notification">
        <img <%--loading="lazy"--%> src="Content/icon/p-Success.gif" alt="">
        <p>Thêm thành công!</p>
    </div>
    <script>
		document.addEventListener("DOMContentLoaded", function () {
			// Sử dụng class của nút thêm vào giỏ hàng để lắng nghe sự kiện click
			const addToCartBtn = document.querySelector('.btn-gio');
			const notification = document.getElementById('notification');

			// Sử dụng addEventListener với class thay vì ID
			addToCartBtn.addEventListener('click', showNotification);

			function showNotification() {
				// Hiển thị thông báo
				notification.style.display = 'flex';

				// Ẩn thông báo sau 2 giây
				setTimeout(function () {
					notification.style.display = 'none';
				}, 2000);
			}
		});
	</script>
    <!-- Header-->
    <header class="py-0 px-0" style="margin-top:7.5rem;">

        <div class="" style="display: flex; background: #000;">
            <div class=" <%--bg-dark--%> px-0 px-lg-0 my-0 position-relative fade-out" style="border: 4px solid #000; max-width: 1150px;border-right: none; height:650px !important;">
                <div id="carouselExampleControls" class="carousel slide bg-dark " data-bs-ride="carousel">
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="2"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="3"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="4"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="5"></li>
                        <li data-target="#carouselExampleControls" data-slide-to="6"></li>

                    </ol> <%--Hình của panel đổi hình --%>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img loading="lazy" src="Content\img-vtuber-bg\Kanade Birthday.png" style="height:100%" class="d-block w-100" alt="Background Image 1">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\AyaFubuMi Situation vol3.png" style="height:100%" class="d-block w-100" alt="Background Image 2">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\Bijou Birthday.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\HoloFantasy Celebration.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\HoloFantasy Celebration.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\Korone 5thAnniversary.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\MumeiNewOutfit.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\NightWalk.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <div class="carousel-item">
                            <img loading="lazy" src="Content\img-vtuber-bg\Specter.png" style="height:100%" class="d-block w-100" alt="Background Image 3">
                        </div>
                        <!-- Thêm các ảnh khác vào đây -->
                    </div>
                </div>



                <div class="position-absolute top-50 start-50 translate-middle text-center text-white fade-in" style="width: max-content;">
   <%--           --%>         <img id="logo" class="display-4 fw-bolder fade-right" style="filter:brightness(0.8);" src="Content/logo/jshop.gif"/>
                    
<%--                    <h2 class="display-4 fw-bolder" style="color: #518ee0; font-size: 8rem; font-family: Baloo;">JPopStore--%>
                        <%--<br />
                        Kpop Store--%>

<%--                    </h2>--%>
<%--                    <p class="lead fw-normal  text-white-50 mb-0" style="color: #518ee0 !important;"><strong style="color: #518ee0 !important;">Cùng JPopStore ủng hộ thần tượng của bản</strong></p>--%>
                </div>
            </div>
            <%--<div class="px-0 px-lg-0 my-0 position-relative d-grid fade-right" style="background: linear-gradient(to right, #522A77, #2a2e77); max-width: 20%; width: 400px;">
                <div class="fade-out" style="border: 4px solid #000; background: linear-gradient(to left, #000, #522A77); height: 300px; /*border: 10px solid #000; border-radius: 20px; */">
                    <div id="carouselExampleIndicators" class="carousel slide fade-out" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
  <%--  đổi hình     --%>              <%-- <div class="carousel-inner carousel-item-boder" style="border:2px solid #000; border-top:none; border-left:none;">
                            <div class="carousel-item active">
                                <a href="Item.aspx?sp=popular">
                                    <img loading="lazy" style="object-fit: cover; background: #fff;" class="d-block w-100" src="Content/icon-show/HoloMyth.png" alt="First slide">
                                </a>
                            </div>
                            <div class="carousel-item carousel-item-boder">
                                <a href="item.aspx?sp=BTSALBprf">
                                    <img loading="lazy" style="object-fit: cover; background: #fff;" class="d-block w-100" src="Content/icon-show/HoloFantasy.png" alt="Second slide">
                                </a>
                            </div>
                            <div class="carousel-item carousel-item-boder">
                                <a href="item.aspx?sp=IU29Doc">
              <%--  đến đây     --%>              <%-- <img loading="lazy" style="object-fit: cover; background: #fff;" class="d-block w-100" src="Content/icon-show/HoloX.png" alt="Third slide">
                                </a>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>--%>

               <%-- </div>--%>
                <%--                <ul id="div-dm" class="ul-l-type d-flex" style="color: aliceblue; flex-wrap:wrap; border: 10px solid #000; border-radius: 20px; padding-top:24px">
                            <li><a href="#ALB">

                                <p>Sản phẩm</p>
                            </a></li>
                            <li><a href="#PTB">

                                <p>Dịch vụ</p>
                            </a></li>

                            <li><a href="#BR">
                                <p>Ưu đãi</p>
                            </a></li>



                            <li><a href="#LS">
                                <p>Hỗ trợ</p>
                            </a></li>
                          

                        </ul>--%>
                <div style="border: 4px solid #000; height: 100%;" class="" loading="lazy">
                    <%--                    <iframe loading="lazy" width="286" height="366" src="https://www.youtube.com/embed/CSGVjrr247I?si=wmT_fTSw2HWafMnA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>--%>
                    <%--               <video src="Content/video/hanni-dance.mp4" autoplay loop width="298" height="390" controls ></video>--%>

                    <div class="video-container fade-right" style="width: 100%; height: 100%;" data-src="https://www.youtube.com/embed/ThvObLS55vM"></div>
                    <script>
						document.addEventListener("DOMContentLoaded", function () {
							var videoContainers = document.querySelectorAll('.video-container');

							// Kiểm tra xem người dùng đã cuộn đến vị trí nào trên trang
							function checkScroll() {
								videoContainers.forEach(function (videoContainer) {
									var rect = videoContainer.getBoundingClientRect();
									var viewportHeight = window.innerHeight || document.documentElement.clientHeight;

									// Nếu video-container xuất hiện trong viewport, tạo iframe
									if (rect.top < viewportHeight) {
										var iframe = document.createElement('iframe');
										iframe.setAttribute('src', videoContainer.getAttribute('data-src'));
										iframe.setAttribute('width', '350');
										iframe.setAttribute('height', '650');
										iframe.setAttribute('frameborder', '0');
										iframe.setAttribute('allow', 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share');
										iframe.setAttribute('referrerpolicy', 'strict-origin-when-cross-origin');
										iframe.setAttribute('allowfullscreen', '');
										videoContainer.appendChild(iframe);

										// Sau khi tạo iframe, loại bỏ sự kiện cuộn để không tạo iframe nữa
										videoContainers = Array.prototype.filter.call(videoContainers, function (container) {
											return container !== videoContainer;
										});
									}
								});
							}

							// Thực hiện kiểm tra khi trang được tải và mỗi khi người dùng cuộn trang
							checkScroll();
							window.addEventListener('scroll', checkScroll);
						});
					</script>
                </div>


            </div>
        </div>

        <script>

			var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'), {
				interval: 3000, // Thời gian chuyển ảnh (5 giây)
				wrap: true // Tự động quay vòng ảnh

			});
			//var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleIndicators'), {
			//    interval: 3000, // Thời gian chuyển ảnh (5 giây)
			//    wrap: true // Tự động quay vòng ảnh

			//});

			var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleIndicators'), {
				interval: 2000, // Thời gian chuyển ảnh (5 giây)
				wrap: true // Tự động quay vòng ảnh

			});
			var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleControlsBranch'), {
				interval: 3000, // Thời gian chuyển ảnh (5 giây)
				wrap: true // Tự động quay vòng ảnh

			});
			var myCarousel = new bootstrap.Carousel(document.getElementById('carouselExampleControlsRoom'), {
				interval: 3000, // Thời gian chuyển ảnh (5 giây)
				wrap: true // Tự động quay vòng ảnh

			});
		</script>

   

        <style>
            .carousel-item {
                transition-duration: 0.1s !important; /* Tốc độ chuyển cảnh là 0.5 giây */
            }

            .container .btn-mua:hover {
                background-color: #FBF4F1;
                color: #212529;
            }

            .container .btn-mua:active {
                background-color: #518ee0 !important;
                color: #212529 !important;
            }
            /**/ .bg-dark {
                position: relative;
            }

                .bg-dark .container {
                    position: relative;
                    overflow: hidden;
                }

                .bg-dark img {
                    filter: brightness(35%);
                }

            .position-absolute {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                z-index: 1;
            }

            .tenSP-ls-h3 {
                padding-bottom: 1.5rem;
                text-align: center;
                font-weight: bolder;
                font-family: Baloo;
                color: #518ee0;
                width: 100%;
                font-size: 3rem
            }

            .tenSP-ls-p {
                color: #518ee0;
                width: max-content;
                padding: 8px;
                margin: auto;
                border-bottom-color: #000;
                border: 1px solid;
                border-top-style: none;
                border-left-style: none;
                border-right: none;
            }
        </style>

    </header>
    <style>
        .ul-l-type p {
            border: 2px solid #21222937;
            width: 7rem;
        }

            .ul-l-type p:hover {
                border-top-color: none;
                border-left-color: none;
                border-right-color: none;
                border-bottom-color: #1c60bc;
            }

        .ul-l-type li p {
            color: #fff;
            padding: 5px;
            font-size: large;
        }



        .ul-l-type a:hover {
            color: #808080;
            text-decoration: none;
        }



        .ul-l-type a {
            text-decoration: none;
            display: flex;
        }




        .carousel-item-boder img {
            /* border-top-right-radius: 10px;
         border-top-right-radius: 10px;*/
        }

        .carousel-item img {
            width: 100% !important;
            height: auto;
        }

        .carousel {
            position: relative
        }

            .carousel.pointer-event {
                -ms-touch-action: pan-y;
                touch-action: pan-y
            }

        .carousel-inner {
            position: relative;
            width: 100%;
            overflow: hidden
        }

            .carousel-inner::after {
                display: block;
                clear: both;
                content: ""
            }

        .carousel-item {
            position: relative;
            display: none;
            float: left;
            width: 100%;
            margin-right: -100%;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            transition: -webkit-transform .6s ease-in-out;
            transition: transform .6s ease-in-out;
            transition: transform .6s ease-in-out,-webkit-transform .6s ease-in-out
        }

        @media (prefers-reduced-motion:reduce) {
            .carousel-item {
                transition: none
            }
        }

        .carousel-item-next, .carousel-item-prev, .carousel-item.active {
            display: block
        }

            .active.carousel-item-right, .carousel-item-next:not(.carousel-item-left) {
                -webkit-transform: translateX(100%);
                transform: translateX(100%)
            }

            .active.carousel-item-left, .carousel-item-prev:not(.carousel-item-right) {
                -webkit-transform: translateX(-100%);
                transform: translateX(-100%)
            }

        .carousel-fade .carousel-item {
            opacity: 0;
            transition-property: opacity;
            -webkit-transform: none;
            transform: none
        }

            .carousel-fade .carousel-item-next.carousel-item-left, .carousel-fade .carousel-item-prev.carousel-item-right, .carousel-fade .carousel-item.active {
                z-index: 1;
                opacity: 1
            }

        .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right {
            z-index: 0;
            opacity: 0;
            transition: opacity 0s .6s
        }

        @media (prefers-reduced-motion:reduce) {
            .carousel-fade .active.carousel-item-left, .carousel-fade .active.carousel-item-right {
                transition: none
            }
        }

        .carousel-control-next, .carousel-control-prev {
            position: absolute;
            top: 0;
            bottom: 0;
            z-index: 1;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            -ms-flex-pack: center;
            justify-content: center;
            width: 15%;
            color: #fff;
            text-align: center;
            opacity: .5;
            transition: opacity .15s ease
        }

        @media (prefers-reduced-motion:reduce) {
            .carousel-control-next, .carousel-control-prev {
                transition: none
            }
        }

        .carousel-control-next:focus, .carousel-control-next:hover, .carousel-control-prev:focus, .carousel-control-prev:hover {
            color: #fff;
            text-decoration: none;
            outline: 0;
            opacity: .9
        }

        .carousel-control-prev {
            left: 0
        }

        .carousel-control-next {
            right: 0
        }

        .carousel-control-next-icon, .carousel-control-prev-icon {
            display: inline-block;
            width: 20px;
            height: 20px;
            background: no-repeat 50%/100% 100%
        }

        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M5.25 0l-4 4 4 4 1.5-1.5L4.25 4l2.5-2.5L5.25 0z'/%3e%3c/svg%3e")
        }

        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' width='8' height='8' viewBox='0 0 8 8'%3e%3cpath d='M2.75 0l-1.5 1.5L3.75 4l-2.5 2.5L2.75 8l4-4-4-4z'/%3e%3c/svg%3e")
        }

        .carousel-indicators {
            position: absolute;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 15;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-pack: center;
            justify-content: center;
            padding-left: 0;
            margin-right: 15%;
            margin-left: 15%;
            list-style: none
        }

            .carousel-indicators li {
                box-sizing: content-box;
                -ms-flex: 0 1 auto;
                flex: 0 1 auto;
                width: 30px;
                height: 3px;
                margin-right: 3px;
                margin-left: 3px;
                text-indent: -999px;
                cursor: pointer;
                background-color: #fff;
                background-clip: padding-box;
                border-top: 10px solid transparent;
                border-bottom: 10px solid transparent;
                opacity: .5;
                transition: opacity .6s ease
            }

        @media (prefers-reduced-motion:reduce) {
            .carousel-indicators li {
                transition: none
            }
        }

        .carousel-indicators .active {
            opacity: 1
        }

        .carousel-caption {
            position: absolute;
            right: 15%;
            bottom: 20px;
            left: 15%;
            z-index: 10;
            padding-top: 20px;
            padding-bottom: 20px;
            color: #fff;
            text-align: center
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0,0,0,0);
            white-space: nowrap;
            border: 0
        }

        .sr-only-focusable:active, .sr-only-focusable:focus {
            position: static;
            width: auto;
            height: auto;
            overflow: visible;
            clip: auto;
            white-space: normal
        }

        .img-dm {
            max-width: 60px !important;
            border-radius: 10px;
            padding-bottom: 0.5rem;
        }
    </style>
   
    

    <style>
        body{
            background:#000;
            overflow-x:hidden;
        }
        .single-row {
            display: flex;
            flex-wrap: nowrap; /* Prevents items from wrapping to the next line */
            overflow-x: auto; /* Enables horizontal scrolling if items overflow the container */
        }
        
        .single-row-item {
            flex: 0 0 auto; /* Prevents the items from growing or shrinking */
            width: 100px; /* Adjust the width as needed */
        }
        /* For WebKit browsers (Chrome, Safari, etc.) */
        /* For WebKit browsers (Chrome, Safari, etc.) */
        .single-row::-webkit-scrollbar {
            width: 4px; /* Adjust the width as needed */
            color: #fff0;
            
        }
        
        .single-row::-webkit-scrollbar-thumb {
            background: linear-gradient(to right, #518ee0, #212529);
            /* Adjust the color as needed */
            border-radius: 20px;
            color: #fff0;
           
        }

        .single-row::-webkit-scrollbar-track {
            background-color: #f1f1f100; /* Adjust the color as needed */
            cursor: pointer; /* Make the track clickable */
            color: #fff0;
        }

        /* For Firefox */
        .single-row {
            scrollbar-width:thin;
            scrollbar-color: #518ee0 #f1f1f100; /* Adjust the colors as needed */
            
        }

        #content-group-idols {
           /* background-image: url('Content/image-bg/JPopStore-bg.png');*/
            background-size: contain;
            background-color: #000;
        }

        .content-itens {
            position: relative; /* Đảm bảo rằng pseudo-element sẽ được đặt đúng vị trí */
            overflow: hidden; /* Đảm bảo rằng nội dung không vượt quá kích thước của #content-itens */
        }

            .content-itens::before {
                content: ""; /* Yêu cầu cho pseudo-element */
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-image: url('Content/image-bg/6.jpg');
                background-size: cover;
                background-repeat: no-repeat;
                filter: brightness(50%); /* Áp dụng hiệu ứng tối hơn cho hình nền */
                z-index: -1; /* Đặt pseudo-element dưới cùng để không che khuất nội dung */
            }
            .popupShowFixGetSubMainTitleEjoy,.popupShowFixGetSubMainEjoy,.popupShowFixGetSubMainEjoy{
                z-index:0;
                background:#0000;
                color:#0000;

            }
    </style>
    <script>
		function changeBackgroundImage() {
			var contentGroupIdols = document.getElementById('content-group-idols');
			contentGroupIdols.style.backgroundImage = "url('Content/image-bg/10.png')";
		} window.onload = changeBackgroundImage;
	</script>
    <section loading="lazy" id="content-group-idols" class="py-5">
        <div loading="lazy" class="container px-4 px-lg-5 mt-0 fade-in">
            <div loading="lazy" class=" gx-4 gx-lg-5 single-row fade-out" style="/*background-color: #EADEFF; */background: linear-gradient(to right, #EADEFF, #C4A1FE); border-radius: 20px; gap: 12px; border: 3px solid #518ee0; padding-top: 2px;">
                <asp:ListView ID="ListView1" runat="server" ItemType="TH03_WebBanHang.Models.Nhom" SelectMethod="GetGroup">
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>

                        <td />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col mb-0 single-row-item">
                            <a class="btn mt-auto card h-100" style="background: #fff0; border: none; width: 100px; height: 100px;" href="item.aspx?gp=<%#:Item.MaNhom%>">
                                <!-- Product image-->
                                <img loading="lazy" class=" img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="background-color: #fff; object-fit: cover; border-radius: 20px;" />
                                <!-- Removed inline styles for .img-with-hover and .btn-outline-dark for clarity -->
                            </a>
                        </div>
                    </ItemTemplate>

                </asp:ListView>


            </div>

        </div>
    </section>

   

   

    <section class="py-5 fade-in d-flex content-itens">
        <div class="container px-4 px-lg-5 mt-0 fade-in" style="background-color: rgb(255 255 255 / 0.57); border-radius: 10px;">

            <h3 id="SP" class="tenSP-ls-h3">
                <p class="tenSP-ls-p">Sản phẩm</p>
            </h3>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-left">
                <asp:ListView ID="ListView2" runat="server" ItemType="TH03_WebBanHang.Models.SanPham" SelectMethod="GetSanPham" PageSize="4">
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <EmptyItemTemplate>
                        <td />
                    </EmptyItemTemplate>
                    <GroupTemplate>
                        <tr id="itemPlaceholderContainer" runat="server">
                            <td id="itemPlaceholder" runat="server"></td>
                        </tr>
                    </GroupTemplate>
                    <ItemTemplate>
                        <div class="col mb-5 fade-in">
                            <a class="btn btn-outline-dark mt-auto btn-mua card h-100" href="item.aspx?sp=<%#:Item.MaSP%>">
                                <!-- Product image-->
                                <img loading="lazy" class="card-img-top img-with-hover" src="<%#:Item.DuongDan%>" alt="..." style="padding: 20px; height: max-content;" />

                                <!-- Product details-->
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <!-- Product name-->
                                        <h5 class="fw-bolder"><%#:Item.TenSP%></h5>
                                    </div>
                                </div>
                                <!-- Product actions-->
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <!-- Product price-->
                                    <p class="text-center"><%# string.Format("{0:N0}", Item.Gia) %>đ</p>
                                                                        <div class="text-center d-flex justify-content-center" style="gap:1rem;">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                                        <script>
											$(document).ready(function () {
												$('.btn-mua').click(function () {
													var url = $(this).data('href');
													window.location.href = url;
												});
											});
										</script>
<button class="btn btn-outline-dark mt-auto btn-mua" style="background:#fff; color:#000;" type="button" data-href="item.aspx?sp=<%#:Item.MaSP%>">Mua</button>
                                                                        <asp:ImageButton ID="btnCart"  CommandArgument='<%#:Item.MaSP%>' runat="server" Style="width: 57.5px; height:37.5px; background:#fff;" OnClick="btnCart_Click" class="btn btn-outline-dark flex-shrink-0 btn-gio  btn-gio-card" ImageUrl="~/Content/icon/sz-add-cart.png" />

            </div>

                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

            </div>
            <a href="Item.aspx">
                <h6 id="more" class="tenSP-ls-h6">
                    <style>
                        .tenSP-ls-h6 {
                            font-size: 1.5rem;
                            font-family: Baloo;
                            
                        }
                    </style>
                    <p class="tenSP-ls-p" style="border-bottom-color: #0000;color:#fff;">
                        Xem thêm
                    </p>
                </h6>
            </a>
        </div>
        <style>
            .embed-responsive {
                border-radius: 10px; /* Điều chỉnh độ tròn của iframe */
                overflow: hidden; /* Đảm bảo rằng iframe được làm tròn */
            }

            .embed-responsive-16by9::before {
                padding-top: 56.25%
            }

            .embed-responsive {
                position: relative;
                display: block;
                width: 100%;
                padding: 0;
                overflow: hidden
            }

                .embed-responsive::before {
                    display: block;
                    content: ""
                }

                .embed-responsive .embed-responsive-item, .embed-responsive embed, .embed-responsive iframe, .embed-responsive object, .embed-responsive video {
                    position: absolute;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    border: 0
                }

                .embed-responsive-item, .embed-responsive embed, .embed-responsive iframe, .embed-responsive object, .embed-responsive video {
                    position: absolute;
                    top: 0;
                    bottom: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    border: 0
                }
        </style>

      
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <!-- JavaScript của Bootstrap và jQuery (Bootstrap đòi hỏi jQuery) -->

    </section>
    <%--<section class="py-5">
        <div class="container px-4 px-lg-5 mt-0 fade-left">

            <div id="carouselExampleControlsRoom" class="carousel slide" data-bs-ride="carousel">
                <a class="carousel-control-prev" href="#carouselExampleControlsRoom" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControlsRoom" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleControlsRoom" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleControlsRoom" data-slide-to="1"></li>
                    <        <li data-target="#carouselExampleControlsRoom" data-slide-to="2"></li>>
                    < <li data-target="#carouselExampleControlsBranch" data-slide-to="3"></li>
        <li data-target="#carouselExampleControlsBranch" data-slide-to="4"></li>>
                    <<li data-target="#carouselExampleControlsBranch" data-slide-to="5"></li>
        <li data-target="#carouselExampleControlsBranch" data-slide-to="6"></li>>
              <  </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active fade-in">
                        <style>
                            .carousel-caption {
                                color: white;
                                text-align: left;
                                background: linear-gradient(to right,#518ee0, #fff);
                                width: max-content;
                                margin-left: -10rem;
                                font-family: 'Baloo', sans-serif;
                                -webkit-background-clip: text;
                                text-fill-color: transparent;
                                -webkit-text-fill-color: transparent;
                            }

                                .carousel-caption h3 {
                                    font-size: 4.5rem;
                                    margin-bottom: 1rem;
                                }

                                .carousel-caption p {
                                    font-size: 3.25rem;
                                }
                        </style>
                        <img loading="lazy" src="Content\image-branch\KGCH.png" class="d-block w-100" alt="Background Image 1">
                    </div>
                    <div class="carousel-item fade-in">

                        <img loading="lazy" src="Content\image-branch\KGCH2.png" class="d-block w-100" alt="Background Image 2">
                    </div>

                    <!-- Thêm các ảnh khác vào đây -->
                </div>
            </div>
        </div>
    </section>--%>
    <%--<section class="py-5">
        <div class="container px-4 px-lg-5 mt-0 fade-right">

            <div id="carouselExampleControlsBranch" class="carousel slide" data-bs-ride="carousel">
                <a class="carousel-control-prev" href="#carouselExampleControlsBranch" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControlsBranch" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleControlsBranch" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleControlsBranch" data-slide-to="1"></li>
                    <li data-target="#carouselExampleControlsBranch" data-slide-to="2"></li>
                    <li data-target="#carouselExampleControlsBranch" data-slide-to="3"></li>
        <li data-target="#carouselExampleControlsBranch" data-slide-to="4"></li>
                    <li data-target="#carouselExampleControlsBranch" data-slide-to="5"></li>
        <li data-target="#carouselExampleControlsBranch" data-slide-to="6"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active fade-in">
                        <style>
                            .carousel-caption {
                                color: white;
                                text-align: left;
                                background: linear-gradient(to right,#518ee0, #fff);
                                width: max-content;
                                margin-left: -10rem;
                                font-family: 'Baloo', sans-serif;
                                -webkit-background-clip: text;
                                text-fill-color: transparent;
                                -webkit-text-fill-color: transparent;
                            }

                                .carousel-caption h3 {
                                    font-size: 4.5rem;
                                    margin-bottom: 1rem;
                                }

                                .carousel-caption p {
                                    font-size: 3.25rem;
                                }
                        </style>
                        <div class="carousel-caption d-none d-md-block fade-in">
                            <h3>Hồ Chí Minh</h3>
                        </div>
                        <img loading="lazy" src="Content\image-branch\cuahang3.png" class="d-block w-100" alt="Background Image 1">
                    </div>
                    <div class="carousel-item fade-in">
                        <div class="carousel-caption d-none d-md-block fade-in">
                            <h3>Hà Nội</h3>
                        </div>
                        <img loading="lazy" src="Content\image-branch\cuahang4.png" class="d-block w-100" alt="Background Image 2">
                    </div>
                    <div class="carousel-item fade-in">
                        <div class="carousel-caption d-none d-md-block fade-in">
                            <h3>Phú Quốc</h3>
                        </div>
                        <img loading="lazy" src="Content\image-branch\cuahang5.png" class="d-block w-100" alt="Background Image 3">
                    </div>--%>
        
                    <!-- Thêm các ảnh khác vào đây -->
     <%--           </div>
            </div>
        </div>
    </section>--%>

  <section class="py-5 fade-in d-flex content-itens">
        <div class="container px-4 px-lg-5 mt-0 fade-in d-flex" style="background-color: #0000007f; border-radius: 50px;">

            <!-- Video lớn ở trên -->
           <div style="width: 50%">
            <h3 id="TS" class="tenSP-ls-h3">
     <%--<p class="tenSP-ls-p">Thịnh hành</p>--%>
 </h3>
                <div class="embed-responsive embed-responsive-16by9 mb-3 fade-in video-if">
                    <iframe loading="lazy" class="embed-responsive-item fade-in" src="https://www.youtube.com/embed/1o9RhSlEIMM" allowfullscreen></iframe>
                </div>
                <!-- 4 video nhỏ ở dưới -->
                <div class="row">
                    <div class="col-6">
                        <div class="embed-responsive embed-responsive-16by9 mb-3 fade-in video-if">
                            <iframe loading="lazy" class="embed-responsive-item fade-in" src="https://www.youtube.com/embed/AAsRtnbDs-0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="embed-responsive embed-responsive-16by9 mb-3 fade-in video-if">
                            <iframe loading="lazy" class="embed-responsive-item fade-in" src="https://www.youtube.com/embed/zBuJD-ugT_g" allowfullscreen></iframe>
                        </div>
                    </div>

                </div>
            </div>
            <div class="fade-in" style="width: 50%; margin-top:3rem;">
                <style>
                    .video-if {
                        background-color: darkgray;
                    }

                    #div-list-end li {
                        border: 4px solid #522A77;
                        padding: 5px;
                        border-radius: 20px;
                        width: 8rem;
                        text-align: center;
                        margin: 0 0.5rem;
                    }

                        #div-list-end li a {
                            color: #518ee0;
                        }

                        #div-list-end li:hover a {
                            color: #542480;
                        }
                    /* #div-tin li a img{
                                            width:100%;
                                            height:100%;
                                        }*/

                    #div-tin li {
                        margin-bottom: 2.5rem;
                        height: 100px;
                    }

                    .text-container {
                        max-height: 100px;
                        overflow: hidden; /* Ẩn phần văn bản vượt quá kích thước */
                        text-overflow: ellipsis; /* Thêm dấu chấm (...) khi văn bản bị cắt bớt */
                    }

                    #div-tin a {
                        display: flex;
                        align-items: flex-start; /* Đảm bảo rằng vị trí x của chữ và hình ảnh bằng nhau */
                        color: #fff;
                        font-size: large;
                    }

                        #div-tin a p {
                            width: 100%;
                            padding-left: 1rem;
                            position: relative;
                            top: 0;
                        }

                    .image-container {
                        height: 100px; /* Kích thước cố định */
                        width: 256px; /* Kích thước cố định */
                        overflow: hidden; /* Ẩn phần nằm ngoài khung */
                    }

                        .image-container img {
                            width: 100%; /* Chiều rộng của ảnh fill toàn bộ phần tử chứa */
                            height: 100%; /* Chiều cao của ảnh fill toàn bộ phần tử chứa */
                            object-fit: cover; /* Hiển thị ảnh sao cho vừa khung */
                        }
                </style>
                <script>
					window.addEventListener('DOMContentLoaded', (event) => {
						const images = document.querySelectorAll('.image-container img');
						if (images.length > 0) {
							const firstImage = images[0];
							const firstImageWidth = firstImage.width;
							const firstImageHeight = firstImage.height;

							images.forEach(img => {
								img.style.width = `${firstImageWidth}px`;
								img.style.height = `${firstImageHeight}px`;
							});
						}
					});
				</script>

                <ul id="div-tin" class="fade-in">
                    <li>
                        <a href="https://hololivepro.com/news_en/20240123-01-66/">
                            <div class="image-container fade-in">
                                <img loading="lazy" class="fade-in" src="https://hololive.hololivepro.com/wp-content/uploads/2024/01/000top.jpg" />
                            </div>
                            <p><span class="text-container fade-in">Hợp tác giữa thủy cung "Gurarium tại Sendai Umino-Mori Aquarium" với hololive English VTuber Gawr Gura!<br />
                                <small>Sự kiện hợp tác sẽ mở cửa trong thời gian giới hạn từ 20/01/2024 đến 29/2/2024.</small></span></p>
                        </a>
                    </li>
                    <li>
                        <a href="https://cover-corp.com/en/news/detail/20230511-03">
                            <div class="image-container fade-in">
                                <img loading="lazy" class="fade-in" src="https://images.microcms-assets.io/assets/6368857617454c2591b02acff18e76bb/35aab7df51fb4b60864b9ccfc556086c/30268-952-0e7e694dd02f06360c15300973ad97eb-1284x720.webp" />
                            </div>
                            <p><span class="text-container fade-in">COVER Corporation thông báo về Studio mới lên đến 2.7 tỷ yên!<br />
                                <small>Việc nâng cấp studio này sẽ có thể hỗ trợ tốt hơn cho các talents của mình trong việc quay hình cũng như trong việc Virtual Streaming.</small></span></p>
                        </a>
                    </li>
                    <li>
                        <a href="https://hololivepro.com/news_en/20240228-01-73/">
                            <div class="image-container fade-in">
                                <img loading="lazy" class="fade-in" src="https://hololive.hololivepro.com/wp-content/uploads/2024/02/Mori-Calliope-Paws-for-a-Cause-2024.webp" />
                            </div>
                            <p><span class="text-container fade-in">Mori Calliope đã gây quỹ hơn 70,000$ cho tổ chức Cats Protection!<br />
                                <small>Vào ngày 14/2 cô đã có một buổi live mang tên "Paws for a Cause 2024" nhằm gây quỹ cho tổ chức Cats Protection để giúp tái định cư cho các chú mèo bị bỏ rơi và không được chủ nhân chăm sóc.</small></span></p>
                        </a>
                    </li>

                </ul>
                <%--<ul id="div-list-end" class="d-flex fade-in">
                    <li>
                        <a href="ChildForm.aspx?page=DichVu">
                            <h6>Dịch vụ</h6>
                        </a>

                    </li>
                    <li>
                        <a href="ChildForm.aspx?page=KhuyenMai">
                            <h6>Khuyến mãi</h6>
                        </a>

                    </li>
                    <li>
                        <a href="ChildForm.aspx?page=HoTro">
                            <h6>Hỗ trợ</h6>
                        </a>

                    </li>
                    <li>
                        <a href="ChildForm.aspx?page=LienKet">
                            <h6>Liên kết</h6>
                        </a>

                    </li>

                    <li>
    <a href="ChildForm.aspx?page=Ưu đãi"> 
        <h6>Báo cáo</h6>
    </a>
   
</li>
         </ul>
            </div>

        </div>--%>

    </section>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </section>
</asp:Content>
