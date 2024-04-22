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
<title>${projectTitle }</title>

<!-- variables -->
<jsp:include page="/WEB-INF/views/common/variables.jsp"></jsp:include>

<!-- css -->
<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
	<div class="container">
		<!-- content -->
		<main class="main">
			<!-- Section: Design Block -->
			<section class="vh-100" style="background-color: #eee;">
				<div class="container h-100">
					<div
						class="row d-flex justify-content-center align-items-center h-100">
						<div class="col-lg-12 col-xl-11">
							<div class="card text-black" style="border-radius: 25px;">
								<div class="card-body p-md-5">
									<div class="row justify-content-center">
										<div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

											<p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

											<form class="mx-1 mx-md-4" action="${classpath }/register" method="post">

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-user fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="username">User name</label>
														<input type="text" id="username" name="username"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="password">Password</label>
														<input type="password" id="password" name = "password"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-key fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="retypepassword">Retype password</label>
														<input type="password" id="retypepassword" name = "retypepassword"
															class="form-control" /> 
													</div>
												</div>
												
												
												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label" for="email">Email</label>
														<input type="email" id="email" name = "email"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex flex-row align-items-center mb-4">
													<i class="fas fa-user fa-lg me-3 fa-fw"></i>
													<div class="form-outline flex-fill mb-0">
														<label class="form-label"for="mobile">Mobile</label>
														<input type="text" id="mobile" name = "mobile"
															class="form-control" /> 
													</div>
												</div>

												<div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
													<button type="submit" class="btn btn-primary btn-lg">Register</button>
												</div>

											</form>

										</div>
										<div
											class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

											<img
												src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
												class="img-fluid" alt="Sample image">

										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Section: Design Block -->
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

</body>

</html>