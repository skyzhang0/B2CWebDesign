package DAOProxy;

import DAO.UserDAO;
import DAOImpl.UserDAOImpl;
import DBConnection.MysqlConnection;
import Entity.User.User;

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
    public User findByName(String name) throws SQLException {
        return userDAO.findByName(name);
    }

    @Override
    public List<User> findAll() throws SQLException {
        return userDAO.findAll();
    }

    @Override
    public boolean doUpdate(User user) throws SQLException {
        // 如果改变了用户的权限要对用户变动记录表也进行改动
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
        // 同时此处需要对用户变更记录表进行改动
        return userDAO.doUpdate(user);
    }

    @Override
    public boolean doInsert(User user) throws SQLException {
        // 在新建用户时设置注册时间为当前时间
        if (user.getRegister_date() == null) {
            Date date = new Date(System.currentTimeMillis());
            user.setRegister_date(date);
        }
        // 同时若无权限则设置用户初始类型为None
        if (user.getType() == null || user.getType().isEmpty()) {
            user.setType("None");
        }
        // 同时对用户变更记录表进行改动
        return userDAO.doInsert(user);
    }
}
