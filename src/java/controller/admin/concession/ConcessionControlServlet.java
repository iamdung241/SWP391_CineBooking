 /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.concession;

import constant.CommonConst;
import dal.ConcessionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

import model.Concession;

@MultipartConfig
/**
 *
 * @author Son
 */
public class ConcessionControlServlet extends HttpServlet {

    ConcessionDAO dao = new ConcessionDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        //get session
        HttpSession session = request.getSession();

        // get action
        String action = request.getParameter("action") == null
                ? ""
                : request.getParameter("action");

        switch (action) {
            case "add":
                addConcession(request);
                break;
            case "edit":
                editConcession(request);
                break;
            case "delete":
                deleteConcession(request);
                break;
            case "restock":
                restockConcession(request);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect(request.getContextPath() + "/admin/concession");
//        request.getRequestDispatcher("../views/admin/manageconcession.jsp").forward(request, response);
    }

    /**
     * Add a concession item to the database based on the data sent from the
     * HTTP request.
     *
     * @param request the HTTP request containing information about the
     * concession item to be added
     */
    //private static final String UPLOAD_DIR = "E:\\CineBooking_SWP391_G3\\SWP391_CineBooking\\web\\img\\ConcessionImage";
    private void addConcession(HttpServletRequest request) {
        try {
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
//            int quantity = Integer.parseInt(request.getParameter("quantity"));

            String img = "img/ConcessionImage/";
            File fileSaveDir = new File(CommonConst.UPLOAD_DIRS);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }

            // Lấy file upload từ request
            Part part = request.getPart("file");
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                img += fileName;
                // Đảm bảo fileName không null
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(CommonConst.UPLOAD_DIRS + File.separator + fileName);
                }
            }

            System.out.println(part);
            Concession concession = new Concession();
            concession.setConcessions_name(name);
            concession.setPrice(price);
//            concession.setQuantity(quantity);
            concession.setImage(img);

            dao.addConcession(concession);

        } catch (NumberFormatException e) {

        } catch (IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Extracts the filename from the content-disposition header of a Part
     * object.
     *
     * @param part the Part object from which to extract the filename
     * @return the extracted filename or an empty string if not found
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    /**
     * Edits a concession item in the database based on the data sent from the
     * HTTP request. If a new image is uploaded, it is saved and the item's
     * image path is updated accordingly.
     *
     * @param request the HTTP request containing information about the
     * concession item to be edited
     */
    private void editConcession(HttpServletRequest request) {
        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            float price = Float.parseFloat(request.getParameter("price"));
//            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            String img = request.getParameter("currentImage");
            System.out.println(img);
            String imgDir = "img/ConcessionImage/";
            File fileSaveDir = new File(CommonConst.UPLOAD_DIRS);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdirs();
            }
            Concession concession = new Concession();
            // Lấy file upload từ request
            Part part = request.getPart("image");
            if (part != null && part.getSize() > 0) {
                String fileName = extractFileName(part);
                imgDir = imgDir + fileName;
                // Đảm bảo fileName không null
                if (fileName != null && !fileName.isEmpty()) {
                    part.write(CommonConst.UPLOAD_DIRS + File.separator + fileName);
                }
                concession.setImage(imgDir);
            } else {
                concession.setImage(img);
            }

            concession.setConcessions_name(name);
            concession.setPrice(price);
//            concession.setQuantity(quantity);
            concession.setConcessions_id(id);
            dao.editConcession(concession);
        } catch (NumberFormatException e) {

        } catch (IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Deletes a concession item from the database based on the ID sent from the
     * HTTP request.
     *
     * @param request the HTTP request containing the ID of the concession item
     * to be deleted
     */
    private void deleteConcession(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.deleteConcession(id);

    }

    private void restockConcession(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.restockConcession(id);
    }
}
