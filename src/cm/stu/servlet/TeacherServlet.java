package cm.stu.servlet;

import cm.stu.bean.Person;
import cm.stu.bean.StudentAnswer;
import cm.stu.bean.Task;
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

@WebServlet("/tea.action")
public class TeacherServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.setCharacterEncoding("UTF-8");
        String action=req.getParameter("action");
        TeacherService ts=new TeacherServiceImpl();
        Person person=(Person)req.getSession().getAttribute("session_person");
        String userAccount=person.getUserAccount();
        //matchText searchMyStudent
        if(action.equals("list")||action.equals("searchMyStudent")||action.equals("deleteThisPersonByTeacher")){
            //window.location.href="tea.action?action=deleteThisPersonByTeacher&studentAccount"+studentAccount
            List arr=null;
            if (action.equals("searchMyStudent")){
                String matchText=req.getParameter("matchText");
                arr=ts.getSearchStudentByTeacherAccount(userAccount,matchText);
            }else {
                //searchMystudent matchText

                 if (action.equals("deleteThisPersonByTeacher")){
                     String studentAccount = req.getParameter("studentAccount");
                     System.out.println(studentAccount);
                     ts.deleteThisPersonByTeacher(studentAccount,userAccount);

                 }
                 arr=ts.AllStudentsByTeacherAccount(userAccount);
            }
            //get all students' information

            req.setAttribute("arr",arr);
            req.setAttribute("mainRight","person.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);

        }else if (action.equals("goMyTask")||action.equals("deleteThisTask")){
            // window.location.href="tea.action?action=deleteThisTask&taskAccount="+taskAccount;
            if (action.equals("deleteThisTask")){
                String taskAccount=req.getParameter("taskAccount");
                ts.deleteThisTask(taskAccount);
            }

            List<Task> arr=ts.getAllMyTask(userAccount);
            req.setAttribute("arr",arr);
            req.setAttribute("mainRight","task.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);
        }
//
        else if (action.equals("goSkimDetail")||action.equals("goStudentTaskDetail")){
            List<StudentAnswer> arr;
            if (action.equals("goSkimDetail")){
                String taskAccount=req.getParameter("taskAccount");
               arr= ts.getTaskDetail(taskAccount);
            }else {
                req.setAttribute("sign","goStudentTaskDetail");
                String studentAccount=req.getParameter("studentAccount");
                arr=ts.goStudentTaskDetail(userAccount,studentAccount);
            }


            System.out.println("Task Account for goSkimDetail: ");
            System.out.println("Student Answer List: " + arr);
            req.setAttribute("arr",arr);
            req.setAttribute("mainRight","studentTask.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);


        }else if (action.equals("deleteTask")){
            req.setCharacterEncoding("UTF-8");
            //action?action=deleteTask&studentAccount="+studentAccount+"$isFinish"+isFinish
            String studentAccount=req.getParameter("studentAccount");
            String taskAccount=req.getParameter("taskAccount");
            String isFinish=req.getParameter("isFinish");
            System.out.println(isFinish);
            ts.deleteTask(taskAccount,studentAccount,isFinish);


            req.setAttribute("tip","delete completed");
            req.setAttribute("mainRight","blank.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);
        }

        else if (action.equals("goAddTask")||action.equals("addTask")){
            if (action.equals("addTask")){
                if (action.equals("addTask")){
                    String taskName=req.getParameter("taskName");
                    taskName=taskName.trim();
                    if (taskName.equals("")){
                        req.setAttribute("tip","sorry error happens when adding tasks");
                    }else {
                        //add Tasks to database
                        String date= Test.getDate();
                        String taskAccount=Test.getTaskAccount();
                        Task task=new Task(taskAccount,userAccount,date,taskName);
                        ts.AddTask(task);

                        req.setAttribute("tip","successfully add Task");
                    }

                }
            }
            req.setAttribute("mainRight","addTask.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);
        }

    }
}
