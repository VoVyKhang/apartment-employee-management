/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import management.dao.DepartmentDAO;
import management.dto.DepartmentDTO;

/**
 *
 * @author VyNT
 */
public class FilterDepByLocationController extends HttpServlet {

    private final String SUCCESS = "listDep.jsp";
    private final String ERROR = "Hall.jsp";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String url = ERROR;
        try {
            DepartmentDAO dao = new DepartmentDAO();
            String location = request.getParameter("locationDep");
            String txtSearchName = request.getParameter("txtSearchName");
            ArrayList<DepartmentDTO> list = new ArrayList<>();
            if(location == null || txtSearchName == null){
                url=ERROR;
            }else{
                if(location.trim().equals("allDep")){
                    list= dao.getDepNumForAll("", txtSearchName.trim());
                }else{
                    list= dao.getDepNumForAll(location.trim(), txtSearchName.trim());
                }
                if(list.isEmpty()){
                    request.setAttribute("listDep", list);
                    request.setAttribute("SearchRS", "No Match");
                    url=SUCCESS;
                }else{
                    request.setAttribute("listDep", list);
                    url=SUCCESS;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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

}
