/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dsm.models.*;
import dsm.dao.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Leonardo
 */
public class LoginAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String login = request.getParameter("login");
        String password = request.getParameter("password");

        User user = new UserDAO().getByLoginAndPassword(login, password);

        if (user == null) {
            request.setAttribute("message", "Login ou Senha inválidos!");
            new LoginViewAction().execute(request, response);
        } else {
//            Student student = new StudentDAO().getByUserId(user.getId());
//            Employee employee = null;
//            Instructor instructor = null;
//
//            if (student == null) {
//                employee = new EmployeeDAO().getByUserId(user.getId());
//                request.getSession().setAttribute("user", employee);
//                if (employee == null) {
//                    instructor = new InstructorDAO().getByUserId(user.getId());
//                    request.getSession().setAttribute("user", instructor);
//                }
//            }

            request.getSession().setAttribute("user", user);
            HttpSession httpSession = request.getSession();
            new HomeViewAction().execute(request, response);
        }
    }

}
