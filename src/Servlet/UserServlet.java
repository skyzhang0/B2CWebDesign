package Servlet;

import Entity.User.User;
import DAOFactory.DAOFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.SQLException;

public class UserServlet extends HttpServlet {
    public static boolean login(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        ServletContext application = request.getServletContext(); // 获取application对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 如果用户名或密码为空则返回报错信息
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            String url = abs_login + "?err=" + URLEncoder.encode("用户名或密码为空", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 尝试使用用户名获取用户信息
        User user = null;
        try {
            user = DAOFactory.getUserDAOInstance().findByName(username);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        // 如果没找到用户则返回报错信息
        if (user == null) {
            String url = abs_login + "?err=" + URLEncoder.encode("找不到用户名或密码", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 实现每天最多尝试三次密码
        Date time_now = new Date(System.currentTimeMillis());
        Date time_last = (Date) application.getAttribute("lastTry_date_" + username);
        long day = 1000 * 60 * 60 * 24;
        // 如果以前没访问过，或者最后一次访问时间大于一天，则置尝试次数为0
        if (time_last == null || (time_last.getTime() - time_now.getTime() > day)) {
            application.removeAttribute("lastTry_date_" + username);
            application.removeAttribute("try_cnt_" + username);
        }
        // 检查用户输错密码次数，如果大于三次则返回报错信息
        Integer try_cnt = (Integer) application.getAttribute("try_cnt_" + username);
        if (try_cnt != null && try_cnt > 3) {
            String url = abs_login + "?err=" + URLEncoder.encode("密码错误超过三次，请改日再试", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 对比数据库中的密码
        // 如果错误，返回报错信息，并更新尝试次数和最后尝试时间
        // 如果正确，返回true，重定向到index，并清除最后访问时间和尝试次数
        if (!password.equals(user.getPassword())) {
            try_cnt = try_cnt == null ? Integer.valueOf(0) : try_cnt;
            application.setAttribute("try_cnt_" + username, try_cnt + 1);
            application.setAttribute("lastTry_date_" + username, new Date(System.currentTimeMillis()));
            String url = abs_login + "?err=" + URLEncoder.encode("找不到用户名或密码", StandardCharsets.UTF_8);
            response.sendRedirect(url);
        } else {
            application.removeAttribute("try_cnt_" + username);
            application.removeAttribute("lastTry_date_" + username);
            response.sendRedirect(abs_index);
        }
        return true;
    }
}
