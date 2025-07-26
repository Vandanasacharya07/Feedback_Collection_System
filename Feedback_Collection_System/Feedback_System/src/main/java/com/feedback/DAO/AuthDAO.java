package com.feedback.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AuthDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/feedback_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";
    
    private static final String CHECK_ADMIN_SQL = "SELECT * FROM admins WHERE username = ? AND password = ?";
    
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
    
    public boolean validateAdmin(String username, String password) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(CHECK_ADMIN_SQL)) {
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            return rs.next(); // Returns true if credentials match
        }
    }
}

