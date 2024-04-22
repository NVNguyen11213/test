<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${title }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="wrapper">
		<!-- header -->
		<jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>

		<!-- content -->
		<main class="main">

			<!-- Danh mục sản phẩm -->
			<div class="main__products">
				<div class="container" id="cartView">
					<div class="main__products-title">
						<p>GIỎ HÀNG CỦA BẠN</p>
					</div>
					<c:choose>
						<c:when test="${totalCartproducts > 0}">
							<form method="get">
								<div class="page-breadcrumb">

									<div class="row">

										<div class="col-12">
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span id="placeOrderSuccess"> Your cart: ${message }
												</span>
											</h3>
										</div>

									</div>

									<div class="row">
										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<div class="row">

														<div class="col-12">
															<table id="zero_config"
																class="table table-striped table-bordered no-wrap">
																<thead>
																	<tr>
																		<th scope="col" class="text-center">No.</th>
																		<th scope="col" class="text-center">Image</th>
																		<th scope="col" class="text-center">Product</th>
																		<th scope="col" class="text-center">Quantity</th>
																		<th scope="col" class="text-center">Price</th>
																		<th scope="col" class="text-center">Total</th>
																		<th scope="col" class="text-center">Actions</th>
																	</tr>
																</thead>
																<tbody>
																	<c:forEach var="item" items="${cart.productCarts }"
																		varStatus="loop">
																		<tr>
																			<th scope="row">${loop.index + 1 }</th>
																			<td><img width="60px" height="60px"
																				src="${classpath}/FileUploads/${item.avatar }"
																				class="light-logo"></td>
																			<td>${item.productName }</td>
																			<td align="center">
																				<button
																					onclick="updateProductQuantity(${item.productId }, -1)"
																					value="-">-</button> 
																					<strong><span
																					id="productQuantity_${item.productId }">${item.quantity }</span></strong>
																				<button
																					onclick="updateProductQuantity(${item.productId }, 1)"
																					value="+">+</button>
																			</td>
																			<td align="right"><fmt:formatNumber
																					value="${item.price }" minFractionDigits="0" /></td>
																			<td align="right"><fmt:formatNumber
																					value="${item.price * item.quantity }"
																					minFractionDigits="0" /></td>
																			<td align="center"><a
																				href="${classpath }/product-detail/${item.productId }"
																				role="button" class="btn btn-secondary">Edit</a> <a
																				href="${classpath }/product-cart-delete/${item.productId }"
																				role="button" class="btn btn-secondary">Delete</a>
																		</tr>
																	</c:forEach>
																</tbody>

															</table>
														</div>

													</div>

													<div class="row">
														<div class="col-4">
															<h3
																class="page-title text-truncate text-dark font-weight-medium mb-1">
																Cart Total:
																<fmt:formatNumber value="${totalCartPrice }"
																	minFractionDigits="0"></fmt:formatNumber>
																<sup>đ</sup>
															</h3>
														</div>

													</div>

												</div>
											</div>
										</div>
									</div>
								</div>
							</form>
							<!-- Thong tin khach hang -->
							<div class="page-breadcrumb">
								<div class="row"></div>
								<div class="row">
									<div class="main__products-title">
										<p>Thông tin khách hàng</p>
									</div>
								</div>
								<form action="${classpath }/cart-view" method="get">
									<div class="row">

										<div class="col-12">
											<div class="card">
												<div class="card-body">
													<div class="form-body">
														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="name">Customer name (*)</label> <input
																		type="text" class="form-control" id="txtName"
																		name="txtName" placeholder="your name"
																		value="${loginedUser.name }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="mobile">Customer mobile (*)</label> <input
																		type="text" class="form-control" id="txtMobile"
																		name="txtMobile" placeholder="your phone number"
																		value="${loginedUser.mobile }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="phone">Customer email</label> <input
																		type="email" class="form-control" id="txtEmail"
																		name="txtEmail" placeholder="your email"
																		value="${loginedUser.email }" />
																</div>
															</div>
														</div>

														<div class="row">

															<div class="col-md-12">
																<div class="form-group mb-4">
																	<label for="phone">Customer address</label> <input
																		type="text" class="form-control" id="txtAddress"
																		name="txtAddress" placeholder="your address"
																		value="${loginedUser.address }" />
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-md-12">
																<div class="form-group mb-4">
																	<a href="${classpath }/index"
																		class="btn btn-primary active" role="button"
																		aria-pressed="true"> Back to shop </a>
																	<button class="btn btn-primary" onclick="_placeOrder()">
																	Place orders</button>

																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</form>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<div class="col-12">
									<c:choose>
										<c:when test="${checkout }">
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span id="placeOrderSuccess">Bạn đã đặt hàng thành
													công</span>
											</h3>
										</c:when>
										<c:otherwise>
											<h3 align="center"
												class="page-title text-truncate text-dark font-weight-medium mb-1">
												<span>Your cart: ${errorMessage }</span>
											</h3>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
							<div class="row">
								<div class="col-md-12" align="center">
									<div class="form-group mb-4">
										<a href="${classpath }/index" class="btn btn-primary active"
											role="button" aria-pressed="true"> Back to shop </a>
									</div>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>

		</main>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>

		<div class="scroll__top">
			<i class='bx bx-up-arrow-alt'></i>
		</div>

		<!-- mobile menu -->

	</div>
	<!-- js -->
	<jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		updateProductQuantity = function(_productId, _quantity) {
			let data = {
				productId : _productId, //lay theo id
				quantity : _quantity
			};

			//$ === jQuery
			jQuery.ajax({
				url : "/update-product-quantity",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json

				success : function(jsonResult) {
					let totalProducts = jsonResult.totalCartProducts; 
					//Viet lai so luong sau khi bam nut -, +
					$("#productQuantity_" + jsonResult.productId).html(jsonResult.newQuantity); 
				},

				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>

	<script type="text/javascript">
		function _placeOrder() {
			//javascript object
			let data = {				
				txtName : jQuery("#txtName").val(),
				txtEmail : jQuery("#txtEmail").val(), //Get by Id
				txtMobile : jQuery("#txtMobile").val(),
				txtAddress : jQuery("#txtAddress").val(),
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/place-order",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#placeOrderSuccess").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>

</body>

</html>