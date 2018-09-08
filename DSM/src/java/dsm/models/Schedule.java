
package dsm.models;

import java.util.List;
/**
 *
 * @author leo-r
 */
public class Schedule {
    private int id;
    private Instructor instructor;
    private List<Lesson> lessons;

    public Schedule(int id, Instructor instructor, List<Lesson> lessons) {
        this.id = id;
        this.instructor = instructor;
        this.lessons = lessons;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Instructor getInstructor() {
        return instructor;
    }

    public void setInstructor(Instructor instructor) {
        this.instructor = instructor;
    }

    public List<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(List<Lesson> lessons) {
        this.lessons = lessons;
    }

}
