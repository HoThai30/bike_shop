<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Quang Phương Motor</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- jQuery và Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- CSS Tùy chỉnh -->
    <style>
/* Thanh điều hướng cố định và nổi bật */
.navbar {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	font-weight: bold;
	transition: all 0.3s ease;
}

.navbar-nav .nav-item {
	display: flex;
	align-items: center;
}

.navbar-nav .nav-link {
	transition: color 0.3s ease;
	display: flex;
	align-items: center;
	color: white !important; /* Đảm bảo chữ màu trắng */
	font-size: 16px;
}

.navbar-nav .nav-link i {
	font-size: 18px; /* Kích thước icon */
	margin-right: 5px; /* Khoảng cách giữa icon và chữ */
}

.navbar-brand {
	font-size: 20px; /* Kích thước chữ logo */
	font-weight: bold;
}

.navbar-nav .nav-link:hover {
	color: #ffc107 !important; /* Màu vàng nổi bật khi hover */
}

/* Danh mục sản phẩm */
.category-title {
	background-color: white;
	color: #007bff;
	padding: 10px;
	font-weight: bold;
	font-size: 1.2rem;
}

.category-title a {
	font-size: 0.9rem; /* Chữ nhỏ lại */
}

/* Sản phẩm */
.product-item img {
	height: 150px;
	object-fit: contain;
	transition: transform 0.3s ease-in-out;
}

.product-item img:hover {
	transform: scale(1.1);
}

/* Khoảng cách cho phần nội dung tránh bị trùng với navbar cố định */
body {
	padding-top: 70px;
}

.text-white {
	color: white !important;
}

.text-white:hover {
	color: #ddd; /* Màu chữ khi hover */
	text-decoration: underline;
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
    <!-- Header và Thanh điều hướng -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container d-flex align-items-center">
        <!-- Logo -->
        <a class="navbar-brand mr-3" href="TrangChuController">Quang Phương Motor</a>
        
        <!-- Thanh tìm kiếm -->
        <form class="form-inline flex-grow-1 mx-3" action="TrangChuController" method="post">
            <input class="form-control mr-sm-2 w-75" type="search" placeholder="Tìm kiếm sản phẩm..." aria-label="Search" name="txttk">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">
                <i class="fas fa-search"></i>
            </button>
        </form>

        <!-- Nút thu gọn cho màn hình nhỏ -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu điều hướng -->
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
                <li class="nav-item"><a class="nav-link" href="SuKienController">Thông tin</a></li>
                <li class="nav-item"><a class="nav-link" href="lienhe.jsp">Liên hệ</a></li>
                <c:if test="${sessionScope.dn==null }">
                <li class="nav-item"><a class="nav-link" href="DangNhapController"><i class="fas fa-user"></i></a></li>
                </c:if>
               <c:if test="${sessionScope.dn != null}">
   
             <li class="nav-item">
        <!-- Chuyển hướng đến trang cá nhân -->
            <a href="profile.jsp" class="nav-link text-white d-flex align-items-center">
            <i class="fas fa-user mr-1"></i> <!-- Icon người dùng -->
            <span>${sessionScope.dn.getHoten()}</span> <!-- Tên người dùng -->
        </a>
    </li>
</c:if>
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
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
     
   <div class="container mt-3">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">Trang chủ</li>
                <li class="breadcrumb-item active" aria-current="page"> <a href="CTGioController">Mua hàng</a></li>
            </ol>
        </nav>
    </div>

    <!-- Danh sách sản phẩm -->
    <div class="container mt-5">
        <c:forEach var="loai" items="${dsloai}">
            <!-- Tiêu đề danh mục -->
            <div class="row">
                <div class="col-12">
                    <h4 class="category-title">
                        ${loai.getTenloai().toUpperCase()}
                       <a href="SanPhamController?maloai=${loai.getMaloai()}" class="float-right text-#007bff">Xem tất cả &rarr;</a>
                    </h4>
                </div>
            </div>
            <!-- Sản phẩm thuộc loại -->
            <div class="row">
                <c:forEach var="xe" items="${dsXe}">
                    <c:if test="${xe.getMaloai() == loai.getMaloai()}">
                        <div class="col-md-2 col-6 mb-3">
                            <div class="card border-0 product-item">
                             <a href="GioHangController?maxe=${xe.getMaxe()}&tenxe=${xe.getTenxe()}&gia=${xe.getGia()}&anh=${xe.getAnh()}&chitiet=${xe.getChitiet()}">
                                <img src="img_xe/${xe.getAnh()}" class="card-img-top" alt="${xe.getTenxe()}">
                                <div class="card-body text-center p-2">
                                   <p class="font-weight-bold mb-1" style="color: black;">${xe.getTenxe()}</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </c:forEach>
    </div>

    <!-- Footer -->
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <!-- Liên hệ -->
                <div class="col-md-4">
                    <h4>LIÊN HỆ VỚI CHÚNG TÔI</h4>
                    <p><strong>CÔNG TY TNHH THƯƠNG MẠI QUANG PHƯƠNG</strong></p>
                    <p><i class="fas fa-map-marker-alt"></i> 463 - 465 - 467 Nguyễn Trãi, P.7, Q.5 - TP. Hồ Chí Minh</p>
                    <p><i class="fas fa-phone"></i> Điện thoại: 0938 33 66 01</p>
                </div>

                <!-- Sản phẩm -->
                <div class="col-md-4">
                    <h4>SẢN PHẨM</h4>
                    <ul class="list-unstyled">
                        <p>50CC</p>
                        <p>HONDA</p>
                        <p>KAWASAKI</p>
                        <p>SUZUKI</p>
                        <p>YAMAHA</p>
                    </ul>
                </div>

                <!-- Fanpage -->
              <div class="col-md-4">
             <h4>FANPAGE</h4>
             <a href="https://www.facebook.com/profile.php?id=100067506996672&ref=embed_page" target="_blank">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTueqhlPIeUApBpTQoQGuthyHh-o3njxaC5Lg&s" alt="Fanpage Image" style="width: 100%; height: auto; border-radius: 10px;">
           </a>
          </div>

    </footer>

</body>
</html>