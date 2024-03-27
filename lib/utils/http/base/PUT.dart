import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../ErrorResponse/ErrorResponse.dart';
import '../HttpAPI.dart';

class PUT {
  static Future<HttpResponse?> execute(baseUrl, urlPath, jsonIn, authHeaders, stopWatch) async {
    final uri = Uri.https(baseUrl, urlPath);

    debugPrint("\n  //--- HTTP API ---\\\\");
    debugPrint("\n  --- Request ---  \n   GET (Auth)\n   URL -\n      ${uri.toString()}\n   Headers -\n");
    authHeaders.forEach((key, value) {
      debugPrint("      $key = $value\n ");
    });
    debugPrint("     Json In -\n");
    debugPrint("${jsonIn}\n");

    debugPrint(" --- END ---  \n");
    debugPrint("   Sending Request...");

    stopWatch.start();
    try {
      http.Response response = await http.put(uri, headers: authHeaders, body: jsonIn);
      stopWatch.stop();
      HttpAPI.lastTransactionTime = stopWatch.elapsedMilliseconds;
      debugPrint("   Response Received (${HttpAPI.lastTransactionTime}ms)\n");

      int statusCode = response.statusCode;
      String responseBody = response.body;
      debugPrint("  Body Received - ${responseBody}\n");

      if (statusCode != 200) {
        try {
          if (statusCode == 666) {
            return null;
          }
          debugPrint("   HttpAPI ERROR - \n      HTTP Request Failed with Result $statusCode\n${responseBody}");
          var responseDecoded = ErrorResponse.fromJson(jsonDecode(responseBody));

          return HttpResponse(statusCode: statusCode, body: responseBody, errorResponse: responseDecoded);
        } catch (e) {
          return HttpResponse(statusCode: statusCode, body: responseBody);
        }
      }

      try {
        return HttpResponse(statusCode: statusCode, body: responseBody);
      } catch (e) {
        //No json body returned
        return null;
      }
    } catch (e) {
      debugPrint("   HttpAPI ERROR -\n      ${e.toString()}");
      return null;
    }
  }
}
