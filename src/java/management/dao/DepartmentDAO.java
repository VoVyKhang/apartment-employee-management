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
import management.dto.DepartmentDTO;
import management.regex.RegexDep;
import management.utils.DBUtils;

/**
 *
 * @author lehon
 */
public class DepartmentDAO {

    private static final String LIST_DEP = "select depNum, depName, description, location, dateCreate, creator\n"
            + "from Department";

    private static final String CHECK_EXIST = "select depName\n"
            + "from Department\n"
            + "where depName = ?";

    private static final String CREATE_NEW_DEP = "INSERT INTO Department (depName, description, location, dateCreate, creator)"
            + " VALUES (?, ?, ?, ?, ?)";

    private static final String UPDATE_DEP = "update Department\n"
            + "set depName = ?, description = ?, location = ?\n"
            + "where depNum = ?";

    private static final String GET_NAME_DEP = "select depName\n"
            + "from Department";

    private static final String GET_DEPNAME_BY_ID = "select depName\n"
            + "from Department\n"
            + "where depNum = ?";

    private static final String GET_DEP_BY_ID = "select depNum, depName, description, location, dateCreate, creator\n"
            + "from Department\n"
            + "where depNum = ?";

    private static final String GET_IDDEP_BY_NAME = "select depNum\n"
            + "from Department\n"
            + "where depName = ?";
    private static final String GET_DEP_BY_LOCATION = "select depNum, depName, description, location, dateCreate, creator\n"
            + "from Department\n"
            + "where location = ?";
    private static Connection conn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    //List all department
    public static ArrayList<DepartmentDTO> listDep() throws SQLException {
        ArrayList<DepartmentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(LIST_DEP);
                while (rs.next()) {
                    int id = rs.getInt("depNum");
                    String depName = rs.getString("depName");
                    String description = rs.getString("description");
                    String location = rs.getString("location");
                    String dateCreate = rs.getString("dateCreate");
                    String creator = rs.getString("creator");
                    DepartmentDTO dep = new DepartmentDTO(id, depName, description, location, dateCreate, creator);
                    list.add(dep);
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

    //Check department is exists or not
    public static boolean checkDepExist(String name) throws SQLException {
        String names = RegexDep.removeAllTrim(name);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(GET_NAME_DEP);
                while (rs.next()) {
                    String nameDep = rs.getString("depName");
                    if (names.equals(RegexDep.removeAllTrim(nameDep))) {
                        return true;
                    }
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

    //Insert new department
    public static boolean inserNewDep(String depname, String des, String location, String creator) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                Date d = new Date(System.currentTimeMillis());
                ptm = conn.prepareStatement(CREATE_NEW_DEP);
                ptm.setString(1, depname);
                ptm.setString(2, des);
                ptm.setString(3, location);
                ptm.setDate(4, d);
                ptm.setString(5, creator);
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

    //Update department
    public static boolean updateDep(String name, String des, String location, String depnum) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                Date d = new Date(System.currentTimeMillis());
                ptm = conn.prepareStatement(UPDATE_DEP);
                ptm.setString(1, name);
                ptm.setString(2, des);
                ptm.setString(3, location);
                ptm.setInt(4, Integer.parseInt(depnum));
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

    //Get name of department by id
    public static String getNameDepByID(String id) throws SQLException {
        String name = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DEPNAME_BY_ID);
                ptm.setInt(1, Integer.parseInt(id));
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    name = rs.getString("depName");
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
        return name;

    }

    //Get department by depNum
    public static DepartmentDTO getDepByDepnum(String id) throws SQLException {
        DepartmentDTO dep = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DEP_BY_ID);
                ptm.setInt(1, Integer.parseInt(id));
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    int depNum = rs.getInt("depNum");
                    String depName = rs.getString("depName");
                    String description = rs.getString("description");
                    String location = rs.getString("location");
                    String dateCreate = rs.getString("dateCreate");
                    String creator = rs.getString("creator");
                    dep = new DepartmentDTO(depNum, depName, description, location, dateCreate, creator);
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
        return dep;
    }

    //Get depNum by depname
    public static int getDepNumByName(String name) throws SQLException {
        int id = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_IDDEP_BY_NAME);
                ptm.setString(1, name);
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    id = rs.getInt("depNum");
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
        return id;

    }
    public static ArrayList<DepartmentDTO> getDepNumByLocation(String location) throws SQLException {
        ArrayList<DepartmentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_DEP_BY_LOCATION);
                ptm.setString(1, location);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int depNum = rs.getInt("depNum");
                    String depName = rs.getString("depName");
                    String description = rs.getString("description");
                    String locationDep = rs.getString("location");
                    String dateCreate = rs.getString("dateCreate");
                    String creator = rs.getString("creator");
                    DepartmentDTO dep = new DepartmentDTO(depNum, depName, description, locationDep, dateCreate, creator);
                    list.add(dep);
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
}
