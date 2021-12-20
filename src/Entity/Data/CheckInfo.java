package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckInfo {
    private int number;
    private int good_number;
    private int count;
    private boolean qualified;
    private Date check_date;
    private double quality;

    public CheckInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        qualified = false;
        check_date = null;
        quality = 0;
    }

    public CheckInfo(int number, int good_number, int count, boolean qualified,
                     Date check_date,
                     double quality
    ) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.qualified = qualified;
        this.check_date = check_date;
        this.quality = quality;
    }

    public CheckInfo(CheckInfo check_info) {
        number = check_info.number;
        good_number = check_info.good_number;
        count = check_info.count;
        qualified = check_info.qualified;
        check_date = check_info.check_date;
        quality = check_info.quality;
    }

    public CheckInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("Kno");
        good_number = rs.getInt("Gno");
        count = rs.getInt("Onum");
        qualified = rs.getBoolean("Kqual");
        check_date = rs.getDate("Kdate");
        quality = rs.getDouble("Kquality");
    }

    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + qualified + "</td>";
        res += "<td>" + (check_date != null ? check_date : "null") + "</td>";
        res += "<td>" + quality + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "验收信息编号" + "</th>";
        res += "<th>" + "验收商品编号" + "</th>";
        res += "<th>" + "验收商品数量" + "</th>";
        res += "<th>" + "是否合格" + "</th>";
        res += "<th>" + "验收日期" + "</th>";
        res += "<th>" + "货物质量" + "</th>";
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

    public boolean isQualified() {
        return qualified;
    }

    public void setQualified(boolean qualified) {
        this.qualified = qualified;
    }

    public Date getCheck_date() {
        return check_date;
    }

    public void setCheck_date(Date check_date) {
        this.check_date = check_date;
    }

    public double getQuality() {
        return quality;
    }

    public void setQuality(double quality) {
        this.quality = quality;
    }
}
