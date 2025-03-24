<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng Ký Tài Khoản</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .form-container {
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 380px;
            margin: 0 auto;
        }

        .form-container h3 {
            font-weight: 500;
            text-align: center;
            margin-bottom: 20px;
            color: #007bff;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            font-weight: 500;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #ff0000;
            font-size: 14px;
        }

        .text-center a {
            color: #007bff;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        /* Điều chỉnh kích thước khi ở màn hình nhỏ */
        @media (max-width: 576px) {
            .form-container {
                padding: 20px;
            }
        }

        /* Định dạng cho các trường nhập liệu và tiêu đề */
        .input-group-label {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .input-group-label label {
            width: 35%;
        }

        .input-group-label .form-control {
            width: 65%;
        }
    </style>
</head>

<body>

    <div class="form-container">
        <h3>Đăng Ký Tài Khoản</h3>

        <!-- Hiển thị thông báo thành công hoặc lỗi -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType}">${message}</div>
        </c:if>

        <form action="DangKiController" method="post">
            <!-- Họ và tên -->
            <div class="mb-3 input-group-label">
                <label for="hoten" class="form-label">Họ và Tên</label>
                <input type="text" class="form-control" id="hoten" name="hoten" placeholder="Nhập họ và tên" required />
            </div>

            <!-- Địa chỉ -->
            <div class="mb-3 input-group-label">
                <label for="diachi" class="form-label">Địa Chỉ</label>
                <input type="text" class="form-control" id="diachi" name="diachi" placeholder="Nhập địa chỉ" />
            </div>

            <!-- Số điện thoại -->
            <div class="mb-3 input-group-label">
                <label for="sodt" class="form-label">Số Điện Thoại</label>
                <input type="text" class="form-control" id="sodt" name="sodt" placeholder="Nhập số điện thoại" />
            </div>

            <!-- Email -->
            <div class="mb-3 input-group-label">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email" required />
            </div>

            <!-- Tên đăng nhập -->
            <div class="mb-3 input-group-label">
                <label for="tendn" class="form-label">Tên Đăng Nhập</label>
                <input type="text" class="form-control" id="tendn" name="tendn" placeholder="Nhập tên đăng nhập" required />
            </div>

            <!-- Mật khẩu -->
            <div class="mb-3 input-group-label">
                <label for="pass" class="form-label">Mật Khẩu</label>
                <input type="password" class="form-control" id="pass" name="pass" placeholder="Nhập mật khẩu" required />
            </div>

            <!-- Xác nhận mật khẩu -->
            <div class="mb-3 input-group-label">
                <label for="confirmPass" class="form-label">Xác Nhận Mật Khẩu</label>
                <input type="password" class="form-control" id="confirmPass" name="confirmPass" placeholder="Xác nhận mật khẩu" required />
            </div>

            <!-- Nút đăng ký -->
            <button type="submit" class="btn btn-primary w-100">Đăng Ký</button>

            <!-- Đã có tài khoản -->
            <div class="text-center mt-3">
                <p>Đã có tài khoản? <a href="DangNhapController">Đăng Nhập</a></p>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
