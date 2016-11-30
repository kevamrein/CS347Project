/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.UUID;

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
    
    public static boolean isValidState(String state) {
        if (state != null) 
            return state.length() == 2;
        return false;
    }
    
    public static boolean isValidCity(String city) {
        if (city != null) {
            return true;
        }
        return false;
    }
}
