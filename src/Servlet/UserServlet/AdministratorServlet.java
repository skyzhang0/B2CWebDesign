package Servlet.UserServlet;

import DAOFactory.DAOFactory;
import Entity.User.User;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

public class AdministratorServlet extends HttpServlet {
    public static boolean createUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession();// 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_add_user = request.getContextPath() + "/pages/ManagePages/personnel_manage/add.jsp";

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String type = request.getParameter("type");

        // 检查信息是否输入完整
        if (name == null || name.isEmpty() || password == null || password.isEmpty() || type == null || type.isEmpty()) {
            String url = abs_add_user + "?err=" + URLEncoder.encode("请输入完整信息", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否是Administrator
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // 用户未登录，重定向到登录页
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else if (!user.getType().equals("Administrator")) {
            // 用户不是超级管理员，重定向到登录页让使用超级管理员账号登录
            String url = abs_login + "?err=" + URLEncoder.encode("请使用超级管理员账号登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        //将新用户存入数据库，成功返回成功信息，错误返回错误信息
        User user_new = new User();
        user_new.setName(name);
        user_new.setPassword(password);
        user_new.setType(type);
        if (!DAOFactory.getUserDAOInstance().doInsert(user_new, user)) {
            String url = abs_add_user + "?err=" + URLEncoder.encode("未知错误，请联系系统管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else {
            String url = abs_add_user + "?scc=" + URLEncoder.encode("添加用户成功", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return true;
        }
    }

    public static boolean deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession();// 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_delete_user = request.getContextPath() + "/pages/ManagePages/personnel_manage/delete.jsp";

        String name = request.getParameter("name");

        // 检查信息是否输入完
        if (name == null || name.isEmpty()) {
            String url = abs_delete_user + "?err=" + URLEncoder.encode("输入信息不全", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否是Administrator
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // 用户未登录，重定向到登录页
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else if (!user.getType().equals("Administrator")) {
            // 用户不是超级管理员，重定向到登录页让使用超级管理员账号登录
            String url = abs_login + "?err=" + URLEncoder.encode("请使用超级管理员账号登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查数据库中是否存在用户
        User user_tar = DAOFactory.getUserDAOInstance().findByName(name);
        if (user_tar == null) {
            String url = abs_delete_user + "?err=" + URLEncoder.encode("不存在此用户", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 删除用户
        if (!DAOFactory.getUserDAOInstance().doDelete(user_tar, user)) {
            String url = abs_delete_user + "?err=" + URLEncoder.encode("未知错误，请联系系统管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else {
            String url = abs_delete_user + "?scc=" + URLEncoder.encode("添加用户成功", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return true;
        }
    }

    // 授予用户权限
    public static boolean awardUser(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException, ClassNotFoundException {
        ServletContext application = request.getServletContext(); // 获取application对象
        HttpSession session = request.getSession();// 获取session对象
        String abs_login = request.getContextPath() + "/pages/login.jsp";
        String abs_register = request.getContextPath() + "/pages/register.jsp";
        String abs_index = request.getContextPath() + "/index.jsp";
        String abs_update_user = request.getContextPath() + "/pages/ManagePages/personnel_manage/update.jsp";

        String name = request.getParameter("name");
        String type = request.getParameter("type");

        // 检查信息是否输入完
        if (name == null || name.isEmpty() || type == null || type.isEmpty()) {
            String url = abs_update_user + "?err=" + URLEncoder.encode("输入信息不全", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查用户是否是Administrator
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // 用户未登录，重定向到登录页
            String url = abs_login + "?err=" + URLEncoder.encode("请重新登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else if (!user.getType().equals("Administrator")) {
            // 用户不是超级管理员，重定向到登录页让使用超级管理员账号登录
            String url = abs_login + "?err=" + URLEncoder.encode("请使用超级管理员账号登录", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 检查数据库中是否存在用户
        User user_tar = DAOFactory.getUserDAOInstance().findByName(name);
        if (user_tar == null) {
            String url = abs_update_user + "?err=" + URLEncoder.encode("不存在此用户", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        }

        // 更新并存入用户信息
        user_tar.setType(type);
        if (!DAOFactory.getUserDAOInstance().doUpdate(user_tar, user)) {
            String url = abs_update_user + "?err=" + URLEncoder.encode("未知错误，请联系系统管理员", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return false;
        } else {
            String url = abs_update_user + "?scc=" + URLEncoder.encode("添加用户成功", StandardCharsets.UTF_8);
            response.sendRedirect(url);
            return true;
        }
    }
}
