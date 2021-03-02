import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation {
  final double lat;
  final double lng;
  final String address;

  PlaceLocation({
    @required this.lat,
    @required this.lng,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;

  Place({
    @required this.id,
    @required this.image,
    @required this.location,
    @required this.title,
  });
}
