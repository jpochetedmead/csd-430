<%@ page import="com.example.model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
/*
 * Author: Julio Pochet
 * Date: 08/31/2025
 * Course: CSD-430
 * Assignment: Module 4 – JavaBean
 * Purpose: Read user-submitted movie data from request parameters, 
 *          populate a MovieBean object, and display the results in 
 *          a formatted HTML table with field descriptions.
 */

// Ensure correct character encoding for form data
request.setCharacterEncoding("UTF-8");

// ---- Retrieve form parameters safely ----
String title    = request.getParameter("title");    
if (title == null) title = "";

String director = request.getParameter("director"); 
if (director == null) director = "";

String category = request.getParameter("category"); 
if (category == null) category = "";

String notes    = request.getParameter("notes");    
if (notes == null) notes = "";

// ---- Parse year (with error handling) ----
int yr = 0;
try {
    String raw = request.getParameter("year");
    if (raw != null && !raw.trim().isEmpty()) {
        yr = Integer.parseInt(raw.trim());
    }
} catch (NumberFormatException ignored) {
    // If user enters invalid year, keep default = 0
}

// ---- Create and populate the MovieBean ----
MovieBean movie = new MovieBean();
movie.setTitle(title.trim());
movie.setDirector(director.trim());
movie.setCategory(category.trim());
movie.setNotes(notes.trim());
movie.setYear(yr);

// Store bean in request scope for JSP access (optional here but good practice)
request.setAttribute("movie", movie);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 4 – Movies (Display)</title>
    <link rel="stylesheet" href="css/style.css"><!-- Reuse Module 2 CSS -->
</head>
<body>
<header class="page-head">
    <h1>Movie Summary (JavaBean → Table)</h1>
    <p class="subtitle">
        This table shows the data captured from the form and loaded into a JavaBean.
    </p>
</header>

<section class="group" style="max-width:960px;">
    <h2 class="group-title">Overview</h2>
    <p class="group-note">
        Data comes from Module 2 fields (Title, Director, Year) plus Category & Notes.
    </p>

    <!-- Display MovieBean values in a styled table -->
    <table class="nice-table">
        <thead>
            <tr><th>Field</th><th>Value</th><th>Description</th></tr>
        </thead>
        <tbody>
            <tr><td>Title</td><td><%= movie.getTitle() %></td><td>Movie title</td></tr>
            <tr><td>Director</td><td><%= movie.getDirector() %></td><td>Directed by</td></tr>
            <tr><td>Year</td><td><%= movie.getYear() %></td><td>Release year</td></tr>
            <tr><td>Category</td><td><%= movie.getCategory() %></td><td>Group (Sci-Fi, Drama/Thriller, etc.)</td></tr>
            <tr><td>Notes</td><td><%= movie.getNotes() %></td><td>Extra context or remarks</td></tr>
        </tbody>
    </table>

    <!-- Link back to form.jsp for editing -->
    <p style="margin-top:12px;"><a href="form.jsp">← Edit Again</a></p>
</section>

<footer class="page-foot">
    <p>
        Overall Data Description: A single movie record showing title, director, year, category, 
        and notes captured through the form and stored in a JavaBean.
    </p>
</footer>
</body>
</html>