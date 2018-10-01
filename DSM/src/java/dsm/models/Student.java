/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import javax.persistence.*;
import java.util.*;
import dsm.enums.UserProfile;
import java.io.Serializable;

/**
 *
 * @author leo-r
 */
@Entity
@Table(name = "tb_student")
public class Student implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "student_id")
    private int id;

    @Column(name = "student_name", length = 100)
    private String name;

    @OneToOne
    private User user;

    @Column(name = "student_email", length = 100)
    private String email;

    @Column(name = "student_address", length = 255)
    private String address;

    @OneToMany(mappedBy = "student")
    private List<Registration> registrations;

    public Student() {
    }

    public int getId() {
        return id;
    }

    public Student(int id, String name, User user, String email, String address, List<Registration> registrations) {
        this.id = id;
        this.name = name;
        this.user = user;
        this.email = email;
        this.address = address;
        this.registrations = registrations;
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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<Registration> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(List<Registration> registrations) {
        this.registrations = registrations;
    }

}
