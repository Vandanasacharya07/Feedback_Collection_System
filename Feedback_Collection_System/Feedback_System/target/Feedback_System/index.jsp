<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Portal</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container">
            <h1>Welcome to Feedback Portal</h1>
        </div>
    </header>
    
    <main>
        <div class="container">
            <h2>Share Your Experience With Us</h2>
            <p>We value your feedback to help us improve our services.</p>
            
            <div class="card-container">
                <div class="card">
                    <div class="card-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
                            <circle cx="9" cy="7" r="4"></circle>
                            <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
                        </svg>
                    </div>
                    <h2>Submit Feedback</h2>
                    <p>Share your thoughts and suggestions with us</p>
                    <a href="feedback" class="btn">Get Started</a>
                </div>
                
                <div class="card">
                    <div class="card-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                    </div>
                    <h2>Admin Portal</h2>
                    <p>View and manage feedback submissions</p>
                    <a href="auth.jsp" class="btn">Login</a>
                </div>
            </div>
        </div>
    </main>
    
    <footer>
        <div class="container">
            <p>Your feedback matters to us</p>
        </div>
    </footer>
</body>
</html>