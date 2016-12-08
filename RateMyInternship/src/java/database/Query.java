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
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;
/**
 *
 * @author kevinamrein
 */
public class Query {
    private static Connection db;
    
    public static String insertUser(String username, String password, String email,
            String firstName, String lastName, String city, String state) {
        String userId = Utilities.generateUUID();
        String userAccountsInsert = "INSERT INTO user_accounts VALUES (?, ?, ?, ?);";
        String userInfoInsert = "INSERT INTO user_info VALUES (?, ?, ?, ?, ?);";

        try {
            if (!Utilities.isValidEmail(email)) {
                return "Error: Email is not in a valid format";
            } else if (!Utilities.isValidUsername(username)) {
                return "Error: Username is not in a valid format";
            } else if (!Utilities.isValidPassword(password)) {
                return "Error: Password is not in a valid format";
            } else if (!Utilities.isValidCity(city)) {
                return "Error: City is not in a valid format";
            } else if (!Utilities.isValidState(state)) {
                return "Error: State is not in a valid format";
            } else {
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

                return "Successfully inserted user";
            }
        } catch (SQLException e) {
            return "Error: " + e.getMessage();
        }
    }
    
    public static User getUser(String user_id) {
        String query = "SELECT * FROM user_accounts AS ua JOIN user_info AS ui ON ua.user_id=ui.user_id "
                + "WHERE ua.user_id = ?";
        User user = null;
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, user_id);
            ResultSet set = statement.executeQuery();
            
            set.next();
            user = new User(set.getString(1), set.getString(2), set.getString(3), set.getString(4), 
            set.getString(6), set.getString(7), set.getString(8), set.getString(9));
            
            set.close();
            db.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return user;        
    }
    
    public static User getUserCreds(String username) {
        String query = "SELECT * FROM user_accounts AS ua JOIN user_info AS ui ON ua.user_id=ui.user_id "
                + "WHERE ua.username = ?";
        User user = null;
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, username);
            ResultSet set = statement.executeQuery();
            
            set.next();
            user = new User(set.getString(1), set.getString(2), set.getString(3), set.getString(4), 
            set.getString(6), set.getString(7), set.getString(8), set.getString(9));
            
            set.close();
            db.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        return user;        
    }
    
    public static ArrayList<Organization> getOrganizations() {
        ArrayList<Organization> orgList = new ArrayList<>();
        Organization org = null;
        String query = "SELECT * FROM organizations ORDER BY organization_name";
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            
            while (set.next()) {
                org = new Organization(set.getString(1), set.getString(2),
                set.getString(3), set.getDouble(4));
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
    
    public static ArrayList<Organization> getOrganizationsInOrder(String field, String type) {
        ArrayList<Organization> orgList = new ArrayList<>();
        Organization org = null;
        String query = "SELECT * FROM organizations ORDER BY " + field + " " + type;
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            ResultSet set = statement.executeQuery();
            
            while (set.next()) {
                org = new Organization(set.getString(1), set.getString(2),
                set.getString(3), set.getDouble(4));
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
           statement.setDouble(4, org.getRating());
           
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
    
    public static void addReview(Review review) {
        String query = "INSERT INTO reviews VALUES (?, ?, ?, ?, ?, ?)";
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            Internship internship = review.getInternship();
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
            ArrayList<Integer> reviews = getReviewRatings(org);
            
            // Calculate the new rating
            for (Integer i : reviews) {
                sum += i;
            }
            db = DatabaseAccess.open();
            newRating = (double)sum / (double)reviews.size();
            // Update the rating
            PreparedStatement statement = db.prepareStatement(setNewRating);
            statement.setDouble(1, newRating);
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
                + "organization_id = ? ORDER BY internship_name";
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
    
    public static String editUserAccount(User user) {
        String updateUserAccount = "UPDATE user_accounts SET username = ?, " +
                    "email = ? WHERE user_id = ?";
        String updateUserInfo = "UPDATE user_info SET first_name = ?, last_name = ?, " +
                    "city = ?, state = ? WHERE user_id = ?";

        try {
            db = DatabaseAccess.open();

            // Update user_accounts table
            PreparedStatement statement = db.prepareStatement(updateUserAccount);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getUserId());

            statement.execute();

            // Update user_info table;
            statement = db.prepareStatement(updateUserInfo);
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getCity());
            statement.setString(4, user.getState());
            statement.setString(5, user.getUserId());

            statement.execute();

            db.close();
            statement.close();
            return "Successfully editted user account!";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }

    public static String editUserPassword(String user_id, String oldPassword, String newPassword) {
        String editUserPassword = "UPDATE user_accounts SET password = ? WHERE user_id = ?";

        User userObj = getUser(user_id);
        
        if (!userObj.getPassword().equals(Utilities.hashPassword(oldPassword))) {
            return "Error: Passwords do not match!";
        }

        try {
            db = DatabaseAccess.open();

            // Update user_accounts table
            PreparedStatement statement = db.prepareStatement(editUserPassword);
            statement.setString(1, Utilities.hashPassword(newPassword));
            statement.setString(2, user_id);

            statement.execute();

            db.close();
            statement.close();
            
            return "Successfully changed password!";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
    
    public static Organization getOrganization(String id) {
        Organization org = null;
        String query = "SELECT * FROM organizations WHERE organization_id = ?";
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            
            rs.next();
            org = new Organization(rs.getString(1), rs.getString(2), 
            rs.getString(3), rs.getDouble(4));
            
            db.close();
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return org;
    }
    
    public static ArrayList<Review> getReviews(Organization org) {
        ArrayList<Review> reviews = new ArrayList<>();
        Review review = null;
        ArrayList<Internship> internships = getInternships(org);
        String reviewQuery = "SELECT * FROM reviews WHERE organization_id = ? "
                + "AND internship_id = ?";
        try {
            PreparedStatement statement;
            for (Internship i : internships) {
                db = DatabaseAccess.open();
                statement = db.prepareStatement(reviewQuery);
                statement.setString(1, org.getId());
                statement.setString(2, i.getId());
                
                ResultSet set = statement.executeQuery();
                while (set.next()) {
                    review = new Review(i, getUser(set.getString(3)), set.getString(4), 
                    set.getInt(5), set.getString(6));
                    reviews.add(review);
                }
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return reviews;
    }
    
    public static Internship getInternship(String id, Organization org) {
        Internship internship = null;
        String query = "SELECT * FROM internships WHERE internship_id = ?";
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, id);
            ResultSet rs = statement.executeQuery();
            
            rs.next();
            internship = new Internship(rs.getString(1), org, rs.getString(3), 
            rs.getString(4), rs.getString(5), rs.getString(6));
            
            db.close();
            rs.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return internship;
    }
    
    public String getSecutiryQuestions(String user_id)

    {
        String query = "SELCECT answer FROM security_questions WHERE user_id = ?";
        String answer = "";
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(query);
            statement.setString(1, user_id);
            ResultSet rs = statement.executeQuery();
            
            rs.next();
            answer = rs.getString(1);
            
            db.close();
            rs.close();
            statement.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answer;
    }
    public static ArrayList<String> getInternshipNameForOrg(Organization org) {
        String sql = "SELECT internship_name FROM internships WHERE organization_id = ?";
        ArrayList<String> result = new ArrayList<>();
        
        try {
            db = DatabaseAccess.open();
            PreparedStatement statement = db.prepareStatement(sql);
            statement.setString(1, org.getId());
            ResultSet set = statement.executeQuery();
            
            while (set.next()) {
                result.add(set.getString(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
