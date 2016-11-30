/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataObjects;

/**
 *
 * @author kevinamrein
 */
public class Organization {
    private String id;
    private String name;
    private String tagline;
    private int avgRating;
    
    public Organization(String id, String name, String tagline, int avgRating) {
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
    
    public String tagline() {
        return this.tagline;
    }
    
    public int getRating() {
        return this.avgRating;
    }
}
