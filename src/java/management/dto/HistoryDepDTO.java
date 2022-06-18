/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dto;

/**
 *
 * @author lehon
 */
public class HistoryDepDTO {

    private int idHidDep;
    private int idemp;
    private String nameEmp;
    private int iddep;
    private String nameDep;
    private String deliveryDate;
    private int status;

    public HistoryDepDTO() {
    }

    public HistoryDepDTO(int idHidDep, int idemp, String nameEmp, int iddep, String nameDep, String deliveryDate, int status) {
        this.idHidDep = idHidDep;
        this.nameEmp = nameEmp;
        this.nameDep = nameDep;
        this.deliveryDate = deliveryDate;
        this.status = status;
        this.idemp = idemp;
        this.iddep = iddep;
    }

    public int getIdemp() {
        return idemp;
    }

    public void setIdemp(int idemp) {
        this.idemp = idemp;
    }

    public int getIddep() {
        return iddep;
    }

    public void setIddep(int iddep) {
        this.iddep = iddep;
    }

    public int getIdHidDep() {
        return idHidDep;
    }

    public void setIdHidDep(int idHidDep) {
        this.idHidDep = idHidDep;
    }

    public String getNameEmp() {
        return nameEmp;
    }

    public void setNameEmp(String nameEmp) {
        this.nameEmp = nameEmp;
    }

    public String getNameDep() {
        return nameDep;
    }

    public void setNameDep(String nameDep) {
        this.nameDep = nameDep;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
