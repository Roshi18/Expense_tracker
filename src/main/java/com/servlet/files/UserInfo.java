package com.servlet.files;

public class UserInfo {
    private String fullname;
    private String email;
    private int age;
    private double salary;
    private int user_id;

    public UserInfo(String fullname, String email, int age, double salary,int user_id) {
        this.fullname = fullname;
        this.email = email;
        this.age = age;
        this.salary = salary;
        this.user_id = user_id;
    }

    // Getter methods
    public String getFullname() {
        return fullname;
    }

    public String getEmail() {
        return email;
    }

    public int getAge() {
        return age;
    }

    public double getSalary() {
        return salary;
    }
    public int getuser_id() {
        return user_id;
    }
}
