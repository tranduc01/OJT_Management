/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.major;

/**
 *
 * @author Tranduc
 */
public class MajorDTO {
    private String majorID;
    private String majorName;

    public MajorDTO() {
    }

    public MajorDTO(String majorID, String majorName) {
        this.majorID = majorID;
        this.majorName = majorName;
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
    
}
