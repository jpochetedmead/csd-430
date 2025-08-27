<%-- 
  Author: Julio Pochet
  Date: 08/24/2025
  Assignment: Module 3 – JSP Forms (CSD 430)
  Purpose: Collects restaurant experience feedback and posts it to feedbackResult.jsp.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Restaurant Experience Feedback – Module 3</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <main class="container">
    <header class="page-header">
      <h1>Restaurant Experience Feedback - <span class="badge">Module 3</span></h1>
      <p class="muted">Tell us about your visit. Fields marked <span class="req">*</span> are required.</p>
    </header>

    <!-- brief description (meets assignment requirement) -->
    <section class="card">
      <p class="muted small">
        This short form collects typical feedback: who you are, when you visited, your ratings,
        and any comments. Your inputs will be displayed on a separate JSP page as a clean table.
      </p>
    </section>

    <form class="card form" action="feedbackResult.jsp" method="post" novalidate>
      <fieldset>
        <legend>Contact</legend>

        <div class="grid-2">
          <div class="field">
            <label for="guestName">Full Name <span class="req">*</span></label>
            <input type="text" id="guestName" name="guestName" required
                   placeholder="e.g., Julio Pochet"
                   autocomplete="name" />
            <div class="hint">Your real name helps us find your visit if needed.</div>
          </div>

          <div class="field">
            <label for="email">Email <span class="req">*</span></label>
            <input type="email" id="email" name="email" required
                   placeholder="e.g., julio@email.com"
                   autocomplete="email" />
            <div class="hint">We’ll only contact you if you asked us to follow up.</div>
          </div>
        </div>

        <div class="field">
          <label for="phone">Phone</label>
          <input type="tel" id="phone" name="phone"
                 placeholder="Optional"
                 inputmode="tel" autocomplete="tel" />
        </div>
      </fieldset>

      <fieldset>
        <legend>Visit Details</legend>

        <div class="grid-3">
          <div class="field">
            <label for="location">Location Visited <span class="req">*</span></label>
            <select id="location" name="location" required aria-required="true">
              <option value="">-- Select --</option>
              <option>Downtown</option>
              <option>West Side</option>
              <option>Riverside</option>
              <option>Mall</option>
            </select>
          </div>

          <div class="field">
            <label for="visitDate">Visit Date</label>
            <input type="date" id="visitDate" name="visitDate" />
          </div>

          <div class="field">
            <label for="partySize">Party Size</label>
            <input type="number" id="partySize" name="partySize" min="1" max="20" step="1" placeholder="e.g., 2" />
          </div>
        </div>

        <div class="field">
          <span class="label">Service Speed <span class="req">*</span></span>
          <div class="choices">
            <label class="choice"><input type="radio" name="speed" value="Fast" required /> Fast</label>
            <label class="choice"><input type="radio" name="speed" value="Average" /> Average</label>
            <label class="choice"><input type="radio" name="speed" value="Slow" /> Slow</label>
          </div>
        </div>

        <div class="field">
          <span class="label">What did you use? (you can choose more than one)</span>
          <div class="choices wrap">
            <label class="choice"><input type="checkbox" name="channels" value="Dine-in" /> Dine-in</label>
            <label class="choice"><input type="checkbox" name="channels" value="Takeout" /> Takeout</label>
            <label class="choice"><input type="checkbox" name="channels" value="Delivery" /> Delivery</label>
            <label class="choice"><input type="checkbox" name="channels" value="Curbside" /> Curbside</label>
          </div>
        </div>
      </fieldset>

      <fieldset>
        <legend>Ratings & Comments</legend>

        <div class="grid-2">
          <div class="field">
            <label for="foodRating">Food Quality (1–5)</label>
            <select id="foodRating" name="foodRating">
              <option value="">(no rating)</option>
              <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option>
            </select>
          </div>

          <div class="field">
            <label for="overall">Overall Satisfaction (1–10)</label>
            <input type="range" id="overall" name="overall" min="1" max="10" value="8" />
            <div class="hint">Drag to a number that feels right.</div>
          </div>
        </div>

        <div class="field">
          <label for="comments">Comments</label>
          <textarea id="comments" name="comments" rows="5"
            placeholder="What went well? Anything we should improve?"></textarea>
        </div>
      </fieldset>

      <div class="actions">
        <button class="btn primary" type="submit">Submit Feedback</button>
        <button class="btn ghost" type="reset">Clear</button>
      </div>
    </form>
  </main>
</body>
</html>