/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.company;

/**
 *
 * @author Tranduc
 */
public class CompanyDTO {
    private int comID;
    private String comName;
    private String comDescription;
    private String comAddress;
    private String comImage;

    public CompanyDTO() {
    }

    public CompanyDTO(int comID, String comName, String comDescription, String comAddress, String comImage) {
        this.comID = comID;
        this.comName = comName;
        this.comDescription = comDescription;
        this.comAddress = comAddress;
        this.comImage = comImage;
    }

    public int getComID() {
        return comID;
    }

    public void setComID(int comID) {
        this.comID = comID;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public String getComDescription() {
        return comDescription;
    }

    public void setComDescription(String comDescription) {
        this.comDescription = comDescription;
    }

    public String getComAddress() {
        return comAddress;
    }

    public void setComAddress(String comAddress) {
        this.comAddress = comAddress;
    }

    public String getComImage() {
        return comImage;
    }

    public void setComImage(String comImage) {
        this.comImage = comImage;
    }

    @Override
    public String toString() {
        return "CompanyDTO{" + "comID=" + comID + ", comName=" + comName + ", comDescription=" + comDescription + ", comAddress=" + comAddress + ", comImage=" + comImage + '}';
    }
    
    
}
