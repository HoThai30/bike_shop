<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .login-container {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: #ff0000;
            font-size: 14px;
        }
        .captcha-container {
            text-align: center;
            margin-top: 10px;
        }
        .captcha-image {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h4 class="text-center mb-4">Đăng Nhập</h4>
        <form action="DangNhapController" method="post">
            <!-- Hiển thị lỗi nếu có -->
            <c:if test="${not empty loi}">
                <div class="alert alert-danger" role="alert">
                    ${loi}
                </div>
            </c:if>

            <!-- Tên đăng nhập -->
            <div class="form-group">
                <label for="username">Tên đăng nhập</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
            </div>

            <!-- Mật khẩu -->
            <div class="form-group">
                <label for="password">Mật khẩu</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Nhập mật khẩu" required>
            </div>

            <!-- CAPTCHA -->
            <div class="form-group captcha-container">
               <%if(session.getAttribute("dem")!=null){
                int d=(int)session.getAttribute("dem");
                 if(d>=3){
                %>
               <img src="simpleCaptcha.jpg" /> <br><input type="text" name="answer" />
               <%}
                }%>
            </div>
            
            <!-- Nút đăng nhập -->
            <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>

            <!-- Đăng ký -->
            <div class="text-center mt-3">
                <a href="DangKiController">Bạn chưa có tài khoản? Đăng ký</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
