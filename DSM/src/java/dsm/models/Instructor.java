package dsm.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "tb_instructor")
public class Instructor implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "instructor_id")
    private int id;

    @Column(name = "instructor_name", length = 100)
    private String name;

    @OneToMany(mappedBy = "instructor")
    private List<Lesson> schedule;

    @OneToOne
    private User user;

    public Instructor() {
        this.schedule = new ArrayList<Lesson>();
    }

    public Instructor(int id, String name, List<Lesson> schedule, User user) {
        this.id = id;
        this.name = name;
        this.schedule = schedule;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Lesson> getSchedule() {
        return schedule;
    }

    public void setSchedule(List<Lesson> schedule) {
        this.schedule = schedule;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    
}
