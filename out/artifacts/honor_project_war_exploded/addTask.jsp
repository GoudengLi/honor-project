<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/1/21
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #content{
            width: 1300px;
            height: 600px;
            float: right;
            margin-right: 40px;
            border: saddlebrown 1px solid;
        }
        #innerAddTaskFrame{
            width: 1000px;
            height: 400px;
            margin-left:100px;
            margin-top: 50px;
            font-size: 20px;
            color: mediumslateblue;

        }
    </style>
</head>
<body >
<div id="content">
<div id="innerAddTaskFrame">
    publish works <br><br>
    <form action="tea.action?action=addTask" method="post">
        <textarea style="width: 800px;font-size: 25px;color: grey; height: 160px" rows="4" name="taskName"   >

        </textarea><br>
        <br>
        <input style="margin-left: 350px" type="submit" value="add">
    </form>
    <span style="margin-left: 320px;font-size: 15px;color: red">${tip}</span>



</div>
</div>

</body>
</html>
<script>
    function checkAddTask(){
        alert("hahah")
        return false;
    }
</script>