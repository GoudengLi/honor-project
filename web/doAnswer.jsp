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
            width: 100%;
            height: 600px;
            float: right;
            margin-right: 40px;
            border: saddlebrown 1px solid;
        }
        #innerAddTaskFrame{
            width: 100%;
            height: 400px;
            margin-left:50px;
            margin-top: 50px;
            font-size: 20px;
            color: mediumslateblue;

        }
    </style>
</head>
<body >
<div id="content">
    <div id="innerAddTaskFrame">
        Answer here:<br><br>
        <form action="student.action?action=dealAnswer&taskAccount=${taskAccount} "method="post" onsubmit="return isDeal()">
        <textarea id="answer" style="width: 600px;font-size: 25px;color: grey; height: 160px" rows="4" name="answer"   >

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
    function isDeal(){
        let  text=document.getElementById("answer").value;
        if (text.trim()==""||text==null){
            alert("write something pls(இ﹏இ｡)")
            return false;
        }else {
            return  true;
        }
        }

</script>