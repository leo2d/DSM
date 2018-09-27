/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import dsm.enums.UserProfile;
import javax.persistence.*;

/**
 *
 * @author leo-r
 */
@Entity
public class Student extends User{

    private String email;
    private Address address;
    private LessonPlan lessonPlan;

    public Student() {
    }
    
}
