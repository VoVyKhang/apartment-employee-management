/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import management.dto.EmployeeDTO;
import management.utils.DBUtils;

/**
 *
 * @author DELL
 */
public class EmployeeDAO {

    private static final String LIST_ALL_EMP = "select e.idEmp, name, address, age, gender, phoneNum, dob, imgPath, joinDate, d.depName, p.posName, email, password, statusLog, role\n"
            + "from Employee as e, HistoryDep as hd, Department as d, HistoryPos as hp, Position as p\n"
            + "where e.idEmp = hd.idEmp and hd.depNum = d.depNum and\n"
            + "e.idEmp = hp.idEmp and hp.idPos = p.idPos and \n"
            + "hd.status = 1 and hp.status = 1 and\n"
            + "statusLog = 1 and role = 0";

    private static final String SHOW_EMP_BY_ID = "select e.idEmp, name, address, age, gender, phoneNum, dob, imgPath, joinDate, d.depName, p.posName, a.role\n"
            + "from Employee as e, Account as a , Department as d, Position as p\n"
            + "where e.idEmp = a.idEmp and e.depNum = d.depNum and e.idPos = p.idPos and a.role = 0 and e.idEmp = ?";

    private static final String GET_EMP_BY_EMAIL = "select e.idEmp, name, address, age, gender, phoneNum, dob, imgPath, joinDate, d.depName, p.posName, email, password, statusLog, role\n"
            + "from Employee as e, HistoryDep as hd, Department as d, HistoryPos as hp, Position as p\n"
            + "where e.idEmp = hd.idEmp and hd.depNum = d.depNum and\n"
            + "e.idEmp = hp.idEmp and hp.idPos = p.idPos and \n"
            + "hd.status = 1 and hp.status = 1 and\n"
            + "statusLog = 1 and email = ?";

    private static final String CHANGE_DEP_BY_IDEMP = "update Employee\n"
            + "set depNum = ?\n"
            + "where idEmp = ?";

    private static Connection conn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    //List all employee
    public static ArrayList<EmployeeDTO> listEmp() throws SQLException {
        ArrayList<EmployeeDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(LIST_ALL_EMP);
                while (rs.next()) {
                    int id = rs.getInt("idEmp");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    int age = rs.getInt("age");
                    String gender = rs.getString("gender");
                    String phoneNum = rs.getString("phoneNum");
                    String dob = rs.getString("dob");
                    if (dob == null) {
                        dob = "0000-00-00";
                    }
                    String imgPath = rs.getString("imgPath");
                    String joinDate = rs.getString("joinDate");
                    if (joinDate == null) {
                        joinDate = "0000-00-00";
                    }
                    String depName = rs.getString("depName");
                    String posName = rs.getString("posName");
                    String mail = rs.getString("email");
                    String password = rs.getString("password");
                    int statuslog = rs.getInt("statusLog");
                    int role = rs.getInt("role");
                    EmployeeDTO emp = new EmployeeDTO(id, name, address, age, gender, phoneNum, dob.substring(0, 10), imgPath, joinDate.substring(0, 10), depName, posName, mail, password, statuslog, role);
                    list.add(emp);

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

    //Show details of employee by id input   
    public static EmployeeDTO showEmpByID(int id) throws SQLException {
        EmployeeDTO emp = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SHOW_EMP_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idS = rs.getInt("idEmp");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    int age = rs.getInt("age");
                    String gender = rs.getString("gender");
                    String phoneNum = rs.getString("phoneNum");
                    String dob = rs.getString("dob");
                    if (dob == null) {
                        dob = "0000-00-00";
                    }
                    String imgPath = rs.getString("imgPath");
                    String joinDate = rs.getString("joinDate");
                    if (joinDate == null) {
                        joinDate = "0000-00-00";
                    }
                    String depName = rs.getString("depName");
                    String posName = rs.getString("posName");
                    String mail = rs.getString("email");
                    String password = rs.getString("password");
                    int statuslog = rs.getInt("statusLog");
                    int role = rs.getInt("role");
                    emp = new EmployeeDTO(idS, name, address, age, gender, phoneNum, dob.substring(0, 10), imgPath, joinDate.substring(0, 10), depName, posName, mail, password, statuslog, role);

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
        return emp;
    }

    //Get details of employee by email input 
    public static EmployeeDTO getEmpByEmail(String email) throws SQLException {
        EmployeeDTO emp = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_EMP_BY_EMAIL);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idS = rs.getInt("idEmp");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    int age = rs.getInt("age");
                    String gender = rs.getString("gender");
                    String phoneNum = rs.getString("phoneNum");
                    String dob = rs.getString("dob");
                    if (dob == null) {
                        dob = "0000-00-00";
                    }
                    String imgPath = rs.getString("imgPath");
                    String joinDate = rs.getString("joinDate");
                    if (joinDate == null) {
                        joinDate = "0000-00-00";
                    }
                    String depName = rs.getString("depName");
                    String posName = rs.getString("posName");
                    String mail = rs.getString("email");
                    String password = rs.getString("password");
                    int statuslog = rs.getInt("statusLog");
                    int role = rs.getInt("role");
                    emp = new EmployeeDTO(idS, name, address, age, gender, phoneNum, dob.substring(0, 10), imgPath, joinDate.substring(0, 10), depName, posName, mail, password, statuslog, role);

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
        return emp;
    }

    //Change department of employee by idemp
    public static boolean changeDepByIDEmp(String idemp, String iddep) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_DEP_BY_IDEMP);
                ptm.setInt(1, Integer.parseInt(iddep));
                ptm.setInt(2, Integer.parseInt(idemp));
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
