package Entity.Data;

import java.sql.ResultSet;
import java.sql.SQLException;

public class StockInfo {
    private int number;
    private int good_number;
    private int count;
    private double monthly_storage_cost;

    public StockInfo() {
        number = 0;
        good_number = 0;
        count = 0;
        monthly_storage_cost = 0;
    }

    public StockInfo(int number, int good_number, int count, double monthly_storage_cost) {
        this.number = number;
        this.good_number = good_number;
        this.count = count;
        this.monthly_storage_cost = monthly_storage_cost;
    }

    public StockInfo(StockInfo stock_info) {
        number = stock_info.number;
        good_number = stock_info.good_number;
        count = stock_info.count;
        monthly_storage_cost = stock_info.monthly_storage_cost;
    }

    public StockInfo(ResultSet rs) throws SQLException {
        number = rs.getInt("Sno");
        good_number = rs.getInt("Gno");
        count = rs.getInt("Snum");
        monthly_storage_cost = rs.getInt("SMonthlyStorageCost");
    }

    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + good_number + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + monthly_storage_cost + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "库存信息编号" + "</th>";
        res += "<th>" + "库存商品编号" + "</th>";
        res += "<th>" + "库存商品数量" + "</th>";
        res += "<th>" + "每月仓储费用" + "</th>";
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

    public double getMonthly_storage_cost() {
        return monthly_storage_cost;
    }

    public void setMonthly_storage_cost(double monthly_storage_cost) {
        this.monthly_storage_cost = monthly_storage_cost;
    }
}
