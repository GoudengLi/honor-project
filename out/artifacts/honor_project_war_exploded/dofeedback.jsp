<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/3/13
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .feedback {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Feedback</h2>
    <div class="feedback" id="feedbackContainer">
        <!-- Feedback will be dynamically added here -->
    </div>
</div>

<script>
    var feedbacks = [
        { teacher: 'Teacher:san', text: 'not bad' },
    ];

    // Function to render feedbacks
    function renderFeedbacks() {
        var feedbackContainer = document.getElementById('feedbackContainer');
        feedbackContainer.innerHTML = ''; // Clear previous feedbacks
        feedbacks.forEach(function(feedback) {
            var feedbackElement = document.createElement('div');
            feedbackElement.innerHTML = '<strong>' + feedback.teacher + ':</strong> ' + feedback.text;
            feedbackContainer.appendChild(feedbackElement);
        });
    }

    // Render initial feedbacks
    renderFeedbacks();
</script>
</body>
</html>

