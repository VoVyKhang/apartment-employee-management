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
import management.dto.ContractDTO;
import management.utils.DBUtils;

/**
 *
 * @author lehon
 */
public class ContractDAO { 

    private static final String LIST_ALL_CONTRACT = "select idContract, tc.name as type, signDay, expDay, e.name, status\n"
            + "from Contract as c, Employee as e, TypeContract as tc\n"
            + "where c.idEmp = e.idEmp and c.idTypeCon = tc.idTypeCon";

    private static final String CHECK_EXP_DATE = "DECLARE @today datetime, @expday datetime;\n"
            + "SET @today = CAST( GETDATE() AS datetime );\n"
            + "SET @expday = ?;\n"
            + "IF @expday > @today\n"
            + "SELECT 'true' as flag\n"
            + "ELSE SELECT 'false' as flag";

    private static final String INSERT_NEW_CON = "INSERT INTO Contract (signDay, expDay, idEmp, status, idTypeCon)"
            + " VALUES (?, ?, ?, ?, ?)";

    private static final String GET_CON_BY_ID = "select idContract, tc.name as type, signDay, expDay, e.name, status\n"
            + "from Contract as c, Employee as e, TypeContract as tc\n"
            + "where c.idEmp = e.idEmp and c.idTypeCon = tc.idTypeCon and idContract = ?";

    private static final String UPDATE_CONTRACT = "update Contract\n"
            + "set idTypeCon = ?, expDay = ?\n"
            + "where idContract = ?";

    private static final String CHANGE_TO_OK = "update Contract\n"
            + "set status = 1\n"
            + "where idContract = ?";

    private static final String CHANGE_TO_EXPIRED = "update Contract\n"
            + "set status = 0\n"
            + "where idContract = ?";

    private static final String RENEWAL_CONTRACT = "update Contract\n"
            + "set expDay = ?\n"
            + "where idContract = ?";

    private static Connection conn = null;
    private static PreparedStatement ptm = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    //Get all contract of employee 
    public static ArrayList<ContractDTO> listCon() throws SQLException {
        ArrayList<ContractDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                st = conn.createStatement();
                rs = st.executeQuery(LIST_ALL_CONTRACT);
                while (rs.next()) {
                    int id = rs.getInt("idContract");
                    String type = rs.getString("type");
                    String signDay = rs.getString("signDay");
                    if (signDay == null) {
                        signDay = "0000-00-00";
                    }
                    String expDay = rs.getString("expDay");
                    if (expDay == null) {
                        expDay = "0000-00-00";
                    }
                    String nameEmp = rs.getString("name");
                    int status = rs.getInt("status");

                    ContractDTO con = new ContractDTO(id, type, signDay.substring(0, 10), expDay.substring(0, 10), nameEmp, status);
                    list.add(con);

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

    //Check validation of expDay in contract
    public static boolean checkValidExpDay(String expDay) throws SQLException {
        String check = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EXP_DATE);
                ptm.setString(1, expDay);
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

    //Insert new contract of employee
    public static boolean insertNewContract(String typeid, String expday, String idEmp) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                Date d = new Date(System.currentTimeMillis());
                ptm = conn.prepareStatement(INSERT_NEW_CON);
                ptm.setDate(1, d);
                ptm.setString(2, expday);
                ptm.setInt(3, Integer.parseInt(idEmp));
                ptm.setInt(4, 1);
                ptm.setInt(5, Integer.parseInt(typeid));
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

    //Get contract by idCon
    public static ContractDTO getContractByID(String id) throws SQLException {
        ContractDTO con = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CON_BY_ID);
                ptm.setInt(1, Integer.parseInt(id));
                rs = ptm.executeQuery();
                if (rs != null && rs.next()) {
                    int idCon = rs.getInt("idContract");
                    String type = rs.getString("type");
                    String signDay = rs.getString("signDay");
                    if (signDay == null) {
                        signDay = "0000-00-00";
                    }
                    String expDay = rs.getString("expDay");
                    if (expDay == null) {
                        expDay = "0000-00-00";
                    }
                    String nameEmp = rs.getString("name");
                    int status = rs.getInt("status");
                    con = new ContractDTO(idCon, type, signDay.substring(0, 10), expDay.substring(0, 10), nameEmp, status);
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
        return con;
    }

    //Update contract by idCon
    public static boolean updateContract(String idCon, String idType, String expDay) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_CONTRACT);
                ptm.setInt(1, Integer.parseInt(idType));
                ptm.setString(2, expDay);
                ptm.setInt(3, Integer.parseInt(idCon));
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

    //Change status of contract if expired
    public static boolean changeConToFailed(int idCon) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_TO_EXPIRED);
                ptm.setInt(1, idCon);
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

    //Change status of contract if renewal or update successful
    public static boolean changeConToOK(int idCon) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHANGE_TO_OK);
                ptm.setInt(1, idCon);
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

    //Renewal contract of employee
    public static boolean renewalCon(String idCon, String expDay) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(RENEWAL_CONTRACT);
                ptm.setString(1, expDay);
                ptm.setInt(2, Integer.parseInt(idCon));
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
