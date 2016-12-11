/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataObjects;

import database.Utilities;

/**
 * Represents a review in the database
 * 
 * @author kevinamrein
 */
public class Review {
    private Internship internship;
    private String reviewId;
    private User user;
    private int rating;
    private String comment;
    
    public Review(Internship internship, User user, String reviewId,
            int rating, String comment) {
        this.internship = internship;
        this.user = user;
        this.rating = rating;
        this.comment = comment;
        this.reviewId = reviewId;
    }
    
    public Review(Internship internship, User user, 
            int rating, String comment) {
        this.internship = internship;
        this.user = user;
        this.rating = rating;
        this.comment = comment;
        this.reviewId = Utilities.generateUUID();
    }
    
    /**
     * Get internship from Review
     * @return Internship
     */
    public Internship getInternship() {
        return this.internship;
    }
    
    /**
     * Get user from review
     * @return User
     */
    public User getUser() {
        return this.user;
    }
    
    /**
     * Get rating from review
     * @return rating
     */
    public int getRating() {
        return this.rating;
    }
    
    /**
     * Get comment from review
     * @return comment
     */
    public String getComment() {
        return this.comment;
    }
    
    /**
     * Get review id
     * @return id
     */
    public String getReviewId() {
        return this.reviewId;
    }
}
