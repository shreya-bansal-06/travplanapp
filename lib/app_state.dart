import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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

  List<LatLng> _coolPlaces = [
    LatLng(27.181143926785428, 78.0215651444656),
    LatLng(28.613037243517837, 77.22950004313722),
    LatLng(28.615593681222155, 77.27718130717284),
    LatLng(28.66163655004342, 77.23925502852462)
  ];
  List<LatLng> get coolPlaces => _coolPlaces;
  set coolPlaces(List<LatLng> value) {
    _coolPlaces = value;
  }

  void addToCoolPlaces(LatLng value) {
    coolPlaces.add(value);
  }

  void removeFromCoolPlaces(LatLng value) {
    coolPlaces.remove(value);
  }

  void removeAtIndexFromCoolPlaces(int index) {
    coolPlaces.removeAt(index);
  }

  void updateCoolPlacesAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    coolPlaces[index] = updateFn(_coolPlaces[index]);
  }

  void insertAtIndexInCoolPlaces(int index, LatLng value) {
    coolPlaces.insert(index, value);
  }
}
