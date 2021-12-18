package Servlet.UserServlet;

import Entity.User.User;
import DAOFactory.DAOFactory;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.sql.SQLException;

public class UserServlet extends HttpServlet {
    public static boolean login(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession();// 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
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
            return false;
        } else {
            application.removeAttribute("try_cnt_" + username);
            application.removeAttribute("lastTry_date_" + username);
        }

        //登录过程，将User对象存入session
        session.setAttribute("user", user);
        response.sendRedirect(abs_index);
        return true;
    }

    public static boolean register(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession(); // 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";

        String username = request.getParameter("username");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String retry_password = request.getParameter("retry_password");

        // 检测信息是否输入完整
        if (username == null || username.isEmpty() || phone == null || phone.isEmpty() || password == null || password.isEmpty() || retry_password == null || retry_password.isEmpty()) {
            String url = abs_register + "?err=" + URLEncoder.encode("必要信息缺失", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查2次密码输入是否相同
        if (!password.equals(retry_password)) {
            String url = abs_register + "?err=" + URLEncoder.encode("2次密码输入不相同", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 查找数据库中是否存在用户名
        User find_user = DAOFactory.getUserDAOInstance().findByName(username);
        if (find_user != null) {
            String url = abs_register + "?err=" + URLEncoder.encode("用户名已存在", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 在数据库中建立用户
        User user = new User();
        user.setName(username);
        user.setPassword(password);
        user.setPhone(phone);
        if (!DAOFactory.getUserDAOInstance().doInsert(user)) {
            String url = abs_register + "?err=" + URLEncoder.encode("未知错误，请联系管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 注册成功，进行登录，重定向到Index
        session.setAttribute("user", user);
        response.sendRedirect(abs_index);
        return true;
    }

    public static boolean logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        // 登出操作
        session.removeAttribute("user");
        response.sendRedirect(abs_login);
        return true;
    }

    public static boolean change_password(HttpServletRequest request, HttpServletResponse response
    ) throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession(); // 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_changePassword = request.getContextPath() + "/pages/change_password.jsp";
        String abs_changeUsername = request.getContextPath() + "/pages/change_username.jsp";
        String abs_changePhone = request.getContextPath() + "/pages/change_phone.jsp";

        String password = request.getParameter("password");
        String retry_password = request.getParameter("retry_password");

        // 检测是否输完信息
        if (password == null || password.isEmpty() || retry_password == null || retry_password.isEmpty()) {
            String url = abs_changePassword + "?err=" + URLEncoder.encode("必要信息缺失", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查2次密码输入是否相同
        if (!password.equals(retry_password)) {
            String url = abs_changePassword + "?err=" + URLEncoder.encode("2次密码输入不相同", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否登录，如果没登录重定向到login.jsp让它登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 修改user将数据插入数据库
        user.setPassword(password);
        if (!DAOFactory.getUserDAOInstance().doUpdate(user)) {
            String url = abs_changePassword + "?err=" + URLEncoder.encode("未知错误，请联系网站管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 插入成功，修改session中user，重定向到index
        session.setAttribute("user", user);
        response.sendRedirect(abs_index);
        return true;
    }

    public static boolean change_username(HttpServletRequest request, HttpServletResponse response
    ) throws IOException, SQLException, ClassNotFoundException {
        // 此处username是unique的要小心

        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession(); // 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_changePassword = request.getContextPath() + "/pages/change_password.jsp";
        String abs_changeUsername = request.getContextPath() + "/pages/change_username.jsp";
        String abs_changePhone = request.getContextPath() + "/pages/change_phone.jsp";

        String username = request.getParameter("username");

        // 检验输入是否完整
        if (username == null || username.isEmpty()) {
            String url = abs_changeUsername + "?err=" + URLEncoder.encode("必要信息缺失", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否登录，如果没登录重定向到login.jsp让它登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 修改user将数据插入数据库
        // 先查看有没有重名的，如果有则让重选用户名
        if (DAOFactory.getUserDAOInstance().findByName(username) != null) {
            String url = abs_changeUsername + "?err=" + URLEncoder.encode("用户名已存在", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }
        // 对数据库中的用户进行更新
        user.setName(username);
        if (!DAOFactory.getUserDAOInstance().doUpdate(user)) {
            String url = abs_changeUsername + "?err=" + URLEncoder.encode("未知错误，请联系网站管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 插入成功，修改session中user，重定向到index
        session.setAttribute("user", user);
        response.sendRedirect(abs_index);
        return true;
    }

    public static boolean change_phone(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession(); // 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_changePassword = request.getContextPath() + "/pages/change_password.jsp";
        String abs_changeUsername = request.getContextPath() + "/pages/change_username.jsp";
        String abs_changePhone = request.getContextPath() + "/pages/change_phone.jsp";

        String phone = request.getParameter("phone");

        // 检验输入是否完整
        if (phone == null || phone.isEmpty()) {
            String url = abs_changePhone + "?err=" + URLEncoder.encode("必要信息缺失", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否登录，如果没登录重定向到login.jsp让它登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 修改user将数据插入数据库
        user.setPhone(phone);
        if (!DAOFactory.getUserDAOInstance().doUpdate(user)) {
            String url = abs_changePhone + "?err=" + URLEncoder.encode("未知错误，请联系网站管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 插入成功，修改session中user，重定向到index
        session.setAttribute("user", user);
        response.sendRedirect(abs_index);
        return true;
    }
}
