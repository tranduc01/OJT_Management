/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.application;

import java.sql.Date;

/**
 *
 * @author Tranduc
 */
public class ApplicationDTO {
    private int applyID;
    private Date applyDate;
    private String stuID;
    private int jobID;
    private int status;

    public ApplicationDTO() {
    }

    public ApplicationDTO(int applyID, Date applyDate, String stuID, int jobID, int status) {
        this.applyID = applyID;
        this.applyDate = applyDate;
        this.stuID = stuID;
        this.jobID = jobID;
        this.status = status;
    }

    public int getApplyID() {
        return applyID;
    }

    public void setApplyID(int applyID) {
        this.applyID = applyID;
    }

    public Date getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(Date applyDate) {
        this.applyDate = applyDate;
    }

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "ApplicationDTO{" + "applyID=" + applyID + ", applyDate=" + applyDate + ", stuID=" + stuID + ", jobID=" + jobID + ", status=" + status + '}';
    }
    
    
}
