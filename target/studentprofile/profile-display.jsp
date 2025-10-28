<%@ page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 700px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .profile-card {
            border: 2px solid #007bff;
            padding: 25px;
            border-radius: 10px;
            background: #f8f9fa;
        }
        .field {
            margin-bottom: 15px;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .label {
            font-weight: bold;
            color: #333;
            display: inline-block;
            width: 150px;
        }
        .value {
            color: #555;
        }
        .btn {
            display: inline-block;
            background: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
        }
        .btn:hover {
            background: #0056b3;
        }
        .nav {
            text-align: center;
            margin-top: 30px;
        }
        .success-msg {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            text-align: center;
            border: 1px solid #c3e6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Profile Details</h1>
        
        <div class="success-msg">
            ✅ Student profile created successfully!
        </div>
        
        <div class="profile-card">
            <%
                Map<String, String> studentProfile = (Map<String, String>) session.getAttribute("studentProfile");
                if (studentProfile != null) {
            %>
            <div class="field">
                <span class="label">Student ID:</span>
                <span class="value"><%= studentProfile.get("studentId") %></span>
            </div>
            <div class="field">
                <span class="label">First Name:</span>
                <span class="value"><%= studentProfile.get("firstName") %></span>
            </div>
            <div class="field">
                <span class="label">Last Name:</span>
                <span class="value"><%= studentProfile.get("lastName") %></span>
            </div>
            <div class="field">
                <span class="label">Email:</span>
                <span class="value"><%= studentProfile.get("email") %></span>
            </div>
            <div class="field">
                <span class="label">Phone:</span>
                <span class="value"><%= studentProfile.get("phone") %></span>
            </div>
            <div class="field">
                <span class="label">Date of Birth:</span>
                <span class="value"><%= studentProfile.get("dateOfBirth") %></span>
            </div>
            <div class="field">
                <span class="label">Gender:</span>
                <span class="value"><%= studentProfile.get("gender") %></span>
            </div>
            <div class="field">
                <span class="label">Course:</span>
                <span class="value"><%= studentProfile.get("course") %></span>
            </div>
            <div class="field">
                <span class="label">Semester:</span>
                <span class="value"><%= studentProfile.get("semester") %> Semester</span>
            </div>
            <div class="field">
                <span class="label">Address:</span>
                <span class="value"><%= studentProfile.get("address") %></span>
            </div>
            <%
                } else {
            %>
            <div class="field">
                <span class="value">No student profile found. Please create a profile first.</span>
            </div>
            <%
                }
            %>
        </div>
        
        <div class="nav">
            <a href="student-form.jsp" class="btn">Create Another Profile</a>
            <a href="index.jsp" class="btn">Back to Home</a>
        </div>
    </div>
</body>
</html>