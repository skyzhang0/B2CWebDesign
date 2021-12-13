package DAO;

import Instance.*;
import DBAccess.*;

import java.sql.*;

public class CustomerDAO {
    public static int insertCustomerInfo(Customer cus) throws SQLException, ClassNotFoundException {
        Connection conn = DBAccess.getConnection();
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String sql = "INSERT INTO shop.customer ( pwd, name,gender, area) VALUES ('" + cus.getName() + "', '" + cus.getPwd() + "', '" + cus.getGender() + "', '" + cus.getArea() + "')";
        try {
            stmt.executeUpdate(sql);
        } catch (SQLException e) {
            return 0;
        }
        DBAccess.closeStatement(stmt);
        DBAccess.closeConnection(conn);
        return 1;
    }
}
