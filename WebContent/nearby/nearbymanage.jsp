<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.nearby.*"%> 
<%@ page import="web.nearby.service.*"%> 
<%@ page import="web.nearby.vo.*"%> 

<%
	NEARBYVO nearbyVO = (NEARBYVO) request.getAttribute("nearbyVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>


<!DOCTYPE html>
<html lang="en">
    <head>
    
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SystemPage - DreamHoliday Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<%=request.getContextPath()%>/nearby/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <style>  
            nav button#sidebarToggle{
                position: absolute;
                right: 10px;
            }          
            div.text-muted{
                margin: 0 auto;
                display: block;
                color: white !important;
            }   
            div button a.backlogin{
                text-decoration: none;
                color: white ;
            }      
            div.main{
                width: 80%;
            }  
            div.input-group{
                margin: 10px auto;
                min-height: 60px;
            } 
            textarea {
                resize : none;
            }
            div.titleText{
                height: 60px;
            }
            div.text{
                margin-top: 10px;
                height: 200px;
            }
            select {
                margin-top: 10px;
            }
            div.d-grid{
                margin-top: 10px;
            }
          
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#"><i class="fas fa-user fa-fw"></i>服務人員介面</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>            
        </nav>
              <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"></div>
                             	   員工管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/roombooking.html">個人資料</a>
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/error.html">個人資料修改</a>
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/error.html">員工管理</a>

                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"></div>
                                	客房管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/sitebooking.html">客房上架</a>
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/error.html">客房管理</a>
                                </nav>
                            </div>
                            
                               <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePagessite" aria-expanded="false" aria-controls="collapsePagessite">
                                <div class="sb-nav-link-icon"></div>
                                	場地管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePagessite" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/sitebooking.html">場地上架</a>
                                    <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/error.html">場地管理</a>
                                </nav>
                            </div>
                            
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseRestaurant" aria-expanded="false" aria-controls="collapseRestaurant">
                                <div class="sb-nav-link-icon"></div>
                              		  餐廳管理
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseRestaurant" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/dish/listAllDish.jsp">菜餚管理</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/seat/listAllSeat.jsp">座位管理</a>
   									<a class="nav-link" href="<%=request.getContextPath()%>/seat/seatmap.jsp">餐廳平面圖</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSetting" aria-expanded="false" aria-controls="collapseSetting">
                                <div class="sb-nav-link-icon"></div>
                                相關設定
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseSetting" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link" href="<%=request.getContextPath()%>/nearby/nearbymanage.jsp">周邊景點</a>
                                    <a class="nav-link" href="<%=request.getContextPath()%>/oneday/onedaymanage.html">一日景點</a>
                                    <!-- <a class="nav-link" href="https://newhandarky.github.io/DH_backsystem/faq.html">FAQ</a> -->
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLogout" aria-expanded="false" aria-controls="collapseLogout">
                                <div class="sb-nav-link-icon"></div>
                                登出
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLogout" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                  
                                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#logout">登出</a>
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
                        <h1 class="mt-4">歡迎使用夢想假期飯店後台管理系統-周邊導覽</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">DreamHoliday Admin</li>
                        </ol>
                    </div>
                </main>

                <!-- Modal -->
                <div class="modal fade" id="logout" tabindex="-1" aria-labelledby="logoutLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="logoutLabel">系統訊息</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                確定登出嗎?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">返回</button>
                                <button type="button" class="btn btn-primary">
                                    <a class="backlogin" href="https://newhandarky.github.io/DH_backsystem/login.html">登出</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
              
         <FORM METHOD="post"  enctype="multipart/form-data" ACTION="<%=request.getContextPath()+"/NearbyupdateServlet"%>" name="form1">
                <div class="main container-fluid">
                    <div class="col-12">
                        <select id="input_text" class="question form-select input_text" aria-label="Default select example" type="TEXT" name="nearbyid" >
                            <option selected>請選擇更換網頁第幾張圖</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                        </select>
                    </div> 


                    <div class="mb-3">
                        <label for="formFile" class="form-label">圖片上傳</label>
                        <!-- <input class="form-control" type="file" id="formFile"> -->
                        <input  class="form-control" type="file" name="nearby"id="myimg formFile" required="required"
                                onchange="imgChange(this)"
                                accept="image/png,image/gif,image/jpeg"/>
                            <img width="300px"  src="" alt="">
                    </div>                    
                    <div class="titleText input-group">
                        <span class="input-group-text ">景點名稱</span>
                        <textarea id="control_2" class="form-control form-control_2" type="TEXT" name="nearbyname"></textarea>
                    </div>
                    <div class="text input-group">
                        <span class="input-group-text ">景點介紹</span>
                        <textarea id="form-control_3" class="form-control form-control_3" aria-label="" type="TEXT" name="nearbyexplanation"></textarea>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <input id="btn_yes" class="btn btn-primary " type="submit" value="送出修改"></FORM>
                    </div>
                </div>
                
                
                <footer class="py-4 bg-dark mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; DreamHoliday Team5 Website 2021</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

   



        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts2.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>


