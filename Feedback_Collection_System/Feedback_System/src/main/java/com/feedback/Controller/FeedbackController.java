package com.feedback.Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.feedback.DAO.FeedbackDAO;
import com.feedback.Model.Feedback;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "FeedbackController", value = {
    "/feedback",            // GET - show form
    "/submit-feedback",     // POST - submit form
    "/admin",               // GET - admin page
    "/update-status"        // POST - update feedback status
})
public class FeedbackController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FeedbackDAO feedbackDao;
    
    public void init() {
        feedbackDao = new FeedbackDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        
        try {
            switch (action) {
                case "/submit-feedback":
                    submitFeedback(request, response);
                    break;
                case "/update-status":
                    updateFeedbackStatus(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        
        try {
            switch (action) {
                case "/feedback":
                    showFeedbackForm(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    private void submitFeedback(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String name = request.getParameter("name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");
        
        Feedback newFeedback = new Feedback();
        newFeedback.setName(name);
        newFeedback.setRating(rating);
        newFeedback.setComments(comments);
        
        feedbackDao.insertFeedback(newFeedback);
        response.sendRedirect("thankyou.jsp");
    }
    
    private void updateFeedbackStatus(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean reviewed = Boolean.parseBoolean(request.getParameter("reviewed"));
        
        feedbackDao.updateFeedbackStatus(id, reviewed);
        response.sendRedirect("admin.jsp");
    }
    
    private void showFeedbackForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("feedback.jsp");
        dispatcher.forward(request, response);
    }
}

