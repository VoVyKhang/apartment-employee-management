/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import management.dto.AccountDTO;
import management.utils.DBUtils;

/**
 *
 * @author AD
 */
public class AccountDAO {

    public static int checkAccountGoogle(String email) {
        Connection cn = null;
        int result = 0;

        try {
            cn = DBUtils.getConnection();
            String sql = "Select email from Account Where email =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs != null && rs.next()) {
                result = 1;
            } else {
                result = 0;
            }
        } catch (Exception e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public static AccountDTO checkRoleAccount(String email) {
        Connection cn = null;
        AccountDTO acc = null;

        try {
            cn = DBUtils.getConnection();
            String sql = "Select role from Account Where email =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int role = rs.getInt("role");
                acc = new AccountDTO(role);
            }
        } catch (Exception e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return acc;
    }
}
