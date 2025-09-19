<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Modules 6–8 (Index)
  Purpose: Landing page linking to Admin, READ, CREATE, and UPDATE flows.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CSD430 - Index</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height: 1.4; margin: 24px; }
    ul { line-height: 1.8; }
    a { text-decoration: none; }
  </style>
</head>
<body>
  <h1>CSD430 – Modules 6–8</h1>
  <ul>
    <li><a href="admin.jsp">Admin: Create / Seed / Delete Table</a></li>
    <li><a href="selectMovie.jsp">READ: Dropdown to Detail</a></li>
    <li><a href="createMovie.jsp">CREATE: Add Movie</a></li>
    <li><a href="updateSelect.jsp">UPDATE: Edit Movie</a></li>
  </ul>
  <p><em>Database:</em> CSD430 &nbsp; <em>User:</em> student1 &nbsp; <em>Pass:</em> pass</p>
</body>
</html>