import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _zenquote = prefs.getString('ff_zenquote') ?? _zenquote;
    });
    _safeInit(() {
      _zenauthor = prefs.getString('ff_zenauthor') ?? _zenauthor;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _zenquote = '';
  String get zenquote => _zenquote;
  set zenquote(String value) {
    _zenquote = value;
    prefs.setString('ff_zenquote', value);
  }

  String _zenauthor = '';
  String get zenauthor => _zenauthor;
  set zenauthor(String value) {
    _zenauthor = value;
    prefs.setString('ff_zenauthor', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
