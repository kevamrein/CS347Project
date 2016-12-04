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
public class Internship {
    private String internshipId;
    private Organization organization;
    private String name;
    private String description;
    private String gpaRequirement;
    private String minClassStanding;
    
    public Internship(String internshipId, Organization organization, String name,
            String description, String gpaRequirement, String minClassStanding) {
        this.internshipId = internshipId;
        this.organization = organization;
        this.name = name;
        this.description = description;
        this.gpaRequirement = gpaRequirement;
        this.minClassStanding = minClassStanding;
    }
    
    public Internship(Organization organization, String name,
            String description, String gpaRequirement, String minClassStanding) {
        this.internshipId = Utilities.generateUUID();
        this.organization = organization;
        this.name = name;
        this.description = description;
        this.gpaRequirement = gpaRequirement;
        if (!Utilities.isValidClassStanding(minClassStanding)) {
            this.minClassStanding = "Freshman";
        } else {
            this.minClassStanding = minClassStanding;
        }
    }
    
    public Organization getOrganization() {
        return this.organization;
    }
    
    public String getId() {
        return this.internshipId;
    }
    
    public String getName() {
        return this.name;
    }
    
    public String getDescription() {
        return this.description;
    }
    
    public String getGpaRequirement() {
        return this.gpaRequirement;
    }
    
    public String getMinClassStanding() {
        return this.minClassStanding;
    }
}
