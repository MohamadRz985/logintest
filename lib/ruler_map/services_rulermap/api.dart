import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiNonimation {
  Future<String> getpoints(String longit, String latit) async {
    var url =
        "https://nominatim.openstreetmap.org/reverse?format=geojson&lat=$longit&lon=$latit";
    Uri? uri = Uri.tryParse(url);
    var response = await http.get(uri!);
    if (response.statusCode == 200) {
      var rutar = jsonDecode(response.body)["features"][0]["properties"]
          ["display_name"];
      String adrress = rutar.toString();
      return adrress;
    } else {
      return "null";
    }
  }
}
