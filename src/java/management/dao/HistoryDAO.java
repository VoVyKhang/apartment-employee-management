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
import management.dto.HistoryDTO;
import management.utils.DBUtils;

/**
 *
 * @author lehon
 */
public class HistoryDAO {

    private static final String CREATE_NEW_HIS = "INSERT INTO History (description, deliveryDate, type, idEmp, new, old)"
            + " VALUES (?, ?, ?, ?, ?, ?)";

    private static final String GET_ALL_HIS_DEP = "select idHis, description, deliveryDate, type, name, new, old \n"
            + "from History as h, Employee as e\n"
            + "where h.idEmp = e.idEmp and type = 0";

    private static final String GET_ALL_HIS_POS = "select idHis, description, deliveryDate, type, name, new, old \n"
            + "from History as h, Employee as e\n"
            + "where h.idEmp = e.idEmp and type = 1";

    private static Connection conn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    //Insert new history of change department
    public static boolean insertNewHistory(String des, String idemp, String oldDep, String newDep) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                Date d = new Date(System.currentTimeMillis());
                ptm = conn.prepareStatement(CREATE_NEW_HIS);
                ptm.setString(1, des);
                ptm.setDate(2, d);
                ptm.setInt(3, 0);
                ptm.setInt(4, Integer.parseInt(idemp));
                ptm.setString(5, newDep);
                ptm.setString(6, oldDep);
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
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }

    //Get all history of change deparment
    public static ArrayList<HistoryDTO> getAllHisDep() throws SQLException {
        ArrayList<HistoryDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(GET_ALL_HIS_DEP);
                while (rs.next()) {
                    int id = rs.getInt("idHis");
                    String description = rs.getString("description");
                    String deliveryDate = rs.getString("deliveryDate");
                    int type = rs.getInt("type");
                    String name = rs.getString("name");
                    String newdep = rs.getString("new");
                    String olddep = rs.getString("old");
                    HistoryDTO his = new HistoryDTO(id, description, deliveryDate, type, olddep, newdep, name);
                    list.add(his);
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
            if (conn != null) {
                conn.close();
            }
        }
        return list;
    }

    //
    public static ArrayList<HistoryDTO> getAllHisPosition() throws SQLException {
        ArrayList<HistoryDTO> listHisPos = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(GET_ALL_HIS_POS);
                while (rs.next()) {
                    int id = rs.getInt("idHis");
                    String description = rs.getString("description");
                    String deliveryDate = rs.getString("deliveryDate");
                    int type = rs.getInt("type");
                    String name = rs.getString("name");
                    String newdep = rs.getString("new");
                    String olddep = rs.getString("old");
                    HistoryDTO his = new HistoryDTO(id, description, deliveryDate, type, olddep, newdep, name);
                    listHisPos.add(his);
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
            if (conn != null) {
                conn.close();
            }
        }
        return listHisPos;
    }

    //
    public static boolean insertNewHisPosition(String description, int idEmp, String newPos, String oldPos) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                Date d = new Date(System.currentTimeMillis());
                ptm = conn.prepareStatement(CREATE_NEW_HIS);
                ptm.setString(1, description);
                ptm.setDate(2, d);
                ptm.setInt(3, 1);
                ptm.setInt(4, idEmp);
                ptm.setString(5, newPos);
                ptm.setString(6, oldPos);
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
            if (conn != null) {
                conn.close();
            }
        }
        return false;
    }
}
