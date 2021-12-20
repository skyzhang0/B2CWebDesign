package Entity.Good;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Good {
    private int number;
    private String unit;
    private String name;
    private int count;
    private double price;
    private String qualityGuaranteePeriod;
    private Date productDate;
    private Date dueDate;
    private String kind;
    private double profit;

    public Good() {
        number = 0;
        unit = "";
        name = "";
        count = 0;
        price = 0;
        qualityGuaranteePeriod = "";
        productDate = null;
        dueDate = null;
        kind = "";
        profit = 0;
    }

    public Good(int number, String unit, String name, int count, double price,
                String qualityGuaranteePeriod, Date productDate, Date dueDate, String kind,
                double profit
    ) {
        this.number = number;
        this.unit = unit;
        this.name = name;
        this.count = count;
        this.price = price;
        this.qualityGuaranteePeriod = qualityGuaranteePeriod;
        this.productDate = productDate;
        this.dueDate = dueDate;
        this.kind = kind;
        this.profit = profit;
    }

    public Good(Good good) {
        number = good.number;
        unit = good.unit;
        name = good.name;
        count = good.count;
        price = good.price;
        qualityGuaranteePeriod = good.qualityGuaranteePeriod;
        productDate = good.productDate;
        dueDate = good.dueDate;
        kind = good.kind;
        profit = good.profit;
    }

    public Good(ResultSet rs) throws SQLException {
        number = rs.getInt("Gno");
        unit = rs.getString("Gunit");
        name = rs.getString("Gname");
        count = rs.getInt("Gnum");
        price = rs.getInt("Gprice");
        qualityGuaranteePeriod = rs.getString("GqualityGuaranteePeriod");
        productDate = rs.getDate("GDateOfProduction");
        dueDate = rs.getDate("GDueDate");
        kind = rs.getString("Gkind");
        profit = rs.getDouble("Gprofit");
    }

    public String toHTMLTableRow() {
        String res = "";
        res += "<tr>\n";
        res += "<td>" + number + "</td>";
        res += "<td>" + (unit != null ? unit : "null") + "</td>";
        res += "<td>" + (name != null ? name : "null") + "</td>";
        res += "<td>" + count + "</td>";
        res += "<td>" + price + "</td>";
        res += "<td>" + (qualityGuaranteePeriod != null ? qualityGuaranteePeriod : "null") + "</td>";
        res += "<td>" + (productDate != null ? productDate : "null") + "</td>";
        res += "<td>" + (dueDate != null ? dueDate : "null") + "</td>";
        res += "<td>" + (kind != null ? kind : "null") + "</td>";
        res += "<td>" + profit + "</td>";
        res += "</tr>\n";
        return res;
    }

    public String getHTMLTableHeader() {
        String res = "";
        res += "<thead>\n<tr>\n";
        res += "<th>" + "商品编号" + "</th>";
        res += "<th>" + "商品单位" + "</th>";
        res += "<th>" + "商品名称" + "</th>";
        res += "<th>" + "商品货架数量" + "</th>";
        res += "<th>" + "商品价格" + "</th>";
        res += "<th>" + "商品保质期" + "</th>";
        res += "<th>" + "商品生产日期" + "</th>";
        res += "<th>" + "商品到期日期" + "</th>";
        res += "<th>" + "商品类别" + "</th>";
        res += "<th>" + "单位商品利润" + "</th>";
        res += "</tr>\n</thead>\n";
        return res;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getQualityGuaranteePeriod() {
        return qualityGuaranteePeriod;
    }

    public void setQualityGuaranteePeriod(String qualityGuaranteePeriod) {
        this.qualityGuaranteePeriod = qualityGuaranteePeriod;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }

    public Date getProductDate() {
        return productDate;
    }

    public void setProductDate(Date productDate) {
        this.productDate = productDate;
    }

}
