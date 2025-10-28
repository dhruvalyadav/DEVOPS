package com.college.student;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class StudentServlet extends HttpServlet {
    
    // Handle GET requests (display forms)
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("view".equals(action)) {
            // Display student profile
            displayProfile(request, response);
        } else {
            // Show student form
            showStudentForm(request, response);
        }
    }
    
    // Handle POST requests (form submissions)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Create student profile
        createStudentProfile(request, response);
    }
    
    private void showStudentForm(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student-form.jsp");
        dispatcher.forward(request, response);
    }
    
    private void createStudentProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Get form parameters
        String studentId = request.getParameter("studentId");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String course = request.getParameter("course");
        String semester = request.getParameter("semester");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String dateOfBirth = request.getParameter("dateOfBirth");
        
        // Store in session (in real app, store in database)
        HttpSession session = request.getSession();
        Map<String, String> studentProfile = new HashMap<>();
        studentProfile.put("studentId", studentId);
        studentProfile.put("firstName", firstName);
        studentProfile.put("lastName", lastName);
        studentProfile.put("email", email);
        studentProfile.put("phone", phone);
        studentProfile.put("course", course);
        studentProfile.put("semester", semester);
        studentProfile.put("address", address);
        studentProfile.put("gender", gender);
        studentProfile.put("dateOfBirth", dateOfBirth);
        
        session.setAttribute("studentProfile", studentProfile);
        
        // Redirect to display page
        response.sendRedirect("profile-display.jsp");
    }
    
    private void displayProfile(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/profile-display.jsp");
        dispatcher.forward(request, response);
    }
}