<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Module 8 (UPDATE)
  Purpose: Execute UPDATE via JavaBean and display the updated record in a table with field titles/types.
--%>
<%@ page import="app.DbMovieDAOBean,app.MovieBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>UPDATE: Result</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height: 1.4; margin: 24px; }
    .card { max-width: 900px; padding: 16px 20px; border: 1px solid #ddd; border-radius: 12px; }
    table { border-collapse: collapse; width: 100%; margin-top: 12px; }
    th, td { border: 1px solid #ddd; padding: 8px 10px; text-align: left; }
    thead th { background: #f7f7f7; }
    .ok { color: #156e2c; }
    .err { color: #c00; }
    a { text-decoration: none; }
  </style>
</head>
<body>
  <h2>Update Result</h2>
  <div class="card">
    <%
      request.setCharacterEncoding("UTF-8");

      String idStr     = request.getParameter("movie_id");
      String title     = request.getParameter("title");
      String genre     = request.getParameter("genre");
      String yrStr     = request.getParameter("release_year");
      String ratingStr = request.getParameter("rating");
      String director  = request.getParameter("director");

      String err = null;
      MovieBean updated = null;

      try {
        if (idStr == null || title == null || genre == null || yrStr == null || ratingStr == null || director == null)
          throw new IllegalArgumentException("Missing required field(s).");

        int id = Integer.parseInt(idStr);
        int year = Integer.parseInt(yrStr);
        double rating = Double.parseDouble(ratingStr);
        if (year < 1888 || year > 2100) throw new IllegalArgumentException("Release year out of range.");
        if (rating < 0.0 || rating > 10.0) throw new IllegalArgumentException("Rating must be 0.0–10.0.");

        MovieBean m = new MovieBean();
        m.setMovie_id(id);
        m.setTitle(title.trim());
        m.setGenre(genre.trim());
        m.setRelease_year(year);
        m.setRating(rating);
        m.setDirector(director.trim());

        DbMovieDAOBean dao = new DbMovieDAOBean();
        int changed = dao.updateMovie(m);
        if (changed == 0) throw new IllegalStateException("No row updated. Check the ID.");

        updated = dao.getById(id); // show fresh values
      } catch (Exception e) {
        err = "Update failed: " + e.getMessage();
      }
    %>

    <% if (err != null) { %>
      <p class="err"><%= err %></p>
      <p><a href="updateSelect.jsp">Try again</a> · <a href="index.jsp">Index</a></p>
    <% } else { %>
      <p class="ok"><strong>Success:</strong> The record was updated.</p>

      <table>
        <thead>
          <tr>
            <th>Movie ID (INT)</th>
            <th>Title (VARCHAR)</th>
            <th>Genre (VARCHAR)</th>
            <th>Release Year (INT)</th>
            <th>Rating (DECIMAL)</th>
            <th>Director (VARCHAR)</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><%= updated.getMovie_id() %></td>
            <td><%= updated.getTitle() %></td>
            <td><%= updated.getGenre() %></td>
            <td><%= updated.getRelease_year() %></td>
            <td><%= updated.getRating() %></td>
            <td><%= updated.getDirector() %></td>
          </tr>
        </tbody>
      </table>

      <p><em>Description:</em> Updated movie record shown with field titles and types in the table header.</p>

      <p>
        <a href="updateSelect.jsp">Update another</a> ·
        <a href="selectMovie.jsp">READ: View by ID</a> ·
        <a href="index.jsp">Index</a>
      </p>
    <% } %>
  </div>
</body>
</html>