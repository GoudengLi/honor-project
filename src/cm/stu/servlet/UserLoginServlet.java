package cm.stu.servlet;

import cm.stu.bean.Person;
import cm.stu.service.UserLoginService;
import cm.stu.service.UserLoginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userLogin")
public class UserLoginServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        System.out.println("here is jonny!!!");
        req.setCharacterEncoding("UTF-8");
        String userAccount= req.getParameter("ayaka");
        String userPwd= req.getParameter("6");
        Person person=new Person(userAccount,userPwd);
        UserLoginService ul=new UserLoginServiceImpl();
        Person newPerson=ul.getLogin(person);

        if (newPerson!=null){
            //contain for 30 min
            req.getSession().setAttribute("session_person",newPerson);
            req.setAttribute("person",newPerson);
            req.setAttribute("mainRight","blank.jsp");
            req.getRequestDispatcher("main.jsp").forward(req,resp);
        }else {
            //back to login
            req.setAttribute("tip","account can not match password");
            req.getRequestDispatcher("userLogin.jsp").forward(req, resp);
        }


    }
}
