/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import dsm.enums.LessonType;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

/**
 *
 * @author leo-r
 */
@Entity
@Table(name = "tb_lesson")
public class Lesson implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lesson_id")
    private int id;

    @Enumerated(EnumType.STRING)
    @Column(name = "lesson_type")
    private LessonType type;

    @Temporal(TemporalType.DATE)
    @Column(name = "lesson_date")
    private Date lessonDate;

    @Column(name = "lesson_price")
    private double price;

    @ManyToOne
    @JoinColumn(name = "registration_id")
    private Registration registration;

    //@Basic(optional = false)
    @ManyToOne
    @JoinColumn(name = "instructor_id")
    private Instructor instructor;

    public Lesson() {
    }

    public Lesson(int id, LessonType type, Date lessonDate, double price, Instructor instructor) {
        this.id = id;
        this.type = type;
        this.lessonDate = lessonDate;
        this.price = price;
        this.instructor = instructor;
    }

    public Lesson(int id, LessonType type, Date lessonDate, double price, Registration registration, Instructor instructor) {
        this.id = id;
        this.type = type;
        this.lessonDate = lessonDate;
        this.price = price;
        this.registration = registration;
        this.instructor = instructor;
    }

    public Registration getRegistration() {
        return registration;
    }

    public void setRegistration(Registration registration) {
        this.registration = registration;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LessonType getType() {
        return type;
    }

    public void setType(LessonType type) {
        this.type = type;
    }

    public Date getLessonDate() {
        return lessonDate;
    }

    public void setLessonDate(Date lessonDate) {
        this.lessonDate = lessonDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
