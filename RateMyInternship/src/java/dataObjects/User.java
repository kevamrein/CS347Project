/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataObjects;

import database.Utilities;

/**
 * Object to represent each user in a database.
 * 
 * @author kevinamrein
 */
public class User {
    private String userId;
    private String username;
    private String password;
    private String email;
    private String firstName;
    private String lastName;
    private String city;
    private String state;
    private int security_index;
    private String answer;
    private boolean isAdmin;
    
    public User(String userId, String firstName, String lastName, int security_index, String answer, 
            String city, String state, boolean isAdmin) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.security_index = security_index;
        this.answer = answer;
        this.isAdmin = isAdmin;
    }
    
    public User(String userId, String username, String password, String email, 
            int security_index, String answer, boolean isAdmin,
            String firstName, String lastName, String city, String state) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.security_index = security_index;
        this.answer = answer;
        this.isAdmin = isAdmin;
    }
    
    public User(String firstName, String lastName, int security_index, String answer,
            String city, String state, boolean isAdmin) {
        this.userId = Utilities.generateUUID();
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.security_index = security_index;
        this.answer = answer;
        this.isAdmin = isAdmin;
    }
    
    public User(String userId, String username, String password, String email,
            String firstName, String lastName, String city, String state, boolean isAdmin) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.isAdmin = isAdmin;
    }
    
    /**
     * Get the user_id
     * @return user_id
     */
    public String getUserId() {
        return this.userId;
    }
    
    /**
     * Get first name
     * @return first name
     */
    public String getFirstName() {
        return this.firstName; 
    }
    
    /**
     * Get last name
     * @return last name
     */
    public String getLastName() {
        return this.lastName;
    }
    
    /**
     * Get city
     * @return city
     */
    public String getCity() {
        return this.city;
    }
    
    /**
     * Get state
     * @return state
     */
    public String getState() {
        return this.state;
    }
    
    /**
     * Get username
     * @return username
     */
    public String getUsername() {
        return username;
    }
    
    /**
     * Get password
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Get email
     * @return email
     */
    public String getEmail() {
        return email;
    }
    
    /**
     * Get answer to security question
     * @return question
     */
    public String getAnswer() {
        return this.answer;
    }
    
    /**
     * Get index into security question array
     * @return index
     */
    public int getSecurityIndex() {
        return this.security_index;
    }
    
    /**
     * Returns whether this use is an admin or not
     * @return true is user is an admin
     */
    public boolean getIsAdmin() {
        return this.isAdmin;
    }
}
