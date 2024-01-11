// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityImpl _$$ActivityImplFromJson(Map<String, dynamic> json) =>
    _$ActivityImpl(
      id: json['id'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$ActivityImplToJson(_$ActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ActivityTypeEnumMap[instance.type]!,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.visit: 'visit',
  ActivityType.medication: 'medication',
  ActivityType.vaccination: 'vaccination',
  ActivityType.lab: 'lab',
  ActivityType.procedure: 'procedure',
  ActivityType.allergy: 'allergy',
  ActivityType.condition: 'condition',
  ActivityType.observation: 'observation',
  ActivityType.immunization: 'immunization',
};
