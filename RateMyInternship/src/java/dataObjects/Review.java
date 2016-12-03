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
public class Review {
    private Internship internship;
    private String reviewId;
    private User user;
    private int rating;
    private String comment;
    
    public Review(Internship internship, User user, 
            int rating, String comment, String reviewId) {
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
    
    public Internship getInternship() {
        return this.internship;
    }
    
    public User getUser() {
        return this.user;
    }
    
    public int getRating() {
        return this.rating;
    }
    
    public String getComment() {
        return this.comment;
    }
    
    public String getReviewId() {
        return this.reviewId;
    }
}
