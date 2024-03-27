import 'package:json_annotation/json_annotation.dart';
part 'UpdateCleaningStatusReq.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateCleaningStatusReq {
  @JsonKey(name: 'RoomId')
  int? roomId;
  @JsonKey(name: 'CleaningStatus')
  bool? cleaningStatus;

  UpdateCleaningStatusReq(this.roomId, this.cleaningStatus);

  static List<UpdateCleaningStatusReq> fromArray(List<dynamic> list) {
    List<UpdateCleaningStatusReq> result = [];
    for (var item in list) {
      result.add(UpdateCleaningStatusReq.fromJson(item));
    }
    return result;
  }

  factory UpdateCleaningStatusReq.fromJson(Map<String, dynamic> json) => _$UpdateCleaningStatusReqFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCleaningStatusReqToJson(this);
}
