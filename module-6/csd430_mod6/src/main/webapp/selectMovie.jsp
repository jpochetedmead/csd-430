<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 Name: Julio Pochet Edmead
 Date: 09/07/2025
 Assignment: Module 6 - Project Part 1 (CSD430)
 Purpose: Show dropdown of available primary keys from DB via bean.
--%>
<%@ page import="java.util.List,app.DbMovieDAOBean" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Select Movie</title></head>
<body>
<h2>Select a Movie (by ID)</h2>

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
  <p style="color:red"><%= err %></p>
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
</form>

<p><a href="index.jsp">Back to Index</a></p>
</body>
</html>