class BASEURL {
  static String ipAddress = '192.168.0.105';
  static String baseUrl = 'http://$ipAddress/medicine/medicine_php';
  static String apiRegister = '$baseUrl/register_api.php';
  static String apiLogin = '$baseUrl/login_api.php';
  static String categoryWithProduct = '$baseUrl/get_product_with_category.php';
  static String getProduct = '$baseUrl/get_product.php';
}
