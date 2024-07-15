package websocket;



import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/toggleSeat")
public class ToggleSeatServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String seatId = request.getParameter("seatId");
        String status = request.getParameter("status");
        String show = request.getParameter("show");

        // Update seat status in the database (pseudo-code)
        // Database.updateSeatStatus(seatId, status);

        // Send WebSocket message
        SeatStatusWebSocket.broadcastMessage("Seat " + seatId + " " + status + " " + show);

        response.setContentType("text/plain");
        response.getWriter().write("Seat " + seatId + " " + status + " " + show);
    }
}
