<%@ page import="com.feedback.Model.Feedback,com.feedback.DAO.*" %>
<%@ page import="java.util.List" %>
<%
    // Check if admin is logged in - using implicit session object
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("auth.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
     <header>
        <div class="container">
            <h1>Feedback Portal - Admin Dashboard</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="./logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="container">
            <h2>Feedback Submissions</h2>
            
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Rating</th>
                        <th>Comments</th>
                        <th>Status</th>
                        <th>Action</th>
                        <th>Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    FeedbackDAO fb=new FeedbackDAO();
                    List<Feedback> feedbackList = fb.selectAllFeedback();
                    if (feedbackList != null && !feedbackList.isEmpty()) {
                        for (Feedback feedback : feedbackList) { %>
                            <tr>
                                <td><%= feedback.getId() %></td>
                                <td><%= feedback.getName() %></td>
                                <td>
                                    <div class="stars">
                                        <% for (int i=1; i<=5; i++) { %>
                                            <span class="star <%= i <= feedback.getRating() ? "filled" : "" %>">*</span>
                                        <% } %>
                                    </div>
                                </td>
                                <td><%= feedback.getComments() %></td>
                                <td class="status-cell">
                                    <span class="status-badge <%= feedback.isReviewed() ? "reviewed" : "pending" %>">
                                        <%= feedback.isReviewed() ? "Reviewed" : "Pending" %>
                                    </span>
                                </td>
                                <td>
                                    <form action="update-status" method="post">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="<%= feedback.getId() %>">
                                        <input type="hidden" name="reviewed" value="<%= !feedback.isReviewed() %>">
                                        <button type="submit" class="status-btn <%= feedback.isReviewed() ? "pending-btn" : "reviewed-btn" %>">
                                            <%= feedback.isReviewed() ? "Mark Pending" : "Mark Reviewed" %>
                                        </button>
                                    </form>
                                </td>
                                <td><%= feedback.getSubmissionDate() != null ? feedback.getSubmissionDate().toString() : "" %></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="7">No feedback submissions found</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </main>
    
    <footer>
        <p>© 2025 Feedback System</p>
    </footer>
</body>
</html>