/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.job;

import java.sql.Date;

/**
 *
 * @author Tranduc
 */
public class JobDTO {
    private int jobID;
    private String jobName;
    private String jobTitle;
    private String jobDescription;
    private String jobRequirement;
    private String jobBenefits;
    private int jobSalary;
    private Date jobCreateDate;
    private Date jobEndDate;
    private int status;
    private int amount;
    private int comID;
    private String comImage;
    private String comAddress;
    private String majorID;

    public JobDTO() {
    }

    public JobDTO(int jobID, String jobName, String jobTitle, String jobDescription, String jobRequirement, String jobBenefits, int jobSalary, Date jobCreateDate, Date jobEndDate, int status, int amount, int comID, String comImage, String comAddress, String majorID) {
        this.jobID = jobID;
        this.jobName = jobName;
        this.jobTitle = jobTitle;
        this.jobDescription = jobDescription;
        this.jobRequirement = jobRequirement;
        this.jobBenefits = jobBenefits;
        this.jobSalary = jobSalary;
        this.jobCreateDate = jobCreateDate;
        this.jobEndDate = jobEndDate;
        this.status = status;
        this.amount = amount;
        this.comID = comID;
        this.comImage = comImage;
        this.comAddress = comAddress;
        this.majorID = majorID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    

    public String getComImage() {
        return comImage;
    }

    public void setComImage(String comImage) {
        this.comImage = comImage;
    }

    public String getComAddress() {
        return comAddress;
    }

    public void setComAddress(String comAddress) {
        this.comAddress = comAddress;
    }

    

    

    

    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getJobRequirement() {
        return jobRequirement;
    }

    public void setJobRequirement(String jobRequirement) {
        this.jobRequirement = jobRequirement;
    }

    public String getJobBenefits() {
        return jobBenefits;
    }

    public void setJobBenefits(String jobBenefits) {
        this.jobBenefits = jobBenefits;
    }

    public int getJobSalary() {
        return jobSalary;
    }

    public void setJobSalary(int jobSalary) {
        this.jobSalary = jobSalary;
    }

    public Date getJobCreateDate() {
        return jobCreateDate;
    }

    public void setJobCreateDate(Date jobCreateDate) {
        this.jobCreateDate = jobCreateDate;
    }

    public Date getJobEndDate() {
        return jobEndDate;
    }

    public void setJobEndDate(Date jobEndDate) {
        this.jobEndDate = jobEndDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getComID() {
        return comID;
    }

    public void setComID(int comID) {
        this.comID = comID;
    }



    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    @Override
    public String toString() {
        return "JobDTO{" + "jobID=" + jobID + ", jobName=" + jobName + ", jobTitle=" + jobTitle + ", jobDescription=" + jobDescription + ", jobRequirement=" + jobRequirement + ", jobBenefits=" + jobBenefits + ", jobSalary=" + jobSalary + ", jobCreateDate=" + jobCreateDate + ", jobEndDate=" + jobEndDate + ", status=" + status + ", comID=" + comID + ", comImage=" + comImage + ", comAddress=" + comAddress + ", majorID=" + majorID + '}';
    }

   

   
    
    
}
