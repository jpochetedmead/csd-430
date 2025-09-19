<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/14/2025
  Assignment: Module 7 - Project Part 2 (CSD430)
  Purpose: Insert a new movie via DAO and display ALL records in a table with thead.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean,app.MovieBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create Movie - Result</title>
</head>
<body>
<h2>Movie Created (and All Records)</h2>

<%
  request.setCharacterEncoding("UTF-8");

  String title     = request.getParameter("title");
  String genre     = request.getParameter("genre");
  String yrStr     = request.getParameter("release_year");
  String ratingStr = request.getParameter("rating");
  String director  = request.getParameter("director");

  String err = null;
  List<MovieBean> all = null;

  try {
    // Basic validation
    if (title == null || title.isBlank()
     || genre == null || genre.isBlank()
     || yrStr == null || yrStr.isBlank()
     || ratingStr == null || ratingStr.isBlank()
     || director == null || director.isBlank()) {
        throw new IllegalArgumentException("All fields are required.");
    }
    int year = Integer.parseInt(yrStr);
    double rating = Double.parseDouble(ratingStr);
    if (year < 1888 || year > 2100) throw new IllegalArgumentException("Release year out of range.");
    if (rating < 0.0 || rating > 10.0) throw new IllegalArgumentException("Rating must be 0.0 to 10.0.");

    // Build bean and insert
    MovieBean m = new MovieBean();
    m.setTitle(title.trim());
    m.setGenre(genre.trim());
    m.setRelease_year(year);
    m.setRating(rating);
    m.setDirector(director.trim());

    DbMovieDAOBean dao = new DbMovieDAOBean();
    dao.createTable();      // safe if table was dropped
    dao.insertMovie(m);     // CREATE

    // Load ALL records for display per assignment
    all = dao.getAllMovies();

  } catch (Exception ex) {
    err = "Create failed: " + ex.getMessage();
  }
%>

<% if (err != null) { %>
  <p style="color:red"><%= err %></p>
  <p><a href="createMovie.jsp">Back to Create</a> | <a href="index.jsp">Index</a></p>
<% } else { %>
  <p><strong>Success:</strong> New record added. The table below shows all records.</p>

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
      <% for (MovieBean row : all) { %>
      <tr>
        <td><%= row.getMovie_id() %></td>
        <td><%= row.getTitle() %></td>
        <td><%= row.getGenre() %></td>
        <td><%= row.getRelease_year() %></td>
        <td><%= row.getRating() %></td>
        <td><%= row.getDirector() %></td>
      </tr>
      <% } %>
    </tbody>
  </table>

  <p><strong>Field descriptions:</strong>
     movie_id (auto key), title (name), genre (category),
     release_year (year), rating (0–10), director (person).
  </p>

  <p><a href="createMovie.jsp">Add another</a> |
     <a href="selectMovie.jsp">READ: View by ID</a> |
     <a href="index.jsp">Index</a></p>
<% } %>

</body>
</html>