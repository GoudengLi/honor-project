package cm.stu.servlet;

import cm.stu.bean.Person;
import cm.stu.service.ManageService;
import cm.stu.service.ManageServiceImpl;
import cm.stu.service.StudentService;
import cm.stu.service.StudentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//used in main page
@WebServlet("/common.action")
public class CommonServlet extends HttpServlet {
    private String taskName;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        StudentService ss = new StudentServiceImpl();
        Person person = (Person) req.getSession().getAttribute("session_person");
        String userAccount = person.getUserAccount();


        ManageService ms = new ManageServiceImpl();
        if (action.equals("index")) {
            //jump to index
            req.setAttribute("mainRight", "blank.jsp");
            req.getRequestDispatcher("main.jsp").forward(req, resp);

        } else if (action.equals("goMyDetail")) {
            req.setAttribute("mainRight","detail.jsp");
            req.getRequestDispatcher("main.jsp").forward(req, resp);

        } else if (action.equals("upPassword")) {
            //upPassword
            req.getRequestDispatcher("upPassword.jsp").forward(req, resp);

        } else if (action.equals("sureUpPassword")) {
            //common.action?action=sureUpPassword
            String userPassword = req.getParameter("userPassword");
            ms.sureUpPassword(userAccount, userPassword);
            req.setAttribute("tip", "password changed successfully,jump to main page 3s later!!!");
            req.getRequestDispatcher("success.jsp").forward(req, resp);

        }else if (action.equals("addComment")) {
            String userName = req.getParameter("userName");
            int userIdentify = person.getUserIdentify();

            String comment = req.getParameter("comment");
//            System.out.println(taskName);

            if (userIdentify == 0) {
                ss.addComment(userName, userIdentify, userAccount, taskName, comment);
            }





        }else if (action.equals("showComments")){
            req.setAttribute("mainRight","comment.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);
             taskName = req.getParameter("taskName");

        }
    }
}
