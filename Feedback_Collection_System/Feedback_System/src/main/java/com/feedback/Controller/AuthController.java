package com.feedback.Controller;

import com.feedback.DAO.AuthDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AuthController", value = "/auth")
public class AuthController extends HttpServlet {
    private AuthDAO authDAO;
    
    public void init() {
        authDAO = new AuthDAO();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        try {
            if (authDAO.validateAdmin(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", username);
                response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("auth.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}
