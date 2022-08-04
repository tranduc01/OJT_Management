/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.result;

/**
 *
 * @author Tranduc
 */
public class ResultDTO {
    private String stuID;
    private int resultID;
    private String comment;
    private int status;
    private int grade;

    public ResultDTO() {
    }

    public ResultDTO(String stuID, int resultID, String comment, int status, int grade) {
        this.stuID = stuID;
        this.resultID = resultID;
        this.comment = comment;
        this.status = status;
        this.grade = grade;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public int getResultID() {
        return resultID;
    }

    public void setResultID(int resultID) {
        this.resultID = resultID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }
    
}
