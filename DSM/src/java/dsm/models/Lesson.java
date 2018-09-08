/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import dsm.enums.LessonType;
import java.util.Date;

/**
 *
 * @author leo-r
 */
public class Lesson {
    private int id;
    private LessonType type;
    private Date lessonTime;

    public Lesson() {
    }
    
    public Lesson(int id, LessonType type, Date lessonTime) {
        this.id = id;
        this.type = type;
        this.lessonTime = lessonTime;
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

    public Date getLessonTime() {
        return lessonTime;
    }

    public void setLessonTime(Date lessonTime) {
        this.lessonTime = lessonTime;
    }
    
    
}
