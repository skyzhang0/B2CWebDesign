package Instance;

public class Customer {
    private String name;        //用户名
    private String pwd;        //密码
    private boolean isVIP;        //是否VIP
    private String gender;        //性别
    private String area;        //地区

    public Customer() {
        this.name = "";
        this.pwd = "";
        this.isVIP = false;
        this.gender = "";
        this.area = "";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public boolean isVIP() {
        return isVIP;
    }

    public void setVIP(boolean isVIP) {
        this.isVIP = isVIP;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }
}
