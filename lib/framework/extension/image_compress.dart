const String COMPRESS_LEVEL_1 = "10";
const String COMPRESS_LEVEL_2 = "20";
const String COMPRESS_LEVEL_3 = "30";
const String COMPRESS_LEVEL_4 = "40";
const String COMPRESS_LEVEL_5 = "50";
const String COMPRESS_LEVEL_6 = "60";
const String COMPRESS_LEVEL_7 = "70";
const String COMPRESS_LEVEL_8 = "80";
const String COMPRESS_LEVEL_9 = "90";
const String COMPRESS_LEVEL_10 = "100";

extension ImageCompress on String {
  // ignore: non_constant_identifier_names
  String compress_value() {
    bool isHttpUrl = this.startsWith("http://img.kaiyanapp.com/") ||
        this.startsWith("https://img.kaiyanapp.com/");
    bool isImageRes = this.contains(".png") ||
        this.contains(".jpeg") ||
        this.contains(".jpg") ||
        this.contains(".gif");

    if (isHttpUrl && isImageRes) {
      Uri uri = Uri.parse(this);
      String compressUrl = "http://${uri.host}${uri.path}?imageMogr2/thumbnail";
      if (!this.contains("?imageMogr2/quality")) {
        compressUrl = "$compressUrl/!${COMPRESS_LEVEL_3}p";
      } else {
        compressUrl = "$compressUrl/!${COMPRESS_LEVEL_5}p";
      }
      return compressUrl;
    }
    return this;
  }
}
