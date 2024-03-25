package cm.stu.servlet;

import cm.stu.bean.Person;
import cm.stu.bean.StudentAnswer;
import cm.stu.dao.Generate;
import cm.stu.service.StudentService;
import cm.stu.service.StudentServiceImpl;
import cm.stu.service.TeacherService;
import cm.stu.service.TeacherServiceImpl;
import cm.stu.util.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/student.action")
public class StudentServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     req.setCharacterEncoding("UTF-8");
    String action=req.getParameter("action");
        StudentService ss=new StudentServiceImpl();
    Person person=(Person)req.getSession().getAttribute("session_person");
    String userAccount=person.getUserAccount();
    //student.action?action=searchTeacher
    if ((action.equals("list")||action.equals("searchTeacher"))){
        //student.action?action=deleteMyTeacher&teacherAccount="+teacherAccount
        List<Person> arr;
        if (action.equals("list")){
            arr=ss.getAllTeacher();
        }else {
            String matchText = req.getParameter("matchText");
            arr=ss.getSearchTeacher(matchText);
        }
        req.setAttribute("arr",arr);
        req.setAttribute("mainRight","person.jsp");
        req.getRequestDispatcher("main.jsp").forward(req,resp);
    }else if (action.equals("goMyTeacher")||action.equals("deleteMyTeacher")){
        //student.action?action=deleteMyTeacher&teacherAccount="+teacherAccount
        //student.action?action=goMyTeacher

        if (action.equals("deleteMyTeacher")){
            String teacherAccount=req.getParameter("teacherAccount");
            ss.deleteMyTeacher(userAccount,teacherAccount);
        }
        List<Person> arr=ss.getMyTeacher(userAccount);
        req.setAttribute("arr",arr);
        req.setAttribute("mainRight","myTeacher.jsp");
        req.getRequestDispatcher("main.jsp").forward(req,resp);
    }else if(action.equals("addTeacher")){

        //addTeacher&teacherAccount
        String teacherAccount=req.getParameter("teacherAccount");
        int flag= Generate.IsExsistStuTea(userAccount,teacherAccount);
        if (flag==0){
            ss.addTeacher(userAccount,teacherAccount);
            req.setAttribute("tip","Wow, successfully adding it! ✨");

        }else {
            req.setAttribute("tip","Oh no, you've activated the repeat mode again! (¬‿¬)");
        }
        req.setAttribute("mainRight","blank.jsp");
        req.getRequestDispatcher("main.jsp").forward(req,resp);

    }else if (action.equals("goMyTeaTask")){
        // window.location.href="student.action?action=goMyTeaTask&teacherAccount="+teacherAccount
        String teacherAccount=req.getParameter("teacherAccount");
        List<StudentAnswer> arr=ss.goMyTeaTask(userAccount,teacherAccount);
        req.setAttribute("arr",arr);
        req.setAttribute("mainRight","studentTask.jsp");
        req.getRequestDispatcher("main.jsp").forward(req,resp);
    }else if (action.equals("doAnswer")){
//        stu.action?action=doAnswer&taskAccount="+taskAccount+"",
        String taskAccount=req.getParameter("taskAccount");
        req.setAttribute("taskAccount",taskAccount);
        req.getRequestDispatcher("doAnswer.jsp").forward(req,resp);

    }else if (action.equals("dealAnswer")){
        //student.action?action=doAnswer&taskAccount="+taskAccount
        String taskAccount=req.getParameter("taskAccount");
        String answer=(req.getParameter("answer")).trim();
        ss.doAnswer(userAccount,taskAccount,answer);

        req.setAttribute("tip","Finished answer!!!");

        req.getRequestDispatcher("success.jsp").forward(req,resp);



    }
}
}
