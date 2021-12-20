package DAOImpl;

import DAO.UserChangeBkDAO;
import Entity.Data.UserChangeBackup;
import Entity.User.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

public class UserChangeBkDAOImpl implements UserChangeBkDAO {
    private Connection conn;
    private PreparedStatement ppstmt; // 资源句柄

    // 构造函数，由DAOProxy调用，conn传入DBConnection返回的数据库连接
    public UserChangeBkDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public UserChangeBackup findByNumber(int number) throws SQLException {
        String sql = "SELECT * FROM `jxc manage system`.user_changebackup WHERE CHno=?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setInt(1, number);
        ResultSet rs = ppstmt.executeQuery();
        UserChangeBackup user_chbk = null;
        if (rs.next()) { // Uno为主键，rs.length()为0，或 1
            user_chbk = new UserChangeBackup(rs);
        }
        ppstmt.close();
        return user_chbk;
    }

    @Override
    public List<UserChangeBackup> findAll() throws SQLException {
        List<UserChangeBackup> res = new Vector<>();
        String sql = "SELECT * FROM `jxc manage system`.user_changebackup";
        ppstmt = conn.prepareStatement(sql);
        ResultSet rs = ppstmt.executeQuery();
        while (rs.next()) {
            UserChangeBackup user_chbk = new UserChangeBackup(rs);
            res.add(user_chbk);
        }
        return res;
    }

    @Override
    public boolean doUpdate(UserChangeBackup user_chbk) throws SQLException {
        String sql = "UPDATE `jxc manage system`.user_changebackup SET CHtype = ?, CHtime = ?, Creator_Uno = ?,Involved_Uno = ?, BeforeType = ?, AfterType = ? WHERE CHno = ?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setString(1, user_chbk.getType());
        ppstmt.setDate(2, user_chbk.getTime());
        ppstmt.setInt(3, user_chbk.getCreator_number());
        ppstmt.setInt(4, user_chbk.getInvolved_number());
        ppstmt.setString(5, user_chbk.getBefore_type());
        ppstmt.setString(6, user_chbk.getAfter_type());
        ppstmt.setInt(7, user_chbk.getNumber());
        boolean state = true;
        try {
            ppstmt.executeUpdate();
        } catch (SQLException e) {
            state = false;
        }
        ppstmt.close();
        return state;
    }

    @Override
    public boolean doDelete(UserChangeBackup user_chbk) throws SQLException {
        String sql = "DELETE FROM `jxc manage system`.user_changebackup WHERE CHno= ?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setInt(1, user_chbk.getNumber());
        boolean state = true;
        try {
            ppstmt.executeUpdate();
        } catch (SQLException e) {
            state = false;
        }
        ppstmt.close();
        return state;
    }

    @Override
    public boolean doInsert(UserChangeBackup user_chbk) throws SQLException {
        String sql = "INSERT INTO `jxc manage system`.user_changebackup (chtype, chtime, creator_uno, involved_uno, beforetype, aftertype) VALUES ( ?, ?, ?, ?, ?, ?);";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setString(1, user_chbk.getType());
        ppstmt.setDate(2, user_chbk.getTime());
        ppstmt.setInt(3, user_chbk.getCreator_number());
        ppstmt.setInt(4, user_chbk.getInvolved_number());
        ppstmt.setString(5, user_chbk.getBefore_type());
        ppstmt.setString(6, user_chbk.getAfter_type());
        boolean state = true;
        try {
            ppstmt.executeUpdate();
        } catch (SQLException e) {
            state = false;
        }
        ppstmt.close();
        return state;
    }
}
