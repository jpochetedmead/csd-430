<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Module 7 (CREATE)
  Purpose: Insert a movie via JavaBean and display ALL records in a table with header.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean,app.MovieBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREATE: Result</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.4; margin:24px; }
    .ok { color:#156e2c; }
    .err { color:#c00; }
    table { border-collapse: collapse; width:100%; margin-top:12px; }
    th, td { border:1px solid #ddd; padding:8px 10px; text-align:left; }
    thead th { background:#f7f7f7; }
  </style>
</head>
<body>
  <h2>Create Result</h2>

<%
  request.setCharacterEncoding("UTF-8");
  String title = request.getParameter("title");
  String genre = request.getParameter("genre");
  String yrStr = request.getParameter("release_year");
  String ratingStr = request.getParameter("rating");
  String director = request.getParameter("director");

  String err = null;
  List<MovieBean> all = null;

  try {
    if (title == null || genre == null || yrStr == null || ratingStr == null || director == null)
      throw new IllegalArgumentException("Missing required field(s).");

    int year = Integer.parseInt(yrStr);
    double rating = Double.parseDouble(ratingStr);
    if (year < 1888 || year > 2100) throw new IllegalArgumentException("Release year out of range.");
    if (rating < 0.0 || rating > 10.0) throw new IllegalArgumentException("Rating must be 0.0–10.0.");

    MovieBean m = new MovieBean();
    m.setTitle(title.trim());
    m.setGenre(genre.trim());
    m.setRelease_year(year);
    m.setRating(rating);
    m.setDirector(director.trim());

    DbMovieDAOBean dao = new DbMovieDAOBean();
    dao.insertMovie(m);

    all = dao.getAllMovies(); // show all records after insert
  } catch (Exception e) {
    err = "Insert failed: " + e.getMessage();
  }
%>

<% if (err != null) { %>
  <p class="err"><%= err %></p>
  <p><a href="createMovie.jsp">Back to Create</a> · <a href="index.jsp">Index</a></p>
<% } else { %>
  <p class="ok"><strong>Success:</strong> Row inserted. Current table contents:</p>
  <table>
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

  <p>
    <a href="createMovie.jsp">Add another</a> ·
    <a href="selectMovie.jsp">READ: View by ID</a> ·
    <a href="index.jsp">Index</a>
  </p>
<% } %>
</body>
</html>