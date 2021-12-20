package DAO;

import Entity.Data.UserChangeBackup;
import Entity.User.User;

import java.sql.SQLException;
import java.util.List;

public interface UserChangeBkDAO {
    // 通过更改编号查询更改记录
    UserChangeBackup findByNumber(int number) throws SQLException;

    // 获取所有更改记录
    List<UserChangeBackup> findAll() throws SQLException;

    // 更新记录，成功返回true，否则返回false
    boolean doUpdate(UserChangeBackup user_chbk) throws SQLException;

    // 删除记录，成功返回true，否则返回false
    boolean doDelete(UserChangeBackup user_chbk) throws SQLException;

    // 插入记录，成功返回true，否则返回false
    boolean doInsert(UserChangeBackup user_chbk) throws SQLException;
}
