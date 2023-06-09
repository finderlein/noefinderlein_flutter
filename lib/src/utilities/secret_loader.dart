import 'dart:async' show Future;
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  final String secretPath;

  SecretLoader({required this.secretPath});
  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath, (jsonStr) async {
      final secret = Secret.fromJson(json.decode(jsonStr));
      return secret;
    });
  }
}

class Secret {
  // final String mapAccessToken;
  final String mapUrl;
  final String mapUrlDark;

  Secret({this.mapUrl = "", this.mapUrlDark = ""});
  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return Secret(
        // mapAccessToken: jsonMap["mapAccessToken"],
        mapUrl: jsonMap["mapUrl"],
        mapUrlDark: jsonMap["mapUrlDark"]);
  }
}
