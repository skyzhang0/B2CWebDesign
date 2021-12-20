package DAOImpl;

import DAO.CheckInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CheckInfoDAOImpl implements CheckInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public CheckInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }

    // todo
}
