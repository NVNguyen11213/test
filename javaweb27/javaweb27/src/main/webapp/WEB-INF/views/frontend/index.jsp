<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>
<link rel="icon" type="image/x-icon"
	href="${classpath }/frontend/img/shop-icon.png">
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">

		<!-- Header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<main class="main">
			<!-- San pham noi bat -->
			<jsp:include page="/WEB-INF/views/frontend/layout/hot-products.jsp"></jsp:include>

			<!-- Sale -->
			<div class="main__products-sale">
				<div class="container">
					<div class="row">
						<div class="col-12 col-lg-6">
							<a href="${classpath }/frontend/danhmuc.html" class="banner-sale">
								<img src="${classpath }/frontend/img/oder-1.jpg" alt="">
							</a>
						</div>
						<div class="col-12 col-lg-6 block none">
							<a href="${classpath }/frontend/danhmuc.html" class="banner-sale">
								<img src="${classpath }/frontend/img/oder-2.jpg" alt="">
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Danh mục sản phẩm -->
			<form method="get">
				<div class="main__products">

					<div class="container">
						<div class="main__products-title">
							<p>Danh sách sản phẩm</p>
						</div>
						<div class="main__products-content">

							<div class="row">
								<div class="col-md-3">
									<input type="text" class="form-control" id="keyword"
										name="keyword" placeholder="Search keyword" />
								</div>

								<div class="col-md-1">
									<button type="submit" class="btn btn-primary" id="btnSearch"
										name="btnSearch">Search</button>
								</div>

								<div class="col-md-1">
									<input id="page" name="page" class="form-control"
										value="${productSearch.currentPage }">
								</div>

							</div>

							<div class="row">
								<c:forEach items="${products }" var="product">
									<div class="col-12 col-lg-3 col-md-6">
										<div class="product">
											<div class="thumb">
												<a href="${classpath }/product-detail/${product.id}" class="image"> <img
													src="${classpath }/FileUploads/${product.avatar }"
													class="fit-img zoom-img">
												</a> <span class="badges"> <!-- <span class="sale">-20%</span> -->
													<span class="new">new</span>

												</span>
											</div>
											<div class="content">
												<a href="${classpath }/product-detail/${product.id}" class="content-link">
													<h5 class="title">${product.name }</h5>
												</a> 
												<span class="price"> <!-- <span class="old">20.000.000đ</span> -->
													<span class="new"> <fmt:formatNumber
															value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
														<sup>vnđ</sup>
												</span>
												</span> <span class="symbol"> <a><i
														class='bx bx-heart'></i></a> 
														<a onclick="addToCart(${product.id}, 1, '${product.name }')"><i
														class='bx bx-cart'></i></a>
												</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>

						<div class="row">
							<div class="col-12 col-lg-6">

								<h5 class="title">
									Total products:
									<fmt:formatNumber value="${totalProducts }"
										minFractionDigits="0"></fmt:formatNumber>
									(items)
								</h5>

							</div>

						</div>

					</div>
				</div>
			</form>

			<!-- Danh sách phụ kiện -->
			<jsp:include page="/WEB-INF/views/frontend/layout/main-accessory.jsp"></jsp:include>

			<!-- Tin tức -->
			<jsp:include page="/WEB-INF/views/frontend/layout/blog.jsp"></jsp:include>

			<!-- main bottom -->
			<jsp:include page="/WEB-INF/views/frontend/layout/main-bottom.jsp"></jsp:include>
		</main>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<!-- mobile menu -->
		<jsp:include page="/WEB-INF/views/frontend/layout/mobile-menu.jsp"></jsp:include>
	</div>

	<!-- js.jsp file -->
	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<!-- Add to cart -->
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName) {		
			//alert("Thêm "  + _quantity + " sản phẩm '" + _productName + "' vào giỏ hàng ");
			let data = {
				productId: _productId, //lay theo id
				quantity: _quantity,
				productName:_productName,
			};
				
			//$ === jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message); 
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert(jsonResult.code + ': Đã có lỗi xay ra...!')
				},
			});
		}
	</script>
</body>

</html>