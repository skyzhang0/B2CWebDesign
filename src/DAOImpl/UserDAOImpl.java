package DAOImpl;

import DAO.UserDAO;
import Entity.User.User;

import java.sql.*;
import java.util.List;
import java.util.Vector;

public class UserDAOImpl implements UserDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    // 构造函数，由DAOProxy调用，conn传入DBConnection返回的数据库连接
    public UserDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // 根据用户编号查询用户，返回用户类
    public User findByNumber(int number) throws SQLException {
        String sql = "SELECT * FROM `jxc manage system`.user_info_t WHERE Uno=?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setInt(1, number);
        ResultSet rs = ppstmt.executeQuery();
        User user = null;
        if (rs.next()) { // Uno为主键，rs.length()为0，或 1
            user = new User(rs);
        }
        ppstmt.close();
        return user;
    }

    public User findByName(String name) throws SQLException {
        String sql = "SELECT * FROM `jxc manage system`.user_info_t WHERE Uname = ?";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setString(1, name);
        ResultSet rs = ppstmt.executeQuery();
        User user = null;
        if (rs.next()) {
            user = new User(rs);
        }
        ppstmt.close();
        return user;
    }

    public List<User> findAll() throws SQLException {
        List<User> res = new Vector<>();
        String sql = "SELECT * FROM `jxc manage system`.user_info_t";
        ppstmt = conn.prepareStatement(sql);
        ResultSet rs = ppstmt.executeQuery();
        while (rs.next()) {
            User user = new User(rs);
            res.add(user);
        }
        return res;
    }

    public boolean doUpdate(User user) throws SQLException {
        String sql = "UPDATE `jxc manage system`.user_info_t SET Uname = ?, Upassword = ?, Utype = ?,Uphone = ?, Uregister_date = ?, Ucancellation_date = ? WHERE Uno = ?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setString(1, user.getName());
        ppstmt.setString(2, user.getPassword());
        ppstmt.setString(3, user.getType());
        ppstmt.setString(4, user.getPhone());
        ppstmt.setDate(5, user.getRegister_date());
        ppstmt.setDate(6, user.getCancellation_date());
        ppstmt.setInt(7, user.getNumber());
        boolean state = true;
        try {
            ppstmt.executeUpdate();
        } catch (SQLException e) {
            state = false;
        }
        ppstmt.close();
        return state;
    }

    public boolean doDelete(User user) throws SQLException {
        String sql = "DELETE FROM `jxc manage system`.user_info_t WHERE Uno= ?;";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setInt(1, user.getNumber());
        boolean state = true;
        try {
            ppstmt.executeUpdate();
        } catch (SQLException e) {
            state = false;
        }
        ppstmt.close();
        return state;
    }

    // 将传入的用户插入数据库，如果插入成功返回true，否则返回false
    public boolean doInsert(User user) throws SQLException {
        String sql = "INSERT INTO `jxc manage system`.user_info_t (Uname, Upassword, Utype, Uphone, Uregister_date, Ucancellation_date) VALUES ( ?, ?, ?, ?, ?, ?);";
        ppstmt = conn.prepareStatement(sql);
        ppstmt.setString(1, user.getName());
        ppstmt.setString(2, user.getPassword());
        ppstmt.setString(3, user.getType());
        ppstmt.setString(4, user.getPhone());
        ppstmt.setDate(5, user.getRegister_date());
        ppstmt.setDate(6, user.getCancellation_date());
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
