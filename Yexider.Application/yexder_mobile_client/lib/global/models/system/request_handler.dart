class RequestHandler {
  static String? getCookieValue(String? cookie, String key) {
    if (cookie == null) {
      return null;
    }
    
    List<String> pairs = cookie.split(';');
    
    for (var pair in pairs) {
      List<String> keyValue = pair.split('=');

      if (keyValue.isNotEmpty && keyValue.length == 2 && keyValue.first == key) {
        return keyValue.last;
      }
    }

    return null;
  }
}