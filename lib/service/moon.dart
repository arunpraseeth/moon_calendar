import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moon_calendar/json_serialization.dart';

class MoonPhaseService with ChangeNotifier {
  late List<MoonPhaseSerialization> _serialization;
  Future<List<MoonPhaseSerialization>> moonService() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            "https://api.farmsense.net/v1/moonphases/?d=${DateTime.now().millisecondsSinceEpoch}"),
      );
      _serialization = moonPhaseFromJson(response.body);
      notifyListeners();
      return _serialization;
    } catch (e) {
      return throw e;
    }
  }

  List<MoonPhaseSerialization> get moonPhaseData => _serialization;
}
