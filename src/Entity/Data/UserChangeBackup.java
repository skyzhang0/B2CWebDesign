package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserChangeBackup {
    private int number;
    private String type;
    private Date time;
    private int creator_number;
    private int involved_number;
    private String before_type;
    private String after_type;

    public UserChangeBackup() {
        number = 0;
        type = "";
        time = null;
        creator_number = 0;
        involved_number = 0;
        before_type = "";
        after_type = "";
    }

    public UserChangeBackup(int number, String type, Date time, int creator_number,
                            int involved_number, String before_type, String after_type
    ) {
        this.number = number;
        this.type = type;
        this.time = time;
        this.creator_number = creator_number;
        this.involved_number = involved_number;
        this.before_type = before_type;
        this.after_type = after_type;
    }

    public UserChangeBackup(ResultSet rs) throws SQLException {
        setNumber(rs.getInt("CHno"));
        setType(rs.getString("CHtype"));
        setTime(rs.getDate("CHtime"));
        setCreator_number(rs.getInt("Creator_Uno"));
        setInvolved_number(rs.getInt("Involved_Uno"));
        setBefore_type(rs.getString("BeforeType"));
        setAfter_type(rs.getString("AfterType"));
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getCreator_number() {
        return creator_number;
    }

    public void setCreator_number(int creator_number) {
        this.creator_number = creator_number;
    }

    public int getInvolved_number() {
        return involved_number;
    }

    public void setInvolved_number(int involved_number) {
        this.involved_number = involved_number;
    }

    public String getBefore_type() {
        return before_type;
    }

    public void setBefore_type(String before_type) {
        this.before_type = before_type;
    }

    public String getAfter_type() {
        return after_type;
    }

    public void setAfter_type(String after_type) {
        this.after_type = after_type;
    }
}
