<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
 Name: Julio Pochet Edmead
 Date: 09/21/2025
 Assignment: CSD430 – Modules 6–8
 Purpose: Let user create, seed, and delete the table by calling the JavaBean.
--%>
<%@ page import="app.DbMovieDAOBean" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Admin</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height: 1.4; margin: 24px; }
    .card { max-width: 560px; padding: 16px 20px; border: 1px solid #ddd; border-radius: 12px; }
    button { padding: 8px 12px; margin-right: 6px; }
  </style>
</head>
<body>
<h2>Admin: Create / Seed / Delete Table</h2>
<div class="card">
<%
  String msg = null;
  String action = request.getParameter("action");
  if (action != null) {
    try {
      DbMovieDAOBean dao = new DbMovieDAOBean();
      if ("create".equals(action)) { dao.createTable(); msg = "Table created or already exists."; }
      if ("seed".equals(action))   { dao.seedIfEmpty();  msg = "Seed complete (skips if already populated)."; }
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
  <a href="index.jsp" style="margin-left:10px">Back to Index</a>
</form>
</div>
</body>
</html>