//Generated with: https://app.quicktype.io/
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

String ip = 'http://169.234.8.107:5000';

String sensorData = '/recentsensordata';
String controlGrowth = '/usercontrolgrowth';

///Sensor GET///
//Executes the get api
Future<SensorPostGet> getSensorData() async{
  final response = await http.get(ip + sensorData);
  return sensorPostFromJson(response.body);
}

//This function is used to get JSON data from the ZotPonics Server
SensorPostGet sensorPostFromJson(String str) => SensorPostGet.fromJson(json.decode(str));

//This class is used with the get api call and uses a Reading Object
class SensorPostGet {
  List<SensorReading> readings;

  SensorPostGet({ this.readings });

  factory SensorPostGet.fromJson(Map<String, dynamic> json) => SensorPostGet(
      readings: List<SensorReading>.from(json["readings"].map((x) => SensorReading.fromJson(x)))
  );
}

class SensorReading {
  DateTime timestamp;
  double temperature;
  double humidity;
  double baseLevel;
  double plantHeight;
  DateTime lastWateredTimestamp;
  dynamic lightStatus;

  SensorReading({
    this.timestamp,
    this.temperature,
    this.humidity,
    this.baseLevel,
    this.plantHeight,
    this.lastWateredTimestamp,
    this.lightStatus
  });

  factory SensorReading.fromJson(Map<String, dynamic> json) => SensorReading(
      timestamp: DateTime.parse(json["timestamp"]),
      temperature: json["temperature"],
      humidity: json["humidity"],
      baseLevel: json["baseLevel"],
      plantHeight: json["plantHeight"],
      lastWateredTimestamp: DateTime.parse(json["lastWateredTimestamp"]),
      lightStatus: json["lightStatus"]
  );
}


///Control Growth GET and POST///
//Executes the get api
Future<CGPostGet> getControlGrowth() async{
  final response = await http.get(ip + controlGrowth);
  return CGPostFromJson(response.body);
}

//This function is used to get JSON data from the ZotPonics Server
CGPostGet CGPostFromJson(String str) => CGPostGet.fromJson(json.decode(str));

//This class is used with the get api call and uses a Reading Object
class CGPostGet {
  List<CGReading> readings;

  CGPostGet({ this.readings });

  factory CGPostGet.fromJson(Map<String, dynamic> json) => CGPostGet(
      readings: List<CGReading>.from(json["readings"].map((x) => CGReading.fromJson(x)))
  );
}

class CGReading {
  DateTime timestamp;
  double lightStart;
  double lightEnd;
  double humidity;
  double temperature;
  double waterFreq;
  double waterDuration;
  double nutrientRatio;
  double baseLevel;

  CGReading({
    this.timestamp,
    this.lightStart,
    this.lightEnd,
    this.humidity,
    this.temperature,
    this.waterFreq,
    this.waterDuration,
    this.nutrientRatio,
    this.baseLevel
  });

  factory CGReading.fromJson(Map<String, dynamic> json) => CGReading(
      timestamp: DateTime.parse(json["timestamp"]),
      lightStart: json["lightStartTime"],
      lightEnd: json["lightEndTime"],
      humidity: json["humidity"],
      temperature: json["temperature"],
      waterFreq: json["waterFreq"],
      waterDuration: json["waterDuration"],
      nutrientRatio: json["nutrientRatio"],
      baseLevel: json["baseLevel"]
  );
}

//Executes the put api
Future<http.Response> postControlGrowth(PostPut post) async{
  final response = await http.post(
      ip + controlGrowth,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader : ''
      },
      body: postToJson(post)
  );
  return response;
}

//This function is used to post JSON data to the ZotPonics Server
String postToJson(PostPut data) => json.encode(data.toJson());

//This class is used with the put api and used with a Writing Object
class PostPut {
  List<Writing> writings;

  PostPut({ this.writings });

  Map<String, dynamic> toJson() => {
    "controlfactors": List<dynamic>.from(writings.map((x) => x.toJson()))
  };
}

class Writing {
  String timestamp;
  int lightStart;
  int lightEnd;
  double humidity;
  double temp;
  double waterFreq;
  double waterDuration;
  double nutrientRatio;
  double baseLevel;

  Writing({
    this.timestamp,
    this.lightStart,
    this.lightEnd,
    this.humidity,
    this.temp,
    this.waterFreq,
    this.waterDuration,
    this.nutrientRatio,
    this.baseLevel
  });

  Map<String,dynamic> toJson() => {
    "timestamp": timestamp,
    "lightstart": lightStart,
    "lightend": lightEnd,
    "humidity": humidity,
    "temp": temp,
    "waterfreq": waterFreq,
    "waterdur": waterDuration,
    "nutrientratio": nutrientRatio,
    "baselevel": baseLevel
  };
}