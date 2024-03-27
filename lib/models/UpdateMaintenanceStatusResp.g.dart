// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateMaintenanceStatusResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMaintenanceStatusResp _$UpdateMaintenanceStatusRespFromJson(
        Map<String, dynamic> json) =>
    UpdateMaintenanceStatusResp(
      json['Success'] as int?,
      json['Message'] as String?,
    );

Map<String, dynamic> _$UpdateMaintenanceStatusRespToJson(
    UpdateMaintenanceStatusResp instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Success', instance.success);
  writeNotNull('Message', instance.message);
  return val;
}
