class HttpUtil {
  static late HttpUtil _instance;

  static HttpUtil getInstance() {
    return _instance;
  }
}

void main() {}

class Api {
  static String baseUrl = "http://tinterest.lechuangtec.com";
  static String newsList = "$baseUrl/app/interest/item/V222/list";
  static String tabList = "$baseUrl/app/interest/channel/select_V200";
  static String videoTabList = "$baseUrl/app/interest/video_channel/select";
  static String videoList = "$baseUrl/app/interest/item/V222/video";
}
