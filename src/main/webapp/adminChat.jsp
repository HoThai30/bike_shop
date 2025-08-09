<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chatbot</title>
    <style>
        body {
            background-color: #0d1117;
            font-family: 'Segoe UI', sans-serif;
            color: #c9d1d9;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            min-height: 100vh;
            padding: 40px 20px;
        }

        h1 {
            font-size: 22px;
            margin-bottom: 30px;
        }

        .chat-container {
            width: 100%;
            max-width: 600px;
        }

        .input-wrapper {
            display: flex;
            align-items: center;
            background-color: #161b22;
            border-radius: 12px;
            padding: 12px 20px;
            box-shadow: none;
            border: none;
            margin-top: 30px;
        }

        .input-wrapper input {
            flex: 1;
            background: transparent;
            border: none;
            outline: none;
            color: #c9d1d9;
            font-size: 16px;
        }

        .input-wrapper input::placeholder {
            color: #8b949e;
        }

        .suggestions {
            margin-top: 40px;
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }

        .suggestion-card {
            background-color: #161b22;
            padding: 16px 20px;
            border-radius: 12px;
            box-shadow: none;
            border: 1px solid #30363d;
            font-size: 14px;
            color: #c9d1d9;
            cursor: pointer;
            min-width: 200px;
            flex: 1 1 calc(33.333% - 30px);
            text-align: left;
        }

        .suggestion-card:hover {
            background-color: #21262d;
        }

       
        .chat-messages {
            display: none;
            max-height: 400px;
            overflow-y: auto;
            margin-top: 30px;
            padding: 10px;
            background: #161b22;
            border-radius: 10px;
        }

        .message {
            margin-bottom: 10px;
            line-height: 1.5;
        }

        .user-message {
            color: #8b949e;
            text-align: right;
        }

        .bot-message {
            color: #8b949e;
            text-align: left;
        }
    </style>
</head>
<body>

<h1>Xin chào, hãy thử hỏi "bạn có thể làm gì?"</h1>

<div class="chat-container">

	<div class="chat-messages" id="chatMessages"></div>
   
    <div class="input-wrapper">
        <input type="text" id="messageInput" placeholder="Nhắn tin cho Phước Thái" />
    </div>

    <div class="suggestions">
        <div class="suggestion-card">✏️ Phân tích văn bản và gợi ý cải thiện</div>
        <div class="suggestion-card">📊 Tóm tắt tin tức tài chính</div>
        <div class="suggestion-card">📝 Viết email xin nghỉ phép hài hước</div>
        <div class="suggestion-card">💡 Giải thích đoạn code khó hiểu</div>
        <div class="suggestion-card">🧠 Gợi ý nội dung sáng tạo mạng xã hội</div>
        <div class="suggestion-card">📚 Hướng dẫn học lập trình Java</div>
    </div>
</div>

<script>
    const input = document.getElementById("messageInput");
    const chatBox = document.getElementById("chatMessages");
    const suggestionCards = document.querySelectorAll(".suggestion-card");

    
    input.addEventListener("keydown", function (e) {
        if (e.key === "Enter") {
            e.preventDefault();
            sendMessage(input.value);
        }
    });

    
    suggestionCards.forEach(card => {
        card.addEventListener("click", () => {
            const content = card.innerText;
            input.value = content;
            sendMessage(content);
        });
    });

   
    function sendMessage(message) {
        message = message.trim();
        if (!message) return;

        chatBox.style.display = "block";

        
        const userDiv = document.createElement("div");
        userDiv.className = "message user-message";
        userDiv.textContent = message;
        chatBox.appendChild(userDiv);
        input.value = "";

        fetch("ChatServlet", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "message=" + encodeURIComponent(message)
        })
        .then(res => res.text())
        .then(text => {
            let data;
            try {
                data = JSON.parse(text);
            } catch {
                data = { error: "Lỗi xử lý phản hồi JSON" };
            }

            const reply = data.choices?.[0]?.message?.content || data.error || "Không có phản hồi";

            const botDiv = document.createElement("div");
            botDiv.className = "message bot-message";
            botDiv.textContent = reply;
            chatBox.appendChild(botDiv);
            chatBox.scrollTop = chatBox.scrollHeight;
        })
        .catch(err => {
            const errDiv = document.createElement("div");
            errDiv.className = "message bot-message";
            errDiv.textContent = "Lỗi gửi yêu cầu: " + err.message;
            chatBox.appendChild(errDiv);
        });
    }
</script>

</body>
</html>
