package com.example.webProject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection connect() throws SQLException, ClassNotFoundException {
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/";
        String dbName = "notifier";
        String username = "root";
        String password = "Jadooo123";

        Class.forName(driver);
        return DriverManager.getConnection(url+dbName, username, password);
    }
}
