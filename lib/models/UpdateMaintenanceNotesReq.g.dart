// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateMaintenanceNotesReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMaintenanceNotesReq _$UpdateMaintenanceNotesReqFromJson(
        Map<String, dynamic> json) =>
    UpdateMaintenanceNotesReq(
      json['RoomId'] as int?,
      json['MaintenanceNotes'] as String?,
    );

Map<String, dynamic> _$UpdateMaintenanceNotesReqToJson(
    UpdateMaintenanceNotesReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  writeNotNull('MaintenanceNotes', instance.maintenanceNotes);
  return val;
}
