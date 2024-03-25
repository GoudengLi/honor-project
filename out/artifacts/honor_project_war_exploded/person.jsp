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

<div id="content">
    <div style="float: right;height: 70px">
        <c:if test="${session_person.getUserIdentify()==0}">
            <form action="student.action?action=searchTeacher"  method="post">
        </c:if>
        <c:if test="${session_person.getUserIdentify()==1}">
            <form action="tea.action?action=searchMyStudent"  method="post">
        </c:if>
        <c:if test="${session_person.getUserIdentify()==2}">
             <form action="man.action?action=search"  method="post">
        </c:if>

            <input name="matchText" type="text" placeholder="search my student" style="height: 35px; width: 500px;font-size: 28px;color: darkslateblue; border: grey solid 1px">


                <input type="submit" style="margin-right: 24px" value="search">




        </form>
    </div>
    <br><br>
</div>

<table border="1" cellspacing="0" align="center" class="con-b">
    <thead>
    <%--   userAccount``userName``userGender``userBirthday``userIdCard``userPassword``userIdentify``userOtherName--%>

    <tr class="row" style="color: black;font-size: 25px" >
        <td class="lf">Account</td>
        <td class="lf">Name</td>
        <td class="lf" style="width: 10%">Gender</td>

        <c:if test="${session_person.getUserIdentify()!=0}">
            <td class="lf">birthday</td>
            <td class="lf">IDNum</td>
            <td class="lf">Identify</td>
        </c:if>

        <td class="lf">OtherName</td>
        <c:if test="${session_person.getUserIdentify()!=0}">
            <td class="lf">Delete</td>
        </c:if>

        <td class="lf" style="width: 10%">manage</td>

    </tr>
    </thead>
    <tbody>
<c:forEach items="${arr}" var="person">

    <tr>
    <td class="lf">${person.getUserAccount()}</td>
    <td class="lf">${person.getUserName()}</td>
    <td class="lf">${person.getUserGender()}</td>
        <c:if test="${session_person.getUserIdentify()!=0}">
        <td class="lf">${person.getUserBirthday()}</td>
        <td class="lf">${person.getUserIdCard()}</td>
            <%--    <td class="lf">${person.getUserAccount()}</td>--%>
            <%--    <td class="lf">${person.getUserAccount()}</td>--%>
        <td class="lf">
            <c:if test="${person.getUserIdentify()==0}">
            student
            </c:if>
            <c:if test="${person.getUserIdentify()==1}">
            teacher
            </c:if>
        </td>
            </c:if>



    <td class="lf">${person.getUserOtherName()}</td>
        <c:if test="${session_person.getUserIdentify()==1}">
            <td>
                <img src="del.png" alt="" onclick="deleteThisPersonByTeacher('${person.getUserAccount()}')">
            </td>
        </c:if>

        <c:if test="${session_person.getUserIdentify()==2}">
            <td>
                <img src="del.png" alt="" onclick="delThisPerson('${person.getUserAccount()}','${person.getUserIdentify()}')">
            </td>

        </c:if>

<%--        <td class="lf"><img src="del.png" alt="" onclick="deleteThisPerson('${person.getUserAccount()}')"></td>--%>
        <c:if test="${session_person.getUserIdentify()!=0}">
        <td class="lf">
            <c:if test="${session_person.getUserIdentify()==1}">
     <img src="detail.jpg" style="width: 40px;height: 40px" alt="" onclick="detailTask('${person.getUserAccount()}')">
<%--           <img src="detail.jpg" alt="" onclick="detailTask('${person.getUserAccount()}')">--%>
        </c:if>
            <c:if test="${session_person.getUserIdentify()==2}">
        <img src="up.jpg" alt="" onclick="upThisPerson('${person.getUserAccount()}')">
        </c:if>


        </td>
        </c:if>
        <c:if test="${session_person.getUserIdentify()==0}">
           <td><img src="add.png" style="width: 40px;height: 40px" alt="" onclick="addTeacher('${person.getUserAccount()}')"></td>
        </c:if>

<%--        <td class="lf"><img src="up.jpg" alt="" onclick="upThisPerson('${person.getUserAccount()}')"></td>--%>
    </tr>
</c:forEach>
    </tbody>

    <tr></tr>
</table>

</body>
<script>
    function delThisPerson(userAccount,userIdentify){
        window.location.href="man.action?action=delThisPerson&userAccount="+userAccount+"&userIdentify="+userIdentify
    }
    function addTeacher(teacherAccount){
        window.location.href="student.action?action=addTeacher&teacherAccount="+teacherAccount;

    }

    function detailTask(studentAccount){
        window.location.href="tea.action?action=goStudentTaskDetail&studentAccount="+studentAccount;

    }
    function deleteThisPersonByTeacher(studentAccount) {
        window.location.href="tea.action?action=deleteThisPersonByTeacher&studentAccount="+studentAccount;
    }
    function upThisPerson(userAccount) {
        alert("updated"+userAccount)
    }
</script>
</html>