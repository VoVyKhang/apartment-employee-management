/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package management.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import management.dao.EmployeeDAO;
import management.dto.EmployeeDTO;
import management.regex.RegexEmp;

/**
 *
 * @author lehon
 */
@MultipartConfig
public class UpdateEmpInfoController extends HttpServlet {

    private static final int DEFAULT_BUFFER_SIZE = 8192;
    private static final String URL_SAVE_IMAGE = "/images/";
    private static String RETURN = "updateEmpInfo.jsp";
    private static final String DONE_UPDATE = "mainController?action=accountInfo";
    private static final String PATH_IMG = "E:\\COURSE_5\\SWP391\\Demo\\apartment-employee-management\\web\\images\\";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "error.jsp";
        try ( PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            String idemp = request.getParameter("idemp");
            String name = request.getParameter("empname");
            String address = request.getParameter("empadd");
            String gender = request.getParameter("empgen");
            String phone = request.getParameter("empphone");
            String dob = request.getParameter("empdob");
            String oldimg = request.getParameter("oldimg");
            Part part = request.getPart("empimg");
            String fileName = extractFileName(part);
            boolean checkUpdate = false;

            if (RegexEmp.checkFieldNullUpdate(name, address, phone, dob)) {
                url = RETURN;
                request.setAttribute("WARNINGFIELD", "You have not filled in the information completely");
            } else {
                if (RegexEmp.checkEmpValidationUpdate(name, address, phone, dob)) {

                    if (!fileName.isEmpty() || !fileName.equals("")) {
                        //Remove old file image
                        File deletefile = new File(PATH_IMG + oldimg);
                        deletefile.delete();

                        //Add new file image
                        writeImage(request, fileName, part);
                        String savePath = PATH_IMG + File.separator + fileName;
                        File fileSaveDir = new File(savePath);
                        part.write(savePath + File.separator);

                        //Update with new image
                        try {
                            checkUpdate = EmployeeDAO.UpdateEmpImg(name, address, gender, phone, dob, fileName, idemp);
                        } catch (SQLException ex) {
                            Logger.getLogger(updateEmpController.class.getName()).log(Level.SEVERE, null, ex);
                        }

                    } else {

                        try {
                            checkUpdate = EmployeeDAO.UpdateEmpNoImg(name, address, gender, phone, dob, idemp);
                        } catch (SQLException ex) {
                            Logger.getLogger(updateEmpController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }

                    if (checkUpdate) {
                        request.setAttribute("COMPLETED", "Successful");
                        EmployeeDTO empOld= (EmployeeDTO) session.getAttribute("USER_LOGGIN");
                        try{
                        EmployeeDTO empNew = EmployeeDAO.getEmpByEmail(empOld.getEmail());
                        session.setAttribute("USER_LOGGIN", empNew);
                        }catch(SQLException e){
                            e.printStackTrace();
                        }
                        url = DONE_UPDATE;
                    }
                } else {
                    url = RETURN;
                    if (RegexEmp.checkEmpName(name) == false) {
                        request.setAttribute("WARNINGNAME", "Names contains only letters and space and can be between 4 and 30 characters long");
                    }

                    if (RegexEmp.checkEmpAddress(address) == false) {
                        request.setAttribute("WARNINGADD", "Address between 5 and 40 characters long");
                    }


                    if (RegexEmp.checkPhone(phone) == false) {
                        request.setAttribute("WARNINGPHONE", "Phone contain only letters and length 5 to 15");
                    }

                    if (RegexEmp.checkValidationDob(dob) == false) {
                        request.setAttribute("WARNINGDOB", "Choose a birthday from today or earlier");
                    }

                }
            }

            if (!url.equals(DONE_UPDATE)) {
                request.setAttribute("namereg", name);
                request.setAttribute("addreg", address);
                request.setAttribute("genreg", gender);
                request.setAttribute("phonereg", phone);
                request.setAttribute("dobreg", dob);
                request.setAttribute("imgreg", oldimg);
                request.setAttribute("idreg", idemp);
            }
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
public static void writeImage(HttpServletRequest request, String imageName, Part filePart) throws IOException, ServletException {
        InputStream fileContent = filePart.getInputStream();
        String path = request.getServletContext().getRealPath("/");
        FileOutputStream fos = new FileOutputStream(path + URL_SAVE_IMAGE + imageName, false);

        try {
            int read;
            byte[] bytes = new byte[DEFAULT_BUFFER_SIZE];
            while ((read = fileContent.read(bytes)) != -1) {
                fos.write(bytes, 0, read);
            }
        } finally {
            if (fos != null) {
                fos.close();
            }
            if (fileContent != null) {
                fileContent.close();
            }
        }

    }
}
