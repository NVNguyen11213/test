<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    
 <header class="header">
            <div class="header__top">
                <div class="container">
                    <p class="header__top-title">
                        Welcome To our shop !
                    </p>
                </div>
            </div>
            <div class="header__bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-4 col-6">
                            <div class="header__bottom-logo">
                                <a href="#"><img src="${classpath}/frontend/img/logo.jpg" alt="Ảnh logo" class="logo"></a>
                            </div>
                        </div>
                        <div class="col-lg-6 block none">
                            <div class="header__bottom-menu">
                                <ul>
                                    <li class="header__bottom-menu-children"><a href="${classpath}/frontend/index.html">Trang chủ</a></li>
                                    <li class="header__bottom-menu-children">
                                        <a href="${classpath}/frontend/danhmuc.html">Thú cưng</a>
                                        <ul class="mega__subnav">
                                            <li class="mega__subnav-menu">
                                                <h4 class="mega__menu-title">Chó</h4>
                                                <ul class="mega__subnav-menu-2">
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Corgi</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Beagle</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Alaska Malamute</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Golden Retriever</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Husky Siberian</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Chó Phốc Sóc – Pomeranian</a></li>
                                                </ul>
                                            </li>
                                            <li class="mega__subnav-menu">
                                                <h4 class="mega__menu-title">Mèo</h4>
                                                <ul class="mega__subnav-menu-2">
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Anh (Dài + Ngắn)</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Chân Ngắn</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Tai Cụp</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Xiêm</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Ba Tư</a></li>
                                                    <li><a href="${classpath}/frontend/danhmuc.html">Mèo Chinchilla</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="header__bottom-menu-children"><a href="#">Phụ kiện</a></li>
                                    <li class="header__bottom-menu-children">
                                        <a href="#">Dịch vụ</a>
                                        <ul class="subnav">
                                            <li><a href="#">Spa</a></li>
                                            <li><a href="#">Chăm sóc thú cưng</a></li>
                                        </ul>
                                    </li>
                                    <li class="header__bottom-menu-children"><a href="${classpath}/frontend/lienhe.html">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-8 col-6">
                            <div class="header__bottom-actions">
                                <div class=" header__bottom-btn header__bottom-search">
                                    <a href="#"><i class='bx bx-search'></i></a>
                                    <div class="header__box">
                                        <div class="header__bottom-box-search">
                                            <input type="text" placeholder="Tìm kiếm..." class="header__search-input">
                                            <div class="header__search-btn">
                                                <i class='bx bx-search'></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class=" header__bottom-btn header__bottom-user">
                                    <a href="${classpath}/frontend/login"><i class='bx bx-user'></i></a>
                                </div>
                                <div class=" header__bottom-btn header__bottom-cart">
                                    <a href="${classpath}/cart-view"><i class='bx bx-cart'></i></a>
                                    <span class="header__bottom-num" id="totalCartProductsId">${totalCartproducts }</span>
                                    <div class="header__box-cart">
                                        <div class="header__bottom-box-cart">
                                            <div class="header__cart-products">
                                                <div class="cart-product-inner">
                                                    <div class="cart-product__main">
                                                        <div class="cart-product__thumb">
                                                            <img src="${classpath}/frontend/img/products/3.jpg" class="cart-product-img">
                                                        </div>
                                                        <div class="cart-product__content">
                                                            <a href="${classpath}/frontend/sanpham.html">
                                                                <p class="cart-product__content-title">POODLE NÂU ĐỎ
                                                                    ĐÁNG YÊU
                                                                </p>
                                                            </a>
                                                            <p class="cart-product__content-quantity">Số lượng: 1</p>
                                                        </div>
                                                    </div>
                                                    <div class="cart-product__close">
                                                        <i class='bx bx-x'></i>
                                                    </div>
                                                </div>
                                                <div class="cart-product-inner">
                                                    <div class="cart-product__main">
                                                        <div class="cart-product__thumb">
                                                            <img src="${classpath}/frontend/img/products/1.jpg" class="cart-product-img">
                                                        </div>
                                                        <div class="cart-product__content">
                                                            <a href="${classpath}/frontend/sanpham.html">
                                                                <p class="cart-product__content-title">MÈO TAI CỤP CƯNG
                                                                    CƯNG
                                                                </p>
                                                            </a>
                                                            <p class="cart-product__content-quantity">Số lượng: 1</p>
                                                        </div>
                                                    </div>
                                                    <div class="cart-product__close">
                                                        <i class='bx bx-x'></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="header__cart-product-buy">
                                                <a href="#" class="buy-product">Mua hàng</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="header__bottom-btn header__bottom-mobilemenu">
                                    <i class='bx bx-menu'></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header__slider">
                <div class="swiper mySwiper ">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/frontend/img/slider-1.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/frontend/img/slider-2.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/frontend/img/slider-3.jpg" alt="" class="header__slider-img">
                        </div>
                        <div class="swiper-slide .header__slider-imgs">
                            <img src="${classpath}/frontend/img/slider-4.jpg" alt="" class="header__slider-img">
                        </div>
                    </div>
                    <div class="swiper-button-next next"></div>
                    <div class="swiper-button-prev prev"></div>
                </div>
            </div>
        </header>