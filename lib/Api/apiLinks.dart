class ApiLinks {
  static const String _BASE_URL = "https://com.simple.chat:433";

  static const String login = _BASE_URL + "/login";

  static const String create = _BASE_URL + "/create";

  static String friends(int page) {
    return _BASE_URL + "/friends/$page";
  }

  static String messages(String friendId) {
    return _BASE_URL + "/messages/$friendId";
  }

  static String message(String friendId) {
    return _BASE_URL + "/message/$friendId";
  }

  static const String profile = _BASE_URL + "/profile";

}
