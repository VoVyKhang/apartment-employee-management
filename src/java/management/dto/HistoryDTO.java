/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dto;

/**
 *
 * @author lehon
 */
public class HistoryDTO {

    private int idHis;
    private String des;
    private String deliveryDate;
    private int type;
    private String oldDep;
    private String newDep;
    private String nameEmp;

    public HistoryDTO() {
    }

    public HistoryDTO(int idHis, String des, String deliveryDate, int type, String oldDep, String newDep, String nameEmp) {
        this.idHis = idHis;
        this.des = des;
        this.deliveryDate = deliveryDate;
        this.type = type;
        this.oldDep = oldDep;
        this.newDep = newDep;
        this.nameEmp = nameEmp;
    }

    public int getIdHis() {
        return idHis;
    }

    public void setIdHis(int idHis) {
        this.idHis = idHis;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getOldDep() {
        return oldDep;
    }

    public void setOldDep(String oldDep) {
        this.oldDep = oldDep;
    }

    public String getNewDep() {
        return newDep;
    }

    public void setNewDep(String newDep) {
        this.newDep = newDep;
    }

    public String getNameEmp() {
        return nameEmp;
    }

    public void setNameEmp(String nameEmp) {
        this.nameEmp = nameEmp;
    }

}
