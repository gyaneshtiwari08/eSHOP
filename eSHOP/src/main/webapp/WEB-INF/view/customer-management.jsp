<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String locale = request.getParameter("locale");
	if (locale == null) {
		session.setAttribute("locale", "en");
	} else {
		session.setAttribute("locale", locale);
	}
	String ctx = request.getContextPath();
%>
<c:if test="<%=locale != null%>">
	<fmt:setLocale value="<%=locale%>" scope="session" />
</c:if>
<script type="text/javascript">
	var projectDir='<%=ctx%>'+'/';
	var context = '<%=ctx%>';
</script>
<!DOCTYPE HTML>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="resources/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="resources/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="resources/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="resources/assets/ico/favicon.png">
    <title>TSHOP - Bootstrap E-Commerce Parallax Theme</title>
    <!-- Bootstrap core CSS -->
    <link href="resources/assets/bootstrap/css/bootstrap.css" rel="stylesheet">


    <!-- styles needed by swiper slider -->
    <link href="resources/assets/plugins/swiper-master/css/swiper.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="resources/assets/css/style.css" rel="stylesheet">
    <link href="resources/assets/css/home-v7.css" rel="stylesheet">
    <link href="resources/assets/css/cart-nav.css" rel="stylesheet">
    
    
    <!-- styles needed by footable  -->
<link href="resources/assets/css/footable-0.1.css" rel="stylesheet"
	type="text/css" />
<link href="resources/assets/css/footable.sortable-0.1.css"
	rel="stylesheet" type="text/css" />
    


    <!-- Just for debugging purposes. -->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    <!-- include pace script for automatic web page progress bar  -->
<!-- vex -->
	<script src="resources/assets/vex/vex.combined.min.js"></script>
	<script>vex.defaultOptions.className = 'vex-theme-default'</script>
	<link rel="stylesheet" href="resources/assets/vex/vex.css" />
	<link rel="stylesheet" href="resources/assets/vex/vex-theme-default.css" />
<!-- /vex -->


    <script>
        paceOptions = {
            elements: true
        };
    </script>
    <script src="resources/assets/js/pace.min.js"></script>
</head>

<body>

<!-- search-overly -->
<jsp:include page="admin-contents/search-overly.jsp"/>
<!-- /search-overly -->

<!-- menu-sidebar -->
<jsp:include page="admin-contents/menu-sidebar.jsp"/>
<!-- /menu-sidebar -->

<!-- /.cart-sidebar -->
<jsp:include page="admin-contents/cart-sidebar.jsp"/>
<!-- /.cart-sidebar -->

<!-- Fixed navbar start -->
<jsp:include page="admin-contents/fixed-navbar-admin.jsp"/>
<!-- /.Fixed navbar  -->


	<!-- CUSTOMER LIST -->
	<div class="container">
	<div class="row">
			<div class="col-lg-9 col-md-9 col-sm-7">
				<h1 class="section-title-inner">
					<span><i class="fa fa-list-alt"></i> Customer List </span>
				</h1>

				<div class="row userInfo">
					<div class="col-lg-12">
						<h2 class="block-title-2">Customer List</h2>
					</div>

					<div style="clear: both"></div>

					<div class="col-xs-12 col-sm-12">
						<table class="footable">
							<thead>
								<tr>
									<th data-class="expand" data-sort-initial="true">
										<span title="table sorted by this column on load">Customer ID</span>
		                            </th>
		                            <th data-hide="phone,tablet" data-sort-ignore="true">Address</th>
		                            <th data-hide="phone,tablet" data-sort-ignore="true">City</th>
		                            <th data-hide="phone,tablet" data-sort-ignore="true">State</th>
		                            <th data-hide="phone,tablet" data-sort-ignore="true">Country</th>
		                            <th data-hide="phone,tablet" data-sort-ignore="true"></th>
<!-- 		                            <th data-hide="phone,tablet"><strong></strong></th> -->
		                            <th data-hide="default"> First Name</th>
		                            <th data-hide="default"> Last Name</th>
		                            <th data-hide="default" data-type="numeric"> Email</th>
		                            <th data-hide="phone" data-type="numeric"> Status</th>
