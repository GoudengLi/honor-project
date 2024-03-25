package cm.stu.bean;

public class Task {
    public String getTaskAccount() {
        return taskAccount;
    }

    public void setTaskAccount(String taskAccount) {
        this.taskAccount = taskAccount;
    }

    public String getTeacherAccount() {
        return teacherAccount;
    }

    public void setTeacherAccount(String teacherAccount) {
        this.teacherAccount = teacherAccount;
    }

    public String getTaskDate() {
        return taskDate;
    }

    public void setTaskDate(String taskDate) {
        this.taskDate = taskDate;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    //`taskAccount``teacherAccount``taskDate``taskName`
    private String taskAccount;
    private String teacherAccount;



    private String taskDate;
    private String taskName;


    public Task(){

    }
    @Override
    public String toString() {
        return "Task{" +
                "taskAccount='" + taskAccount + '\'' +
                ", teacherAccount='" + teacherAccount + '\'' +
                ", taskDate='" + taskDate + '\'' +
                ", taskName='" + taskName + '\'' +
                '}';
    }

    public Task(String taskAccount, String teacherAccount, String taskDate, String taskName) {
        this.taskAccount = taskAccount;
        this.teacherAccount = teacherAccount;
        this.taskDate = taskDate;
        this.taskName = taskName;
    }


}
