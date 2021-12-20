package DAOImpl;

import DAO.OutInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OutInfoDAOImpl implements OutInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public OutInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }
    // todo
}
