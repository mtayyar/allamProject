import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class TakePhotoCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? imageFile,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'TakePhoto',
      apiUrl: 'https://x5pq-kspt-lufp.n7.xano.io/api:ZbJI-l8c/AddingPhoto',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'ImageFile': imageFile,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? photoURL(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.photo_URL.url''',
      ));
}

class WhatIsThisPhotoCall {
  static Future<ApiCallResponse> call({
    String? photoURL = '',
  }) async {
    final ffApiRequestBody = '''
{
  "requests": [
    {
      "features": [
        {
          "type": "OBJECT_LOCALIZATION",
          "maxResults": 10
        }
      ],
      "image": {
        "source": {
          "imageUri": "$photoURL"
        }
      }
    }
  ]
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'what is this Photo',
      apiUrl:
          'https://vision.googleapis.com/v1/images:annotate?key=AIzaSyC6SU5oUw2mOIic_79nX3vN7Rvd2jL8GGE',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? photoObjName(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.responses[:].localizedObjectAnnotations[:].name''',
      ));
}

class TranslateCall {
  static Future<ApiCallResponse> call({
    String? wordToArabic = '',
  }) async {
    final ffApiRequestBody = '''
{
 "input": "<s> [INST]<<SYS>>\\nyou are going to be asked to translate a word from English to Arabic you only going to reply with the translated word so you are only replaying with one word and if you do not have the translation reply with xxxx\\n<</SYS>>\\n\\n $wordToArabic [/INST]","parameters": {
  "decoding_method": "greedy",
  "max_new_tokens": 900,
  "min_new_tokens": 0,
  "stop_sequences": [],
  "repetition_penalty": 1
 },
 "model_id": "sdaia/allam-1-13b-instruct",
 "project_id": "186becbd-5e01-40e3-bad9-e90964801ed4"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'translate',
      apiUrl:
          'https://eu-de.ml.cloud.ibm.com/ml/v1/text/generation?version=2023-05-29',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJraWQiOiIyMDI0MTEwMTA4NDIiLCJhbGciOiJSUzI1NiJ9.eyJpYW1faWQiOiJJQk1pZC02OTcwMDBKQTVCIiwiaWQiOiJJQk1pZC02OTcwMDBKQTVCIiwicmVhbG1pZCI6IklCTWlkIiwianRpIjoiMmQyMzhkNWYtNDVjNC00YzcwLThiNTUtZjY4NGNmOTgxZTJmIiwiaWRlbnRpZmllciI6IjY5NzAwMEpBNUIiLCJnaXZlbl9uYW1lIjoiTW9oYW1tZWQiLCJmYW1pbHlfbmFtZSI6IlRheXlhciIsIm5hbWUiOiJNb2hhbW1lZCBUYXl5YXIiLCJlbWFpbCI6Im10YXl5YXJAbGl2ZS5jb20iLCJzdWIiOiJtdGF5eWFyQGxpdmUuY29tIiwiYXV0aG4iOnsic3ViIjoibXRheXlhckBsaXZlLmNvbSIsImlhbV9pZCI6IklCTWlkLTY5NzAwMEpBNUIiLCJuYW1lIjoiTW9oYW1tZWQgVGF5eWFyIiwiZ2l2ZW5fbmFtZSI6Ik1vaGFtbWVkIiwiZmFtaWx5X25hbWUiOiJUYXl5YXIiLCJlbWFpbCI6Im10YXl5YXJAbGl2ZS5jb20ifSwiYWNjb3VudCI6eyJ2YWxpZCI6dHJ1ZSwiYnNzIjoiYTJkOWQ0ZmJkODcyNDliMDlhYzI5MTM5M2E2ZjU3MzQiLCJpbXNfdXNlcl9pZCI6IjEyNjc3NTAxIiwiZnJvemVuIjp0cnVlLCJpbXMiOiIyNzQ2ODE4In0sImlhdCI6MTczMTEzODg1MiwiZXhwIjoxNzMxMTQyNDUyLCJpc3MiOiJodHRwczovL2lhbS5jbG91ZC5pYm0uY29tL2lkZW50aXR5IiwiZ3JhbnRfdHlwZSI6InVybjppYm06cGFyYW1zOm9hdXRoOmdyYW50LXR5cGU6YXBpa2V5Iiwic2NvcGUiOiJpYm0gb3BlbmlkIiwiY2xpZW50X2lkIjoiZGVmYXVsdCIsImFjciI6MSwiYW1yIjpbInB3ZCJdfQ.E7wUsUhRXeaSv4OMqMUe50pFOsEwhl-_SWKtZwPCaxaAi5kKrdJSIZvCu2RucEiZnfgfTN1ZPHOFSQyqdB4tTj1srHyY-rJA8GxHAk42MosCpc2a22wfIWTMefGL6tcU1AkwAk0dX5Zq7pT6rfIRlw8q9iC-C_jdZGUjxCXUpCzWCghFoJAzevZN062kH56FFDdD9edhRzyyGFD1uci_ef0nzCCnqzDP24nSDc5uk9SCXAvfFQhWHp4T3o2xH4APlyt5A-jMpIpePj_6Bh26fMFKwXJnqV_sYEVoEiKrvAecsL0GC8MLbB6f_rHn2kQ_3gFY0AtiDta2T-_BwAAXQg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? arabicWord(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].generated_text''',
      ));
}

class GetExampleWordCall {
  static Future<ApiCallResponse> call({
    String? arabicWord = '',
  }) async {
    final ffApiRequestBody = '''
{
 "input": "<s> [INST]<<SYS>>\\nyou will be given a word in Arabic you have to tell me what is the first letter in that word \\nthen put that word in an example \\ndo not explain the word \\nonly strictly reply in Arabic\\nkeep in mind you are explaing for a 6 years old kid \\n\\n\\n<</SYS>>\\n\\n $arabicWord [/INST] ",
 "parameters": {
  "decoding_method": "greedy",
  "max_new_tokens": 900,
  "min_new_tokens": 0,
  "stop_sequences": [],
  "repetition_penalty": 1
 },
 "model_id": "sdaia/allam-1-13b-instruct",
 "project_id": "186becbd-5e01-40e3-bad9-e90964801ed4"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetExampleWord',
      apiUrl:
          'https://eu-de.ml.cloud.ibm.com/ml/v1/text/generation?version=2023-05-29',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJraWQiOiIyMDI0MTEwMTA4NDIiLCJhbGciOiJSUzI1NiJ9.eyJpYW1faWQiOiJJQk1pZC02OTcwMDBKQTVCIiwiaWQiOiJJQk1pZC02OTcwMDBKQTVCIiwicmVhbG1pZCI6IklCTWlkIiwianRpIjoiMmQyMzhkNWYtNDVjNC00YzcwLThiNTUtZjY4NGNmOTgxZTJmIiwiaWRlbnRpZmllciI6IjY5NzAwMEpBNUIiLCJnaXZlbl9uYW1lIjoiTW9oYW1tZWQiLCJmYW1pbHlfbmFtZSI6IlRheXlhciIsIm5hbWUiOiJNb2hhbW1lZCBUYXl5YXIiLCJlbWFpbCI6Im10YXl5YXJAbGl2ZS5jb20iLCJzdWIiOiJtdGF5eWFyQGxpdmUuY29tIiwiYXV0aG4iOnsic3ViIjoibXRheXlhckBsaXZlLmNvbSIsImlhbV9pZCI6IklCTWlkLTY5NzAwMEpBNUIiLCJuYW1lIjoiTW9oYW1tZWQgVGF5eWFyIiwiZ2l2ZW5fbmFtZSI6Ik1vaGFtbWVkIiwiZmFtaWx5X25hbWUiOiJUYXl5YXIiLCJlbWFpbCI6Im10YXl5YXJAbGl2ZS5jb20ifSwiYWNjb3VudCI6eyJ2YWxpZCI6dHJ1ZSwiYnNzIjoiYTJkOWQ0ZmJkODcyNDliMDlhYzI5MTM5M2E2ZjU3MzQiLCJpbXNfdXNlcl9pZCI6IjEyNjc3NTAxIiwiZnJvemVuIjp0cnVlLCJpbXMiOiIyNzQ2ODE4In0sImlhdCI6MTczMTEzODg1MiwiZXhwIjoxNzMxMTQyNDUyLCJpc3MiOiJodHRwczovL2lhbS5jbG91ZC5pYm0uY29tL2lkZW50aXR5IiwiZ3JhbnRfdHlwZSI6InVybjppYm06cGFyYW1zOm9hdXRoOmdyYW50LXR5cGU6YXBpa2V5Iiwic2NvcGUiOiJpYm0gb3BlbmlkIiwiY2xpZW50X2lkIjoiZGVmYXVsdCIsImFjciI6MSwiYW1yIjpbInB3ZCJdfQ.E7wUsUhRXeaSv4OMqMUe50pFOsEwhl-_SWKtZwPCaxaAi5kKrdJSIZvCu2RucEiZnfgfTN1ZPHOFSQyqdB4tTj1srHyY-rJA8GxHAk42MosCpc2a22wfIWTMefGL6tcU1AkwAk0dX5Zq7pT6rfIRlw8q9iC-C_jdZGUjxCXUpCzWCghFoJAzevZN062kH56FFDdD9edhRzyyGFD1uci_ef0nzCCnqzDP24nSDc5uk9SCXAvfFQhWHp4T3o2xH4APlyt5A-jMpIpePj_6Bh26fMFKwXJnqV_sYEVoEiKrvAecsL0GC8MLbB6f_rHn2kQ_3gFY0AtiDta2T-_BwAAXQg',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? arabicWordExample(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.results[:].generated_text''',
      ));
}

class TextToSpeechCall {
  static Future<ApiCallResponse> call({
    String? textToTalk = '',
  }) async {
    final ffApiRequestBody = '''
{
  "text": "$textToTalk",
  "voice_settings": {
    "stability": 0.5,
    "similarity_boost": 0.75
  },
  "model_id": "eleven_multilingual_v2"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Text To Speech',
      apiUrl:
          'https://api.elevenlabs.io/v1/text-to-speech/jBpfuIE2acCO8z3wKNLl',
      callType: ApiCallType.POST,
      headers: {
        'xi-api-key': 'sk_e7001403829f2de0722ecb6f1031b57d30fef2e5ef2eb98a',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
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
