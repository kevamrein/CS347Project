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
import java.math.BigDecimal;
import dataObjects.*;
import java.util.*;
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
    
    public static ArrayList<Organization> getOrganizations() {
        ArrayList<Organization> orgList = new ArrayList<>();
        Organization org = null;
        String query = "SELECT * FROM organizations";
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            
            while (set.next()) {
                org = new Organization(set.getString(1), set.getString(2),
                set.getString(3), set.getInt(4));
                orgList.add(org);
            }
            
            set.close();
            db.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        
        return orgList;
    }
    
    public static void addOrganization(Organization org) {
       String query = "INSERT INTO organizations VALUES (?, ?, ?, ?)";
       try {
           db = DatabaseAccess.open();
           PreparedStatement statement = db.prepareStatement(query);
           statement.setString(1, org.getId());
           statement.setString(2, org.getName());
           statement.setString(3, org.getTagline());
           statement.setInt(4, org.getRating());
           
           statement.execute();
           
           db.close();
           statement.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
    }
    
    public static void addInternship(Internship internship) {
       String query = "INSERT INTO internships VALUES (?, ?, ?, ?, ?, ?)";
       try {
           db = DatabaseAccess.open();
           PreparedStatement statement = db.prepareStatement(query);
           statement.setString(1, internship.getId());
           statement.setString(2, internship.getOrganization().getId());
           statement.setString(3, internship.getName());
           statement.setString(4, internship.getDescription());
           statement.setString(5, internship.getGpaRequirement());
           statement.setString(6, internship.getMinClassStanding());
           
           
           statement.execute();
           
           db.close();
           statement.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
    }
    
    public static void addReview(Internship internship, Review review) {
        String query = "INSERT INTO reviews VALUES (?, ?, ?, ?, ?)";
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, internship.getOrganization().getId());
            statement.setString(2, internship.getId());
            statement.setString(3, review.getUser().getUserId());
            statement.setString(4, review.getReviewId());
            statement.setInt(5, review.getRating());
            statement.setString(6, review.getComment());
            
            statement.execute();
            editOrganizationRating(internship.getOrganization());
            db.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Integer> getReviewRatings(Organization org) {
        String query = "SELECT rating FROM reviews WHERE organization_id=?";
        ArrayList<Integer> reviews = new ArrayList<>();
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, org.getId());
            ResultSet set = statement.executeQuery();
            
            while (set.next()) {
                reviews.add(set.getInt(1));
            }
            
            db.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return reviews;
    }
    
    private static void editOrganizationRating(Organization org) {
        String getCurrentRating = "SELECT average_rating FROM organizations WHERE "
                + "organization_id = ?";
        String setNewRating = "UPDATE organizations SET average_rating = ? WHERE "
                + "organization_id = ?";
        double currentRating;
        double newRating;
        int sum = 0;
        
        try {
            
            // Get the current rating for the organization
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(getCurrentRating);
            statement.setString(1, org.getId());
            ResultSet rs = statement.executeQuery();
            rs.next();
            currentRating = rs.getDouble(1);
            rs.close();
            // Get all of the reviews for the organization
            ArrayList<Integer> reviews = getReviewRatings(org);
            
            // Calculate the new rating
            for (Integer i : reviews) {
                sum += i;
            }
            
            newRating = (double)sum / (double)reviews.size();
            
            // Update the rating
            statement = db.prepareStatement(setNewRating);
            statement.setDouble(1, currentRating);
            statement.setString(2, org.getId());
            statement.execute();
            
            db.close();
            statement.close();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static ArrayList<Internship> getInternships(Organization org) {
        ArrayList<Internship> internships = new ArrayList<>();
        Internship internship = null;
        String getInternshipQuery = "SELECT * FROM internships WHERE "
                + "organization_id = ?";
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(getInternshipQuery);
            statement.setString(1, org.getId());
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                internship = new Internship(rs.getString(1), org, 
                rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                internships.add(internship);
            }
            
            db.close();
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return internships;
    }
    
    private static void editUserAccount(User user) {
        String updateUserAccount = "UPDATE user_accounts SET ";
        boolean editUsername = false, editPassword = false, editEmail = false;
        
        if (user.getUsername().length() != 0) {
            //updateUserAccount += "username = ?, "
        }
        //average_rating = ? WHERE " + "organization_id = ?";
        
        try {
            
            // Get the current rating for the organization
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(getCurrentRating);
            statement.setString(1, org.getId());
            ResultSet rs = statement.executeQuery();
            rs.next();
            currentRating = rs.getDouble(1);
            rs.close();
            // Get all of the reviews for the organization
            ArrayList<Integer> reviews = getReviewRatings(org);
            
            // Calculate the new rating
            for (Integer i : reviews) {
                sum += i;
            }
            
            newRating = (double)sum / (double)reviews.size();
            
            // Update the rating
            statement = db.prepareStatement(setNewRating);
            statement.setDouble(1, currentRating);
            statement.setString(2, org.getId());
            statement.execute();
            
            db.close();
            statement.close();
            
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
