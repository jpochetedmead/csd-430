<%-- 
  Author: Julio Pochet
  Date: 08/24/2025
  Assignment: Module 3 – JSP Forms (CSD 430)
  Purpose: Receives feedback POST data and shows it in a clean HTML table with basic validation.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%!
  // Minimal HTML escaping for safe display
  public static String esc(String s) {
    if (s == null) return "";
    return s.replace("&", "&amp;")
            .replace("<", "&lt;")
            .replace(">", "&gt;")
            .replace("\"", "&quot;");
  }
  public static String dashIfEmpty(String s) {
    if (s == null) return "—";
    String t = s.trim();
    return t.isEmpty() ? "—" : t;
  }
%>

<%
  // Read parameters
  request.setCharacterEncoding("UTF-8");

  String guestName  = request.getParameter("guestName");
  String email      = request.getParameter("email");
  String phone      = request.getParameter("phone");
  String location   = request.getParameter("location");
  String visitDate  = request.getParameter("visitDate");
  String partySize  = request.getParameter("partySize");
  String speed      = request.getParameter("speed");
  String[] channels = request.getParameterValues("channels");
  String foodRating = request.getParameter("foodRating");
  String overall    = request.getParameter("overall");
  String comments   = request.getParameter("comments");

  // Required fields validation
  java.util.List<String> errors = new java.util.ArrayList<String>();
  if (guestName == null || guestName.trim().isEmpty()) errors.add("Full Name is required.");
  if (email == null || email.trim().isEmpty())         errors.add("Email is required.");
  if (location == null || location.trim().isEmpty())   errors.add("Location is required.");
  if (speed == null || speed.trim().isEmpty())         errors.add("Service Speed is required.");

  // Join checkboxes
  String channelsJoined = "(none selected)";
  if (channels != null && channels.length > 0) {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < channels.length; i++) {
      if (i > 0) sb.append(", ");
      sb.append(channels[i]);
    }
    channelsJoined = sb.toString();
  }

  String submittedAt = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date());
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Feedback Received – Module 3</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <main class="container">
    <header class="page-header">
      <h1>Thanks for your feedback! <span class="badge">Received</span></h1>
      <p class="muted small">Submitted on <strong><%= esc(submittedAt) %></strong></p>
    </header>

    <%
      if (!errors.isEmpty()) {
    %>
      <div class="card alert">
        <h2 class="alert-title">Please fix the following</h2>
        <ul class="alert-list">
          <% for (String e : errors) { %>
            <li><%= esc(e) %></li>
          <% } %>
        </ul>
        <div class="actions">
          <a class="btn ghost" href="feedbackForm.jsp">Go Back to Form</a>
        </div>
      </div>
    <%
      } else {
    %>
      <section class="card">
        <table class="data-table" aria-label="Submitted Feedback">
          <tbody>
            <tr><th scope="row">Full Name</th><td><%= esc(dashIfEmpty(guestName)) %></td></tr>
            <tr><th scope="row">Email</th><td><%= esc(dashIfEmpty(email)) %></td></tr>
            <tr><th scope="row">Phone</th><td><%= esc(dashIfEmpty(phone)) %></td></tr>
            <tr><th scope="row">Location</th><td><%= esc(dashIfEmpty(location)) %></td></tr>
            <tr><th scope="row">Visit Date</th><td><%= esc(dashIfEmpty(visitDate)) %></td></tr>
            <tr><th scope="row">Party Size</th><td><%= esc(dashIfEmpty(partySize)) %></td></tr>
            <tr><th scope="row">Service Speed</th><td><%= esc(dashIfEmpty(speed)) %></td></tr>
            <tr><th scope="row">Used Channels</th><td><%= esc(channelsJoined) %></td></tr>
            <tr><th scope="row">Food Quality (1–5)</th><td><%= esc(dashIfEmpty(foodRating)) %></td></tr>
            <tr><th scope="row">Overall (1–10)</th><td><%= esc(dashIfEmpty(overall)) %></td></tr>
            <tr><th scope="row">Comments</th><td class="pre"><%= esc(dashIfEmpty(comments)) %></td></tr>
          </tbody>
        </table>

        <div class="actions">
          <a class="btn" href="feedbackForm.jsp">Submit Another Response</a>
        </div>
      </section>
    <%
      }
    %>
  </main>
</body>
</html>