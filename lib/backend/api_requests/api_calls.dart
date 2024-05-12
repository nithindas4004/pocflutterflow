import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BannerCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'banner',
      apiUrl: 'https://free-pigeon-29.hasura.app/api/rest/news',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret':
            'vMGTTKWXLDKIxFmg1pzOUPdStmXiBUIrfT7LGCGsox86B68RRe9a5mhvSpqoSF1L',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? newsList(dynamic response) => getJsonField(
        response,
        r'''$.news''',
        true,
      ) as List?;
}

class MeetingsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'meetings',
      apiUrl: 'https://free-pigeon-29.hasura.app/api/rest/myquery',
      callType: ApiCallType.GET,
      headers: {
        'x-hasura-admin-secret':
            'vMGTTKWXLDKIxFmg1pzOUPdStmXiBUIrfT7LGCGsox86B68RRe9a5mhvSpqoSF1L',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List? meetingList(dynamic response) => getJsonField(
        response,
        r'''$.meetings''',
        true,
      ) as List?;
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meetings[:].name''',
      ));
  static String? startTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meetings[:].start_time''',
      ));
  static String? endaTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.meetings[:].end_time''',
      ));
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
