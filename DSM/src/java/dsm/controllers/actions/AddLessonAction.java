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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;
import java.util.stream.Stream;
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
            String message = "";

            if (parameterIsValid("student")) {

                Registration registration = new RegistrationDAO().getById(Integer.parseInt(request.getParameter("student")));

                if (lessonIsValid(type, registration)) {
                    registration.getLessons().add(lesson);
                    lesson.setRegistration(registration);
                } else {
                    message = type.equals(LessonType.PRATICAL)
                            ? "Aluno nao aprovado na prova e/ou ainda nao fez todas as aulas teoricas."
                            + " Esta aula foi cadastrada sem nenhum aluno associado. "
                            : "Não é possivel associar mais aulas teoricas para este aluno"
                            + " Aluno já fez todas as aulas teóricas do pacote Esta aula foi cadastrada sem nenhum aluno associado. ";
                }
            }

            new LessonDAO().create(lesson);

            if (message.isEmpty()) {
                message = lesson.getRegistration() != null
                        ? "Aula " + lesson.getType() + " cadastrada com sucesso para o aluno " + lesson.getRegistration().getStudent().getName() + "!"
                        : "Aula cadastrada sem nenhum aluno associado. ";
            }

            request.setAttribute("hasAlert", true);
            request.setAttribute("alertMessage", message);
            new CreateLessonViewAction().execute(request, response);
        }
    }

    private boolean parameterIsValid(String parameterName) {
        return _request.getParameter(parameterName) != null && !_request.getParameter(parameterName).isEmpty();
    }

    private boolean lessonIsValid(LessonType type, Registration registration) {
//        List<Lesson> pratic = registration.getLessons().stream()
//                .filter(x -> x.getType().equals(LessonType.PRATICAL))
//                .collect(Collectors.toList());

        List<Lesson> pratic = new ArrayList();
        List<Lesson> teor = new ArrayList();
        for (Lesson x : registration.getLessons()) {
            if (x.getType() == LessonType.PRATICAL) {
                pratic.add(x);
            } else if (x.getType() == LessonType.THEORETICAL) {
                teor.add(x);
            }
        }
//        List<Lesson> pratic = temp.stream()
//                .filter(x -> x.getType() == LessonType.PRATICAL)
//                //.collect(Collectors.<Lesson>toList());
//                //.map(Lesson::new)
//                .collect(Collectors.toCollection(ArrayList::new));
//
//        List<Lesson> teor = registration.getLessons().stream()
//                .filter(x -> x.getType().equals(LessonType.THEORETICAL))
//                .collect(Collectors.toList());

        if (type.equals(LessonType.THEORETICAL)
                && teor.size() < registration.getLessonPlan().getTheoretical()) {
            return true;
        } else if (type.equals(LessonType.PRATICAL) && registration.isWasApproved()
                && teor.size() >= registration.getLessonPlan().getTheoretical()) {
            return true;
        }

        return false;
    }
}
