/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
/**
 *
 * @author kevinamrein
 */
public class Query {
    private static Connection db;
    
    public static void insertUser(String username, String password, String email, 
            String firstName, String lastName, String city, String state) {
        String userId = Utilities.generateUUID();
        String userAccountsInsert = "INSERT INTO user_accounts VALUES (?, ?, ?, ?);";
        String userInfoInsert = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?);";
        try {
            if (Utilities.isValidEmail(email) && Utilities.isValidCity(city) && Utilities.isValidState(state)) {
                db = DatabaseAccess.open();
                PreparedStatement statement = db.prepareStatement(userAccountsInsert);
                statement.setString(1, userId);
                statement.setString(2, username);
                statement.setString(3, password);
                statement.setString(4, email);
                
                statement.execute();
                
                statement = db.prepareStatement(userInfoInsert);
                statement.setString(1, userId);
                statement.setString(2, firstName);
                statement.setString(3, lastName);
                statement.setString(4, city);
                statement.setString(5, state);
                
                statement.execute();
                
                db.close();
                statement.close();
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }  
    }
    
    //public static ArrayList<>
}
