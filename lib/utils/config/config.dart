class AppConfig{
  static const String baseUrl="https://api.zhndev.site/wp-json";
  static const String apiUrl="$baseUrl/blog-app/v1";

  //=================endponits===================================

static Uri loginUrl=Uri.parse("$apiUrl/auth/login");
static Uri registerUrl=Uri.parse("$apiUrl/auth/register");




}