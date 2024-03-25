package cm.stu.util;

import cm.stu.bean.Person;
import cm.stu.dao.Deal;
import cm.stu.dao.Generate;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class Test {
    public static void main(String[] args) {
//        Person p=new Person();
//        p.setUserAccount("17287");
//        p.setUserPassword("1");
//        Person person= TestDao.Login(p);
//
//        if (person==null){
//            System.out.println("failed");
//        }else {
//            System.out.println("success");
//        }
//        Date date=new Date(System.currentTimeMillis());
//        SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//        String time=sdt.format(date);
//        System.out.println(time);
//        Deal.deal("INSERT INTO task VALUES('11','11','11','11')");


        }


    public static String getTaskAccount() {
        String taskAccount = generateRandom8Digits();
        return taskAccount;
    }
    private static String generateRandom8Digits() {
        Random random = new Random();
        StringBuilder random8Digits = new StringBuilder();
        while (true){
        for (int i = 0; i < 8; i++) {
            int randomDigit = random.nextInt(10);
            random8Digits.append(randomDigit);
        }
        int num = Generate.isExistTaskAccount(random8Digits);
        if (num==0){
            break;
        }else {
            random8Digits.setLength(0);
        }
        }
        return random8Digits.toString();
    }

    public static String getDate() {
        Date date=new Date(System.currentTimeMillis());
        SimpleDateFormat sdt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdt.format(date);
    }



    public static String getPersonAccount() {
        Random random = new Random();
        StringBuilder random9Digits = new StringBuilder();
        String userAccount="";
        while (true){
            for (int i = 0; i < 9; i++) {
                int randomDigit = random.nextInt(10);
                random9Digits.append(randomDigit);
            }
            int num = Generate.isExistPersonAccount(random9Digits);
            if (num==0){
                break;
            }else {
                random9Digits.setLength(0);
            }
        }
        userAccount=random9Digits.toString();
        return userAccount;
    }
}
