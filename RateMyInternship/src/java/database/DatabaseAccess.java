/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author kevinamrein
 */
public class DatabaseAccess {
    /** JDBC driver name. */
    private static final String DRIVER = "com.mysql.jdbc.Driver";

    /** Database connection string. */
    private static final String DB_URL = "jdbc:mysql://grove.cs.jmu.edu:3306/team11_db";
    //private static final String DB_URL = "jdbc:mysql://localhost:9789/team11_db";

    /** Database user name. */
    private static final String DB_USER = "team11";

    /** Database password. */
    private static final String DB_PASS = "alph*7";

    /**
     * Static block; loads the JDBC driver.
     */
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException exc) {
            exc.printStackTrace();
        }
    }

    /**
     * Opens a new connection to the database.
     */
    public static Connection open() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
    }
}
