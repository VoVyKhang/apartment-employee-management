/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dto;

/**
 *
 * @author AD
 */
public class AccountDTO {

    private int accID;
    private String email;
    private int password;
    private int status;
    private int role;
    private int token;

    public AccountDTO() {
    }

    public AccountDTO(int accID, String email, int password, int status, int role, int token) {
        this.accID = accID;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role = role;
        this.token = token;
    }

    public AccountDTO(int role) {
        this.role = role;
    }
        

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPassword() {
        return password;
    }

    public void setPassword(int password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }
    

}
