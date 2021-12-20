package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OutInfo {
    private int number;
    private int good_number;
    private int count;
    private Date out_date;

    public OutInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        out_date = null;
    }

    public OutInfo(int number, int good_number, int count, Date out_date) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.out_date = out_date;
    }

    public OutInfo(OutInfo out_info) {
        number = out_info.number;
        good_number = out_info.good_number;
        count = out_info.count;
        out_date = out_info.out_date;
    }

    public OutInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("Ouno");
        good_number = rs.getInt("Gno");
        count = rs.getInt("Onum");
        out_date = rs.getDate("OutStockDate");
    }

    // todo
    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + (out_date != null ? out_date : "null") + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "出库信息编号" + "</th>";
        res += "<th>" + "出库商品编号" + "</th>";
        res += "<th>" + "出库商品数量" + "</th>";
        res += "<th>" + "出库日期  " + "</th>";
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

    public Date getOut_date() {
        return out_date;
    }

    public void setOut_date(Date out_date) {
        this.out_date = out_date;
    }
}
