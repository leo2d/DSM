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
public class User {

    protected String login;
    protected String password;
    protected UserProfile profile;

    protected User(String login, String password, UserProfile profile) {
        this.login = login;
        this.password = password;
        this.profile = profile;
    }


    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserProfile getProfile() {
        return profile;
    }
}
