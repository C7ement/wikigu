import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dart_geohash/dart_geohash.dart';
import 'package:geolocator/geolocator.dart';

class PageHeader {
  PageHeader({
    required this.pushId,
    required this.title,
    required this.hash,
    required this.date,
    required this.delationDate,
    required this.position,
    required this.icon,
    required this.tags,
  });

  factory PageHeader.mock() {
    const positionMap = {
      'floor': 2146959360,
      'latitude': 37.452728271484375,
      'longitude': -121.90013885498047,
      'accuracy': null,
      'altitude': null,
      'heading': null,
      'speed': null,
      'speed_accuracy': null,
    };
    final position = Position.fromMap(positionMap);
    return PageHeader(
      pushId: 'pushId',
      title: 'Resto',
      date: DateTime.parse('2022-11-02T06:09:30.388694'),
      delationDate: null,
      position: position,
      hash: '9q9m44',
      icon: '🧑🏻‍💻',
      tags: {'maison'},
    );
  }

  factory PageHeader.fromMap(Map<String, dynamic> map) {
    final positionMap = map['position'] as Map<String, dynamic>;
    positionMap['accuracy'] = null;
    positionMap['altitude'] = null;
    positionMap['heading'] = null;
    positionMap['speed'] = null;
    positionMap['speed_accuracy'] = null;
    final position = Position.fromMap(positionMap);
    final hash = map['hash'] as String? ??
        GeoHash.fromDecimalDegrees(
          position.longitude,
          position.latitude,
          precision: 6,
        ).geohash;
    return PageHeader(
      pushId: map['pushId'] as String,
      title: map['title'] as String? ?? 'Donut score board',
      date: DateTime.parse(map['date'] as String),
      delationDate: map['delationDate'] == null
          ? null
          : DateTime.parse(map['date'] as String),
      position: position,
      hash: hash,
      icon: map['icon'] as String?,
      tags: {
        for (var tag in map['tags'] as List<dynamic>? ?? []) tag as String
      },
    );
  }

  final String pushId;
  final String hash;
  final String title;
  final DateTime date;
  final DateTime? delationDate;
  final Position position;
  final String? icon;
  final Set<String>? tags;
}
