# Feedback Collection System

A web-based application designed to collect and manage feedback from users efficiently. This system allows users to submit feedback and provides administrators with an interface to view and analyze collected responses.

## GitHub Repository

[Click here to view the repository](https://github.com/Vandanasacharya07/Feedback_Collection_System.git)

---

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (Servlets, JSP)
- **Database**: MySQL
- **Server**: Apache Tomcat

---

## Features

- User-friendly feedback submission form
- Admin panel to view and manage feedback
- Stores data securely in MySQL database
- Simple UI with client-side validations

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Vandanasacharya07/Feedback_Collection_System.git
```

### 2. Import into your IDE

- Open in Eclipse or any Java EE IDE
- Configure Apache Tomcat server

### 3. Setup MySQL Database

- Create a database (e.g., `feedback_db`)
- Create tables manually by using the code provided

### 4. Run the project

- Deploy the project on Tomcat
- Open your browser and visit `http://localhost:8081/Feedback_Collection_System`

---

## Project Structure

```
Feedback_System/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/feedback/
│   │   │       ├── controller/       # Servlets
│   │   │       ├── dao/              # Data Access Objects
│   │   │       └── model/            # POJOs (Plain Old Java Objects)
│   │   ├── resources/                # Configuration files (if any)
│   │   └── webapp/
│   │       ├── WEB-INF/              # web.xml and other configurations
│   │       ├── style.css             # CSS files
│   │       ├── index.jsp             # Entry point JSP
│   │       └── ***.jsp               # Other JSP files
├── pom.xml                           # Maven Project Object Model file
└── README.md

---

## Author

- Vandana Acharya  
  GitHub: [@Vandanasacharya07](https://github.com/Vandanasacharya07)

---

