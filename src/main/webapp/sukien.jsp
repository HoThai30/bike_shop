<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Sự Kiện</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
/* Card container styling */
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

/* Image inside the card */
.event-card img {
	width: 100%;
	height: 200px;
	object-fit: cover;
}

/* Styling for date box */
.event-date {
	position: absolute;
	top: 10px;
	left: 10px;
	background-color: #ffffff; /* Mặc định màu trắng */
	color: #333; /* Màu chữ đen */
	text-align: center;
	font-weight: bold;
	border-radius: 6px;
	padding: 10px 15px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
	transition: background-color 0.3s ease, color 0.3s ease;
}

/* Hiệu ứng khi rê chuột vào card */
.event-card:hover .event-date {
	background-color: #ff5722; /* Đổi màu thành cam khi hover */
	color: #fff; /* Màu chữ trắng khi hover */
}

/* Event details styling */
.event-details {
	padding: 15px;
}

.event-title {
	font-size: 18px;
	font-weight: bold;
	color: #333;
	margin-bottom: 10px;
}

.event-description {
	font-size: 14px;
	color: #666;
	margin-bottom: 0;
}

/* Fix content margin to avoid overlapping with fixed navbar */
.content {
	margin-top: 80px; /* Khoảng cách với navbar */
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
                        <a class="nav-link" href="SanPhamController">Sản Phẩm</a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link active" href="SuKienController">Thông Tin</a>
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
                <li class="breadcrumb-item active" aria-current="page">Thông tin sự kiện</li>
            </ol>
        </nav>
    </div>
    <!-- Main Content -->
    <div class="container content">
        <div class="row g-4">
            <!-- Duyệt qua danh sách sự kiện -->
            <c:forEach var="event" items="${sukien}">
                <div class="col-md-4">
                    <div class="card event-card">
                        <!-- Hình ảnh sự kiện -->
                        <img src="${event.getAnh()}" alt="${event.getTieuDe()}">
                        
                        <!-- Ngày và tháng -->
                        <div class="event-date">
                            <span>${event.getNgay()}</span>
                            <small>${event.getThang()}</small>
                        </div>

                        <!-- Chi tiết sự kiện -->
                        <div class="event-details">
                            <div class="event-title">${event.getTieuDe()}</div>
                            <p class="event-description">
                                ${event.getMoTa()}
                            </p>
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

    
   
    <!-- Link Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
