/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.InstructorDAO;
import dsm.dao.LessonDAO;
import dsm.dao.RegistrationDAO;
import dsm.dao.StudentDAO;
import dsm.enums.LessonType;
import dsm.models.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class AddLessonAction implements ICommander {

    private HttpServletRequest _request = null;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        this._request = request;

        if (parameterIsValid("instructor") && parameterIsValid("lessonType") && parameterIsValid("data")) {

            int idIntructor = Integer.parseInt(request.getParameter("instructor"));
            Instructor instructor = new InstructorDAO().getById(idIntructor);

            LessonType type = LessonType.valueOf(request.getParameter("lessonType"));

            DateFormat format = new SimpleDateFormat("d/MM/yyyy", Locale.ROOT);
            Date date = format.parse(request.getParameter("data"));
            date.setHours(Integer.parseInt(request.getParameter("hour")));

            Lesson lesson = new Lesson(0, type, date, 0, instructor);

            if (parameterIsValid("student")) {

                Registration registration = new RegistrationDAO().getById(Integer.parseInt(request.getParameter("student")));

                registration.getLessons().add(lesson);
                lesson.setRegistration(registration);
            }

            new LessonDAO().create(lesson);
        }
        
        request.setAttribute("hasAlert", true);
        request.setAttribute("alertMessage", "Aula cadastrada com sucesso!");
        new CreateLessonViewAction().execute(request, response);
    }

    private boolean parameterIsValid(String parameterName) {
        return _request.getParameter(parameterName) != null && !_request.getParameter(parameterName).isEmpty();
    }
}
