package cm.stu.service;

import cm.stu.bean.Person;
import cm.stu.bean.StudentAnswer;

import java.util.List;

public interface StudentService {
    List<Person> getAllTeacher();

    List<Person> getSearchTeacher(String matchText);

    List<Person> getMyTeacher(String userAccount);

    void addTeacher(String userAccount, String teacherAccount);

    List<StudentAnswer> goMyTeaTask(String userAccount, String teacherAccount);

    void deleteMyTeacher(String userAccount, String teacherAccount);

    void addComment(String userName, int userIdentify, String userAccount, String taskName,String comment);

    void doAnswer(String userAccount, String taskAccount, String answer);
}
