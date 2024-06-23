import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PHPOpenAICall {
  static Future<ApiCallResponse> call({
    String? locationVar = '',
    String? startDateVar = '',
    String? endDateVar = '',
    String? totalBudgetVar = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PHPOpenAI',
      apiUrl: 'https://proficientsolutions.tech/aichatrequest.php',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'Location': locationVar,
        'StartDate': startDateVar,
        'EndDate': endDateVar,
        'TotalBudget': totalBudgetVar,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List? itineraryData(dynamic response) => getJsonField(
        response,
        r'''$.Itinerary''',
        true,
      ) as List?;
  static dynamic? budgetBreakout(dynamic response) => getJsonField(
        response,
        r'''$.Budget''',
      );
  static dynamic activitiesData(dynamic response) => getJsonField(
        response,
        r'''$.Itinerary.activities''',
      );
  static List? diningData(dynamic response) => getJsonField(
        response,
        r'''$.Itinerary.dining_options''',
        true,
      ) as List?;
  static List? accomodationData(dynamic response) => getJsonField(
        response,
        r'''$.Itinerary.accommodation''',
        true,
      ) as List?;
}

class UnsplashImageAPICall {
  static Future<ApiCallResponse> call({
    String? query = '-',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UnsplashImageAPI',
      apiUrl:
          'https://api.unsplash.com/search/photos?page=1&client_id=d3jGgUPbFt5eYR2niJRct1-Wi3tLnfwZc6uqnuQv9Tw',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': query,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageURL(dynamic response) => (getJsonField(
        response,
        r'''$.results[0].urls.thumb''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
