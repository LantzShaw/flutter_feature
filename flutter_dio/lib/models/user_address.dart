import 'package:flutter_dio/models/user_address_geo.dart';

class UserAddress {
  final String street;
  final String city;
  final UserAddressGeo geo;

  UserAddress(this.geo, {required this.street, required this.city});
}
