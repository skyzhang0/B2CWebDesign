package DAOFactory;

import DAO.*;
import DAOProxy.*;

import java.sql.SQLException;

public class DAOFactory {
    public static UserDAO getUserDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new UserDAOProxy();
    }

    public static UserChangeBkDAO getUserChangeBkDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new UserChangeBkDAOProxy();
    }

    public static CheckInfoDAO getCheckInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new CheckInfoDAOProxy();
    }

    public static GoodDAO getGoodDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new GoodDAOProxy();
    }

    public static OrderInfoDAO getOrderInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new OrderInfoDAOProxy();
    }

    public static OutInfoDAO getOutInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new OutInfoDAOProxy();
    }

    public static SellInfoDAO getSellInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new SellInfoDAOProxy();
    }

    public static StockInfoDAO getStockInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new StockInfoDAOProxy();
    }

    public static WareInfoDAO getWareInfoDAOInstance()
            throws SQLException, ClassNotFoundException {
        return new WareInfoDAOProxy();
    }
}
