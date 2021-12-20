package DAOProxy;

import DAO.GoodDAO;
import DAOImpl.GoodDAOImpl;
import DBConnection.DatabaseConnection;
import DBConnection.MysqlConnection;
import Entity.Good.Good;
import Entity.User.User;

import java.sql.SQLException;
import java.util.List;

public class GoodDAOProxy implements GoodDAO {
    DatabaseConnection conn;
    GoodDAO goodDAO;

    public GoodDAOProxy() throws SQLException, ClassNotFoundException {
        conn = new MysqlConnection();
        goodDAO = new GoodDAOImpl(conn.getConnection());
    }

    @Override
    public Good findByNumber(int number) {
        return null;
    }

    @Override
    public Good findByName(String name) {
        return null;
    }

    @Override
    public List<Good> findAll() {
        return null;
    }

    @Override
    public boolean doUpdate(User user) throws SQLException {
        return false;
    }

    @Override
    public boolean doDelete(User user) throws SQLException {
        return false;
    }

    @Override
    public boolean doInsert(User user) throws SQLException {
        return false;
    }
}
