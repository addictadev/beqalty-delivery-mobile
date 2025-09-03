class AppAssets {
  factory AppAssets() {
    return _instance;
  }
  AppAssets._();
  static final AppAssets _instance = AppAssets._();

  static const String _iconsPath = "assets/icons";
  static const String _imagesPath = "assets/images";

  static const String appIcon = "$_iconsPath/app_icon.png";
  static const String splashIcon = "$_imagesPath/splash_icon.svg";
  static const String authBackground = "$_imagesPath/auth_background.png";
  static const String authLoginBackground = "$_imagesPath/auth_welcome.svg";
  static const String shoppingBag = "$_iconsPath/cart_icon.svg";
  static const String celebrateImg = "$_imagesPath/bk.png";
  static const String underReviewImg = "$_iconsPath/under_review.svg";
  static const String successImg = "$_iconsPath/sucess_icon.svg";
  static const String homeIcon = "$_iconsPath/home_icon.svg";
  static const String alertIcon = "$_iconsPath/alerl_icon.svg";
  static const String earningIcon = "$_iconsPath/earning_icon.svg";
  static const String historyIcon = "$_iconsPath/history.svg";
  static const String profileIcon = "$_iconsPath/profile_icon.svg";

}
