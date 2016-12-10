/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataObjects;

import database.Utilities;

/**
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
    
    public User(String userId, String firstName, String lastName, int security_index, String answer, 
            String city, String state) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.security_index = security_index;
        this.answer = answer;
    }
    
    public User(String userId, String username, String password, String email, 
            int security_index, String answer,
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
    }
    
    public User(String firstName, String lastName, int security_index, String answer,
            String city, String state) {
        this.userId = Utilities.generateUUID();
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
        this.security_index = security_index;
        this.answer = answer;
    }
    
    public User(String userId, String username, String password, String email,
            String firstName, String lastName, String city, String state) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.city = city;
        this.state = state;
    }
    
    public String getUserId() {
        return this.userId;
    }
    
    public String getFirstName() {
        return this.firstName; 
    }
    
    public String getLastName() {
        return this.lastName;
    }
    
    public String getCity() {
        return this.city;
    }
    
    public String getState() {
        return this.state;
    }
    
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }
    
    public String getAnswer() {
        return this.answer;
    }
    
    public int getSecurityIndex() {
        return this.security_index;
    }
}
