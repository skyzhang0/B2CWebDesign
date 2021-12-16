import DAOImpl.UserDAOImpl;
import DBConnection.DatabaseConnection;
import DBConnection.MysqlConnection;
import Entity.User;
import Utils.*;

import java.sql.SQLException;
import java.sql.Date;
import java.util.List;

public class UserDAO_Test {
    public static void main(String[] args)
            throws SQLException, ClassNotFoundException {
        DatabaseConnection mysql_conn = new MysqlConnection();
        UserDAOImpl dao = new UserDAOImpl(mysql_conn.getConnection());

        System.out.println("测试查询所有结果：");
        List<User> res = dao.findAll();
        TestUtils.printAll(res);

        int number1 = 1, number2 = 5;
        Date date = new Date(System.currentTimeMillis());
        User user1 = res.get(0);
        User user2 = new User(8, "asdf", "asdf", "Buyer", "213456", date, null);
        User user3 = new User(8, "asdf", "asdf", "Seller", "213456", date, null);

        System.out.println("测试根据number查询用户：");
        System.out.println("number = " + number1 + ", " + dao.findByNumber(number1));
        System.out.println("number = " + number2 + ", " + dao.findByNumber(number2));

        System.out.println("测试插入操作：");
        System.out.println(dao.doInsert(user1));
        dao.doInsert(user2);
        res = dao.findAll();
        TestUtils.printAll(res);

        System.out.println("测试修改操作：");
        dao.doUpdate(user3);
        mysql_conn.commit();
        res = dao.findAll();
        TestUtils.printAll(res);

        System.out.println("测试删除操作：");
        dao.doDelete(user3);
        mysql_conn.commit();
        res = dao.findAll();
        TestUtils.printAll(res);
    }
}
