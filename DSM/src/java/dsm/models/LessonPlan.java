/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author leo-r
 */
@Entity
@Table(name = "tb_lesson_plan")
public class LessonPlan implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lesson_plan_id")
    private int id;

    @OneToOne(mappedBy = "lessonPlan")
    private Registration registration;

    @Column(name = "lesson_plan_theoretical")
    private int theoretical;//quantidade de aulas teoricas

    @Column(name = "lesson_plan_preatical")
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
