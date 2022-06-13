/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.account;

import java.sql.Date;

/**
 *
 * @author Tranduc
 */
public class AccountDTO {
    private int accId;
    private String email;
    private String password;
    private String name;
    private String phone;
    private String avatar;
    private String cvPath;
    private Date birthday;
    private int role;
    private int status;
    private Date crateDate;
    private String stuID;
    private String semID;
    private String semName;
    private String majorID;
    private String majorName;

    public AccountDTO() {
    }

    public AccountDTO(int accId, String email, String password, String name, String phone, String avatar, String cvPath, Date birthday, int role, int status, Date crateDate, String stuID, String semID, String semName, String majorID, String majorName) {
        this.accId = accId;
        this.email = email;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.avatar = avatar;
        this.cvPath = cvPath;
        this.birthday = birthday;
        this.role = role;
        this.status = status;
        this.crateDate = crateDate;
        this.stuID = stuID;
        this.semID = semID;
        this.semName = semName;
        this.majorID = majorID;
        this.majorName = majorName;
    }

    
    public String getCvPath() {
        return cvPath;
    }

    public void setCvPath(String cvPath) {
        this.cvPath = cvPath;
    }

    

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public String getSemID() {
        return semID;
    }

    public void setSemID(String semID) {
        this.semID = semID;
    }

    public String getSemName() {
        return semName;
    }

    public void setSemName(String semName) {
        this.semName = semName;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCrateDate() {
        return crateDate;
    }

    public void setCrateDate(Date crateDate) {
        this.crateDate = crateDate;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "accId=" + accId + ", email=" + email + ", password=" + password + ", name=" + name + ", phone=" + phone + ", avatar=" + avatar + ", role=" + role + ", status=" + status + ", crateDate=" + crateDate + '}';
    }
    
}
