﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="PayQR.aspx.cs" Inherits="TH03_WebBanHang.PayQR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class=" container p-2" style="max-width:60%">
        <div class="layout-bills-inner box-section">
                        <div class="row list-mb24 list-crop">
                            <div class="col-12 main-title-mobile show-mobile h3 text-center">
                                Thanh toán qua ứng dụng Ngân hàng/ Ví điện tử
                            </div>
                            <div class="col-12 show-desktop">
                                <div class="alert-box alert-box-warning ubg-sub-warning list-crop">
                                    <div class="alert-box-title">
                                        <div class="row row-8">
                                            <div class="col-auto ic">
                                                <img src="https://sandbox.vnpayment.vn/paymentv2/images/icons-color/warning/default/24x24-alert.svg" alt="" class="ic-default">
                                            </div>
                                            <div class="col title weight5">
                                                Quý khách vui lòng không tắt trình duyệt cho đến khi nhận được kết quả giao dịch trên website. Trường hợp đã thanh toán nhưng chưa nhận kết quả giao dịch, vui lòng bấm <a href="#" id="qrBack">"Tại đây"</a> để nhận kết quả. Xin cảm ơn!
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                    <div class="col-md-5 bills-col">
            <div class="bills">
                <div class="bills-header h2 show-desktop">
                    Thông tin đơn hàng
                </div>
                <div class="bills-header-mobile show-mobile list-mb12 list-last-mb" data-bs-toggle="collapse" data-bs-target="#accordionBill" aria-expanded="true" aria-controls="accordionBill">
                    <div class="title weight5">
                        Thanh toán đơn hàng <asp:Label runat="server" ID="lbTTDH"></asp:Label>
                    </div>
                    <div class="row color-primary align-items-center">
                        <div class="col h2">
                            <span id="totalAmountMb"><asp:Label runat="server" ID="lbSoTienThanhToanSmall"></asp:Label></span><%--<%--<sup>VND</sup>--%>
                        </div>
                        <div class="col-auto">
                            <!-- button.button -->
                            <div class="ubg-transparent ubox-size-button-xs ubg-hover ubg-active ubtn">
                                <div class="ubtn-inner">
                                    <span class="ubtn-text color-primary">
                                        Xem chi tiết
                                    </span>
                                    <span class="ubtn-ic ubtn-ic-right">
                                        <img src="https://sandbox.vnpayment.vn/paymentv2/images/icons-color/primary/default/24x24-download.svg" alt="" class="ic-default">
                                    </span>
                                </div>
                            </div>
                            <!-- end button.button -->
                        </div>
                    </div>
                </div>
                <div class="bills-body accordion-collapse collapse" id="accordionBill">
                    <div>
                        <div class="bills-list list-mb24 list-last-mb">
                            <div class="bills-list-item show-desktop">
                                <div class="row">
                                    <div class="col-md-12 col-5 mb4">
                                        <div class="sub-title color-sub-default">
                                            Số tiền thanh toán
                                        </div>
                                    </div>
                                    <div class="col-md-12 col">
                                        <div class="title text-left-md-right color-primary h2">
                                            <span id="totalAmountDt"><asp:Label runat="server" ID="lbSoTienThanhToan"></asp:Label></span><%--<sup>VND</sup>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bills-list-item">
                                <div class="row">
                                    <div class="col-md-12 col-5 mb4">
                                        <div class="sub-title color-sub-default">
                                            Giá trị đơn hàng
                                        </div>
                                    </div>
                                    <div class="col-md-12 col">
                                        <div class="title text-left-md-right h3">
                                            <asp:Label runat="server" ID="lbGiaDonHang"></asp:Label><%--<%--<sup>VND</sup>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bills-list-item">
                                <div class="row">
                                    <div class="col-md-12 col-5 mb4">
                                        <div class="sub-title color-sub-default">
                                            Phí giao dịch
                                        </div>
                                    </div>
                                    <div class="col-md-12 col">
                                        <div class="title text-left-md-right h3">
                                            0<%--<sup>VND</sup>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="bills-list-item show-desktop">
                                <div class="row">
                                    <div class="col-md-12 col-5 mb4">
                                        <div class="sub-title color-sub-default">
                                            Mã đơn hàng
                                        </div>
                                    </div>
                                    <div class="col-md-12 col">
                                        <div class="title text-left-md-right h3">
                                            <asp:Label runat="server" ID="lbMaDH"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bills-list-item">
                                <div class="row">
                                    <div class="col-md-12 col-5 mb4">
                                        <div class="sub-title color-sub-default">
                                            Nhà cung cấp
                                        </div>
                                    </div>
                                    <div class="col-md-12 col">
                                        <div class="title text-left-md-right h3">
                                            MC CTT VietQR
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                            <div class="col-md right-bill-col">
                                <div class="right-bill-col-inner">
                                    <div class="main-title h2 text-center show-desktop mb24">
                                        Quét mã qua ứng dụng Ngân hàng/ Ví điện tử
                                    </div>
                                    <div class="qr-section">
                                        <div class="qr-section-inner list-mb24 list-last-mb">
                                            <a href="#" data-bs-toggle="modal" data-bs-target="#modalHuongDan" class="link weight5 link-style-default show-desktop">
                                                <img src="https://sandbox.vnpayment.vn/paymentv2/images/icons-color/info/default/24x24-information-circle.svg" alt="" class="ic-default">
                                                Hướng dẫn thanh toán
                                            </a>
                                            <div class="qr qr-size-default" data-bs-toggle="modal" data-bs-target="#modalQR">
                                                <div class="qr-inner" style="background-image: url('../../../../images/img/mics/qr-frame.svg');">
<%--                                                    <img  src="data:image/png;base64,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" alt="QR CODE">--%>
                                                   <asp:Image ID="imgMomoQRCode" class="qrcodeimg-modal" runat="server" style=" width: 100%; border:3px ridge #0071A9; border-radius:10px;"/>
                                                  <style>
                                                      [data-accordion],a,button,input,label,section,select,span,textarea {
    -webkit-tap-highlight-color: transparent
}

a {
    text-decoration: none!important
}

a:active,a:focus,a:hover,a:visited {
    color: initial
}

a:focus,input:focus {
    outline: 0
}

img {
    vertical-align: middle;
    max-width: 100%;
    height: auto
}

ol,ul {
    list-style: none;
    padding-left: 0
}

details,footer,header,nav,section {
    display: block
}

select::-ms-expand {
    display: none
}

select {
    border: 0
}

select:focus::-ms-value {
    background-color: inherit;
    color: #000
}

