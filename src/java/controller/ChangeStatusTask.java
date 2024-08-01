package controller.theater;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dal.TaskDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

@WebServlet(name = "ChangeStatusTask", urlPatterns = {"/ViewTask/change-status"})
public class ChangeStatusTask extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String requestData = getRequestData(request);
        System.out.println(requestData);
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(requestData, JsonObject.class);
        System.out.println(jsonObject);
        String taskId = jsonObject.get("taskId").getAsString();
        String status = jsonObject.get("status").getAsString();
        //Change in database
        TaskDAO taskDao = new TaskDAO();
        boolean check = taskDao.updateTaskStatus(status, taskId);
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
