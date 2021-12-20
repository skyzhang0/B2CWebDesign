package Entity.Data;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderInfo {
    private int number;
    private int good_number;
    private int count;
    private double price;
    private Date order_date;
    private double quality;

    public OrderInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        price = 0;
        order_date = null;
        quality = 0;
    }

    public OrderInfo(int number, int good_number, int count, double price, Date order_date,
                     double quality
    ) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.price = price;
        this.order_date = order_date;
        this.quality = quality;
    }

    public OrderInfo(OrderInfo order_info) {
        number = order_info.number;
        good_number = order_info.good_number;
        count = order_info.count;
        price = order_info.price;
        order_date = order_info.order_date;
        quality = order_info.quality;
    }

    public OrderInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("Ono");
        good_number = rs.getInt("Gno");
        count = rs.getInt("Onum");
        price = rs.getInt("Oprice");
        order_date = rs.getDate("Odate");
        quality = rs.getDouble("Oquality");
    }

    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + price + "</td>";
        res += "<td>" + (order_date != null ? order_date : "null") + "</td>";
        res += "<td>" + quality + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "订货信息编号" + "</th>";
        res += "<th>" + "订货商品编号" + "</th>";
        res += "<th>" + "订货商品数量" + "</th>";
        res += "<th>" + "订货商品单价" + "</th>";
        res += "<th>" + "订货日期" + "</th>";
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getOrder_date() {
        return order_date;
    }

    public void setOrder_date(Date order_date) {
        this.order_date = order_date;
    }

    public double getQuality() {
        return quality;
    }

    public void setQuality(double quality) {
        this.quality = quality;
    }
}
