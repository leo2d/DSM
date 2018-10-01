/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Leonardo
 */
@Entity
@Table(name = "tb_registration")
public class Registration implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "registration_id")
    private int id;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @OneToOne
    private LessonPlan lessonPlan;

    @OneToOne
    private Payment payment;

    @OneToMany(mappedBy = "registration")
    private List<Lesson> lessons;

    public Registration() {
        this.lessons = new ArrayList<Lesson>();
    }

    public Registration(int id, Student student, LessonPlan lessonPlan, Payment payment, List<Lesson> lessons) {
        this.id = id;
        this.student = student;
        this.lessonPlan = lessonPlan;
        this.payment = payment;
        this.lessons = lessons;
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

    public LessonPlan getLessonPlan() {
        return lessonPlan;
    }

    public void setLessonPlan(LessonPlan lessonPlan) {
        this.lessonPlan = lessonPlan;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

}