.ubox {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.ubox-square {
    padding: 0!important
}

.ubox-size-ic-xxs {
    height: 16px;
    min-width: 16px
}

.ubox-size-ic-xxs.ubox-square {
    width: 16px
}

.ubox-size-ic-xxs.ubox-rounded {
    border-radius: 8px
}

.ubox-size-ic-xs {
    height: 32px;
    min-width: 32px
}

.ubox-size-ic-xs.ubox-square {
    width: 32px
}

.ubox-size-ic-xs.ubox-rounded {
    border-radius: 16px
}

.ubox-size-ic-md {
    height: 40px;
    min-width: 40px
}

.ubox-size-ic-md.ubox-square {
    width: 40px
}

.ubox-size-ic-md.ubox-rounded {
    border-radius: 20px
}

.ubox-size-ic-xxxl {
    height: 160px;
    min-width: 160px
}

.ubox-size-ic-xxxl.ubox-square {
    width: 160px
}

.ubox-size-ic-xxxl.ubox-rounded {
    border-radius: 80px
}

.ubox-size-button-default {
    height: 44px;
    min-width: 44px;
    font-size: 14px;
    padding: 12px;
    border-radius: 6px;
    font-weight: 500
}

.ubox-size-button-default.ubox-square {
    width: 44px
}

.ubox-size-button-default.ubox-rounded {
    border-radius: 22px
}

.ubox-size-button-default .ubtn-inner {
    font-size: 14px
}

.ubox-size-button-sm {
    height: 36px;
    min-width: 36px;
    font-size: 14px;
    padding: 8px;
    border-radius: 4px
}

.ubox-size-button-sm.ubox-square {
    width: 36px
}

.ubox-size-button-sm.ubox-rounded {
    border-radius: 18px
}

.ubox-size-button-sm .ubtn-inner {
    font-size: 14px
}

.ubox-size-button-xs {
    height: 28px;
    min-width: 28px;
    font-size: 12px;
    padding: 4px;
    border-radius: 4px
}

.ubox-size-button-xs.ubox-square {
    width: 28px
}

.ubox-size-button-xs.ubox-rounded {
    border-radius: 14px
}

.ubox-size-button-xs .ubtn-inner {
    font-size: 12px
}

.ubox-size-button-xxs {
    height: 24px;
    min-width: 24px;
    font-size: 12px;
    padding: 4px;
    border-radius: 4px
}

.ubox-size-button-xxs.ubox-square {
    width: 24px
}

.ubox-size-button-xxs.ubox-rounded {
    border-radius: 12px
}

.ubox-size-button-xxs .ubtn-inner {
    font-size: 12px
}

.ubox-size-ic-xxxl .ic-default {
    width: 160px
}

.color-transparent {
    color: transparent
}

.color-invert {
    color: #fff
}

.color-black {
    color: #000
}

.color-white {
    color: #fff
}

.color-default {
    color: #21262c
}

.color-sub-default {
    color: #5a7087
}

.color-default-light {
    color: #bfccd9
}

.color-blue-light {
    color: #eaf6fa
}

.color-blue {
    color: #1d9ec9
}

.color-blue-dark {
    color: #0b6d8e
}

.color-blue-darker {
    color: #0a5a75
}

.color-red-light {
    color: #faeaea
}

.color-red {
    color: #c91d1d
}

.color-red-dark {
    color: #8e0b0b
}

.color-red-darker {
    color: #750a0a
}

.color-orange-light {
    color: #fef3e7
}

.color-orange {
    color: #e07e06
}

.color-orange-dark {
    color: #995400
}

.color-orange-darker {
    color: #804600
}

.color-green-light {
    color: #eef6ef
}

.color-green {
    color: #29a339
}

.color-green-dark {
    color: #2a6f33
}

.color-green-darker {
    color: #235c2b
}

.color-azure-light {
    color: #e8f1f6
}

.color-azure {
    color: #0071a9
}

.color-azure-dark {
    color: #005c8a
}

.color-azure-darker {
    color: #046
}

.color-porcelain-light {
    color: #f5f7f9
}

.color-porcelain {
    color: #eff2f5
}

.color-porcelain-dark {
    color: #eaedf1
}

.color-apple {
    color: #000
}

.color-primary {
    color: #0071a9
}

.color-sub-primary {
    color: #e8f1f6
}

.color-secondary {
    color: #f5f7f9
}

.color-border-color {
    color: #eff2f5
}

.color-info {
    color: #1d9ec9
}

.color-sub-info {
    color: #eaf6fa
}

.color-danger {
    color: #c91d1d
}

.color-sub-danger {
    color: #faeaea
}

.color-warning {
    color: #e07e06
}

.color-sub-warning {
    color: #fef3e7
}

.color-success {
    color: #29a339
}

.color-sub-success {
    color: #eef6ef
}

.color-blank {
    color: transparent
}

.ubg-transparent {
    background-color: transparent;
    color: #21262c
}

.ubg-transparent.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-transparent.ubg-hover:hover {
    background-color: #e3e8ed
}

.ubg-transparent .ubtn-inner {
    color: #21262c
}

.ubg-white {
    background-color: #fff;
    color: #21262c
}

.ubg-white.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-white .ubtn-inner {
    color: #21262c
}

.ubg-default {
    background-color: #21262c;
    color: #fff
}

.ubg-default.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-default.ubg-hover:hover {
    background-color: #52667a
}

.ubg-default.ubg-active:active {
    background-color: #0b0d0f
}

.ubg-default .ubtn-inner {
    color: #fff
}

.ubg-porcelain-light {
    background-color: #f5f7f9;
    color: #21262c
}

.ubg-porcelain-light.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-porcelain-light.ubg-hover:hover {
    background-color: #e9edf2
}

.ubg-porcelain-light.ubg-active:active {
    background-color: #dce3ea
}

.ubg-porcelain-light .ubtn-inner {
    color: #21262c
}

.ubg-porcelain {
    background-color: #eff2f5;
    color: #21262c
}

.ubg-porcelain.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-porcelain.ubg-hover:hover {
    background-color: #e3e8ed
}

.ubg-porcelain.ubg-active:active {
    background-color: #d6dee6
}

.ubg-porcelain .ubtn-inner {
    color: #21262c
}

.ubg-primary {
    background-color: #0071a9;
    color: #fff
}

.ubg-primary.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-primary.ubg-hover:hover {
    background-color: #00699e
}

.ubg-primary.ubg-active:active {
    background-color: #006394
}

.ubg-primary .ubtn-inner {
    color: #fff
}

.ubg-sub-primary {
    background-color: #e8f1f6;
    color: #0071a9
}

.ubg-sub-primary.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-sub-primary.ubg-hover:hover {
    background-color: #d3e5ee
}

.ubg-sub-primary.ubg-active:active {
    background-color: #bcd8e6
}

.ubg-sub-primary .ubtn-inner {
    color: #0071a9
}

.ubg-secondary {
    background-color: #f5f7f9;
    color: #21262c
}

.ubg-secondary.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-secondary.ubg-hover:hover {
    background-color: #e9edf2
}

.ubg-secondary.ubg-active:active {
    background-color: #dce3ea
}

.ubg-secondary .ubtn-inner {
    color: #21262c
}

.ubg-border-color {
    background-color: #eff2f5;
    color: #21262c
}

.ubg-border-color.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-border-color.ubg-hover:hover {
    background-color: #e3e8ed
}

.ubg-border-color.ubg-active:active {
    background-color: #d6dee6
}

.ubg-border-color.ubg-shadow {
    -webkit-box-shadow: 0 5px 30px 0 rgba(239,242,245,.2);
    box-shadow: 0 5px 30px 0 rgba(239,242,245,.2)
}

.ubg-border-color .ubtn-inner {
    color: #21262c
}

.ubg-sub-info {
    background-color: #eaf6fa;
    color: #0b6d8e
}

.ubg-sub-info.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-sub-info.ubg-hover:hover {
    background-color: #d2ecf4
}

.ubg-sub-info.ubg-active:active {
    background-color: #b9e1ee
}

.ubg-sub-info .ubtn-inner {
    color: #0b6d8e
}

.ubg-danger {
    background-color: #c91d1d;
    color: #fff
}

.ubg-danger.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-danger.ubg-hover:hover {
    background-color: #ae1919
}

.ubg-danger.ubg-active:active {
    background-color: #931515
}

.ubg-danger .ubtn-inner {
    color: #fff
}

.ubg-sub-danger {
    background-color: #faeaea;
    color: #8e0b0b
}

.ubg-sub-danger.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-sub-danger.ubg-hover:hover {
    background-color: #f4d2d2
}

.ubg-sub-danger.ubg-active:active {
    background-color: #eebaba
}

.ubg-sub-danger .ubtn-inner {
    color: #8e0b0b
}

.ubg-warning {
    background-color: #e07e06;
    color: #fff
}

.ubg-warning.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-warning.ubg-hover:hover {
    background-color: #c26d05
}

.ubg-warning.ubg-active:active {
    background-color: #a45d04
}

.ubg-warning .ubtn-inner {
    color: #fff
}

.ubg-sub-warning {
    background-color: #fef3e7;
    color: #e07e06
}

.ubg-sub-warning.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-sub-warning.ubg-hover:hover {
    background-color: #fde4c9
}

.ubg-sub-warning.ubg-active:active {
    background-color: #fcd5ac
}

.ubg-sub-warning .ubtn-inner {
    color: #e07e06
}

.ubg-success {
    background-color: #29a339;
    color: #fff
}

.ubg-success.ubg-hover {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.ubg-success.ubg-hover:hover {
    background-color: #238b30
}

.ubg-success.ubg-active:active {
    background-color: #1c7228
}

.ubg-success .ubtn-inner {
    color: #fff
}

.ubg-op-border-color {
    background-color: rgba(239,242,245,.2);
    color: #eff2f5
}

.ubg-op-border-color.bg-shadow {
    -webkit-box-shadow: 0 5px 30px 0 rgba(239,242,245,.3);
    box-shadow: 0 5px 30px 0 rgba(239,242,245,.3)
}

.ubg-op-border-color .legitRipple-ripple {
    background: #fff
}

.ubg-line-porcelain-dark {
    border: 1px solid #eaedf1!important;
    -webkit-box-shadow: none;
    box-shadow: none;
    background: 0 0
}

.ubg-line-porcelain-dark>* {
    color: #eaedf1
}

.ubg-line-border-color {
    border: 1px solid #eff2f5!important;
    -webkit-box-shadow: none;
    box-shadow: none;
    background: 0 0
}

.ubg-line-border-color>* {
    color: #eff2f5
}

.ubg-line-border-color .legitRipple-ripple {
    background: #fff
}

.text-left {
    text-align: left!important
}

@media (min-width: 768px) {
    .text-left-md-right {
        text-align:left!important
    }
}

@media (max-width: 767px) {
    .text-left-md-right {
        text-align:right!important
    }
}

.text-center {
    text-align: center!important
}

.text-right {
    text-align: right!important
}

.ic {
    height: auto
}

.ic-default {
    width: 24px;
    height: auto
}

.ic-sm {
    width: 16px;
    height: auto
}

.ic-md {
    width: 20px;
    height: auto
}

.fz-h3 {
    font-size: 16px
}

.fz-h5 {
    font-size: 12px
}

.h1,h1 {
    margin: 0;
    font-size: 28px;
    line-height: 1.4;
    font-weight: 500
}

.h2,h2 {
    margin: 0;
    font-size: 22px;
    line-height: 1.4;
    font-weight: 500
}

.h2-5,h2-5 {
    margin: 0;
    font-size: 18px;
    line-height: 1.5;
    font-weight: 500
}

.h3,h3 {
    margin: 0;
    font-size: 16px;
    line-height: 1.5;
    font-weight: 500
}

.h4,h4 {
    margin: 0;
    font-size: 14px;
    line-height: 1.4;
    font-weight: 500
}

.h5,h5 {
    margin: 0;
    font-size: 12px;
    line-height: 1.3;
    font-weight: 600
}

.p1,p1 {
    margin: 0;
    font-size: 16px;
    line-height: 1.5
}

.p3,p3 {
    margin: 0;
    font-size: 12px;
    line-height: 1.4
}

.default,default {
    margin: 0;
    font-size: 14px;
    line-height: 1.4
}

.weight5 {
    font-weight: 500
}

.weight6 {
    font-weight: 600
}

.b,b {
    font-weight: 700
}

.p,p {
    font-size: 14px;
    line-height: 1.3
}

label {
    font-size: 14px
}

button,input,select,textarea {
    font-size: 14px;
    outline: 0;
    -webkit-appearance: none
}

select {
    cursor: pointer
}

/*!
 * Hamburgers
 * @description Tasty CSS-animated hamburgers
 * @author Jonathan Suh @jonsuh
 * @site https://jonsuh.com/hamburgers
 * @link https://github.com/jonsuh/hamburgers
 */
.input-trigger__glass {
    moz-transform-origin: 50% 50%;
    -ms-transform-origin: 50% 50%;
    -webkit-transform-origin: 50% 50%;
    transform-origin: 50% 50%;
    -ms-transform: scale(1);
    -webkit-transform: scale(1);
    transform: scale(1);
    background-position: center;
    background-repeat: no-repeat;
    background-image: url(../images/icons-color/default/default/search.svg);
    background-size: 20px 20px;
    background-color: transparent;
    -webkit-transition: all .3s cubic-bezier(.645,.045,.355,1);
    -o-transition: all .3s cubic-bezier(.645,.045,.355,1);
    transition: all .3s cubic-bezier(.645,.045,.355,1);
    width: 100%;
    height: 100%;
    top: 0
}

.trigger {
    display: block;
    font-size: 0
}

.bd-example-modal {
    padding: 1px;
    background-color: rgba(0,0,0,.5);
    border-radius: 16px;
    margin-bottom: 20px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.bd-example-modal .modal,.bd-example-modal .toast {
    position: relative;
    top: auto;
    right: auto;
    bottom: auto;
    left: auto;
    z-index: 1;
    display: block;
    opacity: 1!important;
    -webkit-transform: none!important;
    -ms-transform: none!important;
    transform: none!important;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.bd-example-modal>:not(.modal) {
    margin: 32px auto;
    pointer-events: all
}

.bd-example-modal .modal-dialog {
    left: auto;
    margin-right: 32px;
    margin-left: 32px;
    -webkit-transform: none!important;
    -ms-transform: none!important;
    transform: none!important;
    max-width: 100%
}

.col-btn-close {
    min-width: 60px
}

.close-modal-btn {
    height: 40px;
    display: block
}

.alert-modal-ic~.modal-title {
    margin-top: 0
}

.modal {
    z-index: 3000;
    -webkit-overflow-scrolling: touch
}

.modal-backdrop {
    background-color: #000
}

.modal-backdrop.show {
    opacity: .5
}

.modal-size-default {
    width: 540px
}

.modal-size-alert-default {
    width: 360px
}

.modal-size-xs {
    width: 360px
}

.modal-size-sm {
    width: 570px
}

.modal-size-md {
    width: 720px
}

.modal-size-lg {
    width: 1200px
}

.modal-wrap {
    width: 100%
}

.modal.title {
    margin-top: 16px
}

.modal-content {
    border: 0;
    border-radius: 10px;
    -webkit-box-shadow: 5px 10px 20px 0 rgba(33,38,44,.03);
    box-shadow: 5px 10px 20px 0 rgba(33,38,44,.03)
}

.modal-dialog-centered .modal-content {
    overflow: hidden
}

.modal-header {
    padding: 32px 16px 5px 16px;
    border: 0
}

.modal-body {
    border: 0;
    text-align: inherit;
    padding: 16px 16px
}

.modal-footer {
    padding: 10px 16px;
    border: 0;
    display: block
}

.modal-footer>* {
    margin-top: 0;
    margin-bottom: 0
}

.modal-close {
    position: absolute;
    right: 0;
    top: 0;
    cursor: pointer;
    min-width: 40px
}

.modal-close img {
    width: 16px
}

.modal-alert .modal-footer {
    padding: 16px 32px 32px 32px
}

.modal-alert .modal-header {
    padding-bottom: 0
}

.modal-alert .modal-body {
    padding: 12px 32px 16px 32px
}

.modal .open>[data-content] {
    max-height: none!important
}

.modal-dialog {
    max-width: calc(100vw - 16px)
}

.modal-dialog-scrollable .modal-footer,.modal-dialog-scrollable .modal-header {
    position: relative;
    z-index: 1
}

.modal-dialog-scrollable .modal-footer::after,.modal-dialog-scrollable .modal-header::after {
    position: absolute;
    content: "";
    left: 0;
    width: 100%;
    height: 16px;
    pointer-events: none;
    background: -o-linear-gradient(top,#fff 0,rgba(255,255,255,0) 100%);
    background: -webkit-gradient(linear,left top,left bottom,from(#fff),to(rgba(255,255,255,0)));
    background: linear-gradient(180deg,#fff 0,rgba(255,255,255,0) 100%)
}

.modal-dialog-scrollable .modal-header::after {
    bottom: -16px
}

.modal-dialog-scrollable .modal-footer::after {
    top: -16px;
    -webkit-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    transform: rotate(180deg)
}

@media (min-width: 768px) {
    .modal-dialog:not(.modal-alert) .modal-open {
        overflow-y:scroll!important
    }

    .modal-dialog:not(.modal-alert) .modal-header {
        padding: 32px 32px 16px 32px
    }

    .modal-dialog:not(.modal-alert) .modal-body {
        padding: 16px 32px
    }

    .modal-dialog:not(.modal-alert) .modal-body:last-child {
        padding-bottom: 32px
    }

    .modal-dialog:not(.modal-alert) .modal-footer {
        padding: 16px 32px 32px 32px
    }
}

@media (max-width: 767px) {
    .modal-dialog:not(.modal-alert) .modal-body {
        padding:12px 16px
    }

    .modal-dialog:not(.modal-alert) .modal-body:last-child {
        padding-bottom: 16px
    }

    .modal-dialog:not(.modal-alert) .modal-header {
        padding: 24px 16px 12px 16px
    }

    .modal-dialog:not(.modal-alert) .modal-footer {
        padding: 12px 16px 16px 16px
    }
}

@media (max-width: 575px) {
    .modal-dialog:not(.modal-alert) .modal-dialog {
        margin:.5rem auto
    }
}

.modal.fade:not(.modal-static) .modal-dialog {
    -webkit-transform: translate(0,0);
    -ms-transform: translate(0,0);
    transform: translate(0,0);
    -webkit-transition: none;
    -o-transition: none;
    transition: none
}

.toast {
    border-radius: 6px;
    border: 0;
    -webkit-box-shadow: 0 4px 8px rgba(38,41,44,.16);
    box-shadow: 0 4px 8px rgba(38,41,44,.16);
    font-weight: 600;
    z-index: 2000;
    width: auto;
    pointer-events: none
}

.toast-container {
    position: fixed;
    top: 30px;
    right: 30px;
    z-index: 4000
}

.toast.show,.toast.showing {
    pointer-events: all
}

.toast-body {
    padding: 12px 12px;
    padding-right: 40px;
    word-break: break-word;
    width: 100%
}

.toast {
    font-weight: 500;
    position: relative;
    max-width: 360px;
    margin-left: 16px;
    margin-right: 16px;
    display: table
}

.toast-container {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    top: calc(32px + env(safe-area-inset-top));
    bottom: auto;
    left: 0;
    right: 0;
    margin: auto
}

.toast-close {
    position: absolute;
    right: 6px;
    top: 8px
}

.toast .col-icon {
    max-height: 1.45em;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.toast .ubg-transparent.ubg-hover:hover:hover {
    background-color: rgba(255,255,255,.2)
}

@media (max-width: 767px) {
    .toast .flex-grow-1 {
        -webkit-box-flex:1;
        -ms-flex: 1 0 0px;
        flex: 1 0 0
    }

    .toast {
        top: auto;
        margin: auto;
        -ms-flex-preferred-size: 100%;
        flex-basis: 100%;
        min-width: 0
    }
}

.modal-close-btn {
    position: absolute;
    background-image: url(../images/icons-color/default2/default/24x24-close.svg);
    background-position: center;
    background-repeat: no-repeat;
    top: 4px;
    right: 4px
}

.modal-title-wrap .modal-title {
    padding: 0 24px
}

@media (max-width: 766px) {
    .modal-title-wrap .modal-title {
        font-size:16px
    }
}

@media (min-width: 768px) {
    .modal-size-xs .modal-body {
        padding-left:24px!important;
        padding-right: 24px!important;
        padding-bottom: 24px!important;
        padding-top: 8px!important
    }

    .modal-size-xs .modal-header {
        padding-left: 24px!important;
        padding-right: 24px!important;
        padding-bottom: 16px!important;
        padding-top: 24px!important
    }
}

.modal-body-ubg-secondary .modal-body {
    padding-top: 24px;
    padding-bottom: 24px;
    background-color: #f5f7f9
}

@media (min-width: 768px) {
    .modal-body-ubg-secondary .modal-header {
        padding-bottom:24px!important
    }

    .modal-body-ubg-secondary .modal-footer {
        padding-top: 32px!important
    }
}

@media (max-width: 767px) {
    .modal-body-ubg-secondary .modal-header {
        padding-bottom:16px!important
    }

    .modal-body-ubg-secondary .modal-footer {
        padding-top: 24px!important
    }
}

.modal-body-ubg-secondary .modal-dialog-scrollable .modal-footer::after,.modal-body-ubg-secondary .modal-dialog-scrollable .modal-header::after {
    background: -o-linear-gradient(top,#f5f7f9 0,rgba(245,247,249,0) 100%);
    background: -webkit-gradient(linear,left top,left bottom,from(#f5f7f9),to(rgba(245,247,249,0)));
    background: linear-gradient(180deg,#f5f7f9 0,rgba(245,247,249,0) 100%)
}

.modal-backdrop.show~.modal-backdrop.show {
    z-index: 3001
}

.modal-footer-content-after {
    margin-left: 0;
    margin-right: 0
}

.modal-footer-content-after:first-child {
    margin-top: 0
}

.bd-example-modal>* {
    max-width: 100%
}

.bd-example-modal .dropdown-menu {
    max-width: 100%;
    position: relative;
    display: block;
    float: none
}

.dropdown-menu {
    padding: 10px;
    border-radius: 8px;
    border: 0;
    -webkit-box-shadow: 0 2px 4px 0 rgba(0,0,0,.04),0 8px 16px 0 rgba(0,0,0,.08);
    box-shadow: 0 2px 4px 0 rgba(0,0,0,.04),0 8px 16px 0 rgba(0,0,0,.08);
    margin-top: 5px;
    font-size: inherit
}

.dropdown-menu>li:not(:last-child) {
    margin-bottom: 4px
}

.dropdown-menu .row {
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.table td,.table th {
    padding: inherit;
    vertical-align: inherit;
    border-top: inherit
}

.table {
    display: table;
    width: 100%;
    margin-bottom: 0
}

.tr {
    display: table-row
}

.td {
    display: table-cell;
    vertical-align: middle;
    position: relative
}

button::after,button::before {
    content: "";
    -webkit-box-flex: 1;
    -ms-flex: 1 0 auto;
    flex: 1 0 auto
}

.ubtn {
    overflow: hidden;
    vertical-align: middle;
    border: 0;
    outline: 0!important;
    cursor: pointer;
    text-decoration: none!important;
    font-weight: 500;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
   
    text-align: center;
    width: 100%;
    padding-top: 0!important;
    padding-bottom: 0!important
}

.ubtn.ubox-size-button-default .ubtn-text:not(:only-child):last-child {
    padding-left: 8px;
    padding-right: 4px
}

.ubtn.ubox-size-button-default .ubtn-text:not(:only-child):first-child {
    padding-right: 8px;
    padding-left: 4px
}

.ubtn.ubox-size-button-default .ubtn-text:not(:only-child):not(:first-child):not(:last-child) {
    padding-left: 8px;
    padding-right: 8px
}

.ubtn.ubox-size-button-default:not(.ubox-square) .ic-default {
    width: 24px;
    height: 24px
}

.ubtn.ubox-size-button-sm .ubtn-text:not(:only-child):last-child {
    padding-left: 6px;
    padding-right: 3px
}

.ubtn.ubox-size-button-sm .ubtn-text:not(:only-child):first-child {
    padding-right: 6px;
    padding-left: 3px
}

.ubtn.ubox-size-button-sm .ubtn-text:not(:only-child):not(:first-child):not(:last-child) {
    padding-left: 6px;
    padding-right: 6px
}

.ubtn.ubox-size-button-sm:not(.ubox-square) .ic-default {
    width: 20px;
    height: 20px
}

.ubtn.ubox-size-button-xs .ubtn-text:not(:only-child):last-child {
    padding-left: 6px;
    padding-right: 3px
}

.ubtn.ubox-size-button-xs .ubtn-text:not(:only-child):first-child {
    padding-right: 6px;
    padding-left: 3px
}

.ubtn.ubox-size-button-xs .ubtn-text:not(:only-child):not(:first-child):not(:last-child) {
    padding-left: 6px;
    padding-right: 6px
}

.ubtn.ubox-size-button-xs:not(.ubox-square) .ic-default {
    width: 16px;
    height: 16px
}

.ubtn {
    max-width: 100%
}

.ubtn img {
    z-index: 2;
    position: relative
}

.ubtn-ic {
    display: inline-block;
    -webkit-box-flex: 0;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: auto;
    max-width: 100%;
    vertical-align: middle;
    line-height: 1
}

.ubtn-ic-left {
    -webkit-box-ordinal-group: 2;
    -ms-flex-order: 1;
    order: 1
}

.ubtn-ic-right {
    -webkit-box-ordinal-group: 4;
    -ms-flex-order: 3;
    order: 3
}

.ubtn-text {
    z-index: 2;
    position: relative;
    vertical-align: middle;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-ordinal-group: 3;
    -ms-flex-order: 2;
    order: 2
}

.ubtn-inner {
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    font-size: 14px;
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex
}

button:disabled,button[disabled] {
    opacity: .4
}

input,select,textarea {
    color: #21262c;
    font-weight: 400;
    font-size: 14px
}

@media (max-width: 991px) {
    input,select,textarea {
        font-size:16px!important
    }
}

input::-webkit-input-placeholder,textarea::-webkit-input-placeholder {
    color: #bfccd9
}

input::-moz-placeholder,textarea::-moz-placeholder {
    color: #bfccd9
}

input:-ms-input-placeholder,textarea:-ms-input-placeholder {
    color: #bfccd9
}

input::-ms-input-placeholder,textarea::-ms-input-placeholder {
    color: #bfccd9
}

input::placeholder,textarea::placeholder {
    color: #bfccd9
}

select:invalid {
    color: #bfccd9
}

.textarea-group.input-group-wrap {
    -webkit-box-align: start;
    -ms-flex-align: start;
    align-items: flex-start
}

.textarea-autosize {
    max-height: 200px;
    -webkit-transition: none!important;
    -o-transition: none!important;
    transition: none!important
}

.input {
    padding-left: 16px;
    padding-right: 8px;
    width: 100%;
    border-radius: 3px;
    border: 0;
    background-color: transparent;
    -webkit-box-ordinal-group: 3;
    -ms-flex-order: 2;
    order: 2;
    z-index: 2
}

.input.text-center:focus {
    padding-left: 44px
}

.input-has-clear:focus {
    padding-right: 36px
}

.input-note {
    margin-top: 4px;
    font-size: 12px
}

.input-frame {
    pointer-events: none;
    position: relative;
    -webkit-transition: .2s all ease-in-out;
    -o-transition: .2s all ease-in-out;
    transition: .2s all ease-in-out;
    z-index: 0
}

.input:not(textarea) {
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden
}

.input::-ms-clear {
    display: none
}

.input:focus~.input-extend .input-ic-clear.show {
    display: -webkit-box!important;
    display: -ms-flexbox!important;
    display: flex!important
}

.input-box {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width: 100%
}

.input-box>* {
    min-width: 100%
}

.input-ic {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.input-ic-clear {
    position: absolute;
    right: 100%;
    width: 36px;
    display: none!important;
    height: 24px;
    background-image: url(../images/icons-color/default2/default/24x24-close.svg);
    background-position: center right 12px;
    background-size: 16px;
    cursor: pointer;
    background-repeat: no-repeat
}

.input-extend {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    position: relative;
    z-index: 3
}

.input-extend-left {
    margin-right: -8px
}

.input-extend-left .input-box {
    padding-left: 8px
}

.input-extend-right {
    -webkit-box-ordinal-group: 4;
    -ms-flex-order: 3;
    order: 3
}

.input-extend-right .input-box {
    padding-right: 12px
}

.input-size-default-label::after {
    max-height: 36px
}

@media (max-width: 766px) {
    .input-size-default-label::after {
        max-height:44px
    }
}

.input-size-default input.input {
    line-height: 36px
}

@media (max-width: 766px) {
    .input-size-default input.input {
        line-height:44px
    }
}

.input-size-default .textarea-autosize {
    padding-top: 11px;
    padding-bottom: 11px
}

@media (max-width: 766px) {
    .input-size-default .textarea-autosize {
        padding-top:15px;
        padding-bottom: 15px
    }
}

.input-size-default .input,.input-size-default .input-box {
    height: 36px
}

@media (max-width: 766px) {
    .input-size-default .input,.input-size-default .input-box {
        height:44px
    }
}

.input-size-default .select2-container .selection {
    min-height: 36px
}

@media (max-width: 766px) {
    .input-size-default .select2-container .selection {
        min-height:44px
    }
}

.input-size-xs-1-label::after {
    max-height: 24px
}

@media (max-width: 766px) {
    .input-size-xs-1-label::after {
        max-height:44px
    }
}

.input-size-xs-label::after {
    max-height: 36px
}

@media (max-width: 766px) {
    .input-size-xs-label::after {
        max-height:44px
    }
}

.input-size-sm-label::after {
    max-height: 44px
}

@media (max-width: 766px) {
    .input-size-sm-label::after {
        max-height:44px
    }
}

.input-size-sm input.input {
    line-height: 44px
}

@media (max-width: 766px) {
    .input-size-sm input.input {
        line-height:44px
    }
}

.input-size-sm .textarea-autosize {
    padding-top: 15px;
    padding-bottom: 15px
}

@media (max-width: 766px) {
    .input-size-sm .textarea-autosize {
        padding-top:15px;
        padding-bottom: 15px
    }
}

.input-size-sm .input,.input-size-sm .input-box {
    height: 44px
}

@media (max-width: 766px) {
    .input-size-sm .input,.input-size-sm .input-box {
        height:44px
    }
}

.input-size-sm .select2-container .selection {
    min-height: 44px
}

@media (max-width: 766px) {
    .input-size-sm .select2-container .selection {
        min-height:44px
    }
}

.input-size-md-label::after {
    max-height: 50px
}

@media (max-width: 766px) {
    .input-size-md-label::after {
        max-height:44px
    }
}

.input-size-lg-label::after {
    max-height: 60px
}

@media (max-width: 766px) {
    .input-size-lg-label::after {
        max-height:44px
    }
}

.input-group-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: end;
    -ms-flex-align: end;
    align-items: flex-end
}

.input-label {
    font-size: 14px;
    font-weight: 400;
    color: #21262c
}

.input-label .inner {
    -webkit-transition: .3s cubic-bezier(.25,.8,.5,1);
    -o-transition: .3s cubic-bezier(.25,.8,.5,1);
    transition: .3s cubic-bezier(.25,.8,.5,1);
    margin-bottom: 4px
}

.input-label-horizontal {
    height: 100%;
    display: block;
    font-size: 0
}

.input-label-horizontal::after {
    content: "";
    height: 100%;
    display: inline-block;
    vertical-align: middle
}

.input-label-horizontal .inner {
    display: inline-block;
    vertical-align: middle;
    margin-bottom: 0;
    font-size: 14px
}

.input-inner-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    position: relative;
    width: 100%;
    -webkit-box-ordinal-group: 2;
    -ms-flex-order: 1;
    order: 1;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -ms-flex-preferred-size: 0;
    flex-basis: 0
}

select.input {
    padding-right: 44px
}

.select2-container,select.input {
    background-image: url(../images/icons-color/default/default/24x24-chevrondown.svg);
    background-position: center right 8px;
    background-repeat: no-repeat
}

.select2-container {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -ms-flex-preferred-size: 0;
    flex-basis: 0;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis
}

.select2-container .selection {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    width: 100%
}

.select2-container .select2-selection--single {
    height: auto!important;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    overflow: hidden;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    background-color: transparent;
    width: 100%
}

.select2-container .select2-selection--single .select2-selection__rendered {
    width: 100%;
    display: block;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding-right: 48px
}

.select2-container .select2-selection--multiple {
    width: 100%;
    height: auto!important
}

.input-inner-wrap {
    display: -ms-grid;
    display: grid;
    -ms-grid-columns: auto auto minmax(0,1fr) auto auto;
    grid-template-columns: auto auto minmax(0,1fr) auto auto
}

.input-frame {
    -ms-grid-column-span: 5;
    grid-column: 2/5;
    -ms-grid-row: 2;
    grid-row: 2
}

.input,.select2 {
    -ms-grid-column: 3;
    grid-column: 3;
    -ms-grid-row: 2;
    grid-row: 2
}

.input-extend-left {
    -ms-grid-column: 2;
    grid-column: 2;
    -ms-grid-row: 2;
    grid-row: 2
}

.input-extend-right {
    -ms-grid-column: 4;
    grid-column: 4;
    -ms-grid-row: 2;
    grid-row: 2
}

.select-tpl-txt {
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    overflow: hidden
}

.errorBlock,.parsley-errors-list {
    color: #c91d1d;
    font-size: 12px
}

.errorBlock>*,.parsley-errors-list>* {
    margin-bottom: 0
}

.errorBlock>:not(:empty),.parsley-errors-list>:not(:empty) {
    margin-top: 4px
}

.parsley-error~.input-frame {
    border-color: #c91d1d!important
}

.input-default .input-note {
    -ms-grid-column-span: 5;
    grid-column: 2/5;
    -ms-grid-row: 3;
    grid-row: 3
}

.input-default .input-label {
    -ms-grid-column-span: 5;
    grid-column: 2/5;
    -ms-grid-row: 1;
    grid-row: 1
}

.input-default .input-frame {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 3px;
    border: 1px solid #bfccd9
}

.input-default .input:focus:not(:disabled):not(:-moz-read-only)~.input-frame {
    border-color: #0071a9
}

.input-default .input:focus:not(:disabled):not(:read-only)~.input-frame {
    border-color: #0071a9
}

.input-default .input:disabled~.input-frame {
    background-color: #eaeff3
}

.nav-justified {
    position: relative
}

.nav-justified::after {
    border-bottom: 1px solid #bfccd9;
    z-index: 1;
    height: 1px;
    width: 100%;
    content: '';
    position: absolute;
    bottom: 0;
    left: 0
}

.nav-justified .nav-link {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center!important;
    -ms-flex-pack: center!important;
    justify-content: center!important;
    padding: 12px 0;
    position: relative;
    z-index: 2;
    font-size: 16px;
    font-weight: 500
}

@media (max-width: 766px) {
    .nav-justified .nav-link {
        font-size:12px
    }
}

.nav-style-default .nav-link {
    border-bottom: 2px solid transparent;
    color: #5a7087!important
}

.nav-style-default .nav-link.active {
    border-bottom: 2px solid #0071a9;
    color: #21262c!important
}

.nav-style-pills {
    border-radius: 12px;
    background-color: #f5f7f9;
    padding: 4px
}

.nav-style-pills .nav-link {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    border-radius: 8px;
    color: #5a7087!important;
    padding: 8px 12px;
    font-weight: 500
}

.nav-style-pills .nav-link.active {
    background-color: #0071a9;
    color: #fff!important
}

.justify-content-between {
    -ms-flex-wrap: nowrap;
    flex-wrap: nowrap
}

.justify-content-between .nav-link {
    -ms-flex-preferred-size: auto;
    flex-basis: auto;
    -webkit-box-flex: 0;
    -ms-flex-positive: 0;
    flex-grow: 0;
    cursor: pointer
}

.checkbox {
    display: block;
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.checkbox .table {
    width: auto
}

.checkbox-size-default {
    width: 20px;
    min-width: 20px;
    height: 20px
}

.checkbox-ic {
    -ms-flex-negative: 0;
    flex-shrink: 0;
    border: 1px solid #bfccd9;
    border-radius: 3px;
    background-color: transparent;
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    position: relative;
    color: transparent;
    line-height: 16px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: auto;
    -webkit-transition: .2s all ease-in-out;
    -o-transition: .2s all ease-in-out;
    transition: .2s all ease-in-out;
    overflow: visible
}

.checkbox-ic:not(.no-animation):before {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0,113,169,.1);
    -webkit-transform: scale(0);
    -ms-transform: scale(0);
    transform: scale(0);
    opacity: 1;
    border-radius: 50%
}

.radio {
    display: block;
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

.radio .table {
    width: auto
}

.radio-size-default {
    width: 20px;
    min-width: 20px;
    height: 20px
}

.radio-size-default:after {
    width: 11px;
    height: 11px
}

input[type=radio]:checked~.radio-style-default.radio-size-default,input[type=radio]:checked~.rnc-content .radio-style-default.radio-size-default {
    border-width: 6px
}

.radio-ic {
    -ms-flex-negative: 0;
    flex-shrink: 0;
    border: 1px solid #bfccd9;
    border-radius: 50%;
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    position: relative;
    color: transparent;
    -webkit-transition: .2s all ease-in-out;
    -o-transition: .2s all ease-in-out;
    transition: .2s all ease-in-out;
    overflow: visible;
    z-index: 1
}

.switch {
    cursor: pointer
}

input[type=checkbox]:checked~.checkbox-ic,input[type=checkbox]:checked~.rnc-content .checkbox-ic {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='9.964' height='8.837' viewBox='0 0 9.964 8.837'%3E%3Cpath id='check-circle' d='M8.445,12.667a.9.9,0,0,0-1.3,1.243l2.573,2.745a.9.9,0,0,0,1.335-.036l5.591-7.037a.9.9,0,1,0-1.367-1.171l-4.655,5.913a.4.4,0,0,1-.607.025L8.445,12.668Z' transform='translate(-6.894 -8.097)' fill='%23fff'/%3E%3C/svg%3E%0A");
    background-size: 10px;
    background-repeat: no-repeat
}

input[type=checkbox]:checked~.checkbox-ic,input[type=checkbox]:checked~.rnc-content .checkbox-ic {
    border-color: #0071a9;
    background-color: #0071a9
}

input[type=radio]:checked~.radio-ic,input[type=radio]:checked~.rnc-content .radio-ic {
    border-color: #0071a9;
    background-color: rgba(0,113,169,.1)
}

input[type=radio]:checked~.radio-style-default.radio-ic,input[type=radio]:checked~.rnc-content .radio-style-default.radio-ic {
    border-color: #0071a9;
    background-color: transparent
}

.rnc {
    display: block
}

.rnc-ic-wrap {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 auto;
    flex: 0 0 auto;
    width: auto;
    max-width: 100%
}

.rnc-content {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex
}

.rnc-inner {
    -ms-flex-preferred-size: 0;
    flex-basis: 0;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    max-width: 100%
}

.rnc-text {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    height: 100%;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.pr4 {
    padding-right: 4px
}

.pr10 {
    padding-right: 10px
}

.pl12 {
    padding-left: 12px
}

.pv12 {
    padding-top: 12px;
    padding-bottom: 12px
}

.pv16 {
    padding-top: 16px;
    padding-bottom: 16px
}

.pv32 {
    padding-top: 32px;
    padding-bottom: 32px
}

.pb24 {
    padding-bottom: 24px
}

.pt24 {
    padding-top: 24px
}

.mb4 {
    margin-bottom: 4px
}

.mb16 {
    margin-bottom: 16px
}

.mb24 {
    margin-bottom: 24px
}

.mb32 {
    margin-bottom: 32px
}

.mt8 {
    margin-top: 8px
}

.mt16 {
    margin-top: 16px
}

.mt20 {
    margin-top: 20px
}

.mt24 {
    margin-top: 24px
}

.list-last-mv>:last-child {
    margin-bottom: 0
}

.list-last-mv>:first-child {
    margin-top: 0
}

.list-last-mh>:last-child {
    margin-right: 0
}

.list-last-mh>:first-child {
    margin-left: 0
}

.list-last-mt>:first-child {
    margin-top: 0
}

.list-last-mr>:last-child {
    margin-right: 0
}

.list-last-mb>:last-child {
    margin-bottom: 0
}

.list-last-ml>:first-child {
    margin-left: 0
}

.list-last-pv>:last-child {
    padding-bottom: 0
}

.list-last-pv>:first-child {
    padding-top: 0
}

.list-last-ph>:last-child {
    padding-right: 0
}

.list-last-ph>:first-child {
    padding-left: 0
}

.list-last-pt>:first-child {
    padding-top: 0
}

.list-last-pr>:last-child {
    padding-right: 0
}

.list-last-pb>:last-child {
    padding-bottom: 0
}

.list-last-pl>:first-child {
    padding-left: 0
}

.list-pv24>* {
    padding-top: 24px;
    padding-bottom: 24px
}

.list-pb4>* {
    padding-bottom: 4px
}

.list-pb24>* {
    padding-bottom: 24px
}

.list-mb4>* {
    margin-bottom: 4px
}

.list-mb4.list-crop {
    margin-bottom: -4px
}

.list-mb8>* {
    margin-bottom: 8px
}

.list-mb8.list-crop {
    margin-bottom: -8px
}

.list-mb12>* {
    margin-bottom: 12px
}

.list-mb12.list-crop {
    margin-bottom: -12px
}

.list-mb16>* {
    margin-bottom: 16px
}

.list-mb16.list-crop {
    margin-bottom: -16px
}

.list-mb24>* {
    margin-bottom: 24px
}

.list-mb24.list-crop {
    margin-bottom: -24px
}

.form-group {
    text-align: left;
    margin-bottom: 0
}

label {
    margin-bottom: 0
}

.ulabel-status {
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    word-break: break-all;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    line-height: 1.2;
    font-weight: 500
}

.ulabel-size-default {
    border-radius: 3px;
    height: 18px;
    line-height: 18px;
    min-width: 0;
    font-size: 9px;
    padding: 0 6px
}

.ulabel-size-sm {
    border-radius: 3px;
    height: 20px;
    line-height: 20px;
    min-width: 0;
    font-size: 10px;
    padding: 0 7px
}

.ulabel-size-md {
    border-radius: 3px;
    height: 22px;
    line-height: 22px;
    min-width: 0;
    font-size: 11px;
    padding: 0 8px
}

.ulabel-size-lg {
    border-radius: 12px;
    height: 24px;
    min-width: 0;
    font-size: 12px;
    padding: 0 9px
}

.ulabel-size-xl {
    border-radius: 16px;
    height: 32px;
    min-width: 0;
    font-size: 12px;
    padding: 0 12px
}

.ulabel-round.label-size-default {
    border-radius: 9px
}

.ulabel-round.label-size-sm {
    border-radius: 10px
}

.ulabel-round.label-size-md {
    border-radius: 11px
}

.ulabel-round.label-size-lg {
    border-radius: 12px
}

.ulabel-round.label-size-xl {
    border-radius: 16px
}

.ulabel-full {
    width: 100%;
    display: block
}

.ulabel-sub {
    font-size: 12px;
    padding-top: 5px;
    display: block
}

html {
    height: 100%
}

.up {
    text-transform: uppercase
}

.u {
    text-decoration: underline
}

.link {
    color: #1d9ec9!important
}

[data-accordion] [data-content] {
    overflow: hidden;
    max-height: 0
}

[data-accordion] {
    line-height: 1
}

[data-control] {
    cursor: pointer;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none
}

[data-content] [data-accordion] {
    border: 0;
    padding: 0
}

[data-accordion] [data-control] {
    position: relative
}

.block-right {
    margin-right: 0;
    margin-left: auto
}

.block-center {
    margin-right: auto;
    margin-left: auto
}

.inline-block {
    display: inline-block;
    max-width: 100%
}

.scroll {
    -webkit-overflow-scrolling: touch
}

.scroll>* {
    -webkit-transform: translate3d(0,0,0)
}

.box:after,.box:before {
    content: " ";
    display: table
}

.block {
    display: block
}

[data-tooltip] {
    cursor: pointer
}

.collapse.in {
    height: auto
}

.tree {
    border: 1px solid #afb3bc;
    border-radius: 6px
}

.tree:not(:last-child) {
    margin-bottom: 30px;
    margin-top: 7px
}

@media (min-width: 1081px) {
    .tree::-webkit-scrollbar {
        width:5px
    }

    .tree::-webkit-scrollbar-thumb {
        height: 56px;
        background: rgba(175,179,188,.6);
        border-radius: 4px;
        position: absolute;
        right: 5px
    }

    .tree::-webkit-scrollbar-track {
        width: 17px
    }
}

.tooltip {
    font-family: inherit
}

.tooltip-inner {
    color: #21262c;
    background-color: #fff;
    -webkit-box-shadow: 0 4px 16px 0 rgba(0,0,0,.2);
    box-shadow: 0 4px 16px 0 rgba(0,0,0,.2)
}

.bs-tooltip-auto[x-placement^=top] .arrow::before,.bs-tooltip-top .arrow::before {
    border-top-color: #fff
}

.hidden {
    display: none!important
}

.clear:after {
    display: table;
    content: "";
    clear: both
}

.no-p {
    padding: 0!important
}

.no-pt {
    padding-top: 0!important
}

.no-shadow {
    box-shadow: none!important;
    -webkit-box-shadow: none!important
}

.no-border {
    border: 0!important
}

.no-bg-color {
    background-color: transparent!important
}

.no-cursor {
    cursor: default
}

.row {
    margin-left: -12px;
    margin-right: -12px
}

.row>* {
    vertical-align: top;
    padding-left: 12px;
    padding-right: 12px
}

.row-0 {
    margin-left: 0;
    margin-right: 0
}

.row-0>* {
    vertical-align: top;
    padding-left: 0;
    padding-right: 0
}

.row-4 {
    margin-left: -2px;
    margin-right: -2px
}

.row-4>* {
    vertical-align: top;
    padding-left: 2px;
    padding-right: 2px
}

.row-8 {
    margin-left: -4px;
    margin-right: -4px
}

.row-8>* {
    vertical-align: top;
    padding-left: 4px;
    padding-right: 4px
}

.row-10 {
    margin-left: -5px;
    margin-right: -5px
}

.row-10>* {
    vertical-align: top;
    padding-left: 5px;
    padding-right: 5px
}

.row-12 {
    margin-left: -6px;
    margin-right: -6px
}

.row-12>* {
    vertical-align: top;
    padding-left: 6px;
    padding-right: 6px
}

.row-16 {
    margin-left: -8px;
    margin-right: -8px
}

.row-16>* {
    vertical-align: top;
    padding-left: 8px;
    padding-right: 8px
}

.row-24 {
    margin-left: -12px;
    margin-right: -12px
}

.row-24>* {
    vertical-align: top;
    padding-left: 12px;
    padding-right: 12px
}

.row-32 {
    margin-left: -16px;
    margin-right: -16px
}

.row-32>* {
    vertical-align: top;
    padding-left: 16px;
    padding-right: 16px
}

.row-52 {
    margin-left: -26px;
    margin-right: -26px
}

.row-52>* {
    vertical-align: top;
    padding-left: 26px;
    padding-right: 26px
}

.list {
    font-size: 14px;
    margin: 0;
    list-style: none
}

@keyframes placeHolderShimmer {
    0% {
        background-position: -468px 0
    }

    100% {
        background-position: 468px 0
    }
}

.blur {
    -webkit-filter: blur(10px);
    filter: blur(10px)
}

.select2-container--open~.input-ic .arrow-down-anim::before {
    -webkit-animation: .2s ease 0s 1 normal forwards running animation-1ssg1zn;
    animation: .2s ease 0s 1 normal forwards running animation-1ssg1zn
}

.select2-container--open~.input-ic .arrow-down-anim::after {
    -webkit-animation: .2s ease 0s 1 normal forwards running animation-jkrku4;
    animation: .2s ease 0s 1 normal forwards running animation-jkrku4
}

@keyframes animation-1xegglx {
    0% {
        -webkit-transform: translateY(-50%) rotate(-43deg);
        -ms-transform: translateY(-50%) rotate(-43deg);
        transform: translateY(-50%) rotate(-43deg)
    }

    50% {
        -webkit-transform: translate(-20%,-50%) rotate(0);
        -ms-transform: translate(-20%,-50%) rotate(0);
        transform: translate(-20%,-50%) rotate(0)
    }

    100% {
        -webkit-transform: translateY(-50%) rotate(43deg);
        -ms-transform: translateY(-50%) rotate(43deg);
        transform: translateY(-50%) rotate(43deg)
    }
}

@keyframes animation-1ssg1zn {
    0% {
        -webkit-transform: translateY(-50%) rotate(43deg);
        -ms-transform: translateY(-50%) rotate(43deg);
        transform: translateY(-50%) rotate(43deg)
    }

    50% {
        -webkit-transform: translate(-20%,-50%) rotate(0);
        -ms-transform: translate(-20%,-50%) rotate(0);
        transform: translate(-20%,-50%) rotate(0)
    }

    100% {
        -webkit-transform: translateY(-50%) rotate(-43deg);
        -ms-transform: translateY(-50%) rotate(-43deg);
        transform: translateY(-50%) rotate(-43deg)
    }
}

@keyframes animation-f7gund {
    0% {
        -webkit-transform: translateY(-50%) rotate(43deg);
        -ms-transform: translateY(-50%) rotate(43deg);
        transform: translateY(-50%) rotate(43deg)
    }

    50% {
        -webkit-transform: translate(20%,-50%) rotate(0);
        -ms-transform: translate(20%,-50%) rotate(0);
        transform: translate(20%,-50%) rotate(0)
    }

    100% {
        -webkit-transform: translateY(-50%) rotate(-43deg);
        -ms-transform: translateY(-50%) rotate(-43deg);
        transform: translateY(-50%) rotate(-43deg)
    }
}

@keyframes animation-jkrku4 {
    0% {
        -webkit-transform: translateY(-50%) rotate(-43deg);
        -ms-transform: translateY(-50%) rotate(-43deg);
        transform: translateY(-50%) rotate(-43deg)
    }

    50% {
        -webkit-transform: translate(20%,-50%) rotate(0);
        -ms-transform: translate(20%,-50%) rotate(0);
        transform: translate(20%,-50%) rotate(0)
    }

    100% {
        -webkit-transform: translateY(-50%) rotate(43deg);
        -ms-transform: translateY(-50%) rotate(43deg);
        transform: translateY(-50%) rotate(43deg)
    }
}

.group-col-fill .group-col-item {
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

.group-col-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 0) {
    .group-col-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-sm-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-sm-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-sm-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-sm-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-sm-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-sm-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-sm-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 576px) {
    .group-col-sm-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-md-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-md-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-md-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-md-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-md-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-md-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-md-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 768px) {
    .group-col-md-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-lg-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-lg-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-lg-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-lg-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-lg-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-lg-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-lg-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 992px) {
    .group-col-lg-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-xl-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-xl-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-xl-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-xl-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-xl-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-xl-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-xl-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-xl-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-xxl-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-xxl-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-xxl-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-xxl-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-xxl-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-xxl-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-xxl-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 1400px) {
    .group-col-xxl-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-1>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-1>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 100%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-2>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-2>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 50%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-3>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-3>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 33.33333%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-4>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-4>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 25%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-5>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-5>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 20%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-6>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-6>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 16.66667%;
        min-width: 0!important
    }
}

.group-col-menu-break-point-7>.group-col-item {
    min-width: 50%
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-7>.group-col-item {
        -webkit-box-flex:0;
        -ms-flex-positive: 0;
        flex-grow: 0;
        width: 14.28571%;
        min-width: 0!important
    }
}

.group-col-xs-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 0) {
    .group-col-xs-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-sm-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 576px) {
    .group-col-sm-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-md-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 768px) {
    .group-col-md-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-lg-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 992px) {
    .group-col-lg-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-xl-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 1200px) {
    .group-col-xl-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-xxl-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 1400px) {
    .group-col-xxl-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-menu-break-point-auto>.group-col-item {
    min-width: 50%;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

@media (min-width: 1200px) {
    .group-col-menu-break-point-auto>.group-col-item {
        width:auto!important;
        -webkit-box-flex: 0!important;
        -ms-flex-positive: 0!important;
        flex-grow: 0!important;
        min-width: 0
    }
}

.group-col-fill>.group-col-item {
    -webkit-box-flex: 1!important;
    -ms-flex-positive: 1!important;
    flex-grow: 1!important
}

.select2-container--default .select2-selection--multiple,.select2-container--default .select2-selection--single {
    border-radius: 3px
}

.select2-selection__arrow {
    display: none
}

.select2-container--default .select2-selection--multiple {
    max-height: 120px;
    overflow-y: auto;
    width: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.select2-container--default .select2-results__option {
    position: relative;
    border-radius: 0;
    background-position: right 12px center;
    background-repeat: no-repeat;
    padding-right: 44px
}

.select2-container--default .select2-search--inline .select2-search__field {
    width: 100%!important;
    margin: 0
}

.select2-container .select2-selection--multiple .select2-selection__rendered {
    display: block
}

.select2-container--default .select2-search--dropdown .select2-search__field {
    background-image: url(../images/icons-color/default/default/24x24-search.svg);
    background-repeat: no-repeat;
    background-size: 20px;
    border-radius: 3px;
    background-color: #eaedf1;
    padding-left: 15px;
    background-position: center right 10px;
    font-size: 14px
}

.select2-container--default .select2-search--dropdown .select2-search__field::-webkit-input-placeholder {
    color: #bfccd9
}

.select2-container--default .select2-search--dropdown .select2-search__field::-moz-placeholder {
    color: #bfccd9
}

.select2-container--default .select2-search--dropdown .select2-search__field:-ms-input-placeholder {
    color: #bfccd9
}

.select2-container--default .select2-search--dropdown .select2-search__field::-ms-input-placeholder {
    color: #bfccd9
}

.select2-container--default .select2-search--dropdown .select2-search__field::placeholder {
    color: #bfccd9
}

@media (max-width: 767px) {
    .select2-container--default .select2-search--dropdown .select2-search__field {
        background-color:#f7f8fa;
        background-position: center right 10px;
        background-repeat: no-repeat;
        height: 36px
    }
}

.select2-search--dropdown {
    border-radius: 6px 6px 0 0
}

.select2-container--disabled {
    opacity: .6
}

.select2-container--default.select2-container--disabled .select2-selection--multiple .select2-search__field {
    display: none
}

.select2-container--default .select2-selection--single .select2-selection__placeholder {
    color: #bfccd9
}

.select2-container--default .select2-selection--multiple .select2-selection__rendered {
    padding-left: 16px;
    width: 100%;
    padding-top: 6px;
    padding-bottom: 6px;
    margin: auto
}

.select2-container--default .select2-selection--multiple .select2-selection__rendered .select2-search__field {
    padding-left: 0
}

.select2-container--default .select2-search--inline .select2-search__field,.select2-container--default .select2-selection--single .select2-selection__rendered {
    font-size: 14px;
    font-weight: 400;
    padding-left: 16px;
    color: #21262c
}

@media (max-width: 768px) {
    .select2-container--default .select2-search--inline .select2-search__field,.select2-container--default .select2-selection--single .select2-selection__rendered {
        font-size:16px!important
    }
}

.select2-search--dropdown {
    padding: 10px
}

@media (max-width: 767px) {
    .select2-search--dropdown {
        padding:10px
    }
}

@media (max-width: 767px) {
    body>.select2-container .select2-dropdown {
        position:fixed;
        width: 100%!important;
        z-index: 4000;
        bottom: 0;
        border-radius: 6px;
        overflow: hidden;
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        -ms-transform: translate(0,100%);
        -webkit-transform: translate(0,100%);
        transform: translate(0,100%);
        -webkit-transition: .3s all ease-in-out;
        -o-transition: .3s all ease-in-out;
        transition: .3s all ease-in-out
    }

    body>.select2-container .select2-dropdown [aria-selected=true] {
        color: #0071a9
    }

    body>.select2-container .select2-dropdown [aria-selected=true] {
        pointer-events: none
    }

    body>.select2-container .select2-dropdown [aria-multiselectable=true] [aria-selected=true] {
        pointer-events: all
    }

    body>.select2-container .select2-dropdown .close-select--multiple~.select2-results [aria-selected=true] {
        pointer-events: all
    }

    body>.select2-container .select2-dropdown.top-0 {
        -ms-transform: translate(0,0);
        -webkit-transform: translate(0,0);
        transform: translate(0,0)
    }

    body>.select2-container .select2-dropdown .select2-results__options {
        height: 45vh;
        max-height: calc(100vh - 200px);
        max-height: -webkit-calc(100vh - 200px);
        min-height: 70px;
        -webkit-overflow-scrolling: touch
    }
}

.select2-results__option {
    font-size: 14px
}

@media (min-width: 768px) {
    .select2-results__option {
        padding:13px
    }
}

@media (max-width: 767px) {
    .select2-results__option {
        padding:12px
    }
}

.select-2-backdrop {
    background-color: #000;
    opacity: 0;
    position: fixed;
    z-index: 3999;
    bottom: 0;
    left: 0;
    right: 0;
    top: 0;
    pointer-events: none;
    -webkit-transition: .3s all ease-in-out;
    -o-transition: .3s all ease-in-out;
    transition: .3s all ease-in-out
}

.select-2-backdrop.show {
    pointer-events: all;
    opacity: .5
}

.close-select {
    text-align: left;
    padding: 12px 44px 12px 12px;
    position: relative;
    min-height: 44px;
    border-bottom: 1px solid #bfccd9
}

.close-select__btn {
    background-image: url(../images/icons-color/default2/default/24x24-close.svg);
    background-position: center;
    background-repeat: no-repeat;
    font-size: 14px;
    font-weight: 400;
    position: absolute;
    right: 0;
    height: 100%;
    width: 44px;
    height: 44px;
    top: 0
}

.select2-container .unselect-all {
    padding: 15px 0;
    text-align: center
}

.select2-container--default.select2-container--focus .select2-selection--multiple {
    border: 0
}

.select-2[multiple]:not(.input-line):not(.input-material)~.input-frame {
    display: none
}

.select-2[multiple].input-default~.select2-container--default.select2-container--focus .select2-selection--multiple {
    border: 1px solid #bfccd9
}

.select-2[multiple].input-default~.select2-container--default.select2-container--open .select2-selection--multiple {
    border: 1px solid #0073ac
}

@media (max-width: 767px) {
    .select-2[multiple]~.select2 .select2-search__field {
        pointer-events:none;
        width: 1px!important
    }
}

.select2-container--default .select2-selection--multiple .select2-selection__choice {
    border: 1px solid #bfccd9;
    background-color: #fff;
    color: #21262c;
    padding: 1px 8px
}

.select2-container--default .select2-selection--multiple .select2-selection__choice__remove {
    color: #21262c
}

.select2-container--default .select2-selection--multiple .select2-selection__choice {
    margin-top: 2px;
    margin-bottom: 2px
}

.select2-container--default.select2-container--open.select2-container--above .select2-selection--multiple,.select2-container--default.select2-container--open.select2-container--above .select2-selection--single,.select2-container--default.select2-container--open.select2-container--below .select2-selection--multiple,.select2-container--default.select2-container--open.select2-container--below .select2-selection--single {
    overflow: hidden;
    position: relative
}

@media (max-width: 767px) {
    body>.select2-container {
        z-index:4000
    }
}

@media (min-width: 768px) {
    body>.select2-container {
        z-index:1000
    }

    .modal-backdrop~.select2-container {
        z-index: 2000
    }
}

.select2-results__options {
    position: relative
}

@media (min-width: 1081px) {
    .select2-results__options::-webkit-scrollbar {
        width:5px
    }

    .select2-results__options::-webkit-scrollbar-thumb {
        height: 56px;
        background: rgba(175,179,188,.6);
        border-radius: 4px;
        position: absolute;
        right: 5px
    }

    .select2-results__options::-webkit-scrollbar-track {
        width: 17px
    }
}

@media (max-width: 767px) {
    .select2-results__options {
        padding-bottom:16px;
        padding-top: 16px
    }

    .select2-results__options .select2-results__option {
        font-size: 16px!important
    }
}

.select2-results {
    position: relative
}

.select2-container--default .select2-results__option--highlighted[aria-selected] {
    background-color: #f7f8fa
}

.select2-dropdown {
    -webkit-box-shadow: 0 4px 8px 0 rgba(33,38,44,.16);
    box-shadow: 0 4px 8px 0 rgba(33,38,44,.16)
}

.select2-search~.select2-search {
    display: none
}

.select2-container--default .select2-selection--multiple .select2-selection__placeholder {
    color: #bfccd9;
    font-size: 14px
}

.select-tpl-img {
    background-position: center;
    background-size: contain
}

.select2-container--default .select2-results__option[aria-selected=true] {
    background-color: #f5f7f9;
    color: #0071a9;
    background-image: url(../images/icons-color/primary/default/24x24-check.svg)
}

.select2-container--default .select2-selection--multiple .select2-selection__rendered .select-tpl-img-wrap {
    display: inline-block
}

.select2-selection__clear {
    width: 24px;
    height: 24px;
    background-size: 16px 16px;
    background-repeat: no-repeat;
    background-position: center;
    font-size: 0;
    position: relative;
    margin-right: 8px;
    z-index: 90;
    top: 9px;
    background-image: url(../images/icons-color/subdefault/default/24x24-close-circle.svg)
}

.lightpick__tooltip {
    z-index: 4;
    position: absolute;
    margin-top: -4px;
    padding: 4px 8px;
    border-radius: 4px;
    background-color: #fff;
    -webkit-box-shadow: 0 5px 20px 0 rgba(0,0,0,.2);
    box-shadow: 0 5px 20px 0 rgba(0,0,0,.2);
    white-space: nowrap;
    font-size: 11px;
    pointer-events: none
}

@media (max-width: 480px) {
    .lightpick__tooltip {
        visibility:hidden!important
    }
}

.lightpick__tooltip::before {
    position: absolute;
    bottom: -5px;
    left: calc(50% - 5px);
    border-top: 5px solid rgba(0,0,0,.12);
    border-right: 5px solid transparent;
    border-left: 5px solid transparent;
    content: ""
}

.lightpick__tooltip::after {
    position: absolute;
    bottom: -4px;
    left: calc(50% - 4px);
    border-top: 4px solid #fff;
    border-right: 4px solid transparent;
    border-left: 4px solid transparent;
    content: ""
}

.lightpick__select-years {
    width: 90px
}

.noUi-target {
    background: 0 0;
    border: 0;
    -webkit-box-shadow: none;
    box-shadow: none
}

.noUi-target {
    position: relative
}

.noUi-target::after {
    height: 3px;
    background-color: #e0e4eb;
    display: block;
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
    margin: auto;
    bottom: 0;
    content: ""
}

.noUi-connect {
    background: 0 0
}

.noUi-connect::after {
    height: 3px;
    background-color: #0071a9;
    display: block;
    position: absolute;
    width: 100%;
    top: 0;
    left: 0;
    margin: auto;
    bottom: 0;
    content: ""
}

.noUi-horizontal .noUi-handle {
    background: 0 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    border: 0
}

.noUi-horizontal .noUi-handle::after,.noUi-horizontal .noUi-handle:before {
    display: none
}

.noUi-touch-area {
    background: 0 0;
    border: 0
}

.noUi-touch-area::after {
    height: 16px;
    width: 16px;
    border-radius: 50%;
    background-color: #0071a9;
    display: block;
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    margin: auto;
    bottom: 0;
    content: ""
}

.noUi-horizontal .noUi-handle {
    top: -5px;
    border: 0;
    outline: 0!important
}

.noUi-tooltip {
    background-repeat: no-repeat;
    background-position: center;
    color: #fff;
    font-size: 11px;
    width: 30px;
    height: 40px;
    line-height: 20px;
    border: 0;
    background-color: transparent;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='30' height='40' viewBox='0 0 30 40'%3E%3Cpath id='Path_244' data-name='Path 244' d='M15,0A15,15,0,0,1,30,15c0,8.284-15,25-15,25S0,23.284,0,15A15,15,0,0,1,15,0Z' fill='%230071a9'/%3E%3C/svg%3E%0A")
}

.noUi-horizontal .noUi-tooltip {
    -webkit-transform: scale(0) translate(-50%,0);
    -ms-transform: scale(0) translate(-50%,0);
    transform: scale(0) translate(-50%,0);
    -webkit-transition: .2s -webkit-transform ease-in-out;
    transition: .2s -webkit-transform ease-in-out;
    -o-transition: .2s transform ease-in-out;
    transition: .2s transform ease-in-out;
    transition: .2s transform ease-in-out,.2s -webkit-transform ease-in-out;
    -webkit-transform-origin: 0 100%;
    -ms-transform-origin: 0 100%;
    transform-origin: 0 100%
}

.noUi-active .noUi-tooltip {
    border-radius: 0;
    -webkit-transform: scale(1) translate(-50%,0);
    -ms-transform: scale(1) translate(-50%,0);
    transform: scale(1) translate(-50%,0)
}

.noUi-horizontal .noUi-tooltip {
    bottom: 90%
}

.noUi-marker-horizontal.noUi-marker {
    height: 3px;
    width: 1px;
    margin-left: -.5px;
    background-color: #e0e4eb
}

.noUi-marker-horizontal.noUi-marker-large {
    height: 5px;
    width: 1px;
    margin-left: -.5px;
    background-color: #e0e4eb
}

.noUi-value-horizontal {
    font-size: 11px
}

.noUi-pips-horizontal {
    padding-top: 2px
}

:root {
    --litepicker-container-months-color-bg: #fff;
    --litepicker-container-months-box-shadow-color: #21262C;
    --litepicker-footer-color-bg: #fafafa;
    --litepicker-footer-box-shadow-color: #21262C;
    --litepicker-tooltip-color-bg: #fff;
    --litepicker-month-header-color: #333;
    --litepicker-button-prev-month-color: #9e9e9e;
    --litepicker-button-next-month-color: #9e9e9e;
    --litepicker-button-prev-month-color-hover: #0071a9;
    --litepicker-button-next-month-color-hover: #0071a9;
    --litepicker-hover-in-range-color: #0071a9;
    --litepicker-month-width: calc(var(--litepicker-day-width) * 7);
    --litepicker-month-weekday-color: #9e9e9e;
    --litepicker-month-week-number-color: #9e9e9e;
    --litepicker-day-width: 44px;
    --litepicker-day-color: #333;
    --litepicker-day-color-hover: #0071a9;
    --litepicker-is-today-color: #0071a9;
    --litepicker-is-in-range-color: white;
    --litepicker-is-locked-color: #21262C;
    --litepicker-is-locked-opacity: 0.3;
    --litepicker-is-start-color: #fff;
    --litepicker-is-start-color-bg: #0071a9;
    --litepicker-is-end-color: #fff;
    --litepicker-is-end-color-bg: #0071a9;
    --litepicker-button-cancel-color: #fff;
    --litepicker-button-cancel-color-bg: #9e9e9e;
    --litepicker-button-apply-color: #fff;
    --litepicker-button-apply-color-bg: #0071a9;
    --litepicker-button-reset-color: #909090;
    --litepicker-button-reset-color-hover: #0071a9;
    --litepicker-highlighted-day-color: #333;
    --litepicker-highlighted-day-color-bg: #ffeb3b
}

.show-week-numbers {
    --litepicker-month-width: calc(var(--litepicker-day-width) * 8)
}

:root {
    --litepicker-mobilefriendly-backdrop-color-bg: #000
}

@-webkit-keyframes lp-bounce-target-next {
    from {
        opacity: 0;
        -webkit-transform: translateX(100px);
        transform: translateX(100px)
    }

    to {
        opacity: 1;
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@keyframes lp-bounce-target-next {
    from {
        opacity: 0;
        -webkit-transform: translateX(100px);
        transform: translateX(100px)
    }

    to {
        opacity: 1;
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@-webkit-keyframes lp-bounce-target-prev {
    from {
        opacity: 0;
        -webkit-transform: translateX(-100px);
        transform: translateX(-100px)
    }

    to {
        opacity: 1;
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

@keyframes lp-bounce-target-prev {
    from {
        opacity: 0;
        -webkit-transform: translateX(-100px);
        transform: translateX(-100px)
    }

    to {
        opacity: 1;
        -webkit-transform: translateX(0);
        transform: translateX(0)
    }
}

body {
    font: 100% Inter,"SF Pro Display","Helvetica Neue",Helvetica,Roboto,Arial;
    margin: 0;
    width: 100%;
    font-size: 14px;
    background-color: #f5f7f9;
    overflow-x: hidden;
    overflow-y: scroll;
    line-height: 1.4;
    letter-spacing: -.03em;
    color: #21262c
}

.scrollspy {
    height: 700px
}

.tooltip-inner {
    padding: 8px
}

@media (max-width: 767px) {
    .main-wrap {
        padding-top:0!important
    }
}

.loading {
    position: fixed;
    z-index: 4000;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-color: rgba(33,38,44,.8)
}

.lds-ring {
    display: inline-block;
    position: relative;
    width: 80px;
    height: 80px
}

.lds-ring div {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    display: block;
    position: absolute;
    width: 64px;
    height: 64px;
    margin: 8px;
    border: 4px solid #fff;
    border-radius: 50%;
    -webkit-animation: lds-ring 1.2s cubic-bezier(.5,0,.5,1) infinite;
    animation: lds-ring 1.2s cubic-bezier(.5,0,.5,1) infinite;
    border-color: #fff transparent transparent transparent
}

.lds-ring div:nth-child(1) {
    -webkit-animation-delay: -.3s;
    animation-delay: -.3s
}

.lds-ring div:nth-child(2) {
    -webkit-animation-delay: -.15s;
    animation-delay: -.15s
}

.lds-ring div:nth-child(3) {
    -webkit-animation-delay: -.1s;
    animation-delay: -.1s
}

@keyframes lds-ring {
    0% {
        -webkit-transform: rotate(0);
        transform: rotate(0)
    }

    100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg)
    }
}

@media (min-width: 1081px) {
    .rs .rs-dropdown__menu .rs-dropdown__menu-list::-webkit-scrollbar {
        width:5px
    }

    .rs .rs-dropdown__menu .rs-dropdown__menu-list::-webkit-scrollbar-thumb {
        height: 56px;
        background: rgba(175,179,188,.6);
        border-radius: 4px;
        position: absolute;
        right: 5px
    }

    .rs .rs-dropdown__menu .rs-dropdown__menu-list::-webkit-scrollbar-track {
        width: 17px
    }
}
@font-face {
    font-family: Inter;
    font-style: normal;
    font-weight: 400;
    src: local(''),url(../fonts/main/inter/inter-v11-vietnamese_latin-regular.woff2) format('woff2'),url(../fonts/main/inter/inter-v11-vietnamese_latin-regular.woff) format('woff')
}

@font-face {
    font-family: Inter;
    font-style: normal;
    font-weight: 500;
    src: local(''),url(../fonts/main/inter/inter-v11-vietnamese_latin-500.woff2) format('woff2'),url(../fonts/main/inter/inter-v11-vietnamese_latin-500.woff) format('woff')
}

@font-face {
    font-family: Inter;
    font-style: normal;
    font-weight: 600;
    src: local(''),url(../fonts/main/inter/inter-v11-vietnamese_latin-600.woff2) format('woff2'),url(../fonts/main/inter/inter-v11-vietnamese_latin-600.woff) format('woff')
}

@font-face {
    font-family: Inter;
    font-style: normal;
    font-weight: 800;
    src: local(''),url(../fonts/main/inter/inter-v11-vietnamese_latin-800.woff2) format('woff2'),url(../fonts/main/inter/inter-v11-vietnamese_latin-800.woff) format('woff')
}

.main {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    margin: 0 auto;
    padding-left: 30px;
    padding-right: 30px
}

.main-layout-xs {
    max-width: 600px
}

.main-layout-sm {
    max-width: 708px
}

.main-layout-lg {
    max-width: 980px
}

.main-wrap {
    min-height: calc(100vh - 1px)
}

.main-wrap {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    padding-top: 4px
}

.main-inner {
    position: relative;
    -webkit-box-flex: 1;
    -ms-flex: 1 0 auto;
    flex: 1 0 auto
}

.main-inner {
    padding-bottom: 16px
}

.main-footer {
    margin-top: auto
}

.form-item {
    word-break: break-word
}

.main-wrap-height-auto {
    min-height: 0
}

@media (prefers-reduced-motion:no-preference) {
    :root {
        scroll-behavior: auto
    }
}

.box {
    border-radius: 6px;
    background: #fff;
    border: 1px solid #eaedf1;
    -webkit-box-shadow: 0 4px 8px rgba(33,38,44,.16);
    box-shadow: 0 4px 8px rgba(33,38,44,.16)
}

.box__body,.box__footer,.box__header {
    padding-left: 24px;
    padding-right: 24px
}

.footer-box,.header-box {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    -ms-flex-direction: row;
    flex-direction: row
}

.box__footer-inner,.box__header-inner {
    padding-top: 16px;
    padding-bottom: 16px;
    min-height: 72px;
    height: 100%;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column
}

.box__footer-inner>*,.box__header-inner>* {
    width: 100%
}

@media (max-width: 767px) {
    .box {
        border-radius:0
    }
}

.item {
    background-color: green;
    height: 50px
}

.ubg-ghost {
    background-color: transparent
}

.ubtn.ubg-ghost {
    padding: 0
}

.header-desktop {
    padding-top: 4px
}

.header-box>.row {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1
}

.header-box-simple {
    border-bottom: 1px solid #eaedf1
}

.header-box-dashed .box__header-inner {
    border-bottom: 1px dashed #eaedf1
}

.ubox-square.ubox-size-ic-md {
    border-radius: 6px
}

.ubox-square.ubox-size-ic-xs {
    border-radius: 5px
}

.ubtn-text.pl12 {
    padding-left: 12px!important
}

.chat-box {
    position: fixed;
    right: 24px!important;
    bottom: 24px!important;
    cursor: pointer
}

.footer_mobile {
    min-height: 56px;
    padding-bottom: env(safe-area-inset-bottom);
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    position: fixed;
    bottom: 0;
    width: 100%;
    background-color: #f5f7f9;
    -webkit-box-shadow: 0 -2px 4px rgba(0,0,0,.12);
    box-shadow: 0 -2px 4px rgba(0,0,0,.12);
    z-index: 90
}

.footer_mobile-inner {
    overflow: hidden;
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    padding: 4px 16px
}

.header-box-top:last-child {
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1
}

.header-box-top .logo img {
    max-height: 32px
}

.header-box-top .logo-group-wrap .logo {
    max-width: 150px
}

.header-box-top .logo.text-right {
    margin-right: 0;
    margin-left: auto
}

@media (min-width: 768px) {
    .show-mobile {
        display:none!important
    }
}

.footer-box {
    border-top: 1px solid #eaedf1
}

.footer-logos img {
    height: 32px
}

.header-desktop-2 {
    padding-top: 16px;
    padding-bottom: 16px
}

.box__header-color {
    border-top-left-radius: 6px;
    border-top-right-radius: 6px
}

.box__header-color .box__header-inner {
    padding-top: 12px;
    padding-bottom: 12px
}

.box__header-color .box__header-inner {
    min-height: 56px
}

@media (max-width: 767px) {
    .logo-group-wrap:first-child>.row {
        padding-left:16px
    }

    .timer {
        margin-bottom: 5px
    }

    .main-wrap {
        overflow: hidden
    }

    .main-layout-sm {
        max-width: 100%
    }

    .box__footer {
        padding-bottom: env(safe-area-inset-bottom)
    }

    .show-desktop {
        display: none!important
    }

    .main {
        padding-left: 0;
        padding-right: 0
    }

    .main-inner {
        padding-bottom: 0
    }

    body:not(.body-color-default) {
        background-color: #fff;
        padding-bottom: 56px
    }

    .box-main {
        -webkit-box-shadow: none;
        box-shadow: none;
        border: 0
    }

    .footer-logos img {
        height: 24px
    }

    .box__footer .row-32 {
        margin-left: -4px;
        margin-right: -4px
    }

    .box__footer .row-32>* {
        padding-left: 4px;
        padding-right: 4px
    }

    .box__body,.box__footer,.timmer-inner {
        padding-left: 16px;
        padding-right: 16px
    }

    .box__header-inner {
        padding-top: 0;
        padding-bottom: 0
    }

    .box__header {
        padding-left: 0;
        padding-right: 0
    }

    .header-box-top {
        padding-top: env(safe-area-inset-top);
        position: fixed;
        top: 0;
        left: 0;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-align: center;
        -ms-flex-align: center;
        align-items: center;
        background-color: #fff;
        height: calc(env(safe-area-inset-top,68px) + 68px);
        z-index: 99;
        padding-left: 0;
        padding-right: 0;
        border-bottom: 1px solid #eaedf1
    }

    .logo-group-wrap .row {
        padding-right: 16px
    }

    .box__footer-inner,.box__header-inner {
        min-height: 0
    }

    .box-main {
        padding-top: calc(env(safe-area-inset-top,68px) + 68px)
    }

    .timer {
        padding-top: 8px;
        padding-bottom: 8px;
        -webkit-box-shadow: 0 2px 4px rgba(0,0,0,.12);
        box-shadow: 0 2px 4px rgba(0,0,0,.12)
    }

    .header-box-simple {
        border-bottom: 0;
        z-index: 99
    }

    .header-box-top>.row {
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1
    }

    .main-inner {
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column
    }

    .box-main {
        -webkit-box-flex: 1;
        -ms-flex: 1 0 auto;
        flex: 1 0 auto;
        display: -webkit-box;
        display: -ms-flexbox;
        display: flex;
        -webkit-box-orient: vertical;
        -webkit-box-direction: normal;
        -ms-flex-direction: column;
        flex-direction: column
    }

    .box__body {
        -webkit-box-flex: 1;
        -ms-flex: 1;
        flex: 1
    }

    .header-box-top>.row {
        margin-left: -8px;
        margin-right: -8px
    }

    .header-box-top>.row>* {
        padding-left: 8px;
        padding-right: 8px
    }

    .box-main-2 .box__header {
        padding-left: 16px;
        padding-right: 16px
    }

    .box-main-2 .box__header-inner {
        padding-top: 16px;
        padding-bottom: 16px
    }

    .header-desktop-2 {
        padding: 16px
    }
}

.box-ic-holder {
    height: 1px;
    width: 44px
}

@media screen and (-ms-high-contrast:active),(-ms-high-contrast:none) {
    .box-main {
        display: block
    }
}

.logo-group-wrap~.box-ic-holder-col {
    display: none
}

.list-method-item {
    background-color: #fff;
    border-radius: 3px;
    -webkit-box-shadow: 0 0 2px rgba(33,38,44,.16);
    box-shadow: 0 0 2px rgba(33,38,44,.16);
    -webkit-transition: .15s all linear;
    -o-transition: .15s all linear;
    transition: .15s all linear;
    border: 0
}

.list-method-button {
    padding: 12px 16px;
    display: block;
    cursor: pointer;
    width: 100%;
    text-align: left;
    border: 0;
    outline: 0;
    background-color: #fff
}

.list-method-item:hover {
    -webkit-box-shadow: 0 4px 8px rgba(33,38,44,.16);
    box-shadow: 0 4px 8px rgba(33,38,44,.16)
}

.list-method-button .icon {
    width: 56px;
    height: 56px
}

.list-method-item-content>div {
    padding: 24px;
    position: relative
}

.list-method-item-content>div::before {
    border-top: 1px dashed #eaedf1;
    content: "";
    display: block;
    width: 100%;
    height: 1px;
    margin-top: -24px;
    margin-bottom: 24px
}

@media (min-width: 768px) {
    .list-method-button .title {
        padding-left:8px
    }
}

.vnpay-logo {
    display: -webkit-inline-box;
    display: -ms-inline-flexbox;
    display: inline-flex;
    -webkit-box-align: end;
    -ms-flex-align: end;
    align-items: flex-end
}

.vnpay-logo>sup {
    line-height: 1;
    font-size: 60%;
    top: -1em
}

.vnpay-red {
    color: #e50019
}

.vnpay-blue {
    color: #004a9c
}

.list-bank-item {
    padding-top: 53.125%;
    display: block;
    position: relative;
    width: 100%;
    background-color: transparent;
    border: 0;
    outline: 0
}

.list-bank-item-inner {
    position: absolute;
    width: 100%;
    font-size: 12px;
    padding: 8px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-position: center;
    background-repeat: no-repeat;
    background-size: 80% auto;
    height: 100%;
    top: 0;
    left: 0;
    border: 1px solid #bfccd9;
    border-radius: 3px;
    -webkit-transition: .15s all linear;
    -o-transition: .15s all linear;
    transition: .15s all linear;
    color: #21262c!important
}

.list-bank-main:not(.list-bank-main-unclickable) .list-bank-item:hover .list-bank-item-inner {
    border: 1px solid #0071a9
}

@media (max-width: 767px) {
    .list-method-item-content>div::before {
        margin-top:-16px;
        margin-bottom: 16px
    }

    .list-method-item-content>div {
        padding: 16px
    }
}

sup {
    top: -.5em;
    font-size: 60%
}

.bills {
    padding: 24px;
    background-color: cornflowerblue;
    border-radius: 3px;
    color:black;
}

.bills-header {
    padding-bottom: 24px;
    border-bottom: 1px solid #bfccd9
}

.bills-body>div {
    padding-top: 24px
}

@media (min-width: 768px) {
    .bills-body {
        max-height:none!important;
        display: block!important
    }
}

.bills-list-item {
    line-height: 1.4
}

@media (max-width: 767px) {
    .bills-list-item .title {
        font-size:14px
    }

    .bills {
        padding: 0 16px
    }

    .bills-body>div {
        border-top: 1px dashed #bfccd9;
        padding-bottom: 16px
    }

    .bills-header-mobile {
        padding: 16px 0
    }

    .bills-header-mobile .ubtn .ubtn-ic {
        -webkit-transition: .15s all linear;
        -o-transition: .15s all linear;
        transition: .15s all linear
    }

    .bills.open .bills-header-mobile .ubtn .ubtn-ic {
        -webkit-transform: rotate(180deg);
        -ms-transform: rotate(180deg);
        transform: rotate(180deg)
    }

    .bills-list-item {
        margin-bottom: 8px
    }

    .main-title-mobile {
        font-size: 16px
    }

    .modal-dialog {
        margin-left: auto;
        margin-right: auto
    }
}

.tooltip.show {
    opacity: 1
}

.v-text-bottom {
    vertical-align: text-bottom
}

.alert-box {
    padding: 12px;
    border-radius: 3px
}

.bs-tooltip-auto[x-placement^=bottom] .arrow::before,.bs-tooltip-bottom .arrow::before {
    border-bottom-color: #fff
}

.alert-box-warning {
    border: 1px solid #fde4c9
}

.alert-box .ic img {
    width: 16px;
    height: 16px
}

.main-title {
    max-width: 360px;
    margin-left: auto;
    margin-right: auto
}

.link-style-default {
    text-decoration: underline!important;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.link-style-default .ic-default {
    margin-right: 4px
}

.qr-cancel-btn-wrap {
    width: 224px
}

.qr {
    display: inline-block;
    max-width: 100%
}

.qr-inner {
    width: 335px;
    padding-top: 106.25%;
    top: 0;
    left: 0;
    background-size: contain;
    position: relative;
    cursor: pointer;
    margin-left: auto;
    margin-right: auto;
    background-repeat: no-repeat;
    max-width: 100%
}

.qr-inner>img {
    position: absolute;
    width: 90%;
    top: 9%;
    left: 0;
    right: 0;
    margin: auto
}

.qr-section-inner {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.qr-size-lg .qr-inner {
    width: 412px
}

@media (max-width: 767px) {
    .qr-cancel-btn-wrap {
        width:100%
    }
}

.or {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center
}

.or::before {
    content: "";
    height: 1px;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    border-top: 1px dashed #eaedf1
}

.or::after {
    content: "";
    height: 1px;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    border-top: 1px dashed #eaedf1
}

.bills-simple {
    padding: 12px 16px
}

.guide-title-number {
    width: 36px;
    height: 36px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    position: relative;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    z-index: 2
}

.guide-title-number::after,.guide-title-number::before {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    margin: auto;
    border-radius: 50%;
    content: ""
}

.guide-title-number::after {
    width: 28px;
    height: 28px;
    background-color: #eaedf1;
    z-index: 1
}

.guide-title-number-inner {
    position: relative;
    z-index: 2
}

.guide-title-number::before {
    width: 100%;
    background-color: #fff;
    opacity: 0;
    -webkit-transition: .15s all linear;
    -o-transition: .15s all linear;
    transition: .15s all linear;
    height: 100%;
    border: 1px solid #0071a9
}

.guide-title {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column
}

.guide-title-inner {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    min-height: 36px
}

.nav-style-guide>a:not(:last-child) {
    padding-bottom: 32px
}

.nav-style-guide>a {
    padding-left: 0;
    padding-right: 0;
    padding-top: 0;
    position: relative
}

.nav-style-guide>a:not(:last-child)::before {
    content: "";
    width: 1px;
    height: 100%;
    z-index: 1;
    border-left: 1px solid #bfccd9;
    position: absolute;
    -webkit-transition: .15s all linear;
    -o-transition: .15s all linear;
    transition: .15s all linear;
    left: 18px;
    top: 8px
}

.nav-style-guide>a.visited:not(:last-child)::before {
    border-left-color: #0071a9
}

.nav-style-guide>a.active .guide-title-number::before,.nav-style-guide>a.visited .guide-title-number::before {
    opacity: 1
}

.nav-style-guide>a.visited .guide-title-number::after {
    background-color: #0071a9
}

.nav-style-guide>a.active .guide-title-number::after {
    background-color: #0071a9
}

.nav-style-guide>a.active .guide-title-number,.nav-style-guide>a.visited .guide-title-number {
    color: #fff
}

.nav-style-guide>a.visited .guide-title {
    color: #0071a9
}

.nav-style-guide>a.active .guide-title {
    color: #0071a9
}

.guide-image {
    height: 400px;
    width: 200px
}

.guide {
    padding: 0 20px
}

.modal-header {
    min-height: 52px
}

.modal-section:not(:last-child) {
    padding-bottom: 32px;
    margin-bottom: 32px;
    border-bottom: 1px solid #eaedf1
}

.box-section:not(:first-child) {
    padding-top: 32px;
    margin-top: 32px;
    border-top: 1px dashed #eaedf1
}

.box-section-sm:not(:first-child) {
    padding-top: 24px;
    margin-top: 24px
}

.app-list-item {
    border-radius: 3px;
    border: 1px solid #eaedf1;
    height: 100%
}

.app-list-item-inner {
    padding: 12px;
    height: 100%
}

.box-section {
    padding-top: 24px
}

.app-list-item-inner .icon {
    width: 46px;
    height: 46px;
    border: 1px solid #eaedf1;
    border-radius: 6px
}

.app-list-item-inner .icon img {
    border-radius: 6px
}

.app-os-item {
    background-size: 16px;
    background-position: top left;
    background-repeat: no-repeat;
    padding-left: 20px;
    line-height: 16px
}

.app-os-item.ios {
    background-image: url("data:image/svg+xml,%3Csvg id='Group_12596' data-name='Group 12596' xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E%3Cpath id='Path_19671' data-name='Path 19671' d='M0,0H16V16H0Z' fill='none'/%3E%3Cpath id='Path_19672' data-name='Path 19672' d='M8.566,5.1c-.584,0-1.488-.664-2.44-.64A3.6,3.6,0,0,0,3.07,6.314c-1.3,2.264-.336,5.608.936,7.448.624.9,1.36,1.9,2.336,1.872.936-.04,1.288-.608,2.424-.608s1.448.608,2.44.584c1.008-.016,1.648-.912,2.264-1.816a8.04,8.04,0,0,0,1.024-2.1A3.264,3.264,0,0,1,12.51,8.7a3.319,3.319,0,0,1,1.6-2.808,3.463,3.463,0,0,0-2.7-1.464c-1.232-.1-2.264.672-2.84.672Zm2.08-1.888A3.234,3.234,0,0,0,11.414.85,3.326,3.326,0,0,0,9.238,1.97a3.093,3.093,0,0,0-.784,2.288A2.758,2.758,0,0,0,10.646,3.21Z' transform='translate(-0.817 -0.283)' fill='%2321262c'/%3E%3C/svg%3E%0A")
}

.app-os-item.android {
    background-image: url("data:image/svg+xml,%3Csvg id='Group_12599' data-name='Group 12599' xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3E%3Cpath id='Path_19673' data-name='Path 19673' d='M0,0H16V16H0Z' fill='none'/%3E%3Cpath id='Path_19674' data-name='Path 19674' d='M3.406,1.814,10.195,8.6,3.407,15.4A.664.664,0,0,1,3,14.782V2.427a.667.667,0,0,1,.406-.613Zm7.26,7.262L12.2,10.611,4.909,14.833l5.757-5.757ZM12.8,6.944,14.67,8.028a.667.667,0,0,1,0,1.153L12.8,10.265,11.137,8.6ZM4.909,2.377,12.2,6.6,10.666,8.133,4.909,2.377Z' transform='translate(-1 -0.605)' fill='%2321262c'/%3E%3C/svg%3E%0A")
}

.list-bank-grid-8 .col-item {
    min-width: 12.5%
}

.modal-full-height .modal-content {
    height: 100%
}

.ubg-ghost {
    color: #21262c
}

@media (min-width: 768px) {
    .bank-payement-section {
        padding:0 22px
    }
}

.logo-brands-small {
    width: 64px;
    height: 32px;
    border-radius: 3px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.select-tpl-img-wrap .logo-brands-small {
    margin-left: -8px
}

.input-extend-inner .logo-brands-small {
    margin-right: -8px
}

.logo-brands-small img {
    max-height: 100%
}

.input-size-default textarea {
    min-height: 48px
}

.select2-container--default .select2-selection--single {
    border: 0
}

@media (max-width: 767px) {
    .input-size-default textarea {
        min-height:56px
    }
}

.rnc-card {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    text-align: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    height: 100%;
    padding: 16px;
    border-radius: 3px;
    -webkit-transition: .15s all linear;
    -o-transition: .15s all linear;
    transition: .15s all linear;
    border: 1px solid #bfccd9
}

.rnc-card-wrap {
    height: 100%
}

.rnc-card .icon img {
    width: auto;
    height: 44px;
    margin-bottom: 8px
}

.rnc:hover .rnc-card {
    border-color: #d6dee6
}

.rnc>input:checked~.rnc-card {
    border-color: #0071a9
}

@media (max-width: 767px) {
    .rnc-card {
        padding:12px 8px
    }
}

.border-item:not(:last-child) {
    margin-bottom: 16px
}

.table-main {
    width: 100%
}

.table-border td {
    border: 1px solid #eaedf1;
    padding: 10px 12px
}

.table-border th {
    border: 1px solid #eaedf1;
    padding: 10px 12px
}

.table-border th {
    font-weight: 600
}

.rnc-vertical .rnc-ic-wrap {
    padding: 0;
    margin-bottom: 4px
}

.rnc-vertical .rnc-content {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.input:disabled:not(.select-2)~.input-frame {
    background-color: #f5f7f9
}

.input:-moz-read-only:not(.select-2)~.input-frame {
    background-color: #f5f7f9
}

.input:read-only:not(.select-2)~.input-frame {
    background-color: #f5f7f9
}

.list-dots {
    list-style-type: none
}

.list-dots {
    margin: 0
}

.list-dots>li {
    padding-left: 20px;
    position: relative
}

.list-dots>li:not(:last-child) {
    padding-bottom: 10px
}

.list-dots>li::before {
    content: "a";
    color: transparent;
    display: inline-block;
    position: absolute;
    width: 10px;
    top: 0;
    left: 0;
    background-repeat: no-repeat;
    background-position: center left;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='6' height='6' viewBox='0 0 6 6'%3E%3Crect id='Rectangle_83' data-name='Rectangle 83' width='6' height='6' rx='3' fill='%230071a9'/%3E%3C/svg%3E%0A")
}

.box-404,.box-error {
    text-align: center
}

.box-404-inner,.box-error-inner {
    margin: 0 auto;
    max-width: 360px;
    padding: 64px 0
}

.link-underline {
    text-decoration: underline!important
}

@media (max-width: 767px) {
    .header-box-simple .box-section {
        padding:16px;
        margin-top: 0;
        border: 0
    }
}

[data-accordion]>* {
    line-height: 1.3
}

.tooltip .tooltip-arrow {
    margin-left: auto;
    margin-right: auto;
    left: 0!important;
    -webkit-transform: none!important;
    -ms-transform: none!important;
    transform: none!important;
    right: 0
}

.bs-tooltip-auto[data-popper-placement^=top] .tooltip-arrow::before,.bs-tooltip-top .tooltip-arrow::before {
    border-top-color: #fff
}

.tooltip[data-popper-placement^=bottom] .tooltip-arrow {
    bottom: auto;
    top: 0
}

.tooltip[data-popper-placement^=bottom] .tooltip-arrow::before {
    border-top-color: transparent;
    border-bottom: #fff;
    border-width: 0 .4rem .4rem
}

.select2-dropdown.top-0 {
    top: auto!important
}

.input.text-center+.input-extend.input-extend-left {
    width: 68px
}

.input.text-center+.input-extend.input-extend-left .input-ic {
    width: 32px
}

.form-group-rnc .input-label .inner {
    margin-bottom: 12px
}

.lds-ellipsis {
    display: inline-block;
    position: relative;
    width: 22px;
    height: 20px
}

.lds-ellipsis div {
    position: absolute;
    top: 0;
    margin: auto;
    bottom: 0;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    background: currentColor;
    -webkit-animation-timing-function: cubic-bezier(0,1,1,0);
    animation-timing-function: cubic-bezier(0,1,1,0)
}

.lds-ellipsis div:nth-child(1) {
    left: 0;
    -webkit-animation: lds-ellipsis1 .6s infinite;
    animation: lds-ellipsis1 .6s infinite
}

.lds-ellipsis div:nth-child(2) {
    left: 0;
    -webkit-animation: lds-ellipsis2 .6s infinite;
    animation: lds-ellipsis2 .6s infinite
}

.lds-ellipsis div:nth-child(3) {
    left: 8px;
    -webkit-animation: lds-ellipsis2 .6s infinite;
    animation: lds-ellipsis2 .6s infinite
}

.lds-ellipsis div:nth-child(4) {
    left: 16px;
    -webkit-animation: lds-ellipsis3 .6s infinite;
    animation: lds-ellipsis3 .6s infinite
}

@keyframes lds-ellipsis1 {
    0% {
        -webkit-transform: scale(0);
        transform: scale(0)
    }

    100% {
        -webkit-transform: scale(1);
        transform: scale(1)
    }
}

@keyframes lds-ellipsis3 {
    0% {
        -webkit-transform: scale(1);
        transform: scale(1)
    }

    100% {
        -webkit-transform: scale(0);
        transform: scale(0)
    }
}

@keyframes lds-ellipsis2 {
    0% {
        -webkit-transform: translate(0,0);
        transform: translate(0,0)
    }

    100% {
        -webkit-transform: translate(8px,0);
        transform: translate(8px,0)
    }
}

.list-dots {
    list-style-type: none
}

.list-dots {
    margin-bottom: 16px
}

.list-dots>li {
    padding-left: 12px;
    position: relative
}

.list-dots>li:not(:last-child) {
    padding-bottom: 10px
}

.list-dots>li::before {
    content: "a";
    color: transparent;
    display: inline-block;
    position: absolute;
    width: 12px;
    top: 0;
    left: 0;
    background-repeat: no-repeat;
    background-position: center left;
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='4' height='4' viewBox='0 0 4 4'%3E%3Crect id='Rectangle_83' data-name='Rectangle 83' width='4' height='4' rx='2' fill='%235A7087'/%3E%3C/svg%3E%0A")
}

.list-dots>li>ul.list-dots>li::before {
    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='4' height='4' viewBox='0 0 4 4'%3E%3Cg id='Ellipse_831' data-name='Ellipse 831' fill='%23fff' stroke='%235a7087' stroke-width='1'%3E%3Ccircle cx='2' cy='2' r='2' stroke='none'/%3E%3Ccircle cx='2' cy='2' r='1.5' fill='none'/%3E%3C/g%3E%3C/svg%3E%0A")
}

.list-dots>li>ul.list-dots {
    padding-left: 16px
}

.textarea-autosize {
    resize: none!important
}

.accordion-item-default.box-blank {
    border-bottom: 1px solid #eaedf1
}

.accordion-item-default .acc-content {
    padding: 16px 0;
    border-top: 1px dashed #eaedf1
}

.accordion-item-default.box-blank .acc-header {
    padding: 12px 0
}

.collapsing {
    pointer-events: none
}

.table-space-h-24 td:not(:last-child) {
    padding-right: 24px
}

.table-space-v-8 tr:not(:last-child) td {
    padding-bottom: 8px
}

.collapse-showing .acc-header {
    pointer-events: none
}

.acc-toggle {
    cursor: pointer
}

.ic-arrow {
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.acc-toggle:not(.collapsed) .ic-arrow {
    -webkit-transform: rotate(180deg);
    -ms-transform: rotate(180deg);
    transform: rotate(180deg)
}

.promo-section {
    padding: 16px 0;
    border-top: 1px dashed #eaedf1;
    border-bottom: 1px dashed #eaedf1
}

.promo-card {
    border-radius: 6px;
    -webkit-filter: drop-shadow(0 4px 8px rgba(33, 38, 44, .12));
    filter: drop-shadow(0 4px 8px rgba(33, 38, 44, .12));
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear;
    position: relative
}

.promo-left,.promo-right {
    padding-top: 12px;
    padding-bottom: 12px;
    background: #fff;
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear
}

.promo-right {
    width: 90px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.promo-card-inner>.row>:not(.scope-vertical) {
    background: #fff
}

.promo-card-inner>.row>:first-child {
    border-radius: 6px 0 0 6px
}

.promo-card-inner>.row>:last-child {
    border-radius: 0 6px 6px 0
}

.promo-left {
    padding-left: 16px;
    padding-right: 12px
}

.promo-right {
    padding-right: 16px;
    padding-left: 12px;
    border-right: 4px solid transparent
}

.promo-right .title {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden
}

.promo-card-inner .row,.promo-left {
    height: 100%
}

.promo-left-inner {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    height: 100%
}

.promo-card-inner {
    width: 100%
}

.promo-right {
    height: 100%
}

@media (max-width: 767px) {
    .promo-left {
        padding-left:12px
    }

    .promo-right {
        padding-right: 12px
    }
}

.scope-divider-inner {
    padding-top: 4px;
    padding-bottom: 4px
}

.scope-vertical {
    overflow: hidden;
    height: 100%
}

.scope-divider-inner {
    width: 16px;
    top: 8px;
    height: calc(100% - 16px);
    background-color: #fff;
    position: relative;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center
}

.scope-divider-inner:after,.scope-divider-inner:before {
    content: "";
    position: absolute;
    width: 24px;
    height: 24px;
    border: 5px solid transparent;
    border-top-color: #fff;
    border-right-color: #fff;
    border-radius: 100%;
    pointer-events: none;
    -webkit-transform: rotate(135deg);
    -ms-transform: rotate(135deg);
    transform: rotate(135deg)
}

.scope-divider-inner:before {
    top: -20px
}

.scope-divider-inner::after {
    bottom: -20px;
    -webkit-transform: rotate(-45deg);
    -ms-transform: rotate(-45deg);
    transform: rotate(-45deg)
}

.scope-divider-line {
    height: 100%;
    border-right: 1px dotted #eaedf1
}

.ulabel-status.ubg-sub-warning {
    border: 2px solid #fcd5ac
}

.ulabel-status[data-bs-toggle] {
    cursor: pointer
}

.empty-box {
    text-align: center
}

.modal-body .empty-box {
    padding-top: 16px;
    padding-bottom: 16px
}

.empty-box-icon {
    width: 80px;
    height: 80px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    background-color: #eaedf1;
    border-radius: 50%;
    margin: 0 auto
}

.empty-box-icon img {
    width: 48px
}

.flat-width-holder {
    width: 58px
}

.box-simple {
    border-radius: 4px;
    padding: 12px 16px
}

.ic-lg-height {
    height: 32px;
    width: auto
}

.input-box-btn {
    padding-right: 4px!important
}

.modal-body:first-child {
    padding-top: 32px
}

.u-label-border-left {
    border-left: 1px solid #bfccd9
}

[name=rncPromo]:checked~.promo-card .promo-right {
    border-color: #29a339
}

.show-checked {
    display: none
}

[name=rncPromo]:checked~.promo-card .show-checked {
    display: block
}

[name=rncPromo]:checked~.promo-card .hide-checked {
    display: none
}

.promo-card-inner .ubtn {
    z-index: 2;
    position: relative
}

.promo-link-abs {
    position: absolute;
    left: 0;
    right: 0;
    width: 100%;
    top: 0;
    height: 100%;
    z-index: 1;
    cursor: pointer
}

.no-minheight {
    min-height: 0!important
}

.modal-header.no-minheight::after {
    display: none
}

.ubg-default-80 {
    background-color: rgba(33,38,44,.8)
}

.promo-info-banner {
    position: relative
}

.promo-info-banner-inner {
    padding-top: 48.06%
}

.promo-info-banner-inner img {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0
}

.modal-body-full {
    margin-left: -32px;
    margin-right: -32px;
    margin-top: -16px
}

@media (max-width: 767px) {
    .modal-body-full {
        margin-left:-16px;
        margin-right: -16px
    }
}

.promo-info-box {
    background: #fff;
    border-radius: 6px;
    -webkit-box-shadow: 0 4px 8px rgba(37,42,49,.12);
    box-shadow: 0 4px 8px rgba(37,42,49,.12);
    padding: 24px;
    margin-top: -24px;
    position: relative;
    text-align: center;
    margin-bottom: 24px
}

.ubox-size-button-xs .ic-default {
    width: 16px;
    height: 16px
}

.list-method-button.no-cursor {
    cursor: default
}

.flex-1-0-auto {
    -webkit-box-flex: 1;
    -ms-flex: 1 1 auto;
    flex: 1 1 auto
}

.title {
    word-break: break-word
}

.ubg-transparent {
    border: 0
}

.rs {
    -ms-grid-column: 3;
    grid-column: 3;
    -ms-grid-row: 2;
    grid-row: 2
}

.rs .rs-container {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-flex: 1;
    -ms-flex-positive: 1;
    flex-grow: 1;
    -ms-flex-preferred-size: 0;
    flex-basis: 0;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis
}

.rs .rs-wrapper {
    position: relative;
    width: 100%;
    min-height: 36px
}

.rs .rs-selection {
    position: relative;
    border-radius: 3px;
    overflow: hidden;
    cursor: pointer
}

.rs .rs-selection__rendered {
    width: 100%;
    display: block;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding-right: 48px;
    font-size: 14px;
    font-weight: 400;
    padding-left: 16px;
    color: #21262c;
    line-height: 36px
}

.rs .rs-dropdown {
    position: absolute;
    background-color: #fff;
    border-radius: 4px;
    margin-top: 8px;
    -webkit-box-shadow: 0 4px 8px 0 #ccc;
    box-shadow: 0 4px 8px 0 #ccc;
    z-index: 10
}

.rs .rs-dropdown__indicators>div {
    width: 20px;
    height: 20px;
    margin-left: 14px;
    margin-right: 14px
}

.rs .rs-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 9
}

.rs .rs-dropdown {
    width: 100%;
    min-width: 200px
}

.rs .rs-dropdown__control {
    background-image: url(../images/icons-color/default/default/24x24-search.svg);
    background-position: center right 10px;
    background-repeat: no-repeat;
    background-color: #eaedf1;
    background-size: 20px;
    padding-right: 40px;
    border-radius: 3px;
    padding-left: 5px;
    min-height: 36px;
    border: 0;
    margin: 10px
}

.rs .rs-dropdown__menu {
    border: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-radius: 0 0 4px 4px
}

.rs .rs-dropdown__option {
    padding: 12px;
    cursor: pointer
}

.rs .rs-dropdown__option--is-selected {
    background-color: #f5f7f9;
    color: #121f3e;
    background-image: url(../images/icons-color/primary/default/24x24-check.svg);
    background-position: center right 8px;
    background-repeat: no-repeat;
    color: #0071a9;
    padding-right: 40px
}

.rs .rs-dropdown__option--is-focused {
    background-color: #f5f7f9
}

.rs .rs-dropdown__menu {
    position: relative
}

.rs .rs-dropdown {
    margin-top: 5px
}

.rs .rs-dropdown__control--is-focused {
    border-color: #0071a9;
    -webkit-box-shadow: #0071a9 0 0 0 1px;
    box-shadow: #0071a9 0 0 0 1px
}

.rs .rs-selection__rendered {
    background-position: center right 8px;
    background-repeat: no-repeat;
    padding-right: 40px;
    background-image: url(../images/icons-color/default/default/24x24-chevrondown.svg)
}

.rs .rs-dropdown__placeholder {
    color: #bfccd9
}

@keyframes fadeInFromNone {
    0% {
        opacity: 0
    }

    100% {
        opacity: .5
    }
}

@keyframes inUpFromNone {
    0% {
        -webkit-transform: translate(0,100%);
        transform: translate(0,100%)
    }

    100% {
        -webkit-transform: translate(0,0);
        transform: translate(0,0)
    }
}

@media (max-width: 767px) {
    .rs .rs-dropdown__input,.rs .rs-dropdown__input-container,.rs .rs-dropdown__placeholder,.rs .rs-selection__rendered {
        font-size:16px!important
    }

    .rs .rs-selection__rendered {
        line-height: 44px
    }

    .rs .rs-dropdown {
        position: fixed!important;
        bottom: 0;
        right: 0;
        left: 0;
        z-index: 9999;
        -webkit-animation: inUpFromNone .3s ease-out;
        animation: inUpFromNone .3s ease-out;
        border-radius: 4px 4px 0 0
    }

    .rs .rs-backdrop {
        background-color: #000;
        opacity: .5;
        position: fixed;
        z-index: 3999;
        bottom: 0;
        left: 0;
        right: 0;
        top: 0;
        -webkit-animation: fadeInFromNone .3s ease-out;
        animation: fadeInFromNone .3s ease-out
    }

    .rs .rs-dropdown__menu-list {
        position: relative!important;
        border-radius: 0;
        height: 45vh;
        max-height: -webkit-calc(100vh - 200px)
    }
}

.mp-container {
    -ms-grid-column: 3;
    grid-column: 1;
    -ms-grid-row: 2;
    grid-row: 3
}

.mp-calendar {
    position: absolute;
    z-index: 12;
    width: 340px;
    right: 0;
    max-width: 90vw
}

.react-calendar {
    padding: 16px;
    border-radius: 3px;
    background: #fff;
    -webkit-box-shadow: 0 4px 8px rgba(37,42,49,.16);
    box-shadow: 0 4px 8px rgba(37,42,49,.16)
}

.react-calendar__navigation__label {
    color: #21262c!important
}

.react-calendar__tile {
    color: #21262c!important
}

.react-calendar__tile {
    width: 100px;
    height: 74px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-pack: middle;
    -ms-flex-pack: middle;
    justify-content: middle;
    -webkit-box-align: center;
    -ms-flex-align: center;
    align-items: center;
    font-weight: 500;
    border: 0
}

.react-calendar__navigation__next2-button,.react-calendar__navigation__prev2-button {
    display: none
}

.react-calendar__navigation {
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex
}

.react-calendar__navigation__arrow,.react-calendar__navigation__label,.react-calendar__tile {
    background-color: #fff;
    -webkit-transition: .2s all linear;
    -o-transition: .2s all linear;
    transition: .2s all linear;
    border-radius: 6px;
    -webkit-appearance: none!important;
    border: 0
}

.react-calendar__navigation__arrow {
    height: 44px;
    width: 44px
}

.react-calendar__navigation__arrow:hover,.react-calendar__navigation__label:hover,.react-calendar__tile:hover {
    background-color: #f5f7f9
}

.react-calendar__navigation__label {
    margin-left: 16px;
    margin-right: 16px;
    font-weight: 500;
    font-size: 16px
}

.react-calendar__navigation__next-button,.react-calendar__navigation__prev-button {
    color: transparent;
    background-position: center;
    background-repeat: no-repeat
}

.react-calendar__navigation__prev-button {
    background-image: url("data:image/svg+xml,%3Csvg id='_24x24-ChevronLeft' data-name='24x24-ChevronLeft' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Crect id='Frame24' width='24' height='24' fill='%23fff' opacity='0'/%3E%3Cpath id='chevron-left' d='M15.254,16.089a.9.9,0,1,1-1.206,1.34l-5.3-4.8a.9.9,0,0,1,0-1.342L14,6.571a.9.9,0,0,1,1.2,1.344l-4.18,3.754a.4.4,0,0,0,0,.594l4.229,3.825Z' transform='translate(0.001 -0.041)' fill='%2321262c'/%3E%3C/svg%3E%0A")
}

.react-calendar__navigation__next-button {
    background-image: url("data:image/svg+xml,%3Csvg id='_24x24-ChevronRight' data-name='24x24-ChevronRight' xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Crect id='Frame24' width='24' height='24' fill='%23fff' opacity='0'/%3E%3Cpath id='chevron-right' d='M8.746,16.089l4.229-3.825a.4.4,0,0,0,0-.594L8.795,7.916A.9.9,0,1,1,10,6.571l5.256,4.72a.9.9,0,0,1,0,1.342l-5.3,4.8a.9.9,0,0,1-1.206-1.34Z' transform='translate(0 -0.041)' fill='%2321262c'/%3E%3C/svg%3E%0A")
}

.react-calendar__tile--active,.react-calendar__tile--hasActive {
    background-color: #0071a9!important;
    color: #fff!important
}

@media (max-width: 767px) {
    .mp-container {
        position:fixed;
        z-index: 9999;
        left: 0;
        bottom: 0;
        height: 100%;
        width: 100%;
        background-color: rgba(33,38,44,.8)
    }

    .mp-calendar {
        bottom: 0;
        width: 100%;
        left: 0;
        border-radius: 0;
        right: 0;
        max-width: none;
        max-height: 80vh;
        overflow: auto
    }

    .react-calendar {
        border-radius: 0;
        border-top-left-radius: 6px;
        border-top-right-radius: 6px
    }
}

@media (max-height: 500px) {
    .modal-dialog-scrollable {
        height:auto
    }
}

.modal-content {
    max-height: 90vh!important
}

.tooltip:not(.show) {
    pointer-events: none
}

.ubg-success .ubg-transparent.ubtn:hover {
    background-color: rgba(255,255,255,.2)
}

.ubtn-title-border.ubg-success .ubtn-text {
    border-right: 1px solid #c7e1ca
}

.ubox-abs {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 10
}

.ubox-abs~.ubtn-inner {
    position: static
}

.ubox-abs~.ubtn-inner .position-relative {
    z-index: 11
}

.input-extend-inner.pr4 {
    padding-right: 4px
}

.ubtn-primary-disabled {
    background-color: #eff2f5!important;
    opacity: .3;
    cursor: not-allowed!important;
    pointer-events: none
}

.ubtn-primary-disabled .ubtn-text {
    color: #21262c!important
}

.color-sub-default {
    color: #5a7087!important
}

@media (max-width: 480px) {
    .modal-mobile,.modal-mobile-full {
        margin:0;
        -webkit-box-align: end;
        -ms-flex-align: end;
        align-items: flex-end;
        max-width: 100%;
        height: 100%
    }

    .modal-mobile .modal-footer,.modal-mobile-full .modal-content {
        border-radius: 0
    }

    .modal-mobile .modal-content {
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
        max-height: none!important;
        height: calc(100% - 32px)
    }

    .modal-mobile-full .modal-content {
        height: 100%;
        max-height: none!important
    }
}

.ulabel-status .ubtn {
    z-index: 20
}

@media (min-width: 1080px) {
    .tooltip {
        z-index:4000
    }
}

.color-block {
    max-width: 100%;
    width: 158px;
    min-height: 120px;
    border-radius: 10px;
    margin-bottom: 20px;
    -webkit-box-shadow: 5px 10px 20px rgba(0,0,0,.08);
    box-shadow: 5px 10px 20px rgba(0,0,0,.08)
}

.color-block-color {
    width: 100%;
    height: 60px;
    border-radius: 10px;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
    -ms-flex-direction: column;
    flex-direction: column;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    padding: 10px
}

.color-block-info {
    padding: 10px;
    font-size: 12px;
    line-height: 1.6
}

.color-block-label {
    opacity: .8
}

.color-block-sample {
    width: 10px;
    height: 10px;
    border-radius: 3px;
    display: inline-block
}

.eye-slash {
    width: 100%;
    -webkit-transition: .2s all ease-in-out;
    -o-transition: .2s all ease-in-out;
    transition: .2s all ease-in-out;
    -webkit-transform: rotate(-30deg);
    -ms-transform: rotate(-30deg);
    transform: rotate(-30deg);
    position: absolute;
    height: 1px;
    background-color: #242526;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    margin: auto
}

.pagination {
    font-size: 0
}

.pagination-first,.pagination-last {
    width: 40px;
    height: 30px
}

.main-footer {
    padding-bottom: 32px
}

.main-footer-2 .footer-inner {
    padding-top: 12px;
    padding-bottom: 24px
}

@media (min-width: 768px) {
    .main-footer-2 .footer-inner {
        padding-top:0
    }
}

@media (max-width: 1200px) {
    .main {
        -webkit-transition:.2s opacity ease-in-out;
        -o-transition: .2s opacity ease-in-out;
        transition: .2s opacity ease-in-out
    }
}.select2-container {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    display: inline-block;
    margin: 0;
    position: relative;
    vertical-align: middle
}

.select2-container .select2-selection--single {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    height: 36px;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-user-select: none
}

.select2-container .select2-selection--single .select2-selection__rendered {
    display: block;
    padding-left: 15px;
    padding-right: 31px;
    overflow: hidden;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap
}

.select2-container .select2-selection--single .select2-selection__clear {
    position: relative
}

.select2-container[dir=rtl] .select2-selection--single .select2-selection__rendered {
    padding-right: 8px;
    padding-left: 20px
}

.select2-container .select2-selection--multiple {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    cursor: pointer;
    display: block;
    min-height: 32px;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-user-select: none
}

.select2-container .select2-selection--multiple .select2-selection__rendered {
    display: inline-block;
    overflow: hidden;
    padding-left: 8px;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: nowrap
}

.select2-container .select2-search--inline {
    float: left
}

.select2-container .select2-search--inline .select2-search__field {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    border: none;
    font-size: 100%;
    margin-top: 5px;
    padding: 0
}

.select2-container .select2-search--inline .select2-search__field::-webkit-search-cancel-button {
    -webkit-appearance: none
}

.select2-dropdown {
    background-color: #fff;
    border-radius: 4px;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    display: block;
    position: absolute;
    left: -100000px;
    width: 100%;
    z-index: 1051;
    -webkit-box-shadow: 0 5px 20px 0 rgba(0,0,0,.2);
    box-shadow: 0 5px 20px 0 rgba(0,0,0,.2)
}

.select2-results {
    display: block
}

.select2-results__options {
    list-style: none;
    margin: 0;
    padding: 0
}

.select2-results__option {
    padding: 10px;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-user-select: none
}

.select2-results__option[aria-selected] {
    cursor: pointer
}

.select2-container--open .select2-dropdown {
    left: 0;
    min-width: 200px
}

.select2-container--open .select2-dropdown--above {
    border-bottom: none;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0
}

.select2-container--open .select2-dropdown--below {
    border-top: none;
    margin-top: 5px
}

.select2-search--dropdown {
    display: block;
    padding: 5px 10px;
    background: #fff;
    border-radius: 4px
}

.select2-search--dropdown .select2-search__field {
    padding: 4px;
    width: 100%;
    -webkit-box-sizing: border-box;
    box-sizing: border-box
}

.select2-search--dropdown .select2-search__field::-webkit-search-cancel-button {
    -webkit-appearance: none
}

.select2-search--dropdown.select2-search--hide {
    display: none
}

.select2-close-mask {
    border: 0;
    margin: 0;
    padding: 0;
    display: block;
    position: fixed;
    left: 0;
    top: 0;
    min-height: 100%;
    min-width: 100%;
    height: auto;
    width: auto;
    opacity: 0;
    z-index: 99;
    background-color: #fff
}

.select2-hidden-accessible {
    border: 0!important;
    clip: rect(0 0 0 0)!important;
    -webkit-clip-path: inset(50%)!important;
    clip-path: inset(50%)!important;
    height: 1px!important;
    overflow: hidden!important;
    padding: 0!important;
    position: absolute!important;
    width: 1px!important;
    white-space: nowrap!important
}

.select2-container--default .select2-selection--single {
    background-color: #fff;
    border: 1px solid #b7c0cd;
    border-radius: 4px;
    outline: 0
}

.select2-container--default .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 34px;
    font-size: 14px
}

.select2-container--default .select2-selection--single .select2-selection__clear {
    cursor: pointer;
    float: right;
    font-weight: 700
}

.select2-container--default .select2-selection--single .select2-selection__placeholder {
    color: #999
}

.select2-container--default .select2-selection--single .select2-selection__arrow {
    height: 26px;
    position: absolute;
    top: 1px;
    right: 1px;
    width: 20px;
    display: none
}

.select2-container--default .select2-selection--single .select2-selection__arrow b {
    border-color: #888 transparent transparent transparent;
    border-style: solid;
    border-width: 5px 4px 0 4px;
    height: 0;
    left: 50%;
    margin-left: -4px;
    margin-top: -2px;
    position: absolute;
    top: 50%;
    width: 0
}

.select2-container--default[dir=rtl] .select2-selection--single .select2-selection__clear {
    float: left
}

.select2-container--default[dir=rtl] .select2-selection--single .select2-selection__arrow {
    left: 1px;
    right: auto
}

.select2-container--default.select2-container--disabled .select2-selection--single {
    background-color: #eee;
    cursor: default
}

.select2-container--default.select2-container--disabled .select2-selection--single .select2-selection__clear {
    display: none
}

.select2-container--default.select2-container--open .select2-selection--single .select2-selection__arrow b {
    border-color: transparent transparent #888 transparent;
    border-width: 0 4px 5px 4px
}

.select2-container--default .select2-selection--multiple {
    background-color: #fff;
    border: 1px solid #aaa;
    border-radius: 4px;
    cursor: text
}

.select2-container--default .select2-selection--multiple .select2-selection__rendered {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    list-style: none;
    margin: 0;
    padding: 0 5px;
    width: 100%
}

.select2-container--default .select2-selection--multiple .select2-selection__rendered li {
    list-style: none
}

.select2-container--default .select2-selection--multiple .select2-selection__placeholder {
    color: #999;
    margin-top: 5px;
    float: left
}

.select2-container--default .select2-selection--multiple .select2-selection__clear {
    cursor: pointer;
    float: right;
    font-weight: 700;
    margin-top: 5px;
    margin-right: 10px
}

.select2-container--default .select2-selection--multiple .select2-selection__choice {
    background-color: #121f3e;
    color: #fff;
    border-radius: 11px;
    cursor: default;
    float: left;
    margin-right: 5px;
    margin-top: 6px;
    padding: 4px 8px;
    font-size: 13px
}

.select2-container--default .select2-selection--multiple .select2-selection__choice__remove {
    color: #fff;
    cursor: pointer;
    display: inline-block;
    font-weight: 700;
    margin-right: 2px
}

.select2-container--default .select2-selection--multiple .select2-selection__choice__remove:hover {
    color: #a2a2a2
}

.select2-container--default[dir=rtl] .select2-selection--multiple .select2-search--inline,.select2-container--default[dir=rtl] .select2-selection--multiple .select2-selection__choice,.select2-container--default[dir=rtl] .select2-selection--multiple .select2-selection__placeholder {
    float: right
}

.select2-container--default[dir=rtl] .select2-selection--multiple .select2-selection__choice {
    margin-left: 5px;
    margin-right: auto
}

.select2-container--default[dir=rtl] .select2-selection--multiple .select2-selection__choice__remove {
    margin-left: 2px;
    margin-right: auto
}

.select2-container--default.select2-container--focus .select2-selection--multiple {
    border: solid #000 1px;
    outline: 0
}

.select2-container--default.select2-container--disabled .select2-selection--multiple {
    background-color: #eee;
    cursor: default
}

.select2-container--default.select2-container--disabled .select2-selection__choice__remove {
    display: none
}

.select2-container--default.select2-container--open.select2-container--above .select2-selection--multiple,.select2-container--default.select2-container--open.select2-container--above .select2-selection--single {
    border-top-left-radius: 0;
    border-top-right-radius: 0
}

.select2-container--default .select2-search--dropdown .select2-search__field {
    height: 36px;
    border-radius: 4px;
    border: 0;
    padding-left: 0;
    padding-right: 36px
}

.select2-container--default .select2-search--inline .select2-search__field {
    background: 0 0;
    border: none;
    outline: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    -webkit-appearance: textfield
}

.select2-container--default .select2-results>.select2-results__options {
    max-height: 200px;
    overflow-y: auto
}

.select2-container--default .select2-results__option[role=group] {
    padding: 0
}

.select2-container--default .select2-results__option[aria-disabled=true] {
    color: #999
}

.select2-container--default .select2-results__option .select2-results__option {
    padding-left: 1em
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__group {
    padding-left: 0
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__option {
    margin-left: -1em;
    padding-left: 2em
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
    margin-left: -2em;
    padding-left: 3em
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
    margin-left: -3em;
    padding-left: 4em
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
    margin-left: -4em;
    padding-left: 5em
}

.select2-container--default .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option .select2-results__option {
    margin-left: -5em;
    padding-left: 6em
}

.select2-container--default .select2-results__option--highlighted[aria-selected] {
    background-color: #f3f6f8;
    color: #121f3e
}

.select2-container--default .select2-results__group {
    cursor: default;
    display: block;
    padding: 6px
}

.select2-container--classic .select2-selection--single {
    background-color: #f7f7f7;
    border: 1px solid #aaa;
    border-radius: 4px;
    outline: 0;
    background-image: -o-linear-gradient(top,#fff 50%,#eee 100%);
    background-image: -webkit-gradient(linear,left top,left bottom,color-stop(50%,#fff),to(#eee));
    background-image: linear-gradient(to bottom,#fff 50%,#eee 100%);
    background-repeat: repeat-x
}

.select2-container--classic .select2-selection--single:focus {
    border: 1px solid #5897fb
}

.select2-container--classic .select2-selection--single .select2-selection__rendered {
    color: #444;
    line-height: 28px
}

.select2-container--classic .select2-selection--single .select2-selection__clear {
    cursor: pointer;
    float: right;
    font-weight: 700;
    margin-right: 10px
}

.select2-container--classic .select2-selection--single .select2-selection__placeholder {
    color: #999
}

.select2-container--classic .select2-selection--single .select2-selection__arrow {
    background-color: #ddd;
    border: none;
    border-left: 1px solid #aaa;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
    height: 26px;
    position: absolute;
    top: 1px;
    right: 1px;
    width: 20px;
    background-image: -o-linear-gradient(top,#eee 50%,#ccc 100%);
    background-image: -webkit-gradient(linear,left top,left bottom,color-stop(50%,#eee),to(#ccc));
    background-image: linear-gradient(to bottom,#eee 50%,#ccc 100%);
    background-repeat: repeat-x
}

.select2-container--classic .select2-selection--single .select2-selection__arrow b {
    border-color: #888 transparent transparent transparent;
    border-style: solid;
    border-width: 5px 4px 0 4px;
    height: 0;
    left: 50%;
    margin-left: -4px;
    margin-top: -2px;
    position: absolute;
    top: 50%;
    width: 0
}

.select2-container--classic[dir=rtl] .select2-selection--single .select2-selection__clear {
    float: left
}

.select2-container--classic[dir=rtl] .select2-selection--single .select2-selection__arrow {
    border: none;
    border-right: 1px solid #aaa;
    border-radius: 0;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
    left: 1px;
    right: auto
}

.select2-container--classic.select2-container--open .select2-selection--single {
    border: 1px solid #5897fb
}

.select2-container--classic.select2-container--open .select2-selection--single .select2-selection__arrow {
    background: 0 0;
    border: none
}

.select2-container--classic.select2-container--open .select2-selection--single .select2-selection__arrow b {
    border-color: transparent transparent #888 transparent;
    border-width: 0 4px 5px 4px
}

.select2-container--classic.select2-container--open.select2-container--above .select2-selection--single {
    border-top: none;
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-image: -o-linear-gradient(top,#fff 0,#eee 50%);
    background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),color-stop(50%,#eee));
    background-image: linear-gradient(to bottom,#fff 0,#eee 50%);
    background-repeat: repeat-x
}

.select2-container--classic.select2-container--open.select2-container--below .select2-selection--single {
    border-bottom: none;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0;
    background-image: -o-linear-gradient(top,#eee 50%,#fff 100%);
    background-image: -webkit-gradient(linear,left top,left bottom,color-stop(50%,#eee),to(#fff));
    background-image: linear-gradient(to bottom,#eee 50%,#fff 100%);
    background-repeat: repeat-x
}

.select2-container--classic .select2-selection--multiple {
    background-color: #fff;
    border: 1px solid #aaa;
    border-radius: 4px;
    cursor: text;
    outline: 0
}

.select2-container--classic .select2-selection--multiple:focus {
    border: 1px solid #5897fb
}

.select2-container--classic .select2-selection--multiple .select2-selection__rendered {
    list-style: none;
    margin: 0;
    padding: 0 5px
}

.select2-container--classic .select2-selection--multiple .select2-selection__clear {
    display: none
}

.select2-container--classic .select2-selection--multiple .select2-selection__choice {
    background-color: #e4e4e4;
    border: 1px solid #aaa;
    border-radius: 4px;
    cursor: default;
    float: left;
    margin-right: 5px;
    margin-top: 5px;
    padding: 0 5px
}

.select2-container--classic .select2-selection--multiple .select2-selection__choice__remove {
    color: #888;
    cursor: pointer;
    display: inline-block;
    font-weight: 700;
    margin-right: 2px
}

.select2-container--classic .select2-selection--multiple .select2-selection__choice__remove:hover {
    color: #555
}

.select2-container--classic[dir=rtl] .select2-selection--multiple .select2-selection__choice {
    float: right
}

.select2-container--classic[dir=rtl] .select2-selection--multiple .select2-selection__choice {
    margin-left: 5px;
    margin-right: auto
}

.select2-container--classic[dir=rtl] .select2-selection--multiple .select2-selection__choice__remove {
    margin-left: 2px;
    margin-right: auto
}

.select2-container--classic.select2-container--open .select2-selection--multiple {
    border: 1px solid #5897fb
}

.select2-container--classic.select2-container--open.select2-container--above .select2-selection--multiple {
    border-top: none;
    border-top-left-radius: 0;
    border-top-right-radius: 0
}

.select2-container--classic.select2-container--open.select2-container--below .select2-selection--multiple {
    border-bottom: none;
    border-bottom-left-radius: 0;
    border-bottom-right-radius: 0
}

.select2-container--classic .select2-search--dropdown .select2-search__field {
    border: 1px solid #aaa;
    outline: 0
}

.select2-container--classic .select2-search--inline .select2-search__field {
    outline: 0;
    -webkit-box-shadow: none;
    box-shadow: none
}

.select2-container--classic .select2-dropdown {
    background-color: #fff;
    border: 1px solid transparent
}

.select2-container--classic .select2-dropdown--above {
    border-bottom: none
}

.select2-container--classic .select2-dropdown--below {
    border-top: none
}

.select2-container--classic .select2-results>.select2-results__options {
    max-height: 200px;
    overflow-y: auto
}

.select2-container--classic .select2-results__option[role=group] {
    padding: 0
}

.select2-container--classic .select2-results__option[aria-disabled=true] {
    color: grey
}

.select2-container--classic .select2-results__option--highlighted[aria-selected] {
    background-color: #3875d7;
    color: #fff
}

.select2-container--classic .select2-results__group {
    cursor: default;
    display: block;
    padding: 6px
}

.select2-container--classic.select2-container--open .select2-dropdown {
    border-color: #5897fb
}


                                                  </style>
                                                    </div>
                                            </div>
                                            <div class="section d-flex justify-content-center align-items-center w-100 show-mobile">
                                                <a href="/paymentv2/Transaction/DownloadQR.html" class="link weight5 link-style-default">
                                                    <img src="https://sandbox.vnpayment.vn/paymentv2/images/icons-color/info/default/24x24-download.svg" alt="" class="ic-default">
                                                    
                                                    Tải mã
                                                </a>
                                                <a data-bs-toggle="modal" data-bs-target="#modalHuongDanMobile" class="link link-underline weight5" style="margin-left:15px;">
                                                    <img src="https://sandbox.vnpayment.vn/paymentv2/images/icons-color/info/default/24x24-question-circle.svg" alt="" class="ic-md"> 
                                                    Hướng dẫn
                                                </a>
                                            </div>
                                      <%--      <div class="list-bank-mobile w-100 show-mobile">
                                                <div class="list-mb16 list-last-mb">
                                                    <div class="p weight5">
                                                        Sử dụng
<a data-bs-toggle="modal" data-bs-target="#modalDanhSachUngDung" class="link link-underline weight5"> Ứng dụng hỗ trợ 
</a>
để quét mã hoặc
<b> nhấn vào logo 
</b>
để thanh toán trực tiếp trên ứng dụng
                                                    </div>
                                                    <div class="list-bank list-bank-grid-4">
                                                        <div class="list-mb24 list-last-mb">
                                                            <div class="list-bank-main">
                                                                <div class="row row-8 list-mb8 list-crop">
                                                                    

                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vietcombank.svg)" onclick="return open_vnpayqr('VIETCOMBANK', 'https://itunes.apple.com/vn/app/vietcombank/id561433133?mt=8', 'VCB Digibank');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/agribank.svg)" onclick="return open_vnpayqr('AGRIBANK', 'https://itunes.apple.com/vn/app/agribank-e-mobile-banking/id935944952?mt=8', 'Agribank E-Mobile Banking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/bidv.svg)" onclick="return open_vnpayqr('BIDV', 'https://itunes.apple.com/vn/app/bidv-smart-banking/id1061867449?mt=8', 'BIDV Smart Banking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vietinbank.svg)" onclick="return open_vnpayqr('VIETINBANK', 'https://itunes.apple.com/vn/app/vietinbank-ipay/id689963454?mt=8', 'VietinBank iPay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vnpayewallet.svg)" onclick="return open_vnpayqr('VNPAYEWALLET', 'https://apps.apple.com/us/app/v%C3%AD-vnpay/id1470378562', 'Ví VNPAY – Ví của Gia đình');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/viettelpay.svg)" onclick="return open_vnpayqr('VIETTELPAY', 'https://itunes.apple.com/vn/app/viettel-money/id1344204781?mt=8', 'Viettel Pay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vcbpay.svg)" onclick="return open_vnpayqr('VCBPAY', 'https://itunes.apple.com/vn/app/vcbpay/id1408592505?mt=8', 'VietcomBank Pay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/scb.svg)" onclick="return open_vnpayqr('SCB', 'https://itunes.apple.com/vn/app/scb-mobile-banking/id954973621?mt=8', 'SCB Mobile Banking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/abbank.svg)" onclick="return open_vnpayqr('ABBANK', 'https://itunes.apple.com/vn/app/abbankmobile/id1137160023?mt=8', 'AB Ditizen');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/ivb.svg)" onclick="return open_vnpayqr('IVB', 'https://itunes.apple.com/vn/app/ivb-mobile/id1096963960?mt=8', 'IVB Mobile Banking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/ncb.svg)" onclick="return open_vnpayqr('NCB', 'https://itunes.apple.com/vn/app/ncb-smart/id1111830467?mt=8', 'NCB iziMobile');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/eximbankomni.svg)" onclick="return open_vnpayqr('EXIMBANKOMNI', '#', 'Eximbank EDigi');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/ojb.svg)" onclick="return open_vnpayqr('OJB', 'https://apps.apple.com/vn/app/oceanbank/id1469028843', 'Easy OceanBank Mobile');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/namabank.svg)" onclick="return open_vnpayqr('NAMABANK', 'https://itunes.apple.com/vn/app/nam-a-mobile-banking/id1227187853?mt=8', 'NamABank Mobile Banking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/baovietbank.svg)" onclick="return open_vnpayqr('BAOVIETBANK', 'https://apps.apple.com/tt/app/baoviet-smart/id1504422967?ign-mpt=uo%3D2', 'BAOVIET Smart');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/hdbank.svg)" onclick="return open_vnpayqr('HDBANK', 'https://itunes.apple.com/vn/app/hdbank-mobile-banking/id510956975?mt=8', 'HDBank');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/saigonbank.svg)" onclick="return open_vnpayqr('SAIGONBANK', '#', 'SAIGONBANK SmartBanking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/kienlongbank.svg)" onclick="return open_vnpayqr('KIENLONGBANK', 'https://apps.apple.com/vn/app/kienlongbank-mobile-banking/id1492432328', 'KienlongBank Plus');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/bidc.svg)" onclick="return open_vnpayqr('BIDC', 'https://apps.apple.com/vn/app/bidc-mobile-banking-viet-nam/id1043501726?l=vi', 'BIDC Mobile Banking Vietnam');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vietabank.svg)" onclick="return open_vnpayqr('VIETABANK', 'https://apps.apple.com/us/app/vietabank/id910897337?l=vi&amp;ls=1', 'VietABank EzMobile');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/msbank.svg)" onclick="return open_vnpayqr('MSBANK', 'https://itunes.apple.com/vn/app/msb-mbank/id436134873?mt=8', 'MSB mBanking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/shb.svg)" onclick="return open_vnpayqr('SHB', 'https://itunes.apple.com/vn/app/shb-mobile/id538278798?mt=8', 'SHB Mobile');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vib.svg)" onclick="return open_vnpayqr('VIB', 'https://itunes.apple.com/vn/app/myvib/id949371011?mt=8', 'MyVIB 2.0');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/tpbank.svg)" onclick="return open_vnpayqr('TPBANK', 'https://itunes.apple.com/vn/app/tpbank-quickpay/id1292194225?mt=8', 'TPBANK Mobile');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/acb.svg)" onclick="return open_vnpayqr('ACB', 'https://apps.apple.com/app/acb/id950141024', 'ACB ONE');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/pgbank.svg)" onclick="return open_vnpayqr('PGBANK', 'https://apps.apple.com/th/app/pg-bank-flexi-app/id1537765475', 'PGB Bank App');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/coopbank.svg)" onclick="return open_vnpayqr('COOPBANK', '#', 'CoopBank');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vbsp.svg)" onclick="return open_vnpayqr('VBSP', '#', 'VBSP SmartBanking');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vnptpay.svg)" onclick="return open_vnpayqr('VNPTPAY', 'https://itunes.apple.com/vn/app/vnpt-pay/id1294940479?mt=8', 'VNPT Money');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vinid.svg)" onclick="return open_vnpayqr('VINID', 'https://apps.apple.com/vn/app/vinid/id1215495998', 'VinID – Tiêu dùng thông minh');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/galaxypay.svg)" onclick="return open_vnpayqr('GALAXYPAY', '#', 'Galaxy Pay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/viting.svg)" onclick="return open_vnpayqr('VITING', 'https://apps.apple.com/us/app/v%C3%AD-ting-qu%E1%BA%A3n-l%C3%BD-ti%E1%BB%81n-hi%E1%BB%87u-qu%E1%BA%A', 'Ví Ting: Quản lý tiền hiệu quả');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/appotapay.svg)" onclick="return open_vnpayqr('APPOTAPAY', 'https://apps.apple.com/vn/app/v%C3%AD-appota-gi%E1%BA%A3i-tr%C3%AD-t%C3%ADch-%C4%91i%E1%BB%83m/id1198481412', 'Ví Appota – Giải trí tích điểm');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/9pay.svg)" onclick="return open_vnpayqr('9PAY', 'https://ninepay.page.link', 'Ví điện tử 9Pay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vtcpay.svg)" onclick="return open_vnpayqr('VTCPAY', 'https://apps.apple.com/vn/app/vtc365/id404108605?l=vi', 'Ví VTC Pay');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/mobifonepay.svg)" onclick="return open_vnpayqr('MOBIFONEPAY', 'https://itunes.apple.com/vn/app/msb-mbank/id436134873?mt=8', 'MobiFone Money');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/cbbank.svg)" onclick="return open_vnpayqr('CBBANK', 'https://apps.apple.com/vn/app/cbway/id1531443181', 'CBBank');"></div>
                    </div>
                </div>
                <div class="col-item col-sm-3 col-4">
                    <div class="list-bank-item">
                        <div class="list-bank-item-inner" style="background-image: url(/paymentv2/images/img/logos/bank/big/vietcredit.svg)" onclick="return open_vnpayqr('VIETCREDIT', 'https://apps.apple.com/vn/app/id6446801016', 'TIN Card');"></div>
                    </div>
                </div>
    <script src="/paymentv2/Scripts/ua-parser.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function open_vnpayqr(bank_code, appLink, appName) {
                //Display Errror
                $("#messageNotify").html("Quý khách vui lòng tải/ chụp ảnh mã QR và quét mã QR để thanh toán tại ứng dụng Mobile Banking/ Ví điện tử");
                $('#modalNotifySupportQR').modal("show");
                return false;
            }
        </script>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>--%>
                                            <div class="qr-cancel-btn-wrap">
                                                <!-- button.button -->
                                               <asp:Button ID="CancelPaymentButton" style="background-color:#ccc; color:black;" runat="server" CssClass="ubg-secondary ubox-size-button-default ubg-hover ubg-active ubtn" Text="Hủy thanh toán" OnClick="CancelPaymentButton_Click" />

                                                <!-- end button.button -->
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    </div>
</asp:Content>
