package Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DBUtils {
    private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static String DateFormatter(Date date) {
        if (date == null) {
            return "null";
        }
        return df.format(date);
    }
}
