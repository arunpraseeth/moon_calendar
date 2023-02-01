import 'dart:convert';

WeatherSerialization weatherSerializationFromJson(String str) =>
    WeatherSerialization.fromJson(json.decode(str));

String weatherSerializationToJson(WeatherSerialization data) =>
    json.encode(data.toJson());

class WeatherSerialization {
  WeatherSerialization({
    required this.queryCost,
    required this.latitude,
    required this.longitude,
    required this.resolvedAddress,
    required this.address,
    required this.currentConditions,
  });

  late int queryCost;
  late double latitude;
  late double longitude;
  late String resolvedAddress;
  late String address;
  late CurrentConditions currentConditions;

  factory WeatherSerialization.fromJson(Map<String, dynamic> json) =>
      WeatherSerialization(
        queryCost: json["queryCost"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        resolvedAddress: json["resolvedAddress"],
        address: json["address"],
        currentConditions:
            CurrentConditions.fromJson(json["currentConditions"]),
      );

  Map<String, dynamic> toJson() => {
        "queryCost": queryCost,
        "latitude": latitude,
        "longitude": longitude,
        "resolvedAddress": resolvedAddress,
        "address": address,
        "currentConditions": currentConditions.toJson(),
      };
}

class CurrentConditions {
  CurrentConditions({
    required this.datetime,
    required this.temp,
    required this.feelslike,
    required this.moonphase,
  });

  late String datetime;
  late double temp;
  late double feelslike;
  late double moonphase;

  factory CurrentConditions.fromJson(Map<String, dynamic> json) =>
      CurrentConditions(
        datetime: json["datetime"],
        temp: json["temp"],
        feelslike: json["feelslike"],
        moonphase: json["moonphase"],
      );

  Map<String, dynamic> toJson() => {
        "datetime": datetime,
        "temp": temp,
        "feelslike": feelslike,
        "moonphase": moonphase,
      };
}

enum Conditions { OVERCAST, PARTIALLY_CLOUDY, CLEAR }

final conditionsValues = EnumValues({
  "Clear": Conditions.CLEAR,
  "Overcast": Conditions.OVERCAST,
  "Partially cloudy": Conditions.PARTIALLY_CLOUDY
});

enum Icon {
  CLOUDY,
  PARTLY_CLOUDY_DAY,
  SNOW,
  CLEAR_DAY,
  PARTLY_CLOUDY_NIGHT,
  CLEAR_NIGHT,
  FOG
}

final iconValues = EnumValues({
  "clear-day": Icon.CLEAR_DAY,
  "clear-night": Icon.CLEAR_NIGHT,
  "cloudy": Icon.CLOUDY,
  "fog": Icon.FOG,
  "partly-cloudy-day": Icon.PARTLY_CLOUDY_DAY,
  "partly-cloudy-night": Icon.PARTLY_CLOUDY_NIGHT,
  "snow": Icon.SNOW
});

enum Preciptype { SNOW, RAIN, ICE }

final preciptypeValues = EnumValues(
    {"ice": Preciptype.ICE, "rain": Preciptype.RAIN, "snow": Preciptype.SNOW});

enum Source { OBS, COMB, FCST }

final sourceValues =
    EnumValues({"comb": Source.COMB, "fcst": Source.FCST, "obs": Source.OBS});

enum Id { CWNC, CYPQ, CTPQ, F7368, D5727 }

final idValues = EnumValues({
  "CTPQ": Id.CTPQ,
  "CWNC": Id.CWNC,
  "CYPQ": Id.CYPQ,
  "D5727": Id.D5727,
  "F7368": Id.F7368
});

class Station {
  Station({
    required this.latitude,
    required this.longitude,
    required this.useCount,
    required this.id,
    required this.name,
    required this.quality,
  });

  double latitude;
  double longitude;
  int useCount;
  Id id;
  String name;
  int quality;

  factory Station.fromJson(Map<String, dynamic> json) => Station(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        useCount: json["useCount"],
        id: idValues.map[json["id"]]!,
        name: json["name"],
        quality: json["quality"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "useCount": useCount,
        "id": idValues.reverse[id],
        "name": name,
        "quality": quality,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
