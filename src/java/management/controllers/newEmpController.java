/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package management.controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import management.dao.EmployeeDAO;
import management.regex.RegexEmp;

/**
 *
 * @author lehon
 */
@MultipartConfig
public class newEmpController extends HttpServlet {

    private static final String DONE = "createNewEmp.jsp";
    private static final String PATH_IMG = "E:\\COURSE_5\\SWP391\\Demo\\apartment-employee-management\\web\\images\\";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "error.jsp";
        try ( PrintWriter out = response.getWriter()) {
            String name = request.getParameter("empname");
            String address = request.getParameter("empadd");
            String age = request.getParameter("empage");
            String gender = request.getParameter("empgen");
            String phone = request.getParameter("empphone");
            String dob = request.getParameter("empdob");

            String iddep = request.getParameter("empdep");
            String idpos = request.getParameter("emppos");
            String email = request.getParameter("empmail");
            String password = request.getParameter("emppass");

            Part part = request.getPart("empimg");
            String fileName = extractFileName(part);
            boolean checkInsert = false;

            if (RegexEmp.chekcEmpFieldNull(name, address, age, phone, dob, email, password)) {
                url = DONE;
                request.setAttribute("WARNINGFIELD", "You have not filled in the information completely");
            } else {
                if (RegexEmp.checkEmpValidation(name, address, age, phone, dob, email, password)) {

                    if (!fileName.isEmpty() || !fileName.equals("")) {
                        String savePath = PATH_IMG + File.separator + fileName;
                        File fileSaveDir = new File(savePath);
                        part.write(savePath + File.separator);
                    } else {
                        fileName = "...";
                    }

                    try {
                        checkInsert = EmployeeDAO.inserNewEmp(name, address, age, gender, phone, dob, fileName, iddep, idpos, email, password);
                    } catch (SQLException ex) {
                        Logger.getLogger(newEmpController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (checkInsert) {
                        request.setAttribute("COMPLETED", "Successful");
                        url = DONE;
                        request.getRequestDispatcher(url).forward(request, response);
                    } else {
                        request.getRequestDispatcher(url).forward(request, response);
                    }

                } else {
                    url = DONE;
                    if (RegexEmp.checkEmpName(name) == false) {
                        request.setAttribute("WARNINGNAME", "Names contains only letters and space and can be between 4 and 30 characters long");
                    }

                    if (RegexEmp.checkEmpAddress(address) == false) {
                        request.setAttribute("WARNINGADD", "Address between 5 and 40 characters long");
                    }

                    if (RegexEmp.checkAge(age) == false) {
                        request.setAttribute("WARNINGAGE", "Age contain only letters and between 15 and 65");
                    }

                    if (RegexEmp.checkPhone(phone) == false) {
                        request.setAttribute("WARNINGPHONE", "Phone contain only letters and length 5 to 15");
                    }

                    if (RegexEmp.checkValidationDob(dob) == false) {
                        request.setAttribute("WARNINGDOB", "Choose a birthday from today or earlier");
                    }

                    if (RegexEmp.checkValidEmail(email) == false) {
                        request.setAttribute("WARNINGMAIL", "Enter following format someone@fpt.edu.vn and length 12 to 30");
                    }

                    if (RegexEmp.checkMailNotExist(email) == false) {
                        request.setAttribute("WARNINGMAILS", "This email already exists");
                    }

                    if (RegexEmp.checkValidPass(password) == false) {
                        request.setAttribute("WARNINGPASS", "Password length 8 to 25");
                    }
                }
            }

            request.setAttribute("namereg", name);
            request.setAttribute("addreg", address);
            request.setAttribute("agereg", age);
            request.setAttribute("genreg", gender);
            request.setAttribute("phonereg", phone);
            request.setAttribute("dobreg", dob);
            request.setAttribute("depreg", iddep);
            request.setAttribute("posreg", idpos);
            request.setAttribute("emailreg", email);
            request.setAttribute("passreg", password);
            request.getRequestDispatcher(url).forward(request, response);
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
