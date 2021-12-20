package DAOImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class WareInfoDAOImpl implements DAO.WareInfoDAO {
    private final Connection conn; // 数据库连接
    private PreparedStatement ppstmt; // 资源句柄

    public WareInfoDAOImpl(Connection conn) {
        this.conn = conn;
    }
    // todo
}
