/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.student;

/**
 *
 * @author Tranduc
 */
public class StudentDTO {
     private String name;
    private String id;
    private int semester;
    private String email;
    private String major;
    private String status;

    public StudentDTO() {
    }

    public StudentDTO(String name, String id, int semester, String email, String major, String status) {
        this.name = name;
        this.id = id;
        this.semester = semester;
        this.email = email;
        this.major = major;
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

   

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

  
}
