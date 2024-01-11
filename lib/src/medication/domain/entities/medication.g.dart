// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicationImpl _$$MedicationImplFromJson(Map<String, dynamic> json) =>
    _$MedicationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      consumptionPeriod: (json['consumptionPeriod'] as List<dynamic>)
          .map((e) => $enumDecode(_$MedicationConsumptionPeriodEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$MedicationImplToJson(_$MedicationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'consumptionPeriod': instance.consumptionPeriod
          .map((e) => _$MedicationConsumptionPeriodEnumMap[e]!)
          .toList(),
    };

const _$MedicationConsumptionPeriodEnumMap = {
  MedicationConsumptionPeriod.sunrise: 'sunrise',
  MedicationConsumptionPeriod.afternoon: 'afternoon',
  MedicationConsumptionPeriod.evening: 'evening',
};
