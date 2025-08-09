<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sự kiện - Quang Phương Motor</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .article-container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .article-title {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #007bff;
        }

        .article-date {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }

        .article-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 25px;
        }

        .article-content {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #333;
        }

        .back-link {
            display: inline-block;
            margin-top: 30px;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body style="background-color: #f8f9fa;">

    <div class="container article-container">
        <h1 class="article-title">${sukien.tieuDe}</h1>
        <p class="article-date">${sukien.ngay} tháng ${sukien.thang}</p>
        <img class="article-image" src="${sukien.anh}" alt="${sukien.tieuDe}">
        <div class="article-content">
            ${sukien.moTa}
        </div>
        <a href="SuKienController" class="back-link">← Quay về danh sách sự kiện</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
