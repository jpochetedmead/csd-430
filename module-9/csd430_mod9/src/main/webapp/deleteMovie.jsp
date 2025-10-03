<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/28/2025
  Assignment: CSD430 – Module 9 (DELETE – Action & Result)
  Purpose: Delete the selected record by movie_id via JavaBean, then display the remaining records
           in the same table format with an updated dropdown (repeat deletes supported).
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean,app.MovieBean" %>
<%
  String idParam = request.getParameter("movie_id");
  Integer id = null;
  boolean deleted = false;
  String status;

  try {
    if (idParam != null && !idParam.trim().isEmpty()) {
      id = Integer.valueOf(idParam.trim());
    }
  } catch (NumberFormatException nfe) {
    // invalid id stays null
  }

  DbMovieDAOBean dao = new DbMovieDAOBean();
  try {
    if (id != null) {
      deleted = dao.deleteMovieById(id) > 0;
      status = deleted ? ("Deleted movie with ID " + id + ".") : ("No movie deleted for ID " + id + ".");
    } else {
      status = "No valid ID provided.";
    }
  } catch (Exception e) {
    status = "Delete failed: " + e.getMessage();
  }

  List<MovieBean> rows = null;
  String err = null;
  try {
    rows = dao.getAllMovies();
  } catch (Exception e) {
    err = "Error loading movies: " + e.getMessage();
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Movie – Result</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.45; margin:24px; }
    .status { margin:12px 0; padding:10px;
      border:1px solid <%= deleted ? "#b6e3b6" : "#f2c9c9" %>;
      background: <%= deleted ? "#eafaea" : "#ffeeee" %>; }
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
  <h1>Delete Result</h1>
  <div class="status"><%= status %></div>

  <% if (err != null) { %>
    <p style="color:#c00"><%= err %></p>
  <% } %>

  <h2>Remaining Movies</h2>
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
          <td colspan="6"><span class="empty">All records deleted.</span></td>
        </tr>
      <%
        }
      %>
    </tbody>
  </table>

  <form action="deleteMovie.jsp" method="post">
    <label for="movie_id">Delete another (ID):</label>
    <select id="movie_id" name="movie_id" <%= (rows==null || rows.isEmpty()) ? "disabled" : "required" %>>
      <%
        if (rows != null && !rows.isEmpty()) {
      %>
        <option value="" disabled selected>-- choose --</option>
      <%
          for (MovieBean m : rows) {
      %>
        <option value="<%= m.getMovie_id() %>"><%= m.getMovie_id() %></option>
      <%
          }
        } else {
      %>
        <option value="">(no IDs available)</option>
      <%
        }
      %>
    </select>
    <button type="submit" <%= (rows==null || rows.isEmpty()) ? "disabled" : "" %>>Delete</button>
    <a href="listMovies.jsp" style="margin-left:8px">← Back to List</a>
  </form>
</body>
</html>