<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container">
            <h1>Feedback Portal - Admin</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="feedback">Submit Feedback</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="auth-container">
            <h2>Admin Login</h2>
            
            <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
       		 <% } %>
            
            <form method="post" action="auth">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <button type="submit" class="btn-submit">Login</button>
            </form>
        </div>
        
    </main>
    
    <footer>
        <div class="container">
            <p>Your feedback matters to us</p>
        </div>
    </footer>
</body>
</html>