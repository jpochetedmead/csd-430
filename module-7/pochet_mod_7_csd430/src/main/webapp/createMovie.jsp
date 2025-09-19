<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/14/2025
  Assignment: Module 7 - Project Part 2 (CSD430)
  Purpose: Form to collect movie data for CREATE operation.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Create Movie</title>
  <style>
    label { display:block; margin:8px 0 4px; }
    input { width: 320px; max-width: 95%; }
    form  { max-width: 440px; }
  </style>
</head>
<body>
<h2>Create Movie</h2>

<form action="createMovieResult.jsp" method="post">
  <label for="title">Title</label>
  <input id="title" name="title" type="text" required maxlength="120">

  <label for="genre">Genre</label>
  <input id="genre" name="genre" type="text" required maxlength="60" placeholder="e.g., Sci-Fi, Drama">

  <label for="release_year">Release Year</label>
  <input id="release_year" name="release_year" type="number" min="1888" max="2100" required>

  <label for="rating">Rating (0.0 - 10.0)</label>
  <input id="rating" name="rating" type="number" step="0.1" min="0" max="10" required>

  <label for="director">Director</label>
  <input id="director" name="director" type="text" required maxlength="120">

  <p><button type="submit">Add Movie</button></p>
</form>

<p><a href="index.jsp">Back to Index</a></p>
</body>
</html>