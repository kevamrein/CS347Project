/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import java.util.regex.Pattern;

/**
 *
 * @author kevinamrein
 */
public class Utilities {
    /**
     * Generates random UUID
     * @return String representing random UUID
     */
    public static String generateUUID() {
        return UUID.randomUUID().toString();
    }
    
    /**
     * Checks if the email contains both '@' and '.' and that these characters
     * do not start or end the String.
     * 
     * @param email Email to validate
     * @return true if email is valid
     */
    public static boolean isValidEmail(String email) {        
        if (email.contains("@") && email.contains(".")) {
            if (!email.startsWith("@") && !email.endsWith("@") && 
                    !email.startsWith(".") && !email.endsWith(".")) {
                return true;
            }
        }
        return false;
    }
    
    /**
     * Checks username to ensure that it starts with a lowercase letter
     * and only contains either lowercase letters or numbers
     * @param username username to check
     * @return true if the username is valid
     */
    public static boolean isValidUsername(String username) {
        if (username == null || username.length() < 3) {
            return false;
        }
        
        if (!Pattern.matches("^[a-z][a-z0-9]*$", username)) {
            return false;
        }
            
        return true;
    }
    
    /**
     * Checks password to make sure it contains uppercase letters, lowercase
     * letters, 0-9 or !, @, #, $, *.
     * @param password password to check
     * @return true if password is correct
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 6) {
            return false;
        }
        
        if (!Pattern.matches("^[a-zA-Z0-9!@#$*]*$", password)) {
            return false;
        }

        return true;
    }
    
    /**
     * Valid two character state code
     * @param state 2 character state id
     * @return true if state is valid
     */
    public static boolean isValidState(String state) {
        if (state != null) 
            return state.length() == 2;
        return false;
    }
    
    /**
     * Makes sure city is not null
     * @param city String city
     * @return true if city is not null
     */
    public static boolean isValidCity(String city) {
        if (city != null) {
            return true;
        }
        return false;
    }
    
    /**
     * Checks that parameter is either Freshman, Sophomore, Junior, Senior, or None.
     * @param classStanding Stirng
     * @return true if classStanding is one of the above options
     */
    public static boolean isValidClassStanding(String classStanding) {
        switch (classStanding) {
            case ("Freshman"):
                return true;
            case ("Sophomore"):
                return true;
            case ("Junior"):
                return true;
            case ("Senior"):
                return true;
            case ("None"):
                return true;
            default:
                return false;
        }
    }
    
    /**
     * Does md5 hash on passed password
     * @param password 
     * @return hashed password
     */
    public static String hashPassword(String password) {
       String digest;
       try {
           MessageDigest md = MessageDigest.getInstance("md5");
           md.reset();
           byte[] bytes = md.digest(password.getBytes());
           digest = new BigInteger(1, bytes).toString(16);
       }
       catch (NoSuchAlgorithmException nsae) {
           nsae.printStackTrace();
           digest = null;
       }
       return digest;
  }
}
