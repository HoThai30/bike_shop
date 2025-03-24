<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat với Admin</title>
    <script>
        function loadMessages() {
            fetch('ChatServlet')
                .then(response => response.text())
                .then(data => {
                    document.getElementById('chatBox').innerHTML = data;
                });
        }
        setInterval(loadMessages, 2000);

        function sendMessage() {
            const message = document.getElementById('messageInput').value;
            fetch('ChatServlet', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: 'sender=user&message=' + encodeURIComponent(message)
            }).then(() => {
                document.getElementById('messageInput').value = '';
                loadMessages();
            });
        }
    </script>
</head>
<body onload="loadMessages()">
    <h1>Chat với Admin</h1>
    <div id="chatBox" style="border: 1px solid #ccc; height: 300px; overflow-y: auto; padding: 10px;"></div>
    <input type="text" id="messageInput" placeholder="Nhập tin nhắn..." />
    <button onclick="sendMessage()">Gửi</button>
   <p class="breadcrumb-item active" aria-current="page"> <a href="TrangChuController">Back</a></p>
</body>
</html>
