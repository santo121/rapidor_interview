import 'package:hive/hive.dart';

class DbKey {
//!---Private
  final String _token = 'access_token';

//!---Getter
  String get tokenKey => _token;
}

late Box cartProducts; 