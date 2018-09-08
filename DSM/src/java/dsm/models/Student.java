/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import dsm.enums.UserProfile;

/**
 *
 * @author leo-r
 */
public class Student extends User{
    private int id;
    private String name;
    private String email;
    private Address address;
    private LessonPlan lessonPlan;

    public Student(String login, String password) {
        super(login, password, UserProfile.STUDENT);
    }

    public Student(int id, String name, String email, Address address, LessonPlan lessonPlan, String login, String password) {
        super(login, password, UserProfile.STUDENT);
        this.id = id;
        this.name = name;
        this.email = email;
        this.address = address;
        this.lessonPlan = lessonPlan;
    }
    
    
}
