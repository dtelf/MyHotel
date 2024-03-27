// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateCleaningStatusResp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCleaningStatusResp _$UpdateCleaningStatusRespFromJson(
        Map<String, dynamic> json) =>
    UpdateCleaningStatusResp(
      json['Success'] as int?,
      json['Message'] as String?,
    );

Map<String, dynamic> _$UpdateCleaningStatusRespToJson(
    UpdateCleaningStatusResp instance) {
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
