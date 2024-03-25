package cm.stu.dao;

import cm.stu.bean.Person;

import java.util.List;

public class ManageDaoImpl implements ManageDao{
    @Override
    public List<Person> getAllPerson() {
        String sql="select * from person where userIdentify!=2";
        return Deal.getAllPerson(sql);
    }

    @Override
    public List<Person> getsearch(String matchText) {
        String sql="select * from person where userIdentify!=2 and (userAccount='"+matchText+"' or userName like '%"+matchText+"%' or userIdCard='"+matchText+"')";
        return Deal.getAllPerson(sql);
    }

    @Override
    public void addPerson(Person newPerson) {
        //`userAccount``userName``userGender``userBirthday``userIdCard``userPassword``userIdentify``userOtherName`
        String sql="insert into person values('"+newPerson.getUserAccount()+"','"+newPerson.getUserName()+"','" +
                ""+newPerson.getUserGender()+"'," +
                "'"+newPerson.getUserBirthday()+"','"+newPerson.getUserIdCard()+"','" +
                ""+newPerson.getUserPassword()+"',"+newPerson.getUserIdentify()+",'"+newPerson.getUserOtherName()+"')";
        Deal.deal(sql);

    }

    @Override
    public void sureUpPassword(String userAccount, String userPassword) {
        String sql="update person set userPassword='"+userPassword+"' where userAccount='"+userAccount+"'";
        System.out.println(sql);
        Deal.deal(sql);
    }

    @Override
    public void delThisPerson(String delAccount, String userIdentify) {
        if (Integer.parseInt(userIdentify)==0){
            //del student
            String sql="DELETE FROM userteacher WHERE userAccount='"+delAccount+"'";
            Deal.deal(sql);
            sql="DELETE FROM studenttask WHERE studentAccount='"+delAccount+"'";
            Deal.deal(sql);

        }else {
            //del teacher
            String sql="DELETE FROM `studenttask` WHERE " +
                    "`taskAccount` IN(SELECT taskAccount FROM task WHERE teacherAccount='"+delAccount+"')";
            Deal.deal(sql);
            sql="DELETE FROM task WHERE teacherAccount='"+delAccount+"'";
            Deal.deal(sql);
            sql="DELETE FROM userteacher WHERE teacherAccount='"+delAccount+"'";
            Deal.deal(sql);

        }
        String sql="DELETE FROM person WHERE userAccount='"+delAccount+"'";
        Deal.deal(sql);
    }

}
//    private List<Person> getAllPerson(String sql){
//        Connection connection= ConnectionFactory.getConnection();
//        PreparedStatement pre=null;
//        ResultSet res=null;
//        List<Person> list=new ArrayList<>();
//        try{
//            pre=connection.prepareStatement(sql);
//            res=pre.executeQuery()  ;
//            while (res.next()){
//                Person newPerson=new Person();
//                //`userAccount``userName``userGender``userBirthday``userIdCard``userPassword``userIdentify``userOtherName`
//                newPerson.setUserAccount(res.getString("userAccount"));
//                newPerson.setUserName(res.getString("userName"));
//                newPerson.setUserGender(res.getString("userGender"));
//                newPerson.setUserBirthday(res.getString("userBirthday"));
//                newPerson.setUserIdCard(res.getString("userIdCard"));
//                newPerson.setUserPassword(res.getString("userPassword"));
//                newPerson.setUserIdentify(res.getInt("userIdentify"));
//                newPerson.setUserOtherName(res.getString("userOtherName"));
//                list.add(newPerson);
//            }
//        }catch (SQLException throwables){
//            throwables.printStackTrace();
//        }finally {
//
//        }
//return list;
//    }