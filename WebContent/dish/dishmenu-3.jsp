<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="web.dish.service.impl.DishServiceImpl"%>
<%@page import="web.dish.service.DishService"%>
<%@ page import="java.util.*"%>
<%@ page import="web.dish.vo.*"%>

<%
	DishService dishSvc = new DishServiceImpl();
	List<Dish> list = dishSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="Chrome" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>�ڷQ�������I�\�I����-1 DreamHoliday</title>
<link href="css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

header {
	background: linear-gradient(#2B3078, #0AA6B7);
	height: 125px;
	z-index: 5;
}

div.photos {
	background-color: rgba(0, 0, 0, 0.904);
}

button#sidebarToggle {
	position: absolute;
	top: 50px;
	right: 10px;
	color: black;
}

button#sidebarToggle svg path {
	height: 80px;
}

div.row a {
	margin-top: 10px;
}

button.btn a {
	text-decoration: none;
	color: white;
}

a.nav-link {
	background-color: black;
	opacity: 90%;
	color: white;
	left: -20px;
	width: 100%;
}

div.collapse nav a {
	width: 200px;
}

div.head {
	position: absolute;
	width: 100%;
	z-index: 6;
}

div div.topmenu ul {
	margin-top: -24px;
	color: white;
	list-style: none;
}

div div.topmenu ul li {
	display: none;
}

div div.topmenu ul li a {
	color: white;
	text-decoration: none;
}

ul li {
	vertical-align: auto
}

ul:hover li {
	background-color: #0AA6B7;
}

ul li:hover {
	background-color: gray;
}

main {
	margin: 50px auto;
}

div.menu {
	margin: 30px auto;
}

div.cart {
	margin-top: 80px;
}

a#cart {
	text-decoration: none;
}

div.photo {
	margin: 50px;
}

div.photo div div.card {
	margin: 10px;
}

h6 {
	text-align: end;
}

nav.changepage {
	margin: 50px;
}

footer {
	background: linear-gradient(#0AA6B7, #2B3078);
	position: absolute;
	width: 100%;
	clear: both;
	vertical-align: bottom;
	text-align: center;
}

footer #logo2 {
	width: 100vh;
	display: inline-block;
}

footer div p {
	display: inline-block;
	font-size: 20px;
	color: white;
	margin: 10px 10px;
	text-align: center;
}

footer div {
	max-width: 1000px;
	margin: 10px auto;
	text-align: center;
	position: relative;
}

footer div#sns {
	display: inline-block;
	position: relative;
}

footer img {
	display: inline-block;
	margin: 10px 10px;
	vertical-align: bottom;
}

footer img.sns {
	width: 50px;
	height: 50px;
}

footer img.twitter {
	width: 55px;
	height: 50px;
}

footer img.fb {
	width: 50px;
	height: 50px;
}

footer img.yt {
	width: 80px;
	height: 50px;
}

div.main.row {
	margin: 30px;
	width: 100%;
}

div.main div {
	margin: 20px;
}

div.main2 div {
	margin: 20px;
}

div div img.card {
	max-width: 500px;
}

div.main2 {
	display: none;
}

@media ( min-width : 768px) {
	button#sidebarToggle, #layoutSidenav {
		display: none;
	}
}

@media ( max-width : 767.98px) {
	div.head {
		display: none;
	}
}

@media ( max-width : 1139.98px) {
	div.main {
		display: none;
	}
}

@media ( max-width : 1140px) {
	div.main2 {
		display: block;
	}
}
</style>
<script>
	$(document).ready(function() {

		$("ul#menu-1").mouseenter(function() {
			$("#menu-1 li").toggle();
		})
		$("ul#menu-1").mouseleave(function() {
			$("#menu-1 li").toggle();
		})

		$("ul#menu-2").mouseenter(function() {
			$("#menu-2 li").toggle();
		})
		$("ul#menu-2").mouseleave(function() {
			$("#menu-2 li").toggle();
		})

		$("ul#menu-3").mouseenter(function() {
			$("#menu-3 li").toggle();
		})
		$("ul#menu-3").mouseleave(function() {
			$("#menu-3 li").toggle();
		})

		$("ul#menu-4").mouseenter(function() {
			$("#menu-4 li").toggle();
		})
		$("ul#menu-4").mouseleave(function() {
			$("#menu-4 li").toggle();
		})

		$("ul#menu-5").mouseenter(function() {
			$("#menu-5 li").toggle();
		})
		$("ul#menu-5").mouseleave(function() {
			$("#menu-5 li").toggle();
		})

		$("ul#menu-6").mouseenter(function() {
			$("#menu-6 li").toggle();
		})
		$("ul#menu-6").mouseleave(function() {
			$("#menu-6 li").toggle();
		})
	})
