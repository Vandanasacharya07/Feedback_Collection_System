<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container">
            <h1>Feedback Portal</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="feedback">Submit Feedback</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="thank-you">
            <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" viewBox="0 0 24 24" fill="none" stroke="#4285f4" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                <polyline points="22 4 12 14.01 9 11.01"></polyline>
            </svg>
            <h2>Thank You!</h2>
            <p>Your feedback has been successfully submitted. We greatly appreciate you taking the time to share your thoughts with us.</p>
            
            <div style="display: flex; justify-content: center; gap: 15px;">
                <a href="feedback" class="btn">Submit Another</a>
                <a href="index.jsp" class="btn" style="background-color: #666;">Return Home</a>
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