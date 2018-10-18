/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao.contracts;

import dsm.models.Lesson;
import java.util.List;

/**
 *
 * @author Leonardo
 */
public interface ILessonDAO {

    List<Lesson> getAllByInstructorId(int idInstructor);

    List<Lesson> getAllByRegistrationId(int idRegistration);

    List<Lesson> getAllFree();
}
