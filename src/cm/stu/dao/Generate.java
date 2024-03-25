package cm.stu.dao;

public class Generate {
    public static int isExistTaskAccount(StringBuilder random8Digits) {
        String sql="select count(*) num from task where taskAccount='"+ random8Digits+"'";
        return Deal.isExist(sql);
    }

    public static int IsExsistStuTea(String userAccount, String teacherAccount) {
        //`userteacher``userAccount``teacherAccount`
        String sql ="select count(*) num from userteacher where userAccount='"+userAccount+"' and teacherAccount='"+teacherAccount+"'";
        return  Deal.isExist(sql);

    }

    public static int isExistPersonAccount(StringBuilder userAccount) {
        String sql ="select count(*) num from userteacher where userAccount='"+userAccount+"' ";
        return  Deal.isExist(sql);
    }
}
