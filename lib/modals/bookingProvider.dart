import 'package:flutter/foundation.dart';

class BookingProvider extends ChangeNotifier {

  String _date = "";
  String _time = "";
  String _service = "";
  String _barber = "";

  String get date => _date;
  set date(String newDate) {
    _date = newDate;
    notifyListeners();
  }

  String get time => _time;
  set time(String newTime) {
    _time = newTime;
    notifyListeners();
  }

  String get service => _service;
  set service(String newService) {
    _service = newService;
    notifyListeners();
  }

  String get barber => _barber;
  set barber(String newBarber) {
    _barber = newBarber;
    notifyListeners();
  }

  void clear() {
    _date = '';
    _time = '';
    _service = '';
    _barber = '';
    notifyListeners();
  }
}