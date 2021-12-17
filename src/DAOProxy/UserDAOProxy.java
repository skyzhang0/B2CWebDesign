package DAOProxy;

import DAO.*;
import DAOImpl.UserDAOImpl;
import DBConnection.MysqlConnection;
import Entity.User;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

public class UserDAOProxy implements UserDAO {
    MysqlConnection conn;
    UserDAOImpl userDAO;

    public UserDAOProxy() throws SQLException, ClassNotFoundException {
        conn = new MysqlConnection();
        userDAO = new UserDAOImpl(conn.getConnection());
    }

    @Override
    public User findByNumber(int number) throws SQLException {
        return userDAO.findByNumber(number);
    }

    @Override
    public List<User> findAll() throws SQLException {
        return userDAO.findAll();
    }

    @Override
    public boolean doUpdate(User user) throws SQLException {
        return userDAO.doUpdate(user);
    }

    @Override
    public boolean doDelete(User user) throws SQLException {
        // 此处需要注意，由于用户变更记录表的存在，每次删除用户其实并不是删除用户在数据库中的记录
        // 而是把用户的权限设为None，并且置注销时间为当前时间
        user = new User(user); // 深拷贝防止改变原对象
        Date date_now = new Date(System.currentTimeMillis());
        user.setType("None");
        user.setCancellation_date(date_now);
        return userDAO.doUpdate(user);
    }

    @Override
    public boolean doInsert(User user) throws SQLException {
        return userDAO.doInsert(user);
    }
}
