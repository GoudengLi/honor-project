<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/2/4
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>User Profile</title>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        table {
            width: 60%;
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
            width: 30%;
            text-align: left;
            padding-left: 20px;
        }

        .rg {
            width: 70%;
        }

        tr:nth-of-type(odd) {
            background-color: #f9f9f9;
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

    <tbody>
    <tr class="row">

        <td class="lf">Account</td>
        <td class="rg">${session_person.getUserAccount()}</td>

    </tr>

    <tr class="row">

        <td class="lf">Name</td>
        <td class="rg">${session_person.getUserName()}</td>

    </tr>

    <tr class="row">

        <td class="lf">Gender</td>
        <td class="rg">${session_person.getUserGender()}</td>

    </tr>

    <tr class="row">

        <td class="lf">Birthday</td>
        <td class="rg">${session_person.getUserBirthday()}</td>

    </tr>

    <tr class="row">

        <td class="lf">ID</td>
        <td class="rg">${session_person.getUserIdCard()}</td>

    </tr>

    <tr class="row">

        <td class="lf">
            <button onclick="upPassword()">change password</button>


        </td>


    </tr>

    </tbody>

</table>

</body>

</html>
<script>
    function upPassword(){
       window.open("common.action?action=upPassword",null,"width=700,height=400,left=400,top=150",true);
    }
</script>