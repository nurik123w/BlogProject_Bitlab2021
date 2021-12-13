package com.nurik.classes;

import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
    private Long id;
    private String name;
    private String surname;
    private String email;
    private String password;
    private Date birthdate;
    private String city;
    private String gender;
    private String job;
    private String address;
    private String img;

    public User() {

    }

    public User(Long id, String name, String surname,String img) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.img = img;
    }

    public User(Long id, String name, String surname, String email, String password, Date birthdate, String city, String gender, String job, String address) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.birthdate = birthdate;
        this.city = city;
        this.gender = gender;
        this.job = job;
        this.address = address;
    }

    public User(Long id, String name, String surname, String email, String password, Date birthdate, String city, String gender, String job, String address, String img) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.password = password;
        this.birthdate = birthdate;
        this.city = city;
        this.gender = gender;
        this.job = job;
        this.address = address;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Long getId() {
        return id;
    }


    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", birthdate=" + birthdate +
                ", city='" + city + '\'' +
                ", gender='" + gender + '\'' +
                ", job='" + job + '\'' +
                ", address='" + address + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
