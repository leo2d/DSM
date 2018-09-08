/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dsm.models;

import dsm.enums.UserProfile;

/**
 *
 * @author leo-r
 */
public class Employee extends User{
    private int id;
    private String name;

    public Employee(String login, String password) {
        super(login, password, UserProfile.EMPLOYEE);
    
    }

    public Employee(int id, String name, String login, String password, UserProfile profile) {
        super(login, password, profile);
        this.id = id;
        this.name = name;
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
    
}
