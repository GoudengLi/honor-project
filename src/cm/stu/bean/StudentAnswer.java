package cm.stu.bean;

public class StudentAnswer {
    //`taskAccount``studentAccount``studentAnswer``isFinish``Score``userName``taskName`
    private String taskAccount;
    private String studentAccount;
    private String studentAnswer;
    private int isFinish;
    private int Score;
    private String userName;
    private  String taskName;

    public String getTaskAccount() {
        return taskAccount;
    }

    public void setTaskAccount(String taskAccount) {
        this.taskAccount = taskAccount;
    }

    public String getStudentAccount() {
        return studentAccount;
    }

    public void setStudentAccount(String studentAccount) {
        this.studentAccount = studentAccount;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public int getIsFinish() {
        return isFinish;
    }

    public void setIsFinish(int isFinish) {
        this.isFinish = isFinish;
    }

    public int getScore() {
        return Score;
    }

    public void setScore(int score) {
        Score = score;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }
}
