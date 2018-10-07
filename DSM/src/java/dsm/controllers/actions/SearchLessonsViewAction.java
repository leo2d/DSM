/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.InstructorDAO;
import dsm.dao.LessonDAO;
import dsm.dao.StudentDAO;
import dsm.enums.UserProfile;
import dsm.models.Instructor;
import dsm.models.Lesson;
import dsm.models.Registration;
import dsm.models.Student;
import dsm.models.User;
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

        List<Lesson> lessons = getLessons();

        List<Lesson> sortedLessons = lessons.stream()
                .sorted(Comparator.comparing(Lesson::getLessonDate))
                .collect(Collectors.toList());

        request.setAttribute("lessons", sortedLessons.size() > 1 ? sortedLessons : lessons);

        RequestDispatcher rd = request.getRequestDispatcher("page.jsp?page=Lessons");
        rd.forward(request, response);

    }

    private List<Lesson> getLessons() {
        User user = (User) _request.getSession().getAttribute("user");
        if (user != null) {
            if (user.getProfile() == UserProfile.EMPLOYEE) {
                return new LessonDAO().getAll();
            } else if (user.getProfile() == UserProfile.INSTRUCTOR) {
                Instructor instructor = new InstructorDAO().getByUserId(user.getId());
                return instructor.getSchedule();
            }
//            } else if (user.getProfile() == UserProfile.STUDENT) {
//                Student student = new StudentDAO().getByUserId(user.getId());
//                Registration registration = student.getRegistrations().stream()
//                        .findFirst()
//                        .get();
//                return new LessonDAO().getAllByRegistrationId(registration.getId());
//            }
        } else {
            return new LessonDAO().getAllFree();
        }
        return new ArrayList<Lesson>();
    }
}
