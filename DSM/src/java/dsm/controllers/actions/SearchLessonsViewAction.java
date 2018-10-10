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
import dsm.enums.UserProfile;
import dsm.models.Instructor;
import dsm.models.Lesson;
import dsm.models.Registration;
import dsm.models.Student;
import dsm.models.User;
import static java.lang.System.gc;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class SearchLessonsViewAction implements ICommander {

    private HttpServletRequest _request;

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        this._request = request;
        User user = (User) _request.getSession().getAttribute("user");

        boolean idIsValid = _request.getParameter("registration") != null && !_request.getParameter("registration").isEmpty();
        boolean userIsVerified = false;
        if (user != null) {
            userIsVerified = user.getProfile().equals(UserProfile.STUDENT);
        }

        if (!idIsValid && userIsVerified) {
            new SelectStudentRegistrationsViewACtion().execute(request, response);
        } else {

            List<Lesson> lessons = getLessons();

            List<Lesson> sortedLessons = lessons.stream()
                    .sorted(Comparator.comparing(Lesson::getLessonDate))
                    .collect(Collectors.toList());

            request.setAttribute("lessons", sortedLessons.size() > 1 ? sortedLessons : lessons);

            List<Lesson> finalLessons = (List<Lesson>) request.getAttribute("lessons");

            if (user != null) {
                if (finalLessons.size() < 1 && user.getProfile() == UserProfile.STUDENT) {
                    request.setAttribute("message", "Você não pode fazer nenhuma aula.\n Procure um atendente na autoescola.");
                }
            }

            RequestDispatcher rd = request.getRequestDispatcher("page.jsp?page=Lessons");
            rd.forward(request, response);
        }
    }

    private List<Lesson> getLessons() {
        User user = (User) _request.getSession().getAttribute("user");
        if (user != null) {
            if (user.getProfile() == UserProfile.EMPLOYEE) {
                return new LessonDAO().getAll();
            } else if (user.getProfile() == UserProfile.INSTRUCTOR) {
                Instructor instructor = new InstructorDAO().getByUserId(user.getId());
                return instructor.getSchedule();
            } else if (user.getProfile() == UserProfile.STUDENT) {
                Registration registration = new RegistrationDAO().getById(Integer.parseInt(_request.getParameter("registration")));
                _request.getSession().setAttribute("registration", registration);
                return GetLessonsThatRegistrationCanDo(registration);
            }

        } else {
            return new LessonDAO().getAllFree();
        }
        return new ArrayList<Lesson>();
    }

    private List<Lesson> GetLessonsThatRegistrationCanDo(Registration registration) {

        List<Lesson> pratic = new ArrayList();
        List<Lesson> teor = new ArrayList();

        for (Lesson x : registration.getLessons()) {
            if (x.getType() == LessonType.PRATICAL) {
                pratic.add(x);
            } else if (x.getType() == LessonType.THEORETICAL) {
                teor.add(x);
            }
        }

        List<Lesson> free = new LessonDAO().getAllFree();
        List<Lesson> freeTeor = new ArrayList<Lesson>();
        List<Lesson> freePrat = new ArrayList<Lesson>();

        free.forEach(x -> {
            if (x.getType().equals(LessonType.PRATICAL)) {
                freePrat.add(x);
            } else if (x.getType().equals(LessonType.THEORETICAL)) {
                freeTeor.add(x);
            }
        });

        List<Lesson> studentCanDo = new ArrayList();

        if (teor.size() < registration.getLessonPlan().getTheoretical()) {
            studentCanDo.addAll(freeTeor);
        }
        if (registration.isWasApproved() && teor.size() >= registration.getLessonPlan().getTheoretical()
                && pratic.size() < registration.getLessonPlan().getPratical()) {
            studentCanDo.addAll(freePrat);
        }

        return studentCanDo;
    }
}
