/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.RegistrationDAO;
import dsm.enums.UserProfile;
import dsm.models.Registration;
import dsm.models.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leo-r
 */
public class AssignLessonAction implements ICommander {

    private HttpServletRequest _request;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        this._request = request;
        User user = (User) _request.getSession().getAttribute("user");

        boolean idIsValid = _request.getSession().getAttribute("registration") != null;

        if (!idIsValid) {
            new SelectStudentRegistrationsViewACtion().execute(request, response);
        } else {
//            Registration registration = new RegistrationDAO()
//                    .getById(Integer.parseInt(_request.getParameter("registration")));
            //   registration.getLessons().add();
        }
    }

}
