/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package management.dao;

import java.sql.Connection;
import java.sql.Date;
import management.utils.DBUtils;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import management.dto.RewardPenaltyDTO;

/**
 *
 * @author Admin
 */
public class RewardPenaltyDAO {

    private static String LIST_RP = "select r.idRP,e.idEmp,e.imgPath,e.name,e.gender,re.status,r.times,r.applicableDate,r.reason,d.depName\n"
            + "from Employee as e, Department as d, Position as p, RewardAndPenalty as r, Regulation as re \n"
            + "where e.depNum = d.depNum and r.idReg = re.idReg and e.idEmp = r.idEmp and e.idPos = p.idPos and e.idEmp like ?  ";

    private static String LIST_RP_NAME = "select r.idRP,e.idEmp,e.imgPath,e.name,e.gender,re.status,r.times,r.applicableDate,r.reason,d.depName\n"
            + "from Employee as e, Department as d, Position as p, RewardAndPenalty as r, Regulation as re \n"
            + "where e.depNum = d.depNum and r.idReg = re.idReg and e.idEmp = r.idEmp and e.idPos = p.idPos and e.name like ?  ";
     
    private static String LIST_RP_NAMEEMP = "select r.idRP,e.idEmp,e.imgPath,e.name,e.gender,re.status,r.times,r.applicableDate,r.reason,d.depName\n"
            + "from Employee as e, Department as d, Position as p, RewardAndPenalty as r, Regulation as re \n"
            + "where e.depNum = d.depNum and r.idReg = re.idReg and e.idEmp = r.idEmp and e.idPos = p.idPos and e.name like ? and e.idEmp like ? ";
    
    private static String UPDATE_RP ="update RewardAndPenalty set reason = ? ,times = ? , idReg = ?\n" 
            + "where idEmp = ?";
    
    private static String CREATE_NEW_RP="INSERT INTO RewardAndPenalty(idReg,reason,applicableDate,times,idEmp)\n" 
            + "VALUES(?, ?, ?, ?,?)";
    
    private static String DELETE_RP="DELETE FROM RewardAndPenalty WHERE idEmp=?";
    
    //List all Reward & Penalty
    public static ArrayList<RewardPenaltyDTO> listrp(String keywordidemp) throws SQLException {
        ArrayList<RewardPenaltyDTO> listrp = new ArrayList<>();
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(LIST_RP);
                pst.setString(1, "%" + keywordidemp + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idRP = rs.getInt("IDRp");
                        int idEmp = rs.getInt("IDEmp");
                        String imgPath = rs.getString("ImgPath");
                        String name = rs.getString("Name");
                        String gender = rs.getString("Gender");
                        int status = rs.getInt("Status");
                        int times = rs.getInt("Times");
                        Date applicableDate = rs.getDate("ApplicableDate");
                        String reason = rs.getString("Reason");
                        String depName = rs.getString("DepName");
                        RewardPenaltyDTO rp = new RewardPenaltyDTO(idEmp, name, gender, imgPath, depName, idRP, reason, status, times, applicableDate);
                        listrp.add(rp);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listrp;
        }
    }
    
     //List all Reward & Penalty by Name
    public static ArrayList<RewardPenaltyDTO> listrpdep(String keywordname) throws SQLException {
        ArrayList<RewardPenaltyDTO> listrp = new ArrayList<>();
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(LIST_RP_NAME);
                pst.setString(1, "%" + keywordname + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idRP = rs.getInt("IDRp");
                        int idEmp = rs.getInt("IDEmp");
                        String imgPath = rs.getString("ImgPath");
                        String name = rs.getString("Name");
                        String gender = rs.getString("Gender");
                        int status = rs.getInt("Status");
                        int times = rs.getInt("Times");
                        Date applicableDate = rs.getDate("ApplicableDate");
                        String reason = rs.getString("Reason");
                        String depName = rs.getString("DepName");
                        RewardPenaltyDTO rp = new RewardPenaltyDTO(idEmp, name, gender, imgPath, depName, idRP, reason, status, times, applicableDate);
                        listrp.add(rp);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listrp;
        }
    }
    
    //Search all Reward & Penalty by Name and IDEmp
    public static ArrayList<RewardPenaltyDTO> listrpdepemp(String keywordname,String keywordidemp) throws SQLException {
        ArrayList<RewardPenaltyDTO> listrp = new ArrayList<>();
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(LIST_RP_NAMEEMP);
                pst.setString(1, "%" + keywordname + "%");
                pst.setString(2, "%" + keywordidemp + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idRP = rs.getInt("IDRp");
                        int idEmp = rs.getInt("IDEmp");
                        String imgPath = rs.getString("ImgPath");
                        String name = rs.getString("Name");
                        String gender = rs.getString("Gender");
                        int status = rs.getInt("Status");
                        int times = rs.getInt("Times");
                        Date applicableDate = rs.getDate("ApplicableDate");
                        String reason = rs.getString("Reason");
                        String depName = rs.getString("DepName");
                        RewardPenaltyDTO rp = new RewardPenaltyDTO(idEmp, name, gender, imgPath, depName, idRP, reason, status, times, applicableDate);
                        listrp.add(rp);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return listrp;
        }
    }

    //Update Reward & Penalty
    public static boolean updateRP(int idReg, String reason, int times, int idEmp) {
        Connection cn = null;
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null) {
                PreparedStatement pst = cn.prepareStatement(UPDATE_RP);
                //gan data vao dau cham ?
                pst.setString(1, reason);
                pst.setInt(2, times);
                pst.setInt(3, idReg);
                pst.setInt(4, idEmp);
                pst.executeUpdate();
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    //Create New Reward & Penalty
    public static boolean createnewRP(int idReg,String reason,int times,int idEmp){
         Connection cn = null; 
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null){
                Date d = new Date(System.currentTimeMillis());
                PreparedStatement pst = cn.prepareStatement(CREATE_NEW_RP);
                 pst.setInt(1, idReg);
                 pst.setString(2, reason);
                 pst.setDate(3, d);
                 pst.setInt(4, times);
                 pst.setInt(5, idEmp);
                 pst.executeUpdate();
            }
            return true;
         }catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }

    //Delete Reward & Penalty
    public static boolean deleteRP(int idEmp){
         Connection cn = null; 
        try {
            //buoc 1: mo ket noi
            cn = (Connection) DBUtils.getConnection();
            //buoc 2: viet query va execute    
            if (cn != null){
                PreparedStatement pst = cn.prepareStatement(DELETE_RP);
                 pst.setInt(1, idEmp);
                 pst.executeUpdate();
            }
            return true;
         }catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
