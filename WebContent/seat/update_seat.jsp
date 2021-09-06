<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.seat.vo.*"%>

<%
	response.setHeader("Cache-Control","no-store"); //HTTP 1.1
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", 0);

	Object obj = session.getAttribute("empVO");
	if(obj==null){
		request.getSession().setAttribute("location", "/Hotel_Team5_TFA102/seat/listAllSeat.jsp");
		response.sendRedirect(request.getContextPath()+"/employee/login.jsp");
		return;
	}

	Seat seatVO = (Seat) request.getAttribute("seatVO");
%>

<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>後台系統 - 訂房頁面 - DreamHoliday Admin</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<style>

table#table-1 {
	background-image: linear-gradient(#0AA6B7, #2B3078);
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: white;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}

table {
	width: 100%;
	color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
    border: 0px solid #CCCCFF;
}
th, td {
    padding: 5px;
    color: black;
    text-align: center;
}

nav button#sidebarToggle {
	position: absolute;
	right: 10px;
}

.wrapper {
	min-height: 100%;
	margin-bottom: -68.8px;
}

.content {
	width: 100%;
	position: relative;
	padding-bottom: 68.8px;
}

footer {
	height: 68.8px;
}

div.text-muted {
	margin: 0 auto;
	display: block;
	color: white !important;
}

#del_btn {
	position: relative;
	/* right: 10%; */
}

.bk {
	height: 10px;
}

.ccle {
	margin: 0px auto;
	text-align: left;
	/*display: inline對齊效果*/
}

.ccle div {
	display: inline-block;
	vertical-align: left;
	border-radius: 3px;
	margin: 2px;
}

.dm {
	font-size: 20px;
}

div button a.backlogin {
	text-decoration: none;
	color: white;
}

</style>
</head>

<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="#"><i class="fas fa-user fa-fw"></i>管理人員介面</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group"></div>
		</form>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"></div>
                            員工管理
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                            	<a class="nav-link" href="<%=request.getContextPath()%>/employee/employee_data.jsp">個人資料</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/employee/employee_changedata.jsp">個人資料修改</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/employee/employee_management.jsp">員工管理</a>
                            </nav>
                        </div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon"></div> 客房管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="room_submit.jsp">客房上架</a> <a
									class="nav-link" href="resbooking_management.jsp">客房管理</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages">
							<div class="sb-nav-link-icon"></div> 場地管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link" href="place_submit.jsp">場地上架</a> <a
									class="nav-link" href="placebooking_management.jsp">場地管理</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseRestaurant" aria-expanded="false"
							aria-controls="collapseRestaurant">
							<div class="sb-nav-link-icon"></div> 餐廳管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseRestaurant"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=request.getContextPath()%>/dish/listAllDish.jsp">菜餚管理</a> 
								<a class="nav-link" href="<%=request.getContextPath()%>/seat/listAllSeat.jsp">座位管理</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/seat/seatmap.jsp">餐廳平面圖</a>
									
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseView" aria-expanded="false"
							aria-controls="collapseRestaurant">
							<div class="sb-nav-link-icon"></div> 相關設定
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseView"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<%=request.getContextPath()%>/nearby/nearbymanage.jsp">周邊景點</a>
								<a class="nav-link" href="<%=request.getContextPath()%>/oneday/onedaymanage.html">一日景點</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLogout" aria-expanded="false"
							aria-controls="collapseLogout">
							<div class="sb-nav-link-icon"></div> 登出
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLogout"
							aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link" href="login.jsp" data-bs-toggle="modal"
									data-bs-target="#logout">登出</a>
							</nav>
						</div>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					DreamHoliday Team5
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">歡迎使用夢想假期飯店後台管理系統</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item active">DreamHoliday Admin</li>
                    </ol>                   
                </div>
            </main>
			<!-- Modal -->
			<div class="modal fade" id="logout" tabindex="-1"
				aria-labelledby="logoutLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="logoutLabel">系統訊息</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">確定登出嗎?</div>
						<div class="back modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">返回</button>
							<form method="post" action="<%=request.getContextPath()%>/employee/EmployeeLogout">
							<input type="submit" class="btn btn-primary" value="登出">
							</button>
								</form>
						</div>
					</div>
				</div>
			</div>
			
			<div class="container">
                <div class="row">
                	<table id="table-1">
						<tr>
							<td>
								 <h4>座位資料修改 - update_seat.jsp</h4>
								 <h4><a href="listAllSeat.jsp">回首頁</a></h4>
							</td>
						</tr>
					</table>
                
                	<h3>資料修改:</h3>

					<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<font style="color:red">請修正以下錯誤:</font>
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color:red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					
					<FORM METHOD="post" ACTION="SeatServlet" name="form1">
						<table class="table table-striped">
							<tr>
								<td>座位代號:<font color=red><b>*</b></font></td>
								<td><%=seatVO.getSeatCode()%></td>
							</tr>
							
							<jsp:useBean id="mapSvc" scope="page" class="web.model.MappingService" />
							<tr>
								<td>座位人數:</td>
								<td>
									<select size="1" name="seatType" style="width: 400px;">
										<c:forEach var="seatTypeVO" items="${mapSvc.getSeatTypeAll()}">
											<option value="${seatTypeVO.seatType}" ${(seatVO.seatType==seatTypeVO.seatType)?'selected':'' } >${seatTypeVO.seatTypeName}
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>座位狀態:</td>
								<td>
									<select size="1" name="seatStatus" style="width: 400px;">
										<c:forEach var="seatStatusVO" items="${mapSvc.getSeatStatusAll()}">
											<option value="${seatStatusVO.seatStatus}" ${(seatVO.seatStatus==seatStatusVO.seatStatus)?'selected':'' } >${seatStatusVO.seatStatusName}
										</c:forEach>
									</select>
								</td>
							</tr>
						</table>
						<br>
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="seatCode" value="<%=seatVO.getSeatCode()%>">
						<input type="submit" value="送出修改">
					</FORM>

				</div>
			</div>
			<footer class="py-4 bg-dark mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; DreamHoliday Team5
							Website 2021</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/seat/js/scripts.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>

			
	</script>
</body>
</html>