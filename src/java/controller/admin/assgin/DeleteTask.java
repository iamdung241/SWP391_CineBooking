package controller.admin.assgin;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

public class DeleteTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Đọc dữ liệu từ yêu cầu Delete
        String requestData = getRequestData(request);

        System.out.println(requestData);
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(requestData, JsonObject.class);

        System.out.println(jsonObject);

        String taskId = jsonObject.get("id").getAsString();

        //Change in database
        TaskDAO taskDao = new TaskDAO();
        boolean check = taskDao.deleteTask(taskId);
        JsonObject responseData = new JsonObject();
        if (check) {
            responseData.addProperty("code", 200);
        } else {
            responseData.addProperty("code", 400);

        }
        //gửi lại phản hổi
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseData));
    }

// đọc dữ liệu từ client
    private String getRequestData(HttpServletRequest request) throws IOException {
        try (BufferedReader reader = request.getReader()) {
            StringBuilder requestData = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                requestData.append(line);
            }
            return requestData.toString();
        }

    }

}
