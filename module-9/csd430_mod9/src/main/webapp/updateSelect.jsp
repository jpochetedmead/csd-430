<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Module 8 (UPDATE)
  Purpose: Show an HTML dropdown with all primary keys so the user can choose a record to edit.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>UPDATE: Choose Movie</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; margin:24px; line-height:1.4; }
    .card { max-width:560px; padding:16px 20px; border:1px solid #ddd; border-radius:12px; }
    label { font-weight:600; display:block; margin:8px 0 6px; }
    select, button { padding:8px 10px; }
    .actions { margin-top:16px; }
    a { text-decoration:none; }
  </style>
</head>
<body>
  <h2>Update a Movie — Choose ID</h2>
  <div class="card">
    <%
      List<Integer> ids = null;
      String err = null;
      try {
        ids = new DbMovieDAOBean().getAllIds();
      } catch (Exception e) {
        err = "Error loading IDs: " + e.getMessage();
      }
    %>

    <% if (err != null) { %>
      <p style="color:#c00"><%= err %></p>
      <p><a href="index.jsp">Back to Index</a></p>
    <% } else if (ids == null || ids.isEmpty()) { %>
      <p>No records yet. Try <a href="createMovie.jsp">adding a movie</a> first.</p>
      <p><a href="index.jsp">Back to Index</a></p>
    <% } else { %>
      <form action="updateMovie.jsp" method="get">
        <label for="movie_id">Select Movie ID to edit</label>
        <select id="movie_id" name="movie_id" required>
          <option value="">-- choose --</option>
          <% for (Integer id : ids) { %>
            <option value="<%= id %>"><%= id %></option>
          <% } %>
        </select>
        <div class="actions">
          <button type="submit">Edit</button>
          <a href="index.jsp" style="margin-left:10px">Back to Index</a>
        </div>
      </form>
    <% } %>
  </div>
</body>
</html>