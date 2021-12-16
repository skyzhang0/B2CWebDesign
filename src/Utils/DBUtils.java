package Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DBUtils {
    private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String DateFormatter(Date date) {
        if (date == null) {
            return "null";
        }
        return df.format(date);
    }

    // 执行SQL文件，如果成功返回true，失败返回false
    public static boolean runSqlFile(String path) {

        return false;
    }
}
