package DAOImpl;

import DAO.StockInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StockInfoDAOImpl implements StockInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public StockInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }
    // todo
}
