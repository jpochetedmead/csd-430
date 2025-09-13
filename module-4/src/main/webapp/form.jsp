<%@ page import="com.example.model.MovieBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
/*
 * Author: Julio Pochet
 * Date: 08/31/2025
 * Course: CSD-430
 * Assignment: Module 4 – JavaBean
 * Purpose: Initialize a MovieBean with default Module 2 data and 
 *          render an HTML form to allow user edits.
 * Rule: Scriptlets hold Java only; ALL HTML tags must be outside scriptlets.
 */

// ---- Preload defaults (based on Module 2 data) ----
MovieBean movie = new MovieBean();
movie.setTitle("Inception");
movie.setDirector("Christopher Nolan");
movie.setYear(2010);
movie.setCategory("Sci-Fi");
movie.setNotes("Imported from Module 2 (Sci-Fi picks).");

// Store in request scope
request.setAttribute("movie", movie);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 4 – Movies (JavaBean Form)</title>
    <link rel="stylesheet" href="css/style.css"><!-- Reusing Module 2 CSS -->
</head>
<body>
<header class="page-head">
    <h1>Module 4 – Movie Editor (JavaBean)</h1>
    <p class="subtitle">
        Pre-filled with data from Module 2 (Inception). Edit fields and submit 
        to view the formatted record in a table.
    </p>
</header>

<section class="group" style="max-width:960px;">
    <h2 class="group-title">Edit Movie (from Bean)</h2>
    <p class="group-note">Fields: Title, Director, Year (Module 2) + Category & Notes.</p>

    <!-- Form posts values to display.jsp -->
    <form action="display.jsp" method="post" class="form-stack">
        <!-- Title input -->
        <label>Title
            <input name="title" type="text" required
                   value="<%= ((MovieBean)request.getAttribute("movie")).getTitle() %>">
        </label>

        <!-- Director input -->
        <label>Director
            <input name="director" type="text" required
                   value="<%= ((MovieBean)request.getAttribute("movie")).getDirector() %>">
        </label>

        <!-- Year input -->
        <label>Year
            <input name="year" type="number" min="1888" max="2100" required
                   value="<%= ((MovieBean)request.getAttribute("movie")).getYear() %>">
        </label>

        <!-- Category dropdown (pre-selects current bean value) -->
        <label>Category
            <select name="category">
                <%
                    String cat = ((MovieBean)request.getAttribute("movie")).getCategory();
                    String[] opts = {"Sci-Fi","Drama/Thriller","Action","Comedy","Other"};
                    for (String o : opts) {
                %>
                <option value="<%= o %>" <%= o.equals(cat) ? "selected" : "" %>><%= o %></option>
                <%
                    }
                %>
            </select>
        </label>

        <!-- Notes text area -->
        <label>Notes
            <textarea name="notes" rows="4"><%= ((MovieBean)request.getAttribute("movie")).getNotes() %></textarea>
        </label>

        <!-- Submit button -->
        <div class="actions">
            <button type="submit">Submit to Display</button>
        </div>
    </form>
</section>

<footer class="page-foot">
    <p>
        Field/Record Description: This form captures movie details (title, director, year, 
        category, and notes). On submit, values are passed to display.jsp where they 
        are shown in a formatted table.
    </p>
</footer>
</body>
</html>