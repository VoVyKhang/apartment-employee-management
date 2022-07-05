/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import management.utils.DBUtils;

/**
 *
 * @author VyNT
 */
public class HistoryContractDAO {

    private static final String INSERT_HISCONTRACT = "INSERT INTO HistoryContract(idContract,idEmp,status)\n"
            + "VALUES(?, ?, 1)";
    private static Connection conn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;
    public static boolean insertHisCon(String idContract, String idEmp) throws SQLException{
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if(conn != null){
                ptm = conn.prepareStatement(INSERT_HISCONTRACT);
                ptm.setString(1, idContract);
                ptm.setString(2, idContract);
                int rs = ptm.executeUpdate();
                if(rs > 0){
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
