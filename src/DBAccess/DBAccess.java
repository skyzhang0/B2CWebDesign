package DBAccess;

import java.sql.*;

public class DBAccess {
    private static final String db_url = "jdbc:mysql://localhost:3306/shop";
    private static final String db_user = "root";
    private static final String db_pwd = "12345678";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(db_url, db_user, db_pwd);
    }

    public static void closeConnection(Connection conn) throws SQLException { conn.close(); }

    public static void closeStatement(Statement stmt) throws SQLException { stmt.close(); }

    public static void closeResultSet(ResultSet rs) throws SQLException { rs.close(); }
}
