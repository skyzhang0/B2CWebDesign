package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WareInfo {
    private int number;
    private int good_number;
    private int count;
    private Date arrive_date;
    private double quality;

    public WareInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        arrive_date = null;
        quality = 0;
    }

    public WareInfo(int number, int good_number, int count, Date arrive_date, double quality) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.arrive_date = arrive_date;
        this.quality = quality;
    }

    public WareInfo(WareInfo ware_info) {
        number = ware_info.number;
        good_number = ware_info.good_number;
        count = ware_info.count;
        arrive_date = ware_info.arrive_date;
        quality = ware_info.quality;
    }

    public WareInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("Wno");
        good_number = rs.getInt("Gno");
        count = rs.getInt("Wnum");
        arrive_date = rs.getDate("WArriveDate");
        quality = rs.getDouble("Wquality");
    }

    // todo
    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + (arrive_date != null ? arrive_date : "null") + "</td>";
        res += "<td>" + quality + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "入库信息编号" + "</th>";
        res += "<th>" + "入库商品编号" + "</th>";
        res += "<th>" + "入库商品数量" + "</th>";
        res += "<th>" + "入库日期" + "</th>";
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

    public Date getArrive_date() {
        return arrive_date;
    }

    public void setArrive_date(Date arrive_date) {
        this.arrive_date = arrive_date;
    }

    public double getQuality() {
        return quality;
    }

    public void setQuality(double quality) {
        this.quality = quality;
    }
}
