<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2023/11/8
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login Page</title>
  <style>
    body {
      background-color: #f0f0f0;
    }
    #loginFrame {
      width: 500px;
      height: 400px;
      margin: 260px auto;
      border: 2px solid grey;
      padding: 20px;
      text-align: center;
      background-color: #ffffff;
    }
    #innerLoginFrame {
      width: 360px;
      margin: 0 auto;
      color: grey;
      font-size: 20px;
    }
    input {
      width: 220px;
      height: 30px;
      margin-bottom: 10px;
    }
    #submitBtn {
      width: 140px;
      margin-right: 15px;
    }
    #registerLink {
      width: 140px;
    }
    #tip {
      color: red;
      font-size: 15px;
    }
    h1 {
      margin-top: 40px;
      font-size: 40px;
      font-weight: normal;
      letter-spacing: 10px;
    }
  </style>
</head>
<body>
<div id="loginFrame">
  <h1>B u l a</h1>
  <div id="innerLoginFrame">
    <form action="userLogin" method="post" onsubmit="return checkLogin()">
      User <input type="text" id="userAc" name="ayaka" class="myText"><br>
      Pwd <input type="password" id="userPw" name="6" class="myText"><br>
      <input type="submit" id="submitBtn" value="Submit">
      <span id="tip">${tip}</span>
    </form>
  </div>
</div>
</body>
</html>

<script>
  function checkLogin() {
    let userAccount = document.getElementById("userAc").value;
    let userPwd = document.getElementById("userPw").value;
    if (userAccount == null || userAccount.trim() === "") {
      document.getElementById("tip").innerHTML = "Blank account";
      return false;
    }
    if (userPwd == null || userPwd.trim() === "") {
      document.getElementById("tip").innerHTML = "Password cannot be blank";
      return false;
    }
  }
</script>

