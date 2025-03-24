<%@page import="giohangModal.HangBo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="giohangModal.Hang"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi Tiết Sản Phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <!-- jQuery và Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 80px; /* Add space for fixed navbar */
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }

        .btn-buy {
            background-color: #007bff;
            color: white;
        }

        .btn-buy:hover {
            background-color: #0056b3;
        }

        /* Floating tư vấn button styles */
        .floating-btn {
            position: fixed; /* Fix the position of the button */
            right: 20px; /* Position the button on the right */
            top: 50%; /* Position button vertically at the center of the screen */
            transform: translateY(-50%); /* Adjust to be exactly in the center */
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            font-size: 24px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            z-index: 1000; /* Ensure it stays above other content */
        }

        .floating-btn:hover {
            background-color: #0056b3;
        }

        .floating-btn i {
            margin: 0;
        }

        /* Fix breadcrumb navigation at the top */
        .breadcrumb {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background-color: #f8f9fa;
            z-index: 999;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            padding: 10px 15px;
        }

        /* Add padding to the body to account for fixed breadcrumb */
        .body-content {
            padding-top: 60px; /* Adjust based on breadcrumb height */
        }
    </style>
</head>
<body>
    <!-- Thanh điều hướng -->
    <div class="container mt-3">
        <nav aria-label="breadcrumb" class="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="TrangChuController">Trang chủ</a></li>
                <li class="breadcrumb-item active" aria-current="page">Mua hàng</li>
            </ol>
        </nav>
    </div>

    <!-- Chi tiết giỏ hàng -->
    <div class="container mt-5 body-content">
        <%
            HangBo hangBo = (HangBo) session.getAttribute("hang");
            if (hangBo != null && !hangBo.getDs().isEmpty()) {
                ArrayList<Hang> ds = hangBo.getDs();
        %>
        <form action="XoaSuaController" method="post">
            <div class="row">
                <%
                    for (Hang hang : ds) {
                %>
                <div class="col-md-12 mb-3">
                    <div class="card product-card">
                        <div class="row no-gutters">
                            <!-- Ảnh sản phẩm lớn hơn -->
                            <div class="col-md-3"  style="left: 20%; margin: auto;">
                                <img src="img_xe/<%= hang.getAnh() %>" class="card-img" alt="<%= hang.getTenxe() %>" style="width: 100%; height: auto;">
                            </div>
                            <!-- Thông tin sản phẩm nằm phía góc phải -->
                            <div class="col-md-9" style="left: 20%; margin: auto;">
                                <div class="card-body">
                                    <h5 class="card-title"><%= hang.getTenxe() %></h5>
                                    <p class="card-text"><strong>Mã xe:</strong> <%= hang.getMaxe() %></p>
                                    <p class="card-text"><strong>Giá:</strong> <%= hang.getGia() %> VND</p>
                                    <p class="card-text"><strong>Số lượng:</strong> <%= hang.getSoluong() %></p>
                                    <p class="card-text"><strong>Tổng tiền:</strong> <%= hang.getThanhtien() %> VND</p>
                                    <p class="card-text">
                                        <input type="checkbox" name="ck" value="<%= hang.getMaxe() %>"> Chọn
                                        <input type="number" class="form-control d-inline" name="<%= hang.getMaxe() %>" value="0" style="width: 70px;">
                                    </p>
                                    <div class="mt-2">
                                        <button type="submit" class="btn btn-success btn-sm" name="butsuasl" value="<%= hang.getMaxe() %>">Cập nhật</button>
                                        <button type="submit" class="btn btn-danger btn-sm" name="maxexoa" value="<%= hang.getMaxe() %>">Xóa</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
            <div class="text-right mt-4">
                <% 
                    HangBo hangbo = (HangBo) session.getAttribute("hang");
                    if (hangbo != null && !hangbo.getDs().isEmpty()) {
                %>
                <div class="text-right"><strong>Tổng Hoá Đơn:</strong> <%= hangBo.Tong() %> VND</div>
                <% } %>
                <button type="submit" class="btn btn-danger" name="xoachon">Xóa sản phẩm đã chọn</button>
                <a href="ThanhToanController" class="btn btn-primary">Thanh toán</a>
            </div>
        </form>
        <% } else { %>
        <div class="alert alert-warning text-center mt-4">
            <strong>Giỏ hàng của bạn đang trống!</strong>
            <br>
            <a href="TrangChuController" class="btn btn-primary mt-3">Quay lại trang chủ</a>
        </div>
        <% } %>
    </div>

    <!-- Floating tư vấn button -->
    <div class="floating-btn">
        <a href="userChat.jsp" class="text-white">
            <i class="fas fa-comment-dots"></i>
        </a>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center p-3 mt-5">
        <p class="m-0">&copy; 2024 Quang Phương Motor. All Rights Reserved.</p>
    </footer>
</body>
</html>
