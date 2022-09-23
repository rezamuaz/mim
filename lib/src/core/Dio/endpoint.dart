class Endpoints {
  Endpoints._();

  // base url
  static String baseUrl = ('https://api.imgflip.com/');

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;

  static String listPost = ('get_memes');
}
