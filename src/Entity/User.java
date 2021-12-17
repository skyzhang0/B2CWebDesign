package Entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;

public class User {
    private int number; // 用户号码
    private String name;        //用户名
    private String password;        //密码
    private String type; // 用户类型
    private String phone;//用户手机号
    private Date register_date; // 注册时间
    private Date cancellation_date;// 注销时间

    public User() {
        this.number = 0;
        this.name = "";
        this.password = "";
        this.type = "";
        this.phone = "";
        this.register_date = null;
        this.cancellation_date = null;
    }

    public User(int number, String name, String password, String type,
                String phone, Date register_date, Date cancellation_date
    ) {
        this.number = number;
        this.name = name;
        this.password = password;
        this.type = type;
        this.phone = phone;
        this.register_date = register_date;
        this.cancellation_date = cancellation_date;
    }

    public User(User user) {
        this.number = user.number;
        this.name = user.name;
        this.password = user.password;
        this.type = user.type;
        this.phone = user.phone;
        this.register_date = user.register_date;
        this.cancellation_date = user.cancellation_date;
    }

    // 通过SQL查询结果构造User类
    public User(ResultSet rs) throws SQLException {
        setNumber(rs.getInt("Uno"));
        setName(rs.getString("Uname"));
        setType(rs.getString("Utype"));
        setPassword(rs.getString("Upassword"));
        setPhone(rs.getString("Uphone"));
        setRegister_date(rs.getDate("Uregister_date"));
        setCancellation_date(rs.getDate("Ucancellation_date"));
    }

    @Override
    public String toString() {
        return "User{" + "number=" + number + ", name='" + name + '\'' + ", password='" + password + '\'' + ", type='" + type + '\'' + ", phone='" + phone + '\'' + ", register_date=" + register_date + ", cancellation_date=" + cancellation_date + '}';
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getRegister_date() {
        return register_date;
    }

    public void setRegister_date(Date register_date) {
        this.register_date = register_date;
    }

    public Date getCancellation_date() {
        return cancellation_date;
    }

    public void setCancellation_date(Date cancellation_date) {
        this.cancellation_date = cancellation_date;
    }
}
