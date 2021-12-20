package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SellInfo {
    private int number;
    private int good_number;
    private int count;
    private Date sell_date;

    public SellInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        sell_date = null;
    }

    public SellInfo(int number, int good_number, int count, Date sell_date) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.sell_date = sell_date;
    }

    public SellInfo(SellInfo sell_info) {
        number = sell_info.number;
        good_number = sell_info.good_number;
        count = sell_info.count;
        sell_date = sell_info.sell_date;
    }

    public SellInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("SLno");
        good_number = rs.getInt("Gno");
        count = rs.getInt("SLnum");
        sell_date = rs.getDate("SLtime");
    }

    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + (sell_date != null ? sell_date : "null") + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "出售信息编号" + "</th>";
        res += "<th>" + "出售商品编号" + "</th>";
        res += "<th>" + "出售商品数量" + "</th>";
        res += "<th>" + "出售日期  " + "</th>";
        res += "</tr>\n</thead>\n";
        return res;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getGood_number() {
        return good_number;
    }

    public void setGood_number(int good_number) {
        this.good_number = good_number;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getSell_date() {
        return sell_date;
    }

    public void setSell_date(Date sell_date) {
        this.sell_date = sell_date;
    }
}
