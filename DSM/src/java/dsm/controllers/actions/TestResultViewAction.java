/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.RegistrationDAO;
import dsm.dao.StudentDAO;
import dsm.models.Registration;
import dsm.models.Student;
import dsm.models.User;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class TestResultViewAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        RequestDispatcher rd = request.getRequestDispatcher("page.jsp?page=PartialViews/SearchStudentsResult");

        User user = (User) request.getSession().getAttribute("user");

        Student student = new StudentDAO().getByUserId(user.getId());

        List<Registration> result = student.getRegistrations();

        request.setAttribute("result", result);

        rd.forward(request, response);
    }

}
