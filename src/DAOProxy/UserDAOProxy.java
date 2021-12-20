package DAOProxy;

import DAO.UserChangeBkDAO;
import DAO.UserDAO;
import DAOImpl.UserChangeBkDAOImpl;
import DAOImpl.UserDAOImpl;
import DBConnection.MysqlConnection;
import Entity.Data.UserChangeBackup;
import Entity.User.User;

import java.sql.Connection;
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
    public boolean doUpdate(User user, User creator) throws SQLException, ClassNotFoundException {
        // 检查是否有用户存在，如果没有用户存在则无法更新
        User user_exist = findByNumber(user.getNumber());
        if (user_exist == null) {
            return false;
        }

        // 检查是否更新了用户的类型，如果更新了类型需要在用户变动记录表中添加记录
        if (user.getType() == null || user_exist.getType() == null) {
            return false;
        } else if (!user.getType().equals(user_exist.getType())) {
            MysqlConnection mysqlConnection = new MysqlConnection();
            Connection connection = mysqlConnection.getConnection();
            UserChangeBkDAO userChangeBkDAO = new UserChangeBkDAOImpl(connection);
            UserChangeBackup user_chbk = new UserChangeBackup();
            user_chbk.setType("ChAuthority");
            user_chbk.setBefore_type(user_exist.getType());
            user_chbk.setAfter_type(user.getType());
            user_chbk.setCreator_number(creator.getNumber());
            user_chbk.setInvolved_number(user.getNumber());
            user_chbk.setTime(new Date(System.currentTimeMillis()));
            userChangeBkDAO.doInsert(user_chbk);
        }
        return userDAO.doUpdate(user, creator);
    }

    @Override
    public boolean doDelete(User user, User creator) throws SQLException, ClassNotFoundException {
        // 此处需要注意，由于用户变更记录表的存在，每次删除用户其实并不是删除用户在数据库中的记录
        // 而是把用户的权限设为Deleted，并且置注销时间为当前时间
        user = new User(user); // 深拷贝防止改变原对象
        Date date_now = new Date(System.currentTimeMillis());
        user.setType("Deleted");
        user.setCancellation_date(date_now);
        // 同时此处需要对用户变更记录表进行改动
        MysqlConnection mysqlConnection = new MysqlConnection();
        Connection connection = mysqlConnection.getConnection();
        UserChangeBkDAO userChangeBkDAO = new UserChangeBkDAOImpl(connection);
        UserChangeBackup user_chbk = new UserChangeBackup();
        user_chbk.setType("Delete");
        user_chbk.setBefore_type(user.getType());
        user_chbk.setAfter_type("Deleted");
        user_chbk.setCreator_number(creator.getNumber());
        user_chbk.setInvolved_number(user.getNumber());
        user_chbk.setTime(new Date(System.currentTimeMillis()));
        userChangeBkDAO.doInsert(user_chbk);
        return userDAO.doUpdate(user, creator);
    }

    @Override
    public boolean doInsert(User user, User creator) throws SQLException, ClassNotFoundException {
        // 在新建用户时设置注册时间为当前时间
        if (user.getRegister_date() == null) {
            Date date = new Date(System.currentTimeMillis());
            user.setRegister_date(date);
        }
        // 同时若无权限则设置用户初始类型为None
        if (user.getType() == null || user.getType().isEmpty()) {
            user.setType("None");
        }

        // 先进行插入，再查询，以决定Uno，因为是自增
        if (!userDAO.doInsert(user, creator)) {
            return false;
        }
        user = userDAO.findByName(user.getName());

        // 同时对用户变更记录表进行改动
        MysqlConnection mysqlConnection = new MysqlConnection();
        Connection connection = mysqlConnection.getConnection();
        UserChangeBkDAO userChangeBkDAO = new UserChangeBkDAOImpl(connection);
        UserChangeBackup user_chbk = new UserChangeBackup();
        user_chbk.setType("Add");
        user_chbk.setBefore_type(null);
        user_chbk.setAfter_type(user.getType());
        user_chbk.setCreator_number(creator.getNumber());
        user_chbk.setInvolved_number(user.getNumber());
        user_chbk.setTime(new Date(System.currentTimeMillis()));
        // 如果插入失败，删除插入的user
        if (!userChangeBkDAO.doInsert(user_chbk)) {
            userDAO.doDelete(user, user);
            return false;
        }
        return true;
    }
}
