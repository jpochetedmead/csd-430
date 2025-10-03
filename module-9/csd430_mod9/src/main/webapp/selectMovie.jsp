<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 Name: Julio Pochet Edmead
 Date: 09/21/2025
 Assignment: CSD430 – Module 6 (READ)
 Purpose: Show dropdown of available primary keys from DB via bean.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Select Movie</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.4; margin:24px; }
    .card { max-width: 520px; padding:16px 20px; border:1px solid #ddd; border-radius:12px; }
    label { display:block; margin:8px 0 6px; font-weight:600; }
    select, button { padding:8px 10px; }
  </style>
</head>
<body>
<h2>Select a Movie (by ID)</h2>
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
<% } %>

<form action="showMovie.jsp" method="get">
  <label for="movie_id">Movie ID:</label>
  <select id="movie_id" name="movie_id" required>
    <option value="">-- choose --</option>
    <% if (ids != null) {
         for (Integer id : ids) { %>
           <option value="<%= id %>"><%= id %></option>
    <%   }
       } %>
  </select>
  <button type="submit">View</button>
  <a href="index.jsp" style="margin-left:10px">Back to Index</a>
</form>
</div>
</body>
</html>