<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Xác nhận thanh toán</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Container for the page content -->
    <div class="container mt-5">
        <!-- Heading -->
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <h1 class="text-success">Xác nhận thanh toán</h1>
                <p class="lead">Cảm ơn bạn đã mua hàng tại Quang Phương Motor!</p>
                
                <!-- Thank you message and Order Confirmation -->
                <div class="alert alert-success">
                    <strong>Đơn hàng của bạn đã được thanh toán thành công!</strong><br>
                    Vui lòng kiểm tra email của bạn để biết thông tin chi tiết.
                </div>

                <!-- View Order Details Button -->
                <a href="LichSuController" class="btn btn-primary btn-lg">
                    <i class="fas fa-info-circle"></i> Xem chi tiết hóa đơn
                </a>

                <!-- Back to Home Button -->
                <div class="mt-3">
                    <a href="TrangChuController" class="btn btn-secondary btn-lg">
                        <i class="fas fa-home"></i> Quay lại trang chủ
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
