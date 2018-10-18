/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.controllers.actions;

import dsm.contracts.ICommander;
import dsm.dao.LessonDAO;
import dsm.models.Lesson;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Leonardo
 */
public class EditLessonViewAction implements ICommander {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        int lessonId = Integer.parseInt(request.getParameter("lesson"));

        Lesson lesson = new LessonDAO().getById(lessonId);

        request.setAttribute("Selectedlesson", lesson);

        RequestDispatcher rd = request.getRequestDispatcher("page.jsp?page=authorize/EditLesson");
        rd.forward(request, response);

    }

}
