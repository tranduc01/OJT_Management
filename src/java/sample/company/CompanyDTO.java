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
    private String comDescription;
    private String comAddress;
    private int accID;

    public CompanyDTO() {
    }

    public CompanyDTO(int comID, String comDescription, String comAddress, int accID) {
        this.comID = comID;
        this.comDescription = comDescription;
        this.comAddress = comAddress;
        this.accID = accID;
    }

    public int getComID() {
        return comID;
    }

    public void setComID(int comID) {
        this.comID = comID;
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

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    @Override
    public String toString() {
        return "CompanyDTO{" + "comID=" + comID + ", comDescription=" + comDescription + ", comAddress=" + comAddress + ", accID=" + accID + '}';
    }

    
    
}
