package dsm.models;

import javax.persistence.*;

@Entity
public class Instructor extends User {

    private Schedule schedule;

    public Instructor() {
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
}
