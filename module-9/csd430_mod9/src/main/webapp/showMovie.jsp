<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 Name: Julio Pochet Edmead
 Date: 09/21/2025
 Assignment: CSD430 – Module 6 (READ)
 Purpose: Display the selected record in a table with thead/tbody using bean.
--%>
<%@ page import="app.DbMovieDAOBean,app.MovieBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Movie Details</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.4; margin:24px; }
    table { border-collapse: collapse; }
    th, td { border:1px solid #ddd; padding:8px 10px; }
    thead th { background:#f7f7f7; }
  </style>
</head>
<body>
<h2>Movie Details</h2>

<%
  String idParam = request.getParameter("movie_id");
  MovieBean m = null;
  String err = null;

  if (idParam == null || idParam.isEmpty()) {
    err = "No movie_id provided.";
  } else {
    try {
      m = new DbMovieDAOBean().getById(Integer.parseInt(idParam));
      if (m == null) err = "No record found for movie_id = " + idParam + ".";
    } catch (Exception e) {
      err = "Error: " + e.getMessage();
    }
  }
%>

<% if (err != null) { %>
  <p style="color:#c00"><%= err %></p>
<% } else { %>
<table border="1" cellpadding="6" cellspacing="0">
  <thead>
    <tr>
      <th>Movie ID</th>
      <th>Title</th>
      <th>Genre</th>
      <th>Release Year</th>
      <th>Rating</th>
      <th>Director</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><%= m.getMovie_id() %></td>
      <td><%= m.getTitle() %></td>
      <td><%= m.getGenre() %></td>
      <td><%= m.getRelease_year() %></td>
      <td><%= m.getRating() %></td>
      <td><%= m.getDirector() %></td>
    </tr>
  </tbody>
</table>

<p><strong>Description:</strong> Single movie record fetched via JavaBean and JDBC.</p>
<% } %>

<p><a href="selectMovie.jsp">Back to Select</a> | <a href="index.jsp">Index</a></p>
</body>
</html>