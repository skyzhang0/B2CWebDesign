package DAO;

import Entity.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDAO {
    User findByNumber(int number) throws SQLException;

    List<User> findAll() throws SQLException;

    boolean doUpdate(User user) throws SQLException;

    boolean doDelete(User user) throws SQLException;

    boolean doInsert(User user) throws SQLException;
}
