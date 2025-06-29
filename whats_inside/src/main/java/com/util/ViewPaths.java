package com.util;

public class ViewPaths {

    // Auth views
    public static final String LOGIN = "auth/Login";
    public static final String SIGNUP = "auth/Signup";
    public static final String OTP_FORM = "auth/OtpForm";
    public static final String FORGOT_PASSWORD = "auth/ForgotPassword";
    public static final String LOGOUT = "auth/Logout";

    // Admin views
    public static final String ADMIN_DASHBOARD = "admin/AdminDashboard";
    
    public static final String ADMIN_LIST_USER = "admin/ListUser";
    public static final String ADMIN_NEW_INGREDIENT = "admin/NewIngredient";
    public static final String ADMIN_UPDATE_INGREDIENT = "admin/UpdateIngredient";
    public static final String ADMIN_SEARCH_LOG_LIST = "admin/SearchLogs";
    
    // Includes (shared components)
    public static final String INCLUDE_FOOTER = "includes/Footer";
    public static final String INCLUDE_HEADER_LINK = "includes/HeaderLink";
    public static final String INCLUDE_SCRIPTS = "includes/Scripts";

    // Layout components
    public static final String LAYOUT_HEADER = "layouts/AdminHeader";
    public static final String LAYOUT_NAVBAR = "layouts/AdminNavbar";
    public static final String LAYOUT_SIDEBAR = "layouts/AdminSidebar";

    // Old/legacy views
    public static final String OLD_LOGIN = "old_versions/old_Login";
    public static final String OLD_SIGNUP = "old_versions/Old_Signup";

    // User views
    public static final String HOME = "Home";
    public static final String LIST_INGREDIENTS = "ListIngredients";
    public static final String SEARCH_INGREDIENT = "SearchIngredient";
    public static final String VIEW_INGREDIENT = "ViewIngredient";
    public static final String Profile = "Profile";
}
