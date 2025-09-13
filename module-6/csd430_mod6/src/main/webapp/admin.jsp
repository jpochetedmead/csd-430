<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 Name: Julio Pochet Edmead
 Date: 09/07/2025
 Assignment: Module 6 - Project Part 1 (CSD430)
 Purpose: Let instructor create, seed, and delete the table by calling the JavaBean.
--%>
<%@ page import="app.DbMovieDAOBean" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8"><title>Admin</title></head>
<body>
<h2>Admin: Create / Seed / Delete Table</h2>

<%
  String msg = null;
  String action = request.getParameter("action");
  if (action != null) {
    try {
      DbMovieDAOBean dao = new DbMovieDAOBean();
      if ("create".equals(action)) { dao.createTable(); msg = "Table created or already exists."; }
      if ("seed".equals(action))   { dao.seedIfEmpty();  msg = "Seed complete. No duplicates if already seeded."; }
      if ("delete".equals(action)) { dao.deleteTable();  msg = "Table deleted."; }
    } catch (Exception e) {
      msg = "Error: " + e.getMessage();
    }
  }
%>

<% if (msg != null) { %>
  <p><strong><%= msg %></strong></p>
<% } %>

<form method="post">
  <button name="action" value="create">Create Table</button>
  <button name="action" value="seed">Seed Data</button>
  <button name="action" value="delete" onclick="return confirm('Drop table?')">Delete Table</button>
</form>

<p><a href="index.jsp">Back to Index</a></p>
</body>
</html>