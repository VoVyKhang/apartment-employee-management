/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import management.dao.CertificateDAO;
import management.dto.CertificateDTO;
import management.regex.RegexEmp;

/**
 *
 * @author VyNT
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
public class AddNewCertEmpController extends HttpServlet {

    private final String SUCCESS = "listCertEmpController";
    private final String ERROR = "addNewCertEmp.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param servlet request
     * @param servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR;
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession ss = request.getSession();
            String cerName = request.getParameter("cerName");
            String doi = request.getParameter("cerDoi");
            String idEmp = request.getParameter("empID");
            String idTypeCer = request.getParameter("idTypeCer");
            Part part = request.getPart("imgPath");
            String fileName = extractFileName(part);
            boolean checkName = RegexEmp.checkEmpName(cerName);
            boolean checkDoi = RegexEmp.checkValidationCertiDate(doi);
            CertificateDAO dao = new CertificateDAO();
            int i = 0;
            if (cerName.equals("") || doi.equals("1900-01-01")) {
                request.setAttribute("filedBlank", "Do not leave any fields blank,  Add fail");
                i++;
            } else if (checkName == false) {
                request.setAttribute("nameInvalid", "Only contain Alphabet(Upper case or Lower case) and space and length 4 -> 30");
                i++;
            } else if (checkDoi == false) {
                request.setAttribute("checkDoi", "Can only enter the date before today");
                i++;
            } else if (fileName.isEmpty() || fileName.equals("")) {
                request.setAttribute("filedBlank", "Choose a Image!!");
                i++;
            }
            if (i == 0) {
                boolean result = false;
                if (!fileName.isEmpty() || !fileName.equals("")) {
                    String path = request.getServletContext().getRealPath("/");
                    String[] list = path.split("\\\\");
                    String path2 = "";
                    for (int j = 0; j < list.length; j++) {
                        if (!list[j].toString().equals("apartment-employee-management")) {
                            path2 = path2 + list[j].toString() + "\\";
                        } else {
                            path2 = path2 + list[j].toString() + "\\" + "web";
                            break;
                        }
                    }
                    String savePath = path2 + "\\images\\" + File.separator + fileName;
                    File fileSaveDir = new File(savePath);
                    part.write(savePath + File.separator);
                    result = CertificateDAO.insertCertificate(cerName, doi, fileName, idEmp, idTypeCer);

                }
                if (result == true) {
                    ss.setAttribute("updateSuccess", "Add success");
                    url = SUCCESS;
                    response.sendRedirect(url);
                } else {
                    ss.setAttribute("updateFail", "Add fail");
                    url = SUCCESS;
                    response.sendRedirect(url);
                }
            } else {
                ArrayList<CertificateDTO> listType = dao.listTypeCertificate();
                request.setAttribute("listTypeCer", listType);
                request.getRequestDispatcher(url).forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String extractFileName(Part part) {//This method will print the file name.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
