import 'package:vanilla/models/filterAll.dart';
import 'package:vanilla/models/setProfile.dart';
import 'package:http/http.dart' as http;

class setProfile {
  Future<List<SetProfile>?> setSetProfile() async {
    var client = http.Client();
    
    var uri = Uri.parse('https://hidden-mountain-66153.herokuapp.com/setProfile');
    var response = await client.post(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      //return setProfileFromJson(json);
    }
  }
}

class filterAll {
  Future<List<FilterAll>?> getFilterAll() async {
    var client = http.Client();

    var uri = Uri.parse('https://hidden-mountain-66153.herokuapp.com/home');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
     // filterAllToJson(json);
    }
  }
}