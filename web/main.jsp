<%--@elvariable id="person" type="java"--%>
<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2023/11/15
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #BigBodyFrame {
            width: 1600px;
            height: 120px;
            background-image: url("head.jpg");
            background-size: cover;
            position: relative;
            color: white;
            text-align: center;
            line-height: 120px;
            font-size: 24px;
        }
        #daohang{
            width: 300px;
            float: left;
            border: grey 1px solid;
        }
        #file{
            width: 270px;
            height: 50px;
            margin-left: 11px;
            margin-top: 10px;
            border: grey 1px solid;
            background-color: mediumslateblue;
        }
        a{
            color: white;
            font-size: 26px;
            margin-left: 30px;
            margin-top: 25px;
        }
    </style>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link href="${pageContext.request.contextPath}/css/css.css" rel="stylesheet" media="screen">

</head>
<body>
<div id="BigBodyFrame" STYLE="border: grey 2px solid;"><strong>B&nbsp;&nbsp;U&nbsp;&nbsp;L&nbsp;&nbsp;A</strong></div>
<br>
<span style="float: right;color: grey;margin-right: 120px">login as:${session_person.userName}</span><br>
<a href="#">change password</a>
<br><br>
<div id="daohang">
   <c:if test="${session_person.getUserIdentify()==0}">
<%--    <div id="file" onclick="clickThis()"></div>--%>
    <li id="file"><a href="common.action?action=index">Main page</a></li>
    <li id="file"><a href="student.action?action=list">teachers</a></li>
       <li id="file"><a href="student.action?action=goMyTeacher">Myteachers</a></li>
    <li id="file"><a href="common.action?action=goMyDetail">MyInformation</a></li>
    <li id="file"><a href="outLogin">Log Out</a></li>
   </c:if>
    <c:if test="${session_person.getUserIdentify()==1}">
        <%--    <div id="file" onclick="clickThis()"></div>--%>
        <li id="file"><a href="common.action?action=index">Main page</a></li>
        <li id="file"><a href="tea.action?action=list">Students</a></li>
        <li id="file"><a href="tea.action?action=goMyTask">Workplace</a></li>
        <li id="file"><a href="tea.action?action=goAddTask">AddTask</a></li>
        <li id="file"><a href="common.action?action=goMyDetail">My Information</a></li>
        <li id="file"><a href="outLogin">Log Out</a></li>
    </c:if>
    <c:if test="${session_person.getUserIdentify()==2}">
        <%--    <div id="file" onclick="clickThis()"></div>--%>
        <li id="file"><a href="common.action?action=index">Main page</a></li>
        <li id="file"><a href="man.action?action=list">members</a></li>
        <li id="file"><a href="man.action?action=goAddPerson">Add Member</a></li>
        <li id="file"><a href="common.action?action=goMyDetail">My Information</a></li>
        <li id="file"><a href="outLogin">Log Out</a></li>
    </c:if>
</div>
<jsp:include page="${mainRight=null?'blank.jsp':mainRight}"></jsp:include>
</body>
</html>




