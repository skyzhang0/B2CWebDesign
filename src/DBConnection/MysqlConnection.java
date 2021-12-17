package DBConnection;

import java.sql.*;

public class MysqlConnection implements DatabaseConnection {
    private static final String db_driver = "com.mysql.cj.jdbc.Driver";
    private static final String db_url = "jdbc:mysql://localhost:3306?unicode=true&characterEncoding=UTF-8";
    private static final String db_user = "root";
    private static final String db_pwd = "12345678";

    private Connection conn;

    public Connection getConnection()
            throws ClassNotFoundException, SQLException {
        Class.forName(db_driver);
        return conn = DriverManager.getConnection(db_url, db_user, db_pwd);
    }

    public void close() throws SQLException {
        this.conn.close();
    }

    public boolean commit() {
        boolean state = true;
        try {
            conn.commit();
        } catch (SQLException e) {
            state = false;
        }
        return state;
    }

    public void setAutoCommit(boolean state) throws SQLException {
        conn.setAutoCommit(state);
    }
}
