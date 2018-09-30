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
    private Registration registration;
    private int theoretical;//quantidade de aulas teoricas
    private int pratical;

    public LessonPlan() {
    }
    
    public LessonPlan(int id, Registration registration, int theoretical, int pratical) {
        this.id = id;
        this.registration = registration;
        this.theoretical = theoretical;
        this.pratical = pratical;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
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
