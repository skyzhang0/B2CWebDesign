import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class Combine_Scripts {
    public static void main(String[] args) throws IOException {
        // 所有SQL脚本存储地址
        String poj_dir = "C:\\project\\B2C Web Design\\SQL Scripts\\";
        // 数据库dll脚本存储地址
        String Origin_sql_dir = poj_dir + "\\Origin_DB_Setup";

        // 用来存储需要合并的SQL脚本的路径，同时规定合并顺序
        List<Path> files = new ArrayList<>();
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/Define_DB.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/Define_Table.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_goods_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_check_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_order_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_out_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_sell_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_stock_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_user_info.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_user_changebackup.sql"));
        files.add(Paths.get(poj_dir, "SQL/Origin_DB_Setup/jxc_manage_system_ware_info.sql"));

        // 按顺序读入SQL脚本并按行存储在List中，同时加入部分提示语句
        List<String> lines = new ArrayList<>();
        for (Path path : files) {
            lines.add("-- From File: " + path.getFileName());
            lines.addAll(Files.readAllLines(path));
            lines.add("");
        }

        // 输出文件地址，每次都重新输出
        Path output_path = Paths.get(poj_dir, "SQL/Setup_all.sql");
        if (Files.exists(output_path)) { // 如果文件存在则删除
            Files.delete(output_path);
        }
        Files.createFile(output_path);

        // 输出合并完成的SQL脚本
        OutputStream outputStream = Files.newOutputStream(output_path);
        PrintWriter out = new PrintWriter(outputStream);
        for (String line : lines) {
            out.println(line);
        }
        out.flush();
    }
}
