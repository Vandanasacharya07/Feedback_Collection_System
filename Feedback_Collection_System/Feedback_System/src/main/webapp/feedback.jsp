<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Submit Feedback</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
    <header>
        <div class="container">
            <h1>Feedback Portal</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="auth.jsp">Admin Portal</a></li>
                </ul>
            </nav>
        </div>
    </header>
    
    <main>
        <div class="form-container">
            <h2>Submit Your Feedback</h2>
            <p>Please share your experience with us. Your feedback helps us improve.</p>
            
            <form action="submit-feedback" method="post">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="rating">Rating</label>
                    <select id="rating" name="rating" required>
                        <option value="">Select a rating</option>
                        <option value="1">1 (Poor)</option>
                        <option value="2">2 (Fair)</option>
                        <option value="3">3 (Average)</option>
                        <option value="4">4 (Good)</option>
                        <option value="5">5 (Excellent)</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="comments">Comments</label>
                    <textarea id="comments" name="comments" placeholder="Share your detailed feedback here..."></textarea>
                </div>
                
                <button type="submit" class="btn-submit">Submit Feedback</button>
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