package Entity.User;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Administrator extends User {
    public Administrator() {
        super();
    }

    public Administrator(int number, String name, String password, String type,
                         String phone, Date register_date,
                         Date cancellation_date
    ) {
        super(number, name, password, type, phone, register_date, cancellation_date);
    }

    public Administrator(User user) {
        super(user);
    }

    // 通过SQL查询结果构造User类
    public Administrator(ResultSet rs) throws SQLException {
        super(rs);
    }

    public boolean createUser(User user) {
        // TODO
        return false;
    }

    public boolean deleteUser(User user) {
        // TODO
        return false;
    }

    // 授予用户权限
    public boolean awardUser(User user) {
        // TODO
        return false;
    }

    public User findUser() {
        //TODO
        return null;
    }


}
