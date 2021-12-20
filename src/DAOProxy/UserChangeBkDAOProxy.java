package DAOProxy;

import DAO.UserChangeBkDAO;
import DAOImpl.UserChangeBkDAOImpl;
import DBConnection.DatabaseConnection;
import DBConnection.MysqlConnection;
import Entity.Data.UserChangeBackup;

import java.sql.SQLException;
import java.util.List;

public class UserChangeBkDAOProxy implements UserChangeBkDAO {
    DatabaseConnection conn;
    UserChangeBkDAO userChangeBkDAO;

    public UserChangeBkDAOProxy() throws SQLException, ClassNotFoundException {
        conn = new MysqlConnection();
        userChangeBkDAO = new UserChangeBkDAOImpl(conn.getConnection());
    }

    @Override
    public UserChangeBackup findByNumber(int number) throws SQLException {
        return userChangeBkDAO.findByNumber(number);
    }

    @Override
    public List<UserChangeBackup> findAll() throws SQLException {
        return userChangeBkDAO.findAll();
    }

    @Override
    public boolean doUpdate(UserChangeBackup user_chbk) throws SQLException {
        return userChangeBkDAO.doUpdate(user_chbk);
    }

    @Override
    public boolean doDelete(UserChangeBackup user_chbk) throws SQLException {
        return userChangeBkDAO.doDelete(user_chbk);
    }

    @Override
    public boolean doInsert(UserChangeBackup user_chbk) throws SQLException {
        return userChangeBkDAO.doInsert(user_chbk);
    }
}
