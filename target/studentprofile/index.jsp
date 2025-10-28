<!DOCTYPE html>
<html>
<head>
    <title>Student Profile Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
            text-align: center;
        }
        .btn:hover {
            background: #0056b3;
        }
        .nav {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Student Profile Management System</h1>
        <p>This application allows students to create and manage their profiles.</p>
        
        <div class="nav">
            <a href="student-form.jsp" class="btn">Create Student Profile</a>
            <a href="about.jsp" class="btn">About</a>
        </div>
    </div>
</body>
</html>
