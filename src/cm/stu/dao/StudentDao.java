package cm.stu.dao;

import cm.stu.bean.Person;
import cm.stu.bean.StudentAnswer;

import java.util.List;

public interface StudentDao {
    List<Person> getAllTeacher();

    List<Person> etSearchTeacher(String matchText);

    List<Person> getMyTeacher(String userAccount);

    void addTeacher(String userAccount, String teacherAccount);

    List<StudentAnswer> goMyTeaTask(String userAccount, String teacherAccount);

    void deleteMyTeacher(String userAccount, String teacherAccount);

    void addComment(String userName, int userIdentify, String userAccount, String taskName,String comment);

    void doAnswer(String userAccount, String taskAccount, String answer);
}
