/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.InstructorDAO;
import dsm.dao.RegistrationDAO;
import dsm.models.Registration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class StudentsAjaxAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("Pages/PartialViews/SearchStudentsResult.jsp");

        String name = request.getParameter("name");
        List<Registration> result = new RegistrationDAO().getByStudentName(name);
        request.setAttribute("result", result);

        rd.forward(request, response);
    }
}
