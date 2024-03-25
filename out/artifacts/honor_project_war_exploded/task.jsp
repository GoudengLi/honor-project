<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/1/19
  Time: 22:06
  To change this template use File | Settings | File Templates.
  `taskAccount``teacherAccount``taskDate``taskName`
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .row {
            font-size: 18px;
            color: #333;
        }

        .lf {
            width: 20%;
            text-align: left;
            padding-left: 10px;
        }

        .rg {
            width: 40%;
        }

        tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        img {
            cursor: pointer;
        }

        #confirmationDialog {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 1px solid #ccc;
            padding: 20px;
            z-index: 1000;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        }

        #confirmationDialog p {
            margin-bottom: 20px;
        }

        #confirmationDialog button {
            margin-right: 10px;
        }
    </style>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<table border="1" cellspacing="0" align="center" class="con-b">
    <thead>
    <%--`taskAccount``teacherAccount``taskDate``taskName` --%>
    <tr class="row" style="color: black;font-size: 25px" >
        <td class="lf">taskAccount</td>
        <td class="lf">taskName</td>
        <td class="lf" style="width: 10%">publishDate</td>
        <td class="lf">delete</td>
        <td class="lf">Completeness</td>
        <td class="lf">Comments</td>

    </tr>
    </thead>
    <tbody>

    <c:forEach items="${arr}" var="task">
        <tr>
            <td class="lf">${task.getTaskAccount()}</td>
            <td class="lf">${task.getTaskName()}</td>
            <td class="lf">${task.getTaskDate()}</td>
            <td class="lf"><img src="del.png" alt="" onclick="confirmDelete('${task.getTaskAccount()}')"></td>
            <td class="lf"><img src="detail.jpg" style="width: 40px;height: 40px" alt="" onclick="skimDetail('${task.getTaskAccount()}')"></td>
            <td class="lf"><img src="comment.png" style="width: 40px;height: 40px" alt="" onclick=""></td>
                <%--    <td class="lf">${person.getUserAccount()}</td>--%>
                <%--    <td class="lf">${person.getUserAccount()}</td>--%>
        </tr>
    </c:forEach>
    <div id="confirmationDialog" style="display: none;">
        <p>Are you totally, absolutely, completely sure you want to say "bye" to this task? (´∩｡• ᵕ •｡∩`)</p>
        <button onclick="deleteTaskConfirmed()">Yup, delete it!</button>
        <button onclick="cancelDelete()">Nope, keep it!</button>
    </div>
    </tbody>

    <tr></tr>
</table>

</body>

</html>
<script>
    // function deleteThisTask(taskAccount){
    //     window.location.href="tea.action?action=deleteThisTask&taskAccount="+taskAccount;
    // }

    function skimDetail(taskAccount){
        window.location.href="tea.action?action=goSkimDetail&taskAccount="+taskAccount;
    }

    function confirmDelete(taskAccount) {

        var confirmationDialog = document.getElementById('confirmationDialog');


        confirmationDialog.style.display = 'block';


        window.taskToDelete = taskAccount;
    }

    function deleteTaskConfirmed() {

        var taskAccount = window.taskToDelete;


        var deleteTaskUrl = "tea.action?action=deleteThisTask&taskAccount=" + taskAccount;


        window.location.href = deleteTaskUrl;
    }

    function cancelDelete() {

        var confirmationDialog = document.getElementById('confirmationDialog');


        confirmationDialog.style.display = 'none';
    }

</script>