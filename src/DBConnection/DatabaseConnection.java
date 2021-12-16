package DBConnection;

import java.sql.Connection;
import java.sql.SQLException;

// 数据库接口类，用来封装对数据库的连接操作
public interface DatabaseConnection {
    // 获取数据库连接
    Connection getConnection() throws ClassNotFoundException, SQLException;

    // 关闭当前连接
    void close() throws SQLException;

    // 提交事务，如果成功返回true，否则返回false
    boolean commit();

    void setAutoCommit(boolean state) throws SQLException;
}
