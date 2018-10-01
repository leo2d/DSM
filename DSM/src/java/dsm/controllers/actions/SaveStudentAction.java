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

        int id = parameterIsValid("id") ? Integer.parseInt(request.getParameter("id")) : 0;

        User user = new User(id, request.getParameter("login"), request.getParameter("password"), UserProfile.STUDENT);

        UserDAO userDAO = new UserDAO();
        userDAO.create(user);

        user = userDAO.getByLoginAndPassword(user.getLogin(), user.getPassword());

        if (parameterIsValid("name")) {
            Student student = new Student();
            student.setName(request.getParameter("name"));
            student.setAddress(request.getParameter("address"));
            student.setEmail(request.getParameter("email"));
            student.setUser(user);

            StudentDAO sdao = new StudentDAO();
            sdao.create(student);
            
            student = sdao.getByUserId(student.getUser().getId());
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

                Registration registration = new Registration();
                registration.setLessonPlan(plan);
                registration.setPayment(payment);
                registration.setStudent(student);
                
                RegistrationDAO rdao = new RegistrationDAO();
                rdao.create(registration);
                
                payment.setRegistration(registration);
                plan.setRegistration(registration);
                
                List<Registration> regs = rdao.getByStudentId(registration.getStudent().getId());
                
                student.setRegistrations(regs);
                sdao.update(student);
            }
        }

        request.setAttribute("info", "Salvo Com Sucesso");
        request.setAttribute("jsAlertAtivo", true);

        new LoginViewAction().execute(request, response);
    }

    private boolean parameterIsValid(String parameterName) {
        return _request.getParameter(parameterName) != null && !_request.getParameter(parameterName).isEmpty();
    }
}
