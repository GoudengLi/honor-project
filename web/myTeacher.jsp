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
        table{
            width: 1300px;
        }
        tr,td{
            border: grey 1px ;
        }
        td{
            height: 40px;
        }

        table td{
            height: 60px;
            vertical-align: middle!important;  /*text in the center vertically*/
            text-align: center;
        }

        tr,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}

        th{font-weight:bold;background:#ccc;}

        .con-b .row .lf{
            width: 15%;
            text-align: center;
            padding: 10px;
        }
        .con-b .row .rg{
            width: 85%;
        }

        .con-b tr:nth-of-type(odd){
            background-color: #f2f2f2;
        }
        #content{
            width: 1300px;
            height: 70px;
            float: right;
            margin-right: 40px;
            border: grey 1px solid;
            color: grey;
            font-size: 50px;
        }

    </style>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>

<%--<div style="width: 1300px;height: 100px; margin-left:450px;background-color:aliceblue;border: red 1px solid"></div>--%>
<%--//matchText searchMyStudent--%>


<table border="1" cellspacing="0" align="center" class="con-b">
    <thead>
    <%--   userAccount``userName``userGender``userBirthday``userIdCard``userPassword``userIdentify``userOtherName--%>

    <tr class="row" style="color: black;font-size: 25px" >
        <td class="lf">TeacherID</td>
        <td class="lf">Name</td>
        <td class="lf" style="width: 10%">Gender</td>
        <td class="lf">subject</td>
        <td>tasks</td>
        <td class="lf" style="width: 10%">delete</td>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${arr}" var="person">

        <tr>
            <td class="lf">${person.getUserAccount()}</td>
            <td class="lf">${person.getUserName()}</td>
            <td class="lf">${person.getUserGender()}</td>
            <td class="lf">${person.getUserOtherName()}</td>
            <td class="lf">
            <img src="detail.jpg" style="width: 40px;height: 40px" alt="" onclick="goMyTask('${person.getUserAccount()}')">
            </td>

                <%--        <td class="lf"><img src="del.png" alt="" onclick="deleteThisPerson('${person.getUserAccount()}')"></td>--%>
                <td><img src="del.png" style="width: 40px;height: 40px" alt="" onclick="deleteThisPerson('${person.getUserAccount()}')"></td>

                <%--        <td class="lf"><img src="up.jpg" alt="" onclick="upThisPerson('${person.getUserAccount()}')"></td>--%>
        </tr>
    </c:forEach>
    </tbody>

    <tr></tr>
</table>

</body>
<script>
    function goMyTask(teacherAccount){
        window.location.href="student.action?action=goMyTeaTask&teacherAccount="+teacherAccount
    }

    function deleteThisPerson(teacherAccount) {
        window.location.href="student.action?action=deleteMyTeacher&teacherAccount="+teacherAccount
    }

</script>
</html>