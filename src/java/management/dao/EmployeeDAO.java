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
            + "statusLog = 1 and role = 0"
            + "order by idEmp ASC";

    private static final String SHOW_EMP_BY_ID = "select e.idEmp, name, address, age, gender, phoneNum, dob, imgPath, joinDate, d.depName, p.posName, email, password, statusLog, role\n"
            + "from Employee as e, HistoryDep as hd, Department as d, HistoryPos as hp, Position as p\n"
            + "where e.idEmp = hd.idEmp and hd.depNum = d.depNum and\n"
            + "e.idEmp = hp.idEmp and hp.idPos = p.idPos and \n"
            + "hd.status = 1 and hp.status = 1 and e.idEmp = ?";

    private static final String GET_EMP_BY_EMAIL = "select e.idEmp, name, address, age, gender, phoneNum, dob, imgPath, joinDate, d.depName, p.posName, email, password, statusLog, role\n"
            + "from Employee as e, HistoryDep as hd, Department as d, HistoryPos as hp, Position as p\n"
            + "where e.idEmp = hd.idEmp and hd.depNum = d.depNum and\n"
            + "e.idEmp = hp.idEmp and hp.idPos = p.idPos and \n"
            + "hd.status = 1 and hp.status = 1 and\n"
            + "statusLog = 1 and email = ?";

    private static final String CHECK_DOB = "DECLARE @today date, @dob date;\n"
            + "SET @today = CAST( GETDATE() AS date);\n"
            + "SET @dob = ?;\n"
            + "IF  @dob <= @today\n"
            + "SELECT 'true' as flag\n"
            + "ELSE SELECT 'false' as flag";

    private static final String INSERT_EMPLOYEE = "INSERT INTO Employee(name, address, age, gender, phoneNum, dob, imgPath, joinDate, email, password, statusLog, role)"
            + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_IDEMP_INSERTED = "SELECT TOP 1 idEmp FROM Employee order by idEmp desc";

    private static final String INSERT_NEW_HIS_DEP = "INSERT INTO HistoryDep(idEmp, depNum, deliveryDate, status)"
            + " VALUES (?, ?, ?, ?)";

    private static final String INSERT_NEW_HIS_POS = "INSERT INTO HistoryPos(idEmp, idPos, deliveryDate, status, type)"
            + " VALUES (?, ?, ?, ?, ?)";

    private static final String UPDATE_EMP_NO_IMG = "UPDATE Employee\n"
            + "SET name = ?, address = ?, age = ?, gender = ?, phoneNum = ?, dob = ?\n"
            + "WHERE idEmp = ?";

    private static final String UPDATE_EMP_IMG = "UPDATE Employee\n"
            + "SET name = ?, address = ?, age = ?, gender = ?, phoneNum = ?, dob = ?, imgPath = ?\n"
            + "WHERE idEmp = ?";

    private static final String CHECK_MAIL_EXIST = "select email\n"
            + "from Employee\n"
            + "where email = ?";

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

    //Check day of birth of employee by dof input
    public static boolean checkValidDobDay(String dob) throws SQLException {
        String check = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DOB);
                ptm.setString(1, dob);
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    check = rs.getString("flag");
                    if (check.equals("true")) {
                        return true;
                    } else {
                        return false;
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

    //Insert new employee
    public static boolean inserNewEmp(String name, String address, String age, String gender, String phoneNum, String dob, String imgPath, String depNum, String idPos, String email, String password) throws SQLException {
        boolean result = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int empid = 0;
                conn.setAutoCommit(false);
                Date d = new Date(System.currentTimeMillis());

                // Insert employee first   
                ptm = conn.prepareStatement(INSERT_EMPLOYEE);
                ptm.setString(1, name);
                ptm.setString(2, address);
                ptm.setInt(3, Integer.parseInt(age));
                ptm.setString(4, gender);
                ptm.setString(5, phoneNum);
                ptm.setString(6, dob);
                ptm.setString(7, imgPath);
                ptm.setDate(8, d);
                ptm.setString(9, email);
                ptm.setString(10, password);
                ptm.setInt(11, 1);
                ptm.setInt(12, 0);
                ptm.executeUpdate();

                //Get the idEmp just inserted
                ptm = conn.prepareStatement(SELECT_IDEMP_INSERTED);
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    empid = rs.getInt("idEmp");
                }

                //Insert HistoryDep
                ptm = conn.prepareStatement(INSERT_NEW_HIS_DEP);
                ptm.setInt(1, empid);
                ptm.setInt(2, Integer.parseInt(depNum));
                ptm.setDate(3, d);
                ptm.setInt(4, 1);
                ptm.executeUpdate();

                //Insert HistoryPos
                ptm = conn.prepareStatement(INSERT_NEW_HIS_POS);
                ptm.setInt(1, empid);
                ptm.setInt(2, Integer.parseInt(idPos));
                ptm.setDate(3, d);
                ptm.setInt(4, 1);
                ptm.setInt(5, 1);
                ptm.executeUpdate();
                conn.commit();
                conn.setAutoCommit(true);

                return true;
            } else {
                System.out.println("can not insert employee");
            }
        } catch (Exception e) {
            try {
                if (conn != null) {
                    conn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    //Update employee without new image
    public static boolean UpdateEmpNoImg(String name, String address, String age, String gender, String phoneNum, String dob, String idemp) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_EMP_NO_IMG);
                ptm.setString(1, name);
                ptm.setString(2, address);
                ptm.setInt(3, Integer.parseInt(age));
                ptm.setString(4, gender);
                ptm.setString(5, phoneNum);
                ptm.setString(6, dob);
                ptm.setInt(7, Integer.parseInt(idemp));
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

    //Update employee with new image
    public static boolean UpdateEmpImg(String name, String address, String age, String gender, String phoneNum, String dob, String imgPath, String idemp) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_EMP_IMG);
                ptm.setString(1, name);
                ptm.setString(2, address);
                ptm.setInt(3, Integer.parseInt(age));
                ptm.setString(4, gender);
                ptm.setString(5, phoneNum);
                ptm.setString(6, dob);
                ptm.setString(7, imgPath);
                ptm.setInt(8, Integer.parseInt(idemp));
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

    //Check exist of email
    public static boolean checkMailExist(String email) throws SQLException {

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_MAIL_EXIST);
                ptm.setString(1, email);

                rs = ptm.executeQuery();
                rs.next();
                if (rs != null && rs.getString(1).equals(email)) {
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
