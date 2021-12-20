package DAOImpl;

import DAO.OutInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class SellInfoDAOImpl implements OutInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public SellInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }
    // todo
}
