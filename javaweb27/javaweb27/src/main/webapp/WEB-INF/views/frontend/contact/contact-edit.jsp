<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title }</title>
    
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>

</head>

<body>
    <div class="wrapper">
        
        <!-- Header -->
        <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
        
        <main class="main">
            <div class="main__breadcrumb">
                <div class="container">
                    <div class="bread-crumb">
                        <span><a href="${classpath }/index">Trang chủ</a></span>
                        <span><a href="#">Liên hệ</a></span>
                    </div>
                </div>
            </div>
            <div class="main__contact">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="contact__title">
                                <h2 class="title">Liên lạc</h2>
                            </div>
                            
                            <div class="contact__title">
                                <h2 class="title" id="notification"></h2>
                            </div>
                            
                            <div class="contact__form">
                                <form class="form" action="/contact-edit-save" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="text" class="form-input" placeholder="Your name..."
                                                	id="name" name="txtName" value="${contact.name }">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="email" class="form-input" placeholder="Email..."
                                                		id="email" name="txtEmail" value="${contact.email }">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="text" class="form-input" placeholder="Your mobile..."
                                                	id="mobile" name="txtMobile" value="${contact.mobile }">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="contact__form-input">
                                                <input type="text" class="form-input" placeholder="Your address..."
                                                	id="address" name="txtAddress" value="${contact.address }">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="contact__form-input">
                                                <textarea cols="30" rows="5" class="form__textarea" id="txtMessage" name="txtMessage"
                                                    placeholder="Message">${contact.message }</textarea>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="contact__btn">
                                                <!-- <a href="#">Send</a> -->
                                                <button type="button" class="btn btn-primary" onclick="_notification()">Save edit</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="contact__title">
                                <h2 class="title">Liên hệ với chúng tôi</h2>
                            </div>
                            <p class="contact__description">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                                Voluptate facere aliquid quibusdam provident laudantium veniam iste magni doloribus
                                ipsam porro similique, quisquam temporibus, quod ipsa obcaecati tempora. Doloribus,
                                corporis impedit! Lorem, ipsum dolor sit amet consectetur adipisicing elit. Id ducimus
                                sed voluptates sequi adipisci aspernatur, veniam libero dolor harum eaque consectetur
                                officia iusto aut officiis quas est animi nam autem.</p>
                            <ul class="contact__address">
                                <li><i class='bx bx-phone'></i> 012345678</li>
                                <li><i class='bx bx-envelope'></i> mail@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main__map">
                <div class="row">
                    <div class="col-12">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1612.1966650274296!2d105.78817454726801!3d20.980166368165296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135acce762c2bb9%3A0xbb64e14683ccd786!2zSOG7jWMgVmnhu4duIENOIELGsHUgQ2jDrW5oIFZp4buFbiBUaMO0bmcgLSBIw6AgxJDDtG5n!5e0!3m2!1svi!2s!4v1647935982673!5m2!1svi!2s"
                            width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- footer -->
        <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
        
        <div class="scroll__top">
            <i class='bx bx-up-arrow-alt'></i>
        </div>
        
    </div>
    <!-- Slider -->
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>

	<script type="text/javascript">
		function _notification() {
			//javascript object
			let data = {
				
				name : jQuery("#name").val(),
				email : jQuery("#email").val(), //Get by Id
				mobile : jQuery("#mobile").val(),
				address : jQuery("#address").val(),
				message : jQuery("#message").val(),
				
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/contact-edit-save",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					alert(jsonResult.code + ": " + jsonResult.message);
					//$("#notification").html(jsonResult.message);
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					alert("An error occur");
				}
			});
		}
	</script>
</body>

</html>