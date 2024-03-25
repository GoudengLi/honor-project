<%--
  Created by IntelliJ IDEA.
  User: 张san
  Date: 2024/2/5
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    * {
        background-color: #9acfea;
    }
</style>

<div class="data_list">
    <h1>Password Modification</h1>

    <div>

            <table class="table table-striped table-bordered table-hover datatable">
                <thead>
                <tr height="15px">
                    <th style="text-align: center;">Enter New Password:</th>
                    <th style="text-align: center;"><input name="userPassword" id="userPassword" type="password" width="400px"
                                                           height="26px"
                                                           style="border-bottom-right-radius: 3px"></th>
                </tr>
                <tr style="width: 500px">
                    <th style="text-align: center;">Re-enter Password:</th>
                    <th style="text-align: center;width: 70%"><input id="a" type="password" width="400px" height="26px";style="border-bottom-right-radius: 3px">
                    </th>
                </tr>
                <tr style="width: 500px">
                    <td></td>
                    <td>
                        <input type="submit" value="Submit">
                    </td>

                </tr>
                <tr style="width: 500px">
                    <td></td>
                    <td>
                        <span style="color: #dd1144" id="error"></span>
                    </td>

                </tr>
                </thead>
            </table>
        </form>

        <script>
            function checkThisFile() {
                let userPassword = document.getElementById("userPassword").value;
                let a = document.getElementById("a").value;

                if ((a==null||a.trim()=="")||(userPassword==null||userPassword.trim()=="")) {
                    document.getElementById("error").innerHTML = "Please enter both passwords.";
                    return false;
                } else if(a!=userPassword){
                    document.getElementById("error").innerHTML = "Passwords do not match.";
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </div>
    <div align="center"><font color="red"></font></div>
</div>


