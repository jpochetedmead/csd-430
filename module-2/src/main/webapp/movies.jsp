<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%-- 
    Author: Julio Pochet
    Course: CSD-430 | Module 2
    File: movies.jsp
    Purpose: Show a small dynamic table page using JSP scriptlets.
             Java lives in scriptlets; all HTML tags are outside.
--%>
<%
    // ====== Simple data setup (grouped by category) ======
    // each record: { title, director, year }
    String[][] sciFi = {
        {"Inception", "Christopher Nolan", "2010"},
        {"The Matrix", "Lana & Lilly Wachowski", "1999"},
        {"Interstellar", "Christopher Nolan", "2014"}
    };
    String[][] drama = {
        {"Parasite", "Bong Joon-ho", "2019"},
        {"The Social Network", "David Fincher", "2010"},
        {"Whiplash", "Damien Chazelle", "2014"}
    };

    // helper to print a table (kept very basic on purpose)
    String[] headers = {"Title", "Director", "Year"};
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Module 2 – Movies (JSP Scriptlets)</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<header class="page-head">
    <h1>Favorite Movies – JSP Scriptlet Demo</h1>
    <p class="subtitle">
        Small dynamic page for Module 2. Data is grouped into categories and shown in HTML tables.
    </p>
</header>

<section class="group">
    <h2 class="group-title">Sci-Fi</h2>
    <p class="group-note">Three sci-fi picks. Columns = Title, Director, Year.</p>

    <table class="nice-table">
        <thead>
            <tr>
                <th><%= headers[0] %></th>
                <th><%= headers[1] %></th>
                <th><%= headers[2] %></th>
            </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < sciFi.length; i++) {
        %>
            <tr>
                <td><%= sciFi[i][0] %></td>
                <td><%= sciFi[i][1] %></td>
                <td><%= sciFi[i][2] %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<section class="group">
    <h2 class="group-title">Drama / Thriller</h2>
    <p class="group-note">Three drama/thriller picks. Same three fields.</p>

    <table class="nice-table">
        <thead>
            <tr>
                <th><%= headers[0] %></th>
                <th><%= headers[1] %></th>
                <th><%= headers[2] %></th>
            </tr>
        </thead>
        <tbody>
        <%
            for (int i = 0; i < drama.length; i++) {
        %>
            <tr>
                <td><%= drama[i][0] %></td>
                <td><%= drama[i][1] %></td>
                <td><%= drama[i][2] %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</section>

<footer class="page-foot">
    <p>Built for CSD-430 Module 2 • JSP Scriptlets + external CSS • Author: Julio Pochet • Date: 08/17/2025</p>
</footer>
</body>
</html>