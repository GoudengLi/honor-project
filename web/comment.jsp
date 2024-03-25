<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/2/15
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment Section</title>
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
        textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .comments {
            margin-top: 20px;
        }
        .comment {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>You are in the comment space of: 666</h1>
    <!-- Existing form and comments container -->
</div>
<form method="post" action="common.action?action=addComment" onsubmit="return addComment()">
    <div class="container">
        <h2>Leave Your Comment</h2>
        <textarea id="comment" name="comment" placeholder="Please enter your comment"></textarea>
<c:forEach items="${arr}" var="stuTask">
        <input type="hidden" id="userName" name="userName" value="${session_person.userName}" />
        <input type="hidden" id="taskAccount" name="taskAccount" value="${stuTask.getTaskAccount()}" />
        <input type="hidden" id="userIdentify" name="userIdentify" value="${session_person.userIdentify}" />
        <input type="hidden" id="userAccount" name="userAccount" value="${session_person.userAccount}" />
        <input type="submit" value="Post Comment" />
</c:forEach>
        <div class="comments" id="commentsContainer">
            <!-- Comments will be dynamically added here -->
        </div>
    </div>
</form>

</body>
</html>
<script>

    var comments = [];



    // Function to add comment
    function addComment() {

        let userName = document.getElementById("userName").value;
        let userIdentify=document.getElementById("userIdentify").value;
        let userAccount=document.getElementById("userAccount").value;
        let taskAccount=document.getElementById("taskAccount").value;
        let comment  = document.getElementById('comment').value ;
        if (comment.trim() === '') {
            alert('Please enter comment content');
            return false;
        }




        return true;
    }
    comments.push({
        name: 'san',
        identity: '1',
        account: '17287',
        text: 'This is a comment from san with account 17287.'
    });
    comments.push({
        name: 'hayate',
        identity: '0',
        account: '23333',
        text: 'This is a test comment from hayate.'
    });

    // Render the comments
    renderComments();
    // Function to render comments
    function renderComments() {
        var commentsContainer = document.getElementById('commentsContainer');
        commentsContainer.innerHTML = ''; // Clear previous comments
        comments.forEach(function(comment) {
            var commentElement = document.createElement('div');
            commentElement.classList.add('comment');
            commentElement.innerHTML = '<strong>' + comment.name + '</strong> (' + (comment.identity === '0' ? 'Student' : 'Teacher') + ') - ' + comment.account + ': ' + comment.text;
            commentsContainer.appendChild(commentElement);
        });
    }
</script>