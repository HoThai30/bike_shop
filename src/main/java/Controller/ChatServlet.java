package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ChatServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String userMessage = request.getParameter("message");
        if (userMessage == null || userMessage.trim().isEmpty()) {
            response.getWriter().write("{\"error\":\"Nội dung trống.\"}");
            return;
        }

        String payload = String.format("""
        {
            "model": "openai/gpt-3.5-turbo-16k",
            "messages": [
                { "role": "user", "content": "%s" }
            ]
        }
        """, userMessage);

        try {
            HttpClient client = HttpClient.newHttpClient();
            HttpRequest httpRequest = HttpRequest.newBuilder()
                    .uri(URI.create("https://openrouter.ai/api/v1/chat/completions"))
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer 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")
                    .POST(HttpRequest.BodyPublishers.ofString(payload))
                    .build();

            HttpResponse<String> httpResponse = client.send(httpRequest, HttpResponse.BodyHandlers.ofString());

           
//            System.out.println("Phản hồi từ OpenRouter:");
//            System.out.println(httpResponse.body());

            PrintWriter out = response.getWriter();
            out.print(httpResponse.body()); 
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"error\":\"Lỗi gọi OpenRouter: " + e.getMessage() + "\"}");
        }
    }
}
