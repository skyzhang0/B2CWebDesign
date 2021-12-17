package DAO;

import Entity.User.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {
    // 通过用户编号查找用户，如果没有查找到返回null
    User findByNumber(int number) throws SQLException;

    // 通过用户名查找用户，如果没有查找到返回null
    User findByName(String name) throws SQLException;

    // 差找所有用户，存储在List中
    List<User> findAll() throws SQLException;

    // 更新用户信息，成功返回true，否则返回false
    boolean doUpdate(User user) throws SQLException;

    // 删除用户信息，成功返回true，否则返回false
    boolean doDelete(User user) throws SQLException;

    // 插入用户信息，成功返回true，否则返回false
    boolean doInsert(User user) throws SQLException;
}
