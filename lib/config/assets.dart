class AssetConfig {
  static String iconpath = "assets/icon/";
  static String iconspath = "assets/icons/";
  static String flagspath = "assets/flags/";
  static String assets = "assets/";

  static getFromAssets(String image) {
    return assets + image;
  }

  static getFromIcon(String image) {
    return iconpath + image;
  }

  static getFromIcons(String image) {
    return iconspath + image;
  }

  static getFromFlag(String image) {
    return flagspath + image;
  }
}
