import '../helpers/helpers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'media_content.dart';

part 'white_flag.freezed.dart';
part 'white_flag.g.dart';

@freezed
abstract class WhiteFlag with _$WhiteFlag {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory WhiteFlag({
    String id,
    String address,
    String addressReference,
    String title,
    String description,
    MediaContent mediaContent,
    String uid,
    String senderName,
    String displayName,
    String senderPhotoUrl,
    int reportedCount,
    int helpedDays,
    @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeAsIs)
        DateTime helpedAt,
    @JsonKey(fromJson: geoPointFromFirestore, toJson: positionAsIs)
        LatLng position,
    @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeAsIs)
        DateTime timestamp,
  }) = _WhiteFlag;

  factory WhiteFlag.fromJson(Map<String, dynamic> json) =>
      _$WhiteFlagFromJson(json);
}

GeoPoint positionAsIs(LatLng pos) => GeoPoint(pos.latitude, pos.longitude);

LatLng geoPointFromFirestore(GeoPoint pos) {
  // GeoPoint pos = f.data['position'];
  return LatLng(pos.latitude, pos.longitude);
}
