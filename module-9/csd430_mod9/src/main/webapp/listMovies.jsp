<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/28/2025
  Assignment: CSD430 – Module 9 (DELETE – List & Select)
  Purpose: Display ALL records in a table and provide a dropdown of keys (movie_id) to delete.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean,app.MovieBean" %>
<%
  DbMovieDAOBean dao = new DbMovieDAOBean();
  List<MovieBean> rows = null;
  String err = null;

  try {
    rows = dao.getAllMovies(); // existing DAO helper
  } catch (Exception e) {
    err = "Error loading movies: " + e.getMessage();
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Module 9 – List & Delete Movies</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.45; margin:24px; }
    h1 { margin:0 0 8px; }
    .lead { color:#444; margin-bottom:14px; }
    table { border-collapse:collapse; width:100%; margin:12px 0; }
    th, td { border:1px solid #ddd; padding:8px 10px; text-align:left; }
    thead th { background:#f7f7f7; }
    .empty { background:#fffaf0; border:1px solid #f0e0b8; padding:8px; display:inline-block; }
    form { display:flex; gap:8px; align-items:center; margin-top:12px; }
    select, button { padding:8px; }
    a { text-decoration:none; }
  </style>
</head>
<body>
  <h1>All Movies</h1>
  <div class="lead">
    Pick a Movie ID to delete. After you submit, the page will show the remaining records
    and let you delete again if you want.
  </div>

  <% if (err != null) { %>
    <p style="color:#c00"><%= err %></p>
  <% } %>

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
      <%
        if (rows != null && !rows.isEmpty()) {
          for (MovieBean m : rows) {
      %>
        <tr>
          <td><%= m.getMovie_id() %></td>
          <td><%= m.getTitle() %></td>
          <td><%= m.getGenre() %></td>
          <td><%= m.getRelease_year() %></td>
          <td><%= m.getRating() %></td>
          <td><%= m.getDirector() %></td>
        </tr>
      <%
          }
        } else {
      %>
        <tr>
          <td colspan="6"><span class="empty">No records found.</span></td>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>

  <form action="deleteMovie.jsp" method="post">
    <label for="movie_id">Delete ID:</label>
    <select id="movie_id" name="movie_id" required>
      <option value="" disabled selected>-- choose --</option>
      <%
        if (rows != null) {
          for (MovieBean m : rows) {
      %>
        <option value="<%= m.getMovie_id() %>"><%= m.getMovie_id() %></option>
      <%
          }
        }
      %>
    </select>
    <button type="submit">Delete</button>
    <a href="index.jsp" style="margin-left:8px">Back to Index</a>
  </form>
</body>
</html>