import 'package:http/http.dart' as http;

class ClientAPI {
  static String AccesToken =
      "091343ce13c8ae780065ecb3b13dc903475dd22cb78a05503c2e0c69c5e98044";

  static Future<http.Response?> showimageAnime() async {
    var header = {
      "content-Type": 'application/json; charset=UTF-8',
      'Authorization': 'Bearer' '$AccesToken',
      // 'X-RapidAPI-Key': '18e246cdaemsh086842b8de263bap10cf13jsnd2070128d5bb',
      // 'X-RapidAPI-Host': 'any-anime.p.rapidapi.com'
    };
    http.Response? responses;

    try {
      responses = await http
          .get(
            Uri.parse("https://api.unsplash.com/photos/?client_id=$AccesToken"),
            headers: header,
          )
          .timeout(Duration(seconds: 5));
    } catch (e) {
      print(e);
    }
    print(responses!.body);
    return responses;
  }
}
