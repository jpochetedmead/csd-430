<%--
  Author: Julio Pochet
  Course: CSD 430 – Server-Side Development
  Assignment: Module 1 – Project Setup and Repository
  Date: 08/17/2025
  Purpose: Quick sanity check that Java + Tomcat + Eclipse actually work together.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Module 1: Hello JSP 👋</title>
  <style>
    :root { --pad: 1.2rem; --border: #e5e5e5; --muted: #666; }
    body { font-family: system-ui, -apple-system, Segoe UI, Roboto, Arial, sans-serif; margin: 2rem; }
    .card { border: 1px solid var(--border); border-radius: 12px; padding: var(--pad); max-width: 720px; }
    h1 { margin: 0 0 .5rem; }
    p { line-height: 1.5; }
    .meta { color: var(--muted); font-size: .95rem; }
    .kv { display: grid; grid-template-columns: 160px 1fr; gap: .4rem .8rem; margin-top: .75rem; }
    code { background: #f7f7f8; padding: .05rem .35rem; border-radius: 6px; }
  </style>
</head>
<body>
  <div class="card">
    <h1>Hey there — JSP is alive ✅</h1>
    <p>
      This little page proves my Java + Tomcat setup works. It’s mostly HTML,
      with a tiny bit of Java to print the current server time and show the browser I’m using.
    </p>

    <%-- Minimal Java scriptlet --%>
    <%
      // Grab a couple dynamic values to show it's not just static HTML
      java.time.ZonedDateTime now = java.time.ZonedDateTime.now();
      String userAgent = request.getHeader("User-Agent");
      String who = request.getParameter("name"); // try: ?name=Julio
      if (who == null || who.isBlank()) {
        who = "friend";
      }
    %>

    <p class="meta">Hi, <strong><%= who %></strong>! Thanks for visiting my Module 1 page.</p>

    <div class="kv">
      <div class="meta">Server time:</div>
      <div><strong><%= now %></strong></div>

      <div class="meta">Your browser:</div>
      <div><code><%= userAgent %></code></div>
    </div>

    <p style="margin-top:1rem;">
      Tip: add <code>?name=YourName</code> to the URL to see a custom greeting.
      (Example: <code>/mod1-hellojsp/hello.jsp?name=Julio</code>)
    </p>
  </div>
</body>
</html>