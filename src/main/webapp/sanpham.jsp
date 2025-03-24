<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
/* Điều chỉnh kích thước ảnh để tất cả ảnh có cùng chiều cao */
.product-image {
	width: 100%;
	height: 250px;
	object-fit: cover; /* Giữ tỷ lệ ảnh đồng nhất và cắt nếu cần */
}

.card-body {
	text-align: center;
}

.product-card {
	border: 1px solid #ddd;
	margin-bottom: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.category-title {
	font-size: 1.5rem;
	font-weight: bold;
}

.product-title {
	font-size: 1.2rem;
	color: #333;
}

.product-price {
	font-size: 1.1rem;
	font-weight: bold;
	color: #007bff;
}

.product-detail {
	font-size: 0.9rem;
	color: #666;
}

/* Màu sắc cho danh mục đang được chọn */
.list-group-item.active {
	background-color: #007bff;
	color: white;
}

.list-group-item.active:hover {
	background-color: #0056b3;
	color: white;
}

.breadcrumb {
	background-color: #e0f7fa; /* Nền xanh nhạt */
	border-radius: 8px; /* Bo góc */
	padding: 10px 15px; /* Khoảng cách trong */
	font-size: 14px; /* Kích thước chữ */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Hiệu ứng bóng */
}

.breadcrumb-item a {
	color: #007bff; /* Màu chữ liên kết */
	text-decoration: none; /* Bỏ gạch chân */
	transition: color 0.2s ease-in-out; /* Hiệu ứng khi hover */
}

.breadcrumb-item a:hover {
	color: #0056b3; /* Màu chữ khi rê chuột */
}

.breadcrumb-item.active {
	color: #333; /* Màu chữ mục hiện tại */
	font-weight: bold; /* Đậm hơn */
}

/* Sticky Navigation Bar */
.navbar {
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	font-weight: bold;
	transition: all 0.3s ease;
	background-color: #007bff;
}

/* Navbar Container to center content */
.navbar .container-fluid {
	display: flex;
	justify-content: center; /* Center align the nav items */
	align-items: center;
}

/* Navbar Items Styling */
.navbar .nav-item .nav-link {
	display: flex;
	align-items: center;
	padding: 8px 15px; /* Adjust padding for better spacing */
}

.navbar .navbar-brand {
	font-size: 20px; /* Kích thước chữ logo */
	font-weight: bold;
}

.navbar .nav-link {
	transition: color 0.3s ease;
	display: flex;
	align-items: center;
	color: white;
	font-size: 16px;
}

.navbar .nav-link:hover {
	color: #ffc107 !important;
}

/* User Icon in Navbar */
.navbar .nav-item .nav-link i {
	margin-right: 5px;
}

.navbar-toggler-icon {
	background-color: white; /* White icon for the toggle button */
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
   <!-- thanh điều hướng -->
     <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="TrangChuController">Quang Phương Motor</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="TrangChuController">Trang Chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="SanPhamController">Sản Phẩm</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="SuKienController">Thông Tin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lienhe.jsp">Liên Hệ</a>
                    </li>
                    <!-- "Tôi" section with user icon -->
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">
                            <i class="fas fa-user" style="color: white;"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
      
     
  
       <div class="container mt-3">
        <nav aria-label="breadcrumb" class="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="TrangChuController">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Chi tiết sản phẩm</li>
            </ol>
        </nav>
    </div>
    <div class="container mt-5">
        <!-- Danh mục các loại sản phẩm -->
        <h3 class="mb-4">Danh mục sản phẩm</h3>
        <div class="list-group mb-5">
            <c:forEach var="loai" items="${dsLoai}">
                <c:set var="isActive" value="${param.maloai == loai.maloai}" />
                <a href="SanPhamController?maloai=${loai.maloai}" 
                   class="list-group-item list-group-item-action <c:if test="${isActive}">active</c:if>">
                    ${loai.tenloai}
                </a>
            </c:forEach>
        </div>

        <!-- Hiển thị danh sách sản phẩm -->
        <h3 class="mb-4">Sản phẩm</h3>
        <div class="row">
            <c:if test="${empty dsXe}">
                <div class="col-12">
                    <p class="text-center text-muted">Không có sản phẩm nào trong loại này.</p>
                </div>
            </c:if>
            <c:forEach var="xe" items="${dsXe}">
                <div class="col-md-4 col-sm-6 mb-4">
                    <div class="card product-card">
                        <img src="img_xe/${xe.getAnh()}" class="card-img-top product-image" alt="${xe.getTenxe()}">
                        <div class="card-body">
                            <h5 class="card-title product-title">${xe.getTenxe()}</h5>
                         <%--   <p class="card-text product-price">${xe.getGia()} VND</p> --%>
                            <p class="card-text product-detail">${xe.getChitiet()}</p>
                              <a href="userChat.jsp" class="btn btn-primary">Tư Vấn</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
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
    

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
