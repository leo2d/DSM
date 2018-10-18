/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.*;
import dsm.enums.UserProfile;
import dsm.models.*;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class SaveStudentAction implements ICommander {

    private HttpServletRequest _request = null;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        this._request = request;
        StudentDAO sdao = new StudentDAO();
        Student student = null;

        int id = parameterIsValid("student") ? Integer.parseInt(request.getParameter("student")) : 0;

        if (id != 0) {
            student = sdao.getById(id);
        } else if (student == null || id == 0) {
            User user = CreateUser();

            if (parameterIsValid("name")) {
                student = CreateStudent(user);
                sdao.create(student);
                student = sdao.getByUserId(student.getUser().getId());
            }
        }

        if (parameterIsValid("payment")) {

            LessonPlan plan = new LessonPlan();
            plan.setPratical(parameterIsValid("pratica") ? Integer.parseInt(request.getParameter("pratica")) : 0);
            plan.setTheoretical(parameterIsValid("teorica") ? Integer.parseInt(request.getParameter("teorica")) : 0);

            new LessonPlanDAO().create(plan);

            Payment payment = new Payment();
            String value = request.getParameter("value").replace("R$", "");
            payment.setValue(Double.parseDouble(value));
            payment.setIsInstallment(request.getParameter("payment").equals("parcelado"));

            new PaymentDAO().create(payment);

            Registration registration = CreateNewRegistration(student, plan, payment);

            payment.setRegistration(registration);
            plan.setRegistration(registration);

            List<Registration> regs = new RegistrationDAO().getByStudentId(registration.getStudent().getId());

            student.setRegistrations(regs);
            sdao.update(student);
        }

        if (request.getSession().getAttribute("user") != null) {
            new HomeViewAction().execute(request, response);
        } else {
            new LoginViewAction().execute(request, response);
        }
    }

    private boolean parameterIsValid(String parameterName) {
        return _request.getParameter(parameterName) != null && !_request.getParameter(parameterName).isEmpty();
    }

    private User CreateUser() {
        User user = new User(0, _request.getParameter("login"), _request.getParameter("password"), UserProfile.STUDENT);
        UserDAO userDAO = new UserDAO();
        userDAO.create(user);
        user = userDAO.getByLoginAndPassword(user.getLogin(), user.getPassword());

        return user;
    }

    private Student CreateStudent(User user) {
        Student student = student = new Student();
        student.setName(_request.getParameter("name"));
        student.setAddress(_request.getParameter("address"));
        student.setEmail(_request.getParameter("email"));
        student.setUser(user);

        return student;
    }

    private Registration CreateNewRegistration(Student student, LessonPlan plan, Payment payment) {
        Registration registration = new Registration();
        registration.setLessonPlan(plan);
        registration.setPayment(payment);
        registration.setStudent(student);

        RegistrationDAO rdao = new RegistrationDAO();
        rdao.create(registration);

        return registration;
    }
}
