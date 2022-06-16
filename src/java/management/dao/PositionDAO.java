/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import management.dto.PositionDTO;
import management.utils.DBUtils;

/**
 *
 * @author BachLe
 */
public class PositionDAO {

    private static final String SHOW_POSITION = "SELECT idPos, posName,description, creator, dateCreated FROM Position";
    private static final String UPDATE_POSITION = " UPDATE Position\n"
            + "SET posName = ?, description =?\n"
            + "WHERE idPos = ?";
    private static final String CHANGE_POSITION = "UPDATE Employee SET idPos = ? WHERE idEmp = ?";
    private static Connection cn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    public static ArrayList<PositionDTO> listPosition() throws SQLException {
        ArrayList<PositionDTO> listPosition = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            st = cn.createStatement();
            rs = st.executeQuery(SHOW_POSITION);
            while (rs != null && rs.next()) {
                int idPos = rs.getInt("idPos");
                String posName = rs.getString("posName");
                String description = rs.getString("description");
                String creator = rs.getString("creator");
                Date dateCreated = rs.getDate("dateCreated");
                PositionDTO p = new PositionDTO(idPos, posName, description, creator, dateCreated);
                listPosition.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return listPosition;
    }

    public static boolean updatePosition(String posName, String description, int idPos) throws SQLException {
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                ptm = cn.prepareStatement(UPDATE_POSITION);
                ptm.setString(1, posName);
                ptm.setString(2, description);
                ptm.setInt(3, idPos);
                int result = ptm.executeUpdate();
                if (result > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return false;
    }

    public static boolean changePosition(int idPos, int idEmp) throws SQLException {
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                ptm = cn.prepareStatement(CHANGE_POSITION);
                ptm.setInt(1, idPos);
                ptm.setInt(2, idEmp);
                int result = ptm.executeUpdate();
                if (result > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return false;
    }
}
