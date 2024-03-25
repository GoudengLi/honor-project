<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/1/16
  Time: 22:57
  To change this template use File | Settings | File Templates.
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
            width: 15%;
            text-align: left;
            padding-left: 10px;
        }

        .rg {
            width: 85%;
        }

        tr:nth-of-type(odd) {
            background-color: #f9f9f9;
        }

        img {
            cursor: pointer;
            height: 40px;
            width: 40px;
        }
    </style>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<table border="1" cellspacing="0" align="center" class="con-b">
    <thead>
    <%--  `taskAccount``studentAccount``studentAnswer``isFinish``Score` studentName--%>

    <tr class="row" style="color: black;font-size: 25px" >
        <%--  //`taskAccount``studentAccount``studentAnswer``isFinish``Score``userName``taskName`--%>
            <c:if test="${session_person.getUserIdentify()!=0}">
        <td class="lf">Name</td>
            </c:if>
            <td class="lf">question</td>
        <td class="lf" style="width: 10%">Answer</td>
        <td class="lf">Completeness</td>
        <td class="lf">marks</td>

            <c:if test="${session_person.getUserIdentify()==0}">
              <td class="lf">Start Answer</td>
            </c:if>
            <c:if test="${session_person.getUserIdentify()==1}">
                <td class="lf">give marks</td>
            </c:if>
        <td class="lf">Comments</td>
        <td class="lf">feedback</td>

    </tr>
    </thead>
    <tbody>

<c:forEach items="${arr}" var="stuTask">
    <tr>
        <c:if test="${session_person.getUserIdentify()!=0}">
            <td class="lf">${stuTask.getUserName()}</td>
        </c:if>

    <td class="lf">${stuTask.getTaskName()}</td>
    <td class="lf">${stuTask.getStudentAnswer()}</td>

<%--    <td class="lf">${person.getUserAccount()}</td>--%>
<%--    <td class="lf">${person.getUserAccount()}</td>--%>
    <td class="lf">
        <c:if test="${stuTask.getIsFinish()==0}">
           <span style="color: red">NoAnswer</span>
        </c:if>
        <c:if test="${stuTask.getIsFinish()==1}">
            <span style="color: green">NoCheck</span>
        </c:if>
        <c:if test="${stuTask.getIsFinish()==2}">
            <span style="color: green">Completed</span>
        </c:if>

    </td>
        <td class="lf">${stuTask.getScore()}</td>

        <c:if test="${session_person.getUserIdentify()==0}">
            <td class="lf"><button onclick="doAnswer('${stuTask.getTaskAccount()}','${stuTask.getIsFinish()}')">Start</button></td>
        </c:if>
        <c:if test="${session_person.getUserIdentify()==1}">
            <td class="lf">
                <button onclick="confirmMark('${stuTask.getTaskAccount()}')">Mark</button>
            </td>
        </c:if>
        <td class="lf">
            <a href="common.action?action=showComments&taskName=${stuTask.getTaskName()}"><img src="comment.png" style="width: 40px;height: 40px" alt="" onclick=""></a>
        </td>

<%--        <td class="lf"><img style="height: 40px;width: 40px"src="del.png" alt="" onclick="delThisTask('${stuTask.getTaskAccount()}','${stuTask.getStudentAccount()}','${stuTask.getIsFinish()}')"></td>--%>
        <td class="lf">
            <a href="dofeedback.jsp">
                <img style="height: 40px; width: 40px;" src="detail.jpg" alt="">
            </a>
        </td>
    </tr>
</c:forEach>

    </tbody>

    <tr></tr>
</table>

</body>
<script>
    <%--function delThisTask(taskAccount,studentAccount,isFinish) {--%>
    <%--    if (${session_person.getUserIdentify()==1}){--%>
    <%--        if (isFinish==1){--%>
    <%--            alert("Not check yet,delete forbidden!");--%>
    <%--        }else {--%>
    <%--            window.location.href="tea.action?action=deleteTask&studentAccount="+studentAccount+"$taskAccount="+taskAccount+"$isFinish="+isFinish--%>
    <%--        }--%>
    <%--    }else {--%>
    <%--        if (isFinish==2){--%>

    <%--        }else {--%>
    <%--            alert("Student is working on it ,better not disturb him .^◡^. ")--%>
    <%--        }--%>
    <%--    }--%>
    <%--    alert("deleted question:"+taskAccount+"student"+studentAccount)--%>
    <%--}--%>
    <%--function delThisTask(taskAccount, studentAccount, isFinish) {--%>
    <%--    if (${session_person.getUserIdentify() == 1}) {--%>
    <%--        if (isFinish == 1 || isFinish === "1") {--%>
    <%--            alert("Not checked yet, delete forbidden!");--%>
    <%--        } else {--%>
    <%--            window.location.href = "tea.action?action=deleteTask&studentAccount=" + studentAccount + "&taskAccount=" + taskAccount + "&isFinish=" + isFinish;--%>
    <%--        }--%>
    <%--    } else {--%>
    <%--        if (isFinish == 2 || isFinish === "2") {--%>
    <%--         //--%>
    <%--        }--%>
    <%--        else {--%>
    <%--            alert("Student is working on it, better not disturb him. ^◡^.");--%>
    <%--        }--%>
    <%--    }--%>
    <%--    alert("deleted question:" + taskAccount + " student " + studentAccount);--%>
    <%--}--%>
    function confirmMark(taskAccount) {
        var answer = confirm("Would you like to mark according to the preset answer?");

        if (answer) {
            prompt("set the pre answer here:");
            return;
        } else {
            // If no, prompt for score
            var score = prompt("Please enter the score for the student:");
            if (score != null && score.trim() !== "") {
                // If score is entered, do something with it, like send it to backend
                alert("You entered the score: " + score);
            } else {
                alert("Please enter a valid score.");
            }
        }
    }

    function upThisPerson(userAccount) {
        alert("updated"+userAccount)
    }

    function doAnswer(taskAccount,isFinish){
        if (isFinish!=0){
            alert("Finished")
            return;
        }
        window.open("student.action?action=doAnswer&taskAccount="+taskAccount+"",
        null,"width=600,height=400,left=400,top=150",true);
    }
</script>
</html>