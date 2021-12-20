package DAOImpl;

import DAO.GoodDAO;
import Entity.Good.Good;
import Entity.User.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class GoodDAOImpl implements GoodDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public GoodDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // todo
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
