class BaseUrl {
  /// main url
  static const String baseUrl =
      "http://scprojects.in.net/projects/skoolmonk/api_";

  /// login
  static const String login = '$baseUrl/login/login_check';

  /// password forgot use otp
  static const String forgotPassword = '$baseUrl/login/forgot_password';
  static const String resetPassword = '$baseUrl/login/reset_password';

  /// create user
  static const String createUser = '$baseUrl/user/create';

  /// otp login
  /// not working this api
  static const String sendOtp = '$baseUrl/otp/validate/1';
  static const String verifyOtp = '$baseUrl/otp/validate/0';

  /// upload image
  static const String imageUpload = '$baseUrl/app/image_upload';

  /// get current login user details
  static const String userDetail = '$baseUrl/user/user_detail';
  static const String updateProfile = '$baseUrl/user/update_user_detail';

  ///update user details
  static const String productDetails = '$baseUrl/product/detail';

  /// update user mobile number
  static const String updateMobileNumber =
      '$baseUrl/user/update_user_mobile_number';

  /// user image update
  static const String updateUserProfileImage =
      '$baseUrl/user/update_user_profile';

  /// add user address
  static const String addAddress = '$baseUrl/user/add_address';

  /// user all address
  static const String userAllAddress = '$baseUrl/user/user_all_address';

  /// user single address
  static const String userSingleAddress = '$baseUrl/user/user_address';

  /// update address
  static const String updateAddress = '$baseUrl/user/update_address_user';

  /// update Selected Address User
  static const String updateSelectedAddress =
      '$baseUrl/user/update_selected_address_user';

  /// delete address
  static const String deleteAddressUser = '$baseUrl/user/delete_address_user';

  /// main categories
  static const String mainCategories = '$baseUrl/categories/main_categories';

  /// get main categories view with Subcategory
  static const String getMainCategoriesViewWithSubcategory =
      '$baseUrl/categories/get_main_categories_view_with_subcategory_subsubcategory';

  /// categories by subcategories product post
  static const String categoryWiseProduct =
      '$baseUrl/categories/categories_by_subcategories_product_post';

  /// school api
  static const String allSchool = '$baseUrl/app/all_school';
  static const String singleSchool = '$baseUrl/app/single_school';
  static const String singleSchoolCategoriesProduct =
      '$baseUrl/app/single_school_categories_product';
  static const String bookSetCategoriesProduct = '$baseUrl/product/detail';

  /// add to cart
  static const String addToCart = '$baseUrl/purchase/add_to_cart';

  /// cart view
  static const String cartView = '$baseUrl/purchase/cart_view';

  /// update cart
  static const String updateCart = '$baseUrl/purchase/update_cart';

  /// remove cart
  static const String removeCart = '$baseUrl/purchase/remove_cart';

  /// product add to wish list
  static const String productAddToWishList =
      '$baseUrl/product/product_in_user_wishlist';

  /// get all product in user wish list
  static const String userWishList =
      '$baseUrl/product/product_from_user_wishlist';

  /// home page
  static const String homePage = '$baseUrl/home/homepage';

  /// find product
  static const String findProduct = '$baseUrl/product/find';
  static const String findProductSuggestion =
      '$baseUrl/product/find_suggestion';
}
