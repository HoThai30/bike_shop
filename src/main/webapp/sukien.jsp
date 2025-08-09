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
			transition: background-color 0.3s ease, color 0.3s ease;
		}
		
		
		.event-card:hover .event-date {
			background-color: #ff5722; 
			color: #fff;
		}
		
		
		.event-details {
			padding: 15px;
			flex-grow: 1;  
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
		
		
		.content {
			margin-top: 80px; 
		}
		
		.breadcrumb {
			background-color: #e0f7fa; 
			border-radius: 8px; 
			padding: 10px 15px; 
			font-size: 14px; 
			box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
		}
		
		.breadcrumb-item a {
			color: #007bff; 
			text-decoration: none;
			transition: color 0.2s ease-in-out; 
		}
		
		.breadcrumb-item a:hover {
			color: #0056b3; 
		}
		
		.breadcrumb-item.active {
			color: #333; 
			font-weight: bold; 
		}
		
		.navbar {
			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
			font-weight: bold;
			transition: all 0.3s ease;
			background-color: #007bff;
		}
		
		
		.navbar .container-fluid {
			display: flex;
			justify-content: center; 
			align-items: center;
		}
		

		.navbar .nav-item .nav-link {
			display: flex;
			align-items: center;
			padding: 8px 15px; 
		}
		
		.navbar .navbar-brand {
			font-size: 20px; 
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
		
		
		.navbar .nav-item .nav-link i {
			margin-right: 5px;
		}
		
		.navbar-toggler-icon {
			background-color: white; 
		}
		
		
		.navbar-toggler-icon {
			background-color: white; 
		}
		
		.footer-section {
			margin-top: 60px;  
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
		    height: 150px;               
		    overflow: hidden;          
		    text-overflow: ellipsis;    
		    display: -webkit-box;
		    -webkit-line-clamp: 8;      
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
   
    <div class="container content">
        <div class="row g-4">
          
           <c:forEach var="event" items="${sukien}" varStatus="status">
           
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
           
        </c:forEach>
        </div>
    </div>

    <footer class="footer-section">
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
                    <ul class="list-unstyled">
                        <p>50CC</p>
                        <p>HONDA</p>
                        <p>KAWASAKI</p>
                        <p>SUZUKI</p>
                        <p>YAMAHA</p>
                    </ul>
                </div>

           
              <div class="col-md-4">
             <h4>FANPAGE</h4>
             <a href="https://www.facebook.com/profile.php?id=100067506996672&ref=embed_page" target="_blank">
              <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTueqhlPIeUApBpTQoQGuthyHh-o3njxaC5Lg&s" alt="Fanpage Image" style="width: 100%; height: auto; border-radius: 10px;">
           </a>
          </div>
    </footer>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
