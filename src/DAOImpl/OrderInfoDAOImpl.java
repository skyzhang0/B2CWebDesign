package DAOImpl;

import DAO.OrderInfoDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderInfoDAOImpl implements OrderInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public OrderInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }
    // todo
}
