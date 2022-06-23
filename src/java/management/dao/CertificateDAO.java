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
import management.dto.CertificateDTO;
import management.utils.DBUtils;

/**
 *
 * @author AD
 */
public class CertificateDAO {

    private static final String LIST_CERTIFICATE = "SELECT e.idEmp, e.name, c.cerID, c.cerName, c.doi, t.name as cerType, t.idTypeCer\n"
            + "            FROM Employee as e, Certificate as c, TypeCertificate as t\n"
            + "			WHERE e.idEmp = c.idEmp AND c.idTypeCer = t.idTypeCer";
    private static final String LIST_TYPE_CERTIFICATE = "SELECT c.idTypeCer, c.name FROM TypeCertificate as c";
    private static final String INSERT_CERTIFICATE = "INSERT into Certificate(cerName, doi, idEmp, idTypeCer)\n"
            + "values(?,?,?,?)";

    private static final String LIST_CERTIFICATE_OBJECT = "SELECT e.idEmp, e.name, c.cerID, c.cerName, c.doi, t.name as cerType , t.idTypeCer\n"
            + "            FROM Employee as e, Certificate as c, TypeCertificate as t\n"
            + "            WHERE e.idEmp = ? AND c.cerID = ? AND t.idTypeCer = ?";
    private static final String SAVE_CHANGE_CERTIFICATE = "UPDATE Certificate\n"
            + "SET cerName = ?, doi = ?, idTypeCer = ?\n"
            + "WHERE cerID = ? AND idEmp = ?";
    
    private static final String SEARCH_CER ="SELECT e.idEmp, e.name, c.cerID, c.cerName, c.doi, t.name as cerType, t.idTypeCer\n" 
            +"FROM Employee as e, Certificate as c, TypeCertificate as t\n" 
            +"WHERE e.idEmp = c.idEmp AND c.idTypeCer = t.idTypeCer and e.idEmp like ?  and t.name like ? and e.name like ?";
    private static Connection cn = null;
    private static PreparedStatement pst = null;
    private static Statement st = null;
    private static ResultSet rs = null;

    public static ArrayList<CertificateDTO> listCertificate() throws SQLException {
        ArrayList<CertificateDTO> listCer = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                st = cn.createStatement();
                rs = st.executeQuery(LIST_CERTIFICATE);
            }
            while (rs != null && rs.next()) {
                int idEmp = rs.getInt("idEmp");
                String name = rs.getString("name");
                int cerID = rs.getInt("cerID");
                String cerName = rs.getString("cerName");
                Date doi = rs.getDate("doi");
                String type = rs.getString("cerType");
                int idTypeCer = rs.getInt("idTypeCer");
                CertificateDTO cer = new CertificateDTO(name, cerID, cerName, doi, type, idEmp, idTypeCer);
                listCer.add(cer);
            }
        } catch (Exception e) {
            e.getMessage();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return listCer;
    }

    public static boolean insertCertificate(String cerName, String doi, String idEmp, String idTypeCer) throws SQLException {
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(INSERT_CERTIFICATE);
                pst.setString(1, cerName);
                pst.setString(2, doi);
                pst.setString(3, idEmp);
                pst.setString(4, idTypeCer);
                int result = pst.executeUpdate();
                if (result > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return false;
    }

    public static ArrayList<CertificateDTO> listTypeCertificate() throws SQLException {
        ArrayList<CertificateDTO> listTypeCer = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                st = cn.createStatement();
                rs = st.executeQuery(LIST_TYPE_CERTIFICATE);
            }
            while (rs != null && rs.next()) {
                int idTypeCer = rs.getInt("idTypeCer");
                String name = rs.getString("name");
                CertificateDTO cer = new CertificateDTO(idTypeCer, name);
                listTypeCer.add(cer);
            }
        } catch (Exception e) {
            e.getMessage();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (st != null) {
                st.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return listTypeCer;

    }

    public static ArrayList<CertificateDTO> listCertificateObject(String idEmp, String cerID, String idTypeCer) throws SQLException {
        ArrayList<CertificateDTO> listCerObject = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(LIST_CERTIFICATE_OBJECT);
                pst.setString(1, idEmp);
                pst.setString(2, cerID);
                pst.setString(3, idTypeCer);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int _idEmp = rs.getInt("idEmp");
                    String name = rs.getString("name");
                    int _cerID = rs.getInt("cerID");
                    String cerName = rs.getString("cerName");
                    Date doi = rs.getDate("doi");
                    String type = rs.getString("cerType");
                    int _idTypeCer = rs.getInt("idTypeCer");
                    CertificateDTO cer = new CertificateDTO(name, _cerID, cerName, doi, type, _idEmp, _idTypeCer);
                    listCerObject.add(cer);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return listCerObject;

    }

    public static boolean saveChangeCertificate(String cerName, String doi, String idTypeCer, String cerID, String idEmp) throws SQLException {
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                pst = cn.prepareStatement(SAVE_CHANGE_CERTIFICATE);
                pst.setString(1, cerName);
                pst.setString(2, doi);
                pst.setString(3, idTypeCer);
                pst.setString(4, cerID);
                pst.setString(5, idEmp);
                int result = pst.executeUpdate();
                if (result > 0) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (pst != null) {
                pst.close();
            }
        }
        return false;
    }
    
    //List all certificate filter 
    public static ArrayList<CertificateDTO> filterCer(String empid, String typecer, String empname) throws SQLException {
        ArrayList<CertificateDTO> list = new ArrayList<>();
        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                     pst = cn.prepareStatement(SEARCH_CER);
                     pst.setString(1,"%" + empid + "%" );
                     pst.setString(2,"%" + typecer + "%" );
                     pst.setString(3,"%" + empname + "%" );
                     rs = pst.executeQuery();
                while (rs.next()) {
                int idEmp = rs.getInt("idEmp");
                String name = rs.getString("name");
                int cerID = rs.getInt("cerID");
                String cerName = rs.getString("cerName");
                Date doi = rs.getDate("doi");
                String type = rs.getString("cerType");
                int idTypeCer = rs.getInt("idTypeCer");
                CertificateDTO cer = new CertificateDTO(name, cerID, cerName, doi, type, idEmp, idTypeCer);
                list.add(cer);
                }
                 } 
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }    
}
