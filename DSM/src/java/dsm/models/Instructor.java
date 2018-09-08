package dsm.models;

import dsm.enums.UserProfile;

/**
 *
 * @author leo-r
 */
public class Instructor extends User{
    private int id;
    private String name;
    private Schedule schedule;

    public Instructor(int id, String name, Schedule schedule, String login, String password) {
        super(login, password, UserProfile.INSTRUCTOR);
        this.id = id;
        this.name = name;
        this.schedule = schedule;
    }
  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
        
}