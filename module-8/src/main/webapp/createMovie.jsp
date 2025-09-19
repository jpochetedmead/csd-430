<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Name: Julio Pochet Edmead
  Date: 09/21/2025
  Assignment: CSD430 – Module 7 (CREATE)
  Purpose: Gather user input to add a new movie record.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREATE: Add Movie</title>
  <style>
    body { font-family: system-ui, Arial, sans-serif; line-height:1.4; margin:24px; }
    .card { max-width: 640px; padding:16px 20px; border:1px solid #ddd; border-radius:12px; }
    label { display:block; margin:10px 0 6px; font-weight:600; }
    input { width:100%; max-width:520px; padding:8px; }
    .actions { margin-top:12px; }
  </style>
</head>
<body>
  <h2>Add a Movie</h2>
  <div class="card">
    <form action="createMovieResult.jsp" method="post">
      <label for="title">Title</label>
      <input id="title" name="title" type="text" required maxlength="120">

      <label for="genre">Genre</label>
      <input id="genre" name="genre" type="text" required maxlength="60">

      <label for="release_year">Release Year</label>
      <input id="release_year" name="release_year" type="number" min="1888" max="2100" required>

      <label for="rating">Rating (0.0 – 10.0)</label>
      <input id="rating" name="rating" type="number" step="0.1" min="0" max="10" required>

      <label for="director">Director</label>
      <input id="director" name="director" type="text" required maxlength="120">

      <div class="actions">
        <button type="submit">Create</button>
        <a href="index.jsp" style="margin-left:10px">Back to Index</a>
      </div>
    </form>
  </div>
</body>
</html>