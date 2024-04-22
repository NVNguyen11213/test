<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf8"%>
<div class="mobile__menu-wrapper">
			<div class="mobile__menu-body">
				<div class="mobile__btn-close">
					<i class='bx bx-x'></i>
				</div>
				<div class="mobile__content">
					<div class="mobile__search-box">
						<form>
							<input type="text" placeholder="Tìm kiếm..."
								class="mobile__search-input">
							<button class="mobile__search-btn">
								<i class='bx bx-search'></i>
							</button>
						</form>
					</div>
					<div class="mobile__navigation">
						<ul class="mobile__nav">
							<li class="mobile__children"><a
								href="${classpath }/frontend/index.html" class="mobile__link">Trang
							chủ </a></li> 
					<li class="mobile__children"><a href="#"
						class="mobile__link">Thú cưng <i class='bx bx-chevron-down'></i>
					</a>
						<ul class="mobile__submenu">
							<li class="mobile__submenu-item"><a
								href="${classpath }/frontend/danhmuc.html"
								class="mobile__submenu-link">Chó Corgi</a></li>
							<li class="mobile__submenu-item"><a
								href="${classpath }/frontend/danhmuc.html"
								class="mobile__submenu-link">Chó Beagle</a></li>
							<li class="mobile__submenu-item"><a
								href="${classpath }/frontend/danhmuc.html"
								class="mobile__submenu-link">Chó Alaska Malamute</a></li>
							<li class="mobile__submenu-item"><a
								href="${classpath }/frontend/danhmuc.html"
								class="mobile__submenu-link">Chó Golden Retriever</a></li>
							<li class="mobile__submenu-item"><a
								href="${classpath }/frontend/danhmuc.html"
								class="mobile__submenu-link"> Chó Husky Siberian</a></li>
						</ul></li>
					<li class="mobile__children"><a href="#"
						class="mobile__link">Phụ kiện</a></li>
					<li class="mobile__children"><a href="#"
						class="mobile__link">Dịch vụ <i class='bx bx-chevron-down'></i></a>
						<ul class="mobile__submenu">
							<li class="mobile__submenu-item"><a href="#"
								class="mobile__submenu-link">Spa</a></li>
							<li class="mobile__submenu-item"><a href="#"
								class="mobile__submenu-link">Chăm sóc thú cưng</a></li>
						</ul></li>
					<li class="mobile__children"><a
						href="${classpath }/frontend/lienhe.html" class="mobile__link">Liên
							hệ </a></li>
				</ul>
			</div>
		</div>
	</div>
</div>