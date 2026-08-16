<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Category Advice</title>
    <style>
      .advice-box {
        background-color: #f0f8ff;
        padding: 15px;
        border-radius: 10px;
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
    <div class="advice-box">
      <h4>Personalized Saving Tip</h4>
      <p><%= request.getAttribute("tip") %></p>
    </div>
  </body>
</html>
