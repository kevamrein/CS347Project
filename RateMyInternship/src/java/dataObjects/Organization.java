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
public class Organization {
    private String id;
    private String name;
    private String tagline;
    private double avgRating;
    
    public Organization(String name, String tagline, double avgRating) {
        this.id = Utilities.generateUUID();
        this.name = name;
        this.tagline = tagline;
        this.avgRating = avgRating;
    }
    
    public Organization(String id, String name, String tagline, double avgRating) {
        this.id = id;
        this.name = name;
        this.tagline = tagline;
        this.avgRating = avgRating;
    }
    
    public String getId() {
        return this.id;
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getTagline() {
        return this.tagline;
    }
    
    public double getRating() {
        return this.avgRating;
    }
}
