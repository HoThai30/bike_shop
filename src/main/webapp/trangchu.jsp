<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang chủ - Quang Phương Motor</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body { padding-top: 70px; }
        .navbar { box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3); font-weight: bold; }
        .navbar-nav .nav-link { color: white !important; font-size: 16px; transition: color 0.3s; }
        .navbar-nav .nav-link:hover { color: #ffc107 !important; }
        .product-item img { height: 150px; object-fit: contain; transition: transform 0.3s; }
        .product-item img:hover { transform: scale(1.1); }
        .category-title { background: white; color: #007bff; padding: 10px; font-weight: bold; font-size: 1.2rem; }
        .footer-section { background-color: #333; color: #fff; padding: 30px 0; }
        .footer-section h4 { font-size: 18px; font-weight: bold; color: #f8d7da; }
        .footer-section a { color: #f8d7da; text-decoration: none; transition: color 0.3s; }
        .footer-section a:hover { color: #fff; }

        /* Sự kiện */
        .event-card {
            position: relative;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
        }
        .event-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .event-date {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #ffffff;
            color: #333;
            text-align: center;
            font-weight: bold;
            border-radius: 6px;
            padding: 10px 15px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }
        .event-card:hover .event-date {
            background-color: #ff5722;
            color: #fff;
        }
        .event-title { font-size: 18px; font-weight: bold; color: #333; margin-bottom: 10px; }
        .event-description { font-size: 14px; color: #666; margin-bottom: 0; }
        
        .event-description {
		    font-size: 14px;
		    color: #666;
		    margin-bottom: 0;
		    height: 60px;               
		    overflow: hidden;          
		    text-overflow: ellipsis;    
		    display: -webkit-box;
		    -webkit-line-clamp: 3;      
		    -webkit-box-orient: vertical;
		}
		
		.event-card {
		    height: 100%;               
		    display: flex;
		    flex-direction: column;
		}
		
		.event-details {
		    padding: 15px;
		    flex-grow: 1;               
		}
		
		 /* liên hệ */
		.info-section {
			background-color: #f8f9fa;
			padding: 40px 0;
		}
		
		.info-box {
			text-align: center;
			padding: 20px;
			border-radius: 10px;
			background-color: #fff;
			box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
			transition: transform 0.3s ease-in-out;
		}
		
		.info-box:hover {
			transform: scale(1.05);
		}
		
		.info-box i {
			font-size: 50px;
			color: #d32f2f;
			margin-bottom: 15px;
		}
		
		.info-box h3 {
			font-size: 24px;
			color: #d32f2f;
			font-weight: bold;
		}
		
		.info-box p {
			font-size: 16px;
			color: #666;
		}
		
		.footer-section {
			background-color: #333;
			color: #fff;
			padding: 30px 0;
		}
		
		.footer-section h4 {
			font-size: 18px;
			font-weight: bold;
			color: #f8d7da;
			margin-bottom: 20px;
		}
		
		.footer-section a {
			color: #f8d7da;
			text-decoration: none;
			transition: color 0.3s;
		}
		
		.footer-section a:hover {
			color: #fff;
		}
		
		        
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container d-flex align-items-center">
        <a class="navbar-brand mr-3" href="TrangChuController">Quang Phương Motor</a>
        <form class="form-inline flex-grow-1 mx-3" action="TrangChuController" method="post">
            <input class="form-control w-75 mr-2" type="search" name="txttk" placeholder="Tìm kiếm sản phẩm...">
            <button class="btn btn-outline-light" type="submit"><i class="fas fa-search"></i></button>
        </form>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active"><a class="nav-link" href="TrangChuController">Trang chủ</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="SanPhamController" id="productDropdown" data-toggle="dropdown">Sản phẩm</a>
                    <div class="dropdown-menu">
                        <c:forEach var="loai" items="${dsloai}">
                            <a class="dropdown-item" href="#">${loai.getTenloai()}</a>
                        </c:forEach>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link" href="SuKienController">Sự Kiện</a></li>
                <li class="nav-item"><a class="nav-link" href="lienhe.jsp">Liên hệ</a></li>
                <c:choose>
                    <c:when test="${sessionScope.dn == null}">
                        <li class="nav-item"><a class="nav-link" href="DangNhapController"><i class="fas fa-user"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item">
                            <a href="profile.jsp" class="nav-link text-white d-flex align-items-center">
                                <i class="fas fa-user mr-1"></i> <span>${sessionScope.dn.getHoten()}</span>
                            </a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

<!-- Slideshow -->
<div id="carouselExampleIndicators" class="carousel slide mt-2" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="img_xe/top-5-xe-may-honda-duoc-ua-chuong-nhat.jpg" class="d-block w-100" alt="Slide 1">
        </div>
        <div class="carousel-item">
            <img src="img_xe/cac-loai-xe-may-quoc-dan.jpg" class="d-block w-100" alt="Slide 2">
        </div>
        <div class="carousel-item">
            <img src="img_xe/cac-loai-xe-may-moi-ra.jpg" class="d-block w-100" alt="Slide 3">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>
</div>

<!-- Danh mục sản phẩm -->
<div class="container mt-5">
    <c:forEach var="loai" items="${dsloai}">
        <div class="row">
            <div class="col-12">
                <h4 class="category-title">
                    ${loai.getTenloai().toUpperCase()}
                    <a href="SanPhamController?maloai=${loai.getMaloai()}" class="float-right text-primary">Xem tất cả &rarr;</a>
                </h4>
            </div>
        </div>
        <div class="row">
            <c:set var="count" value="0"/>
            <c:forEach var="xe" items="${dsXe}">
                <c:if test="${xe.getMaloai() == loai.getMaloai() && count < 6}">
                    <c:set var="count" value="${count + 1}"/>
                    <div class="col-md-2 col-6 mb-3">
                        <div class="card border-0 product-item">
                            <a href="GioHangController?maxe=${xe.getMaxe()}&tenxe=${xe.getTenxe()}&gia=${xe.getGia()}&anh=${xe.getAnh()}&chitiet=${xe.getChitiet()}">
                                <img src="img_xe/${xe.getAnh()}" class="card-img-top" alt="${xe.getTenxe()}">
                                <div class="card-body text-center p-2">
                                    <p class="font-weight-bold mb-1" style="color: black;">${xe.getTenxe()}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </c:forEach>
</div>

<!-- SỰ KIỆN -->
<div class="container content mt-5">
    <h4 class="mb-4 text-primary font-weight-bold text-uppercase">Sự kiện nổi bật</h4>
    <div class="row g-4">
        <c:forEach var="event" items="${sukien}" varStatus="status">
            <c:if test="${status.index < 3}">
                <div class="col-md-4">
                    <div class="card event-card">
                    <a href="CTSuKien?id=${event.suKienID}">
                        <img src="${event.anh}" alt="${event.tieuDe}">
                        </a>
                        <div class="event-date">
                            <span>${event.ngay}</span>
                            <small>${event.thang}</small>
                        </div>
                        <div class="event-details">
                         <a href="CTSuKien?id=${event.suKienID}">
                           <div class="event-title">${event.tieuDe}</div>
                            <p class="event-description">${event.moTa}</p>
                            </a>
                        </div>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </div>
</div>

<!-- lien hệ -->
<section class="info-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="info-box">
                        <i class="fas fa-headset"></i>
                        <h3>0938 33 66 01</h3>
                        <p>Giải đáp các vấn đề bán hàng</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box">
                        <i class="fas fa-tools"></i>
                        <h3>0938 33 66 01</h3>
                        <p>Giải đáp sửa chữa và bảo hành</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box">
                        <i class="fas fa-phone-alt"></i>
                        <h3>0938 334 762</h3>
                        <p>Bán hàng và sau bán hàng</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Footer -->
<footer class="footer-section mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h4>LIÊN HỆ VỚI CHÚNG TÔI</h4>
                <p><strong>CÔNG TY TNHH THƯƠNG MẠI QUANG PHƯƠNG</strong></p>
                <p><i class="fas fa-map-marker-alt"></i> 463 - 465 - 467 Nguyễn Trãi, P.7, Q.5 - TP. Hồ Chí Minh</p>
                <p><i class="fas fa-phone"></i> Điện thoại: 0938 33 66 01</p>
            </div>
            <div class="col-md-4">
                <h4>SẢN PHẨM</h4>
                <p>50CC</p>
                <p>HONDA</p>
                <p>KAWASAKI</p>
                <p>SUZUKI</p>
                <p>YAMAHA</p>
            </div>
            <div class="col-md-4">
                <h4>FANPAGE</h4>
                <a href="https://www.facebook.com/profile.php?id=100067506996672&ref=embed_page" target="_blank">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTueqhlPIeUApBpTQoQGuthyHh-o3njxaC5Lg&s"
                         alt="Fanpage" style="width: 100%; border-radius: 10px;">
                </a>
            </div>
        </div>
    </div>
</footer>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
