<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Module 8 (UPDATE)
  Purpose: Prefilled form for editing a single record; the primary key is shown but not editable.
--%>
<%@ page import="app.DbMovieDAOBean,app.MovieBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>UPDATE: Edit Movie</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; margin:24px; line-height:1.4; }
    .card { max-width:640px; padding:16px 20px; border:1px solid #ddd; border-radius:12px; }
    label { font-weight:600; display:block; margin:10px 0 6px; }
    input { width:100%; max-width:520px; padding:8px; }
    .row { margin-bottom:8px; }
    .muted { color:#555; }
    .actions { margin-top:16px; }
    a { text-decoration:none; }
  </style>
</head>
<body>
  <h2>Edit Movie</h2>
  <div class="card">
    <%
      String idParam = request.getParameter("movie_id");
      MovieBean m = null;
      String err = null;

      try {
        if (idParam == null || idParam.trim().isEmpty()) {
          throw new IllegalArgumentException("No movie_id provided.");
        }
        int id = Integer.parseInt(idParam.trim());
        m = new DbMovieDAOBean().getById(id);
        if (m == null) err = "No record found for movie_id = " + id + ".";
      } catch (NumberFormatException nfe) {
        err = "movie_id must be a whole number.";
      } catch (Exception e) {
        err = "Error: " + e.getMessage();
      }
    %>

    <% if (err != null) { %>
      <p style="color:#c00"><%= err %></p>
      <p><a href="updateSelect.jsp">Back to Choose</a> · <a href="index.jsp">Index</a></p>
    <% } else { %>
      <form action="updateMovieResult.jsp" method="post">
        <!-- Show key as read-only AND submit via hidden field -->
        <div class="row">
          <label>Movie ID (read-only)</label>
          <input type="text" value="<%= m.getMovie_id() %>" readonly class="muted">
          <input type="hidden" name="movie_id" value="<%= m.getMovie_id() %>">
        </div>

        <div class="row">
          <label for="title">Title</label>
          <input id="title" name="title" type="text" required maxlength="120" value="<%= m.getTitle() %>">
        </div>

        <div class="row">
          <label for="genre">Genre</label>
          <input id="genre" name="genre" type="text" required maxlength="60" value="<%= m.getGenre() %>">
        </div>

        <div class="row">
          <label for="release_year">Release Year</label>
          <input id="release_year" name="release_year" type="number" min="1888" max="2100" required
                 value="<%= m.getRelease_year() %>">
        </div>

        <div class="row">
          <label for="rating">Rating (0.0 – 10.0)</label>
          <input id="rating" name="rating" type="number" step="0.1" min="0" max="10" required
                 value="<%= m.getRating() %>">
        </div>

        <div class="row">
          <label for="director">Director</label>
          <input id="director" name="director" type="text" required maxlength="120" value="<%= m.getDirector() %>">
        </div>

        <div class="actions">
          <button type="submit">Save Changes</button>
          <a href="updateSelect.jsp" style="margin-left:10px">Back to Choose</a>
        </div>
      </form>
    <% } %>
  </div>
</body>
</html>