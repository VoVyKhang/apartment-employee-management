/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dto;

/**
 *
 * @author DELL
 */
public class EmployeeDTO {

    private int idEmp;
    private String name;
    private String address;
    private int age;
    private String gender;
    private String phoneNum;
    private String dob;
    private String imgPath;
    private String joinDate;
    private String depName;
    private String posName;
    private int role;

    public EmployeeDTO() {
    }

    public EmployeeDTO(int idEmp, String name, String address, int age, String gender, String phoneNum, String dob, String imgPath, String joinDate, String depName, String posName, int role) {
        this.idEmp = idEmp;
        this.name = name;
        this.address = address;
        this.age = age;
        this.gender = gender;
        this.phoneNum = phoneNum;
        this.dob = dob;
        this.imgPath = imgPath;
        this.joinDate = joinDate;
        this.depName = depName;
        this.posName = posName;
        this.role = role;
    }

    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public String getPosName() {
        return posName;
    }

    public void setPosName(String posName) {
        this.posName = posName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
