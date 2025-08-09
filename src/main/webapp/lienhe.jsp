<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Liên Hệ</title>
    <!-- Link Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- jQuery và Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
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

</style>
</head>
<body>

    <!-- Sticky Navigation Bar -->
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
                         <li class="nav-item">
                        <a class="nav-link " href="SuKienController">Thông Tin</a>
                    </li>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="lienhe.jsp">Liên Hệ</a>
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

    <!-- Thông tin liên hệ -->
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

<script src="//code.tidio.co/9dc1tehnia3wl1k5rcftptjbj4twsomw.js" async></script>
</body>
</html>
