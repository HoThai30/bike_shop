

<%@page import="LichSuModal.LichSu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa Đơn</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Hóa Đơn</h1>
        <hr>
        <div class="table-responsive">
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên Xe</th>
                        <th>Số Lượng</th>
                        <th>Giá</th>
                        <th>Thành Tiền</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<LichSu> dsXe = (List<LichSu>) request.getAttribute("dsXe");
                        if (dsXe != null && !dsXe.isEmpty()) {
                            int index = 1;
                            for (LichSu xe : dsXe) {
                    %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= xe.getTenxe() %></td>
                        <td><%= xe.getSoluong()%></td>
                        <td><%= xe.getGia() %> VND</td>
                        <td><%= xe.getThanhTien() %> VND</td>
                    </tr>
                    <% 
                            }
                        } else { 
                    %>
                    <tr>
                        <td colspan="5" class="text-center">Không có dữ liệu để hiển thị</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <div class="d-flex justify-content-center mt-4">
            <a href="TrangChuController" class="btn btn-primary">Quay lại trang chủ</a>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
