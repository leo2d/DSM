/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers;

import dsm.contracts.ICommander;
import dsm.controllers.actions.*;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
@WebServlet(name = "CentralController", urlPatterns = {"/CentralController", "/Central", "/Ctrl", "",})
public class CentralController extends HttpServlet {

    static HashMap<String, ICommander> actions = new HashMap<>();

    static {
        actions.put(null, new HomeViewAction());
        actions.put("", new HomeViewAction());
        actions.put("home", new HomeViewAction());
        actions.put("loginPage", new LoginViewAction());
        actions.put("login", new LoginAction());
        actions.put("logout", new LogoutAction());
        actions.put("preregistration", new PreregistrationViewAction());
        actions.put("studentRegistration", new StudentRegistrationViewAction());
        actions.put("saveStudent", new SaveStudentAction());
        actions.put("createLesson", new CreateLessonViewAction());
        actions.put("getStudentsAjax", new StudentsAjaxAction());
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("ac");

        try {
            if (!actions.containsKey(action)) {
                response.getWriter().print("<h1>ERRO: </h1><h2>Ação não Encontrada</h2>");
            }
            actions.get(action).execute(request, response);
        } catch (Exception ex) {
            response.getWriter().print("<h1>ERROR: </h1><h2>" + ex.getMessage() + "</h2>");
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
