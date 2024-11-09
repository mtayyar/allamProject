import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _photoURL = '';
  String get photoURL => _photoURL;
  set photoURL(String value) {
    _photoURL = value;
  }

  String _objPhoto = 'المجسم';
  String get objPhoto => _objPhoto;
  set objPhoto(String value) {
    _objPhoto = value;
  }

  String _ArabicWord = 'المجسم';
  String get ArabicWord => _ArabicWord;
  set ArabicWord(String value) {
    _ArabicWord = value;
  }

  String _EnglishWord = '';
  String get EnglishWord => _EnglishWord;
  set EnglishWord(String value) {
    _EnglishWord = value;
  }

  String _ArabicWordAudio = '';
  String get ArabicWordAudio => _ArabicWordAudio;
  set ArabicWordAudio(String value) {
    _ArabicWordAudio = value;
  }

  String _ArabicWordExampleAudio = '';
  String get ArabicWordExampleAudio => _ArabicWordExampleAudio;
  set ArabicWordExampleAudio(String value) {
    _ArabicWordExampleAudio = value;
  }

  String _ArabicWordExample = 'شرح المجسم';
  String get ArabicWordExample => _ArabicWordExample;
  set ArabicWordExample(String value) {
    _ArabicWordExample = value;
  }
}
