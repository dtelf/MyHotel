// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateMaintenanceStatusReq.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMaintenanceStatusReq _$UpdateMaintenanceStatusReqFromJson(
        Map<String, dynamic> json) =>
    UpdateMaintenanceStatusReq(
      json['RoomId'] as int?,
      json['MaintenanceStatus'] as int?,
    );

Map<String, dynamic> _$UpdateMaintenanceStatusReqToJson(
    UpdateMaintenanceStatusReq instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoomId', instance.roomId);
  writeNotNull('MaintenanceStatus', instance.maintenanceStatus);
  return val;
}
