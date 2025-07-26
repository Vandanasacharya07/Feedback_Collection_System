package com.feedback.DAO;


import com.feedback.Model.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FeedbackDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/feedback_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";
    
    private static final String INSERT_FEEDBACK_SQL = "INSERT INTO feedback (name, rating, comment,reviewed,submission_date) VALUES (?, ?, ?,?, NOW())";
    private static final String SELECT_ALL_FEEDBACK = "SELECT * FROM feedback ORDER BY id ASC";
    private static final String UPDATE_FEEDBACK_STATUS = "UPDATE feedback SET reviewed = ? WHERE id = ?";
    
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
    
    public void insertFeedback(Feedback feedback) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_FEEDBACK_SQL)) {
            statement.setString(1, feedback.getName());
            statement.setInt(2, feedback.getRating());
            statement.setString(3, feedback.getComments());
            statement.setBoolean(4, feedback.isReviewed());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    
    public List<Feedback> selectAllFeedback() {
        List<Feedback> feedbacks = new ArrayList<>();
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(SELECT_ALL_FEEDBACK);
                ResultSet rs = statement.executeQuery()) {
               
               while (rs.next()) {
                   Feedback feedback = new Feedback();
                   feedback.setId(rs.getInt("id"));
                   feedback.setName(rs.getString("name"));
                   feedback.setRating(rs.getInt("rating"));
                   feedback.setComments(rs.getString("comment"));
                   feedback.setReviewed(rs.getBoolean("reviewed"));
                   feedback.setSubmissionDate(rs.getTimestamp("submission_date"));
                   feedbacks.add(feedback);

               }
           }
           
           catch (SQLException e) {
            printSQLException(e);
        }
        return feedbacks;
    }
    
    public boolean updateFeedbackStatus(int id, boolean reviewed) throws SQLException {
       
        try (Connection connection = getConnection();
                PreparedStatement statement = connection.prepareStatement(UPDATE_FEEDBACK_STATUS)) {
               
               statement.setBoolean(1, reviewed);
               statement.setInt(2, id);
               
               return statement.executeUpdate() > 0;
        }
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}