</script>
</head>
<body>
	<header class="container-fluid">
		<div class="row justify-content-center">
			<a class="col-auto"
				href="<%=request.getContextPath()%>/hpbasic/hpbasic.jsp"> <img
				class="col-auto"
				src="<%=request.getContextPath()%>/images/logo1.png" alt="">
			</a>
		</div>
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<div id="layoutSidenav">
			<div id="layoutSidenav_nav">
				<nav class="sb-sidenav accordion sb-sidenav-menu"
					id="sidenavAccordion">
					<div class="sb-sidenav-menu">
						<div class="nav">
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLayouts" aria-expanded="false"
								aria-controls="collapseLayouts">
								<div class="sb-nav-link-icon"></div> �|���M��
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseLayouts"
								aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link"
										href="<%=request.getContextPath()%>/DH_backsystem/login.jsp">�|���n�J</a>
									<a class="nav-link"
										href="<%=request.getContextPath()%>/DH_backsystem/register.jsp">���U�b��</a>
									<!-- <a class="nav-link" href="memberpassword.html">�ѰO�K�X</a> -->
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapsePages" aria-expanded="false"
								aria-controls="collapsePages">
								<div class="sb-nav-link-icon"></div> ���a����
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapsePages"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link" href="sitebookingmain.html">��ܳ��a</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseRestaurant" aria-expanded="false"
								aria-controls="collapseRestaurant">
								<div class="sb-nav-link-icon"></div> �u�W�q��
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseRestaurant"
								aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav">
									<a class="nav-link" href="roombookingmain.html">������</a> <a
										class="nav-link" href="showroom.html">�Ы�����</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseSetting" aria-expanded="false"
								aria-controls="collapseSetting">
								<div class="sb-nav-link-icon"></div> �u�W�q�\
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseSetting"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link" href="dishMain.jsp">�u�W�w��</a> <a
										class="nav-link" href="dishmenu-1.jsp">���˦�</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseSetting" aria-expanded="false"
								aria-controls="collapseSetting">
								<div class="sb-nav-link-icon"></div> �P�����
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseSetting"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link" href="#">��q���n</a> <a class="nav-link"
										href="#">�P�䴺�I</a> <a class="nav-link" href="#">�@�鴺�I</a>
								</nav>
							</div>
							<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
								data-bs-target="#collapseLogout" aria-expanded="false"
								aria-controls="collapseLogout">
								<div class="sb-nav-link-icon"></div> �Ȥ�A��
								<div class="sb-sidenav-collapse-arrow">
									<i class="fas fa-angle-down"></i>
								</div>
							</a>
							<div class="collapse" id="collapseLogout"
								aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
								<nav class="sb-sidenav-menu-nested nav accordion"
									id="sidenavAccordionPages">
									<a class="nav-link" href="error.html">�p���ڭ�</a> <a
										class="nav-link" href="#" data-bs-toggle="modal"
										data-bs-target="#logout">FAQ</a>
								</nav>
							</div>
						</div>
					</div>
				</nav>
			</div>
		<div class="divforul col"></div>
	</header>
	<div class="head row justify-content-center">
		<div class="topmenu col-auto">
			<ul id="menu-1">
				<span class="member">�|���M��</span>
				<li><a href="memberlogin.html">�|���n�J</a></li>
				<li><a href="membercreataccount.html">���U�|��</a></li>
				<!-- <li><a href="memberpassword.html">�ѰO�K�X</a></li> -->
			</ul>
		</div>
		<div class="topmenu col-auto">
			<ul id="menu-2">
				<span class="site">���a����</span>
				<li><a href="sitebookingmain.html">��ܳ��a</a></li>
			</ul>
		</div>
		<div class="topmenu  col-auto">
			<ul id="menu-3">
				<span class="booking">�u�W�q��</span>
				<li><a href="roombookingmain.html">������</a></li>
				<li><a href="showroom.html">�Ы�����</a></li>
			</ul>
		</div>
		<div class="topmenu  col-auto">
			<ul id="menu-4">
				<span class="restaurant">�u�W�q�\</span>
				<li><a href="dishMain.jsp">�u�W�w��</a></li>
				<li><a href="dishmenu-1.jsp">���˦�</a></li>
			</ul>
		</div>
		<div class="topmenu  col-auto">
			<ul id="menu-5">
				<span class="map">�P�����</span>
				<li><a href="map.html">��q���n</a></li>
				<li><a href="fontoneday.html">�P�䴺�I</a></li>
				<li><a href="fontoneday.html">�@�鴺�I</a></li>
			</ul>
		</div>
		<div class="topmenu  col-auto">
			<ul id="menu-6">
				<span class="faq">�Ȥ�A��</span>
				<li><a href="">�p���ڭ�</a></li>
				<li><a href="faq.html">FAQ</a></li>
			</ul>
		</div>
	</div>
	<div class="photos container-fluid">
		<div class="row justify-content-center">
			<div class="col-10">
				<div id="carouselExampleFade" class="carousel slide carousel-fade"
					data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="<%=request.getContextPath()%>/images/dish017.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish020.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish002.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish003.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish004.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish012.jpg"
								class="w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="<%=request.getContextPath()%>/images/dish018.jpg"
								class="w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleFade" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="menu container">
		<div class="row ">
			<div class="row justify-content-start">
				<a class="col-6 col-md-3 col-lg-2" href="dishmenu-1.jsp#targetPoint">
					<!-- <input type="radio" class="btn-check" name="options-outlined" id="success-outlined" autocomplete="on" > -->
					<label class="btn btn-outline-success container"
					for="success-outlined">����</label>
				</a> <a class="col-6 col-md-3 col-lg-2"
					href="dishmenu-2.jsp#targetPoint"> <!-- <input type="radio" class="btn-check" name="options-outlined" id="danger-outlined" autocomplete="off"> -->
					<label class="btn btn-outline-danger container"
					for="danger-outlined">�覡</label>
				</a> <a class="col-6 col-md-3 col-lg-2" id="targetPoint" href="#"> <input
					type="radio" class="btn-check" name="options-outlined"
					id="primary-outlined" autocomplete="on" checked> <label
					class="btn btn-outline-primary container" for="primary-outlined">���I</label>
				</a> <a class="col-6 col-md-3 col-lg-2"
					href="dishmenu-4.jsp#targetPoint"> <!-- <input type="radio" class="btn-check" name="options-outlined" id="warning-outlined" autocomplete="on" checked> -->
					<label class="btn btn-outline-warning container"
					for="warning-outlined">���~</label>
				</a>
			</div>
		</div>
	</div>
	<div class="photo container">
		<div class="row justify-content-center">
				
				<c:forEach var="dishVO" items="${list}" >
					<c:if test="${dishVO.dishType == 2}">
						<div class="card col-12 col-md-4" style="width: 18rem;">
							<img src="DBPicReader?dishId=${dishVO.dishId}" class="card-img-top" alt="...">
							<div class="card-body">
							<h5>${dishVO.dishName}</h5>
								<div>
									<p>${dishVO.dishIntro}</p>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
		
		</div>
	</div>
	<!--             <nav class="changepage" aria-label="Page navigation example"> -->
	<!--                 <ul class="pagination justify-content-end"> -->
	<!--                     <li class="page-item disabled"> -->
	<!--                         <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a> -->
	<!--                     </li> -->
	<!--                     <li class="page-item"><a class="page-link" href="#">1</a></li> -->
	<!--                     <li class="page-item"><a class="page-link" href="#">2</a></li> -->
	<!--                     <li class="page-item"><a class="page-link" href="#">3</a></li> -->
	<!--                     <li class="page-item"> -->
	<!--                         <a class="page-link" href="#">Next</a> -->
	<!--                     </li> -->
	<!--                 </ul> -->
	<!--             </nav> -->
	<footer>
		<a class="col-auto" href=""> <img class="col-auto"
			src="<%=request.getContextPath()%>/images/logo1.png" alt="">
		</a>
		<div id="sns">
			<a href=""><img class="fb"
				src="<%=request.getContextPath()%>/images/Facebook_icon.svg.png"
				alt=""></a> <a href=""><img class="sns"
				src="<%=request.getContextPath()%>/images/ig.png" alt=""></a> <a
				href=""><img class="twitter"
				src="<%=request.getContextPath()%>/images/Twitter_bird_logo_2012.svg.png"
				alt=""></a> <a href=""><img class="sns"
				src="<%=request.getContextPath()%>/images/line.png" alt=""></a> <a
				href=""><img class="yt"
				src="<%=request.getContextPath()%>/images/youtube.svg.png" alt=""></a>
		</div>
		<div>
			<p>�q��:02:2712-0689</p>
			<p>�ǯu:02:2712-0689</p>
			<p>�H�c:tibame@gmail.com</p>
			<p>�a�}:�x�_�����s�ϫn�ʪF���T�q219��5��</p>
		</div>
		<div class="container-fluid px-4">
			<div class="d-flex align-items-center justify-content-between small">
				<div class="text-light">Copyright &copy; DreamHoliday Team5
					Website 2021</div>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>