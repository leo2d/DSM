/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

/**
 *
 * @author leo-r
 */
public class LessonPlan {
    private int id;
    private Student student;
    private int theoretical;//quantidade de aulas teoricas
    private int pratical;

    public LessonPlan(int id, Student student, int theoretical, int pratical) {
        this.id = id;
        this.student = student;
        this.theoretical = theoretical;
        this.pratical = pratical;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public int getTheoretical() {
        return theoretical;
    }

    public void setTheoretical(int theoretical) {
        this.theoretical = theoretical;
    }

    public int getPratical() {
        return pratical;
    }

    public void setPratical(int pratical) {
        this.pratical = pratical;
    }
    
    
}
