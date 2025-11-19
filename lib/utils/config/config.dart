class AppConfig {
  static const String baseUrl = "https://api.zhndev.site/wp-json";
  static const String apiUrl = "$baseUrl/blog-app/v1";

  // =================== Authentication URLs ===================
  static Uri loginUrl = Uri.parse("$apiUrl/auth/login");
  static Uri registerUrl = Uri.parse("$apiUrl/auth/register");
  static Uri logoutUrl = Uri.parse("$apiUrl/auth/logout");

  // =================== User Profile URLs ===================
  static Uri userProfileUrl = Uri.parse("$apiUrl/user/profile");
  static Uri changePasswordUrl = Uri.parse("$apiUrl/user/change-password");
  static Uri userLikesUrl = Uri.parse("$apiUrl/user/likes");

  // =================== Categories URLs ===================
  static Uri categoriesUrl = Uri.parse("$apiUrl/categories");

  // =================== Comments URLs ===================
  static Uri commentsUrl = Uri.parse("$apiUrl/comments");
}