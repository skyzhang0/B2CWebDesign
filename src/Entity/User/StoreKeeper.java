package Entity.User;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StoreKeeper extends User {
    public StoreKeeper() {
        super();
    }

    public StoreKeeper(int number, String name, String password, String type,
                  String phone, Date register_date,
                  Date cancellation_date
    ) {
        super(number, name, password, type, phone, register_date, cancellation_date);
    }

    public StoreKeeper(User user) {
        super(user);
    }

    // 通过SQL查询结果构造User类
    public StoreKeeper(ResultSet rs) throws SQLException {
        super(rs);
    }
}
