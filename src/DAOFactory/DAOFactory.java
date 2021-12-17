package DAOFactory;

import DAO.UserDAO;
import DAOProxy.UserDAOProxy;

import java.sql.SQLException;

public class DAOFactory {
    public static UserDAO getUserDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new UserDAOProxy();
    }
}
