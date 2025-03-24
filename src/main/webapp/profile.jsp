<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Cá Nhân</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .profile-card {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn {
            width: 100%;
            font-size: 16px;
            margin-top: 10px;
        }
        .section-title {
            font-size: 1.2rem;
            color: #495057;
            margin-bottom: 15px;
        }
        .section-content {
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .action-buttons {
            display: flex;
            justify-content: space-between;
        }
        .action-buttons a {
            width: 48%;
        }
        .member-rank {
            font-size: 1rem;
            font-weight: bold;
            color: #28a745;
            margin-bottom: 15px;
        }
        .back-home-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            background-color: transparent;
            border: none;
            font-size: 1.5rem;
            color: #495057;
        }
        .back-home-btn:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <!-- Nút về trang chủ -->
    <button class="back-home-btn" onclick="window.location.href='TrangChuController'">
        <i class="fas fa-arrow-left"></i>
    </button>

    <div class="container">
        <div class="profile-card">
            <h2 class="text-center">Thông Tin Cá Nhân</h2>
            <hr>

            <!-- Hiển thị thông tin người dùng -->
            <div class="row">
                <div class="col-md-6">
                    <div class="section-title">
                        <i class="fas fa-user"></i> Hồ sơ cá nhân
                    </div>
                    <div class="section-content">
                        <strong>Họ tên:</strong> ${dn.getHoten()}
                    </div>
                    <div class="section-content">
                        <strong>Email:</strong> ${dn.getEmail()}
                    </div>
                    <div class="section-content">
                        <strong>Số điện thoại:</strong> ${dn.getSodt()}
                    </div>
                    <div class="section-content">
                        <strong>Địa chỉ:</strong> ${dn.getDiachi()}
                    </div>

                    <!-- Mục Lịch sử mua hàng -->
                    <div class="section-title">
                        <a href="LichSuController" class="text-decoration-none text-dark">
                            <i class="fas fa-history"></i> Lịch sử mua hàng
                        </a>
                    </div>
                </div>

                <!-- Mục Xếp loại thành viên -->
                <div class="col-md-6">
                    <div class="member-rank">
                        <i class="fas fa-star"></i> Xếp loại thành viên: <span class="text-success">Vàng</span>
                    </div>
                    <hr>
                    <div class="action-buttons">
                        <a href="doiMatKhau.jsp" class="btn btn-warning">Đổi mật khẩu</a>
                        <a href="DangNhapController" class="btn btn-danger">Đăng xuất</a>
                    </div>
                </div>
            </div>

           
        </div>
    </div>

    <!-- Bootstrap JS và các dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
