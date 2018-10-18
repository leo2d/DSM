/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.dao.contracts;

import dsm.models.Student;
import java.util.List;

/**
 *
 * @author Leonardo
 */
public interface IStudentDAO {
    List<Student> getByName(String name);
}