<!-- 		                            <th data-hide="phone" data-type="numeric"> Status</th> -->
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${wrapCustomerManagement.customerList}" var="customer">
									<tr>
										<td>${customer.userName}</td>
											<td>${customer.addressLine1}, ${customer.addressLine1}</td>
											<td>${customer.city}-${customer.postalcode}</td>
											<td>${customer.state}</td>
											<td>${customer.country}</td>
											<td>
											 	<button id="orderDetails" custName="${customer.userName}" class="btn btn-default btn-sm">
											 		<i class="fa fa-truck" aria-hidden="true"></i>
											 	Order Details</button>
												<c:choose>
													<c:when test="${customer.active==true}">
														<button id="deactivateCustomer" custName="${customer.userName}" class="btn btn-warning btn-sm">
															<i class="fa fa-lock" aria-hidden="true"> </i>
														De-Activate</button>
													</c:when>
													<c:otherwise>
														<button id="activateCustomer" custName="${customer.userName}" class="btn btn-success btn-sm">
															<i class="fa fa-unlock" aria-hidden="true"> </i>  
															Activate</button>
													</c:otherwise>
												</c:choose>
												
												<button id="removeCustomer" custName="${customer.userName}" class="btn btn-danger btn-sm">
													<!-- <span style="color: #fff;" 
											 			class="glyphicon glyphicon-trash"></span> -->
											 		<i class="fa fa-user-times" aria-hidden="true"></i>
											 			 Remove</button>
											</td>
										<td>${customer.firstName}</td>
										<td>${customer.lastName}</td>
										<td  data-value="2">${customer.email}</td>
										<td  data-value="3">
											<c:choose>
												<c:when test="${customer.active==true}">
													<span class="label label-success pull-left">Active</span>		
												</c:when>
												<c:otherwise>
													<span class="label label-danger">In Active</span>
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<div style="clear: both"></div>

					<div class="col-lg-12 clearfix">
						<ul class="pager">
							<!-- <li class="previous pull-right"><a href="index"> <i
									class="fa fa-home"></i> Go to Shop
							</a></li>
							<li class="next pull-left"><a href="account"> &larr;
									Back to My Account</a></li> -->
						</ul>
					</div>
				</div>
				<!--/row end-->

			</div>
			<div class="col-lg-3 col-md-3 col-sm-5"></div>
		</div>
	</div>




<!-- Footer  -->
<jsp:include page="admin-contents/admin-footer.jsp"/>
<!-- / Footer  -->


<!-- Le javascript
================================================== -->

<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript" src="resources/assets/js/jquery/jquery-1.10.1.min.js"></script>
<script src="resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/assets/plugins/swiper-master/js/swiper.jquery.min.js"></script>
<!-- include footable plugin -->
	<script src="resources/assets/js/footable.js" type="text/javascript"></script>
	<script src="resources/assets/js/footable.sortable.js"
		type="text/javascript"></script>
	<script type="text/javascript">
    $(function () {
        $('.footable').footable();
    });
</script>
<script>

    var swiper = new Swiper('.swiper-container', {
        pagination: '.swiper-pagination',
        paginationClickable: '.swiper-pagination',
        nextButton: '.arrow-right',
        prevButton: '.arrow-left',
        // effect: 'cube',
        keyboardControl: true,
        parallax: true,
        speed: 600,
        spaceBetween: 0
    });


</script>

<!-- include jqueryCycle plugin -->
<script src="resources/assets/js/jquery.cycle2.min.js"></script>

<!-- include easing plugin -->
<script src="resources/assets/js/jquery.easing.1.3.js"></script>

<!-- include  parallax plugin -->
<script type="text/javascript" src="resources/assets/js/jquery.parallax-1.1.js"></script>

<!-- optionally include helper plugins -->
<script type="text/javascript" src="resources/assets/js/helper-plugins/jquery.mousewheel.min.js"></script>

<!-- include mCustomScrollbar plugin //Custom Scrollbar  -->

<script type="text/javascript" src="resources/assets/js/jquery.mCustomScrollbar.js"></script>

<!-- include icheck plugin // customized checkboxes and radio buttons   -->
<script type="text/javascript" src="resources/assets/plugins/icheck-1.x/icheck.min.js"></script>

<!-- include grid.js // for equal Div height  -->
<script src="resources/assets/js/grids.js"></script>

<!-- include carousel slider plugin  -->
<script src="resources/assets/js/owl.carousel.min.js"></script>

<!-- jQuery select2 // custom select   -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>

<!-- include touchspin.js // touch friendly input spinner component   -->
<script src="resources/assets/js/bootstrap.touchspin.js"></script>

<!-- include custom script for only homepage  -->
<script src="resources/assets/js/home.js"></script>

<!-- include custom script for site  -->
<script src="resources/assets/js/script.js"></script>

<script src="resources/assets/js/sidebar-nav.js"></script>


<!-- scrollme || onscroll parallax effect for category page  -->
<script src="resources/assets/js/jquery.scrollme.min.js"></script>
<script src="resources/assets/js/wrap-admin.js"></script>
<script type="text/javascript">


    $(function () {
        var target = $("div.has-overly-shade"),
                targetHeight = target.outerHeight();
        $(document).scroll(function () {
            var scrollPercent = (targetHeight - window.scrollY) / targetHeight;
            scrollPercent >= 0 && (target.css("background-color", "rgba(0,0,0," + (1.1 - scrollPercent) + ")"))
        })
    });


    $(function () {
        if (navigator.userAgent.match(/(iPod|iPhone|iPad|Android)/)) {
            $('#ios-notice').removeClass('hidden');
            $('.parallax-container').height($(window).height() * 0.5 | 0);
        } else {
            $(window).resize(function () {
                var parallaxHeight = Math.max($(window).height() * 0.7, 200) | 0;
                $('.parallax-container').height(parallaxHeight);
            }).trigger('resize');
        }
    });


    $(document).ready(function () {
        var isMobile = function () {
            //console.log("Navigator: " + navigator.userAgent);
            return /(iphone|ipod|ipad|android|blackberry|windows ce|palm|symbian)/i.test(navigator.userAgent);
        };

        if (isMobile()) {
            // For  mobile , ipad, tab
            $('.animateme').removeClass('animateme');
            $('.if-is-mobile').addClass('ismobile');

        } else {
        }


    }); // end


</script>


</body>
</html>
