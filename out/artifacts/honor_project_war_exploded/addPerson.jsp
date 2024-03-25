<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/2/5
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">

</script>
<div class="data_list">
</div>

<form method="post" action="man.action?action=addThisPerson" onsubmit="return checkThis()">

    <div class="data_form">
        <table align="center">
            <tr>
                <td><font color="red">*</font>Name:</td>

                <td><input type="text" id="userName" name="userName"
                           style="margin-top:5px;height:30px;"/></td>


            </tr>
            <tr>
                <td><font color="red">*</font>Gender:</td>
                <td>&nbsp;<input  type="radio" name="userGender" value="male" checked="checked">&nbsp;Male&nbsp;&nbsp;
                    <input type="radio" name="userGender" value="female">Female<br>


            </tr>

            <tr>
                <td><font color="red">*</font>Date of Birth:</td>
                <td><input type="date" id="userBirthday" name="userBirthday"
                           style="margin-top:5px;height:30px;"/></td>
            </tr>

            <tr>
                <td><font color="red">*</font>ID Card Number:</td>
                <td><input type="text" id="userIdCard" name="userIdCard" style="margin-top:5px;height:30px;"/>
                </td>
            </tr>

            <tr>
                <td><font color="red">*</font>Phone Number:</td>
                <td><input type="number" id="userPhone" name="userPhone" style="margin-top:5px;height:30px;"/>
                </td>
            </tr>

            <tr>
                <td><font color="red">*</font>Role:</td>

                <td>
                    <select id="userIdentify" name="userIdentify" style="width: 205px" ;>
                        <%--                                Top secret, secret, confidential, non-secret--%>
                        <option id="a" value="0">Student</option>
                        <option id="b" value="1">Teacher</option>
                    </select>
                </td>
            </tr>


            <tr>
                <td><font color="red">*</font>Position:</td>
                <td><input type="text" id="nikeName" name="userOtherName" placeholder="Subject Teacher/Student"
                           style="margin-top:5px;height:30px;"/></td>

            </tr>


            <tr>
                <td><font color="red">*</font>Enter Password:</td>
                <td><input type="password" id="userPassword" name="userPassword"
                           style="margin-top:5px;height:30px;"/></td>
            </tr>

            <tr>
                <td><font color="red">*</font>Confirm Password:</td>
                <td><input type="password" id="rUserPassword" name="rUserPassword"
                           style="margin-top:5px;height:30px;"/></td>
            </tr>


            <script>

                function checkThis() {
                    let userName = document.getElementById("userName").value;
                    let userIdCard = document.getElementById("userIdCard").value;
                    let nikeName = document.getElementById("nikeName").value;
                    let userPassword = document.getElementById("userPassword").value;
                    let userPhone = document.getElementById("userPhone").value;
                    let rUserPassword = document.getElementById("rUserPassword").value;
                    if (userName.trim() == null || userName.trim() == "") {
                        document.getElementById("error").innerHTML = "Name cannot be empty";
                        return false;
                    }

                    if (userIdCard.trim() == null || userIdCard.trim() == "") {
                        document.getElementById("error").innerHTML = "ID Card Number cannot be empty";
                        return false;
                    }

                    if (userPhone.trim() == null || userPhone.trim() == "") {
                        document.getElementById("error").innerHTML = "Phone Number cannot be empty";
                        return false;
                    }

                    if (nikeName.trim() == null || nikeName.trim() == "") {
                        document.getElementById("error").innerHTML = "Position cannot be empty";
                        return false;
                    }


                    if (userPassword == null || userPassword.trim() == "") {
                        document.getElementById("error").innerHTML = "Password cannot be empty";
                        return false;
                    }


                    if (rUserPassword.trim() == null || rUserPassword.trim() == "") {
                        document.getElementById("error").innerHTML = "Password cannot be empty";
                        return false;
                    }
                    let reg1 = /(^\d{18}$)||(^\d{17}(\d|X|x)$)/;
                    let reg2 = /(^\d{11}$)/;
                    if(reg1.test(userIdCard) === false){
                        alert("Invalid ID Card input");
                        return false;
                    }
                    if(reg2.test(userPhone) === false){
                        alert("Invalid phone number input");
                        return false;
                    }
                    if (rUserPassword != userPassword) {
                        document.getElementById("error").innerHTML = "Passwords do not match";
                        return false;
                    }

                    return true;


                }


            </script>


        </table>
        <div align="center">
            <input type="submit" class="btn btn-primary" value="save"/>
            <span style="color: #dd1144" id="error">${tip}</span>
        </div>
    </div>
</form>
</div>

