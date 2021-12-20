package DAO;

import Entity.Good.Good;
import Entity.User.User;

import java.sql.SQLException;
import java.util.List;

public interface GoodDAO {
    // 通过商品编号获取商品
    Good findByNumber(int number);

    // 通过商品名获取商品
    Good findByName(String name);

    // 获取所有商品
    List<Good> findAll();

    // 更新商品信息，成功返回true，否则返回false
    boolean doUpdate(User user) throws SQLException;

    // 删除商品信息，成功返回true，否则返回false
    boolean doDelete(User user) throws SQLException;

    // 插入商品信息，成功返回true，否则返回false
    boolean doInsert(User user) throws SQLException;
}

