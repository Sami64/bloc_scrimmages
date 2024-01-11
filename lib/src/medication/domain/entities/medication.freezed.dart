// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'medication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Medication _$MedicationFromJson(Map<String, dynamic> json) {
  return _Medication.fromJson(json);
}

/// @nodoc
mixin _$Medication {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get dosage => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  List<MedicationConsumptionPeriod> get consumptionPeriod =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MedicationCopyWith<Medication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MedicationCopyWith<$Res> {
  factory $MedicationCopyWith(
          Medication value, $Res Function(Medication) then) =
      _$MedicationCopyWithImpl<$Res, Medication>;
  @useResult
  $Res call(
      {String id,
      String name,
      String dosage,
      String frequency,
      List<MedicationConsumptionPeriod> consumptionPeriod});
}

/// @nodoc
class _$MedicationCopyWithImpl<$Res, $Val extends Medication>
    implements $MedicationCopyWith<$Res> {
  _$MedicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? consumptionPeriod = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      consumptionPeriod: null == consumptionPeriod
          ? _value.consumptionPeriod
          : consumptionPeriod // ignore: cast_nullable_to_non_nullable
              as List<MedicationConsumptionPeriod>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MedicationImplCopyWith<$Res>
    implements $MedicationCopyWith<$Res> {
  factory _$$MedicationImplCopyWith(
          _$MedicationImpl value, $Res Function(_$MedicationImpl) then) =
      __$$MedicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String dosage,
      String frequency,
      List<MedicationConsumptionPeriod> consumptionPeriod});
}

/// @nodoc
class __$$MedicationImplCopyWithImpl<$Res>
    extends _$MedicationCopyWithImpl<$Res, _$MedicationImpl>
    implements _$$MedicationImplCopyWith<$Res> {
  __$$MedicationImplCopyWithImpl(
      _$MedicationImpl _value, $Res Function(_$MedicationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dosage = null,
    Object? frequency = null,
    Object? consumptionPeriod = null,
  }) {
    return _then(_$MedicationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dosage: null == dosage
          ? _value.dosage
          : dosage // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
      consumptionPeriod: null == consumptionPeriod
          ? _value._consumptionPeriod
          : consumptionPeriod // ignore: cast_nullable_to_non_nullable
              as List<MedicationConsumptionPeriod>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MedicationImpl extends _Medication {
  _$MedicationImpl(
      {required this.id,
      required this.name,
      required this.dosage,
      required this.frequency,
      required final List<MedicationConsumptionPeriod> consumptionPeriod})
      : _consumptionPeriod = consumptionPeriod,
        super._();

  factory _$MedicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$MedicationImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String dosage;
  @override
  final String frequency;
  final List<MedicationConsumptionPeriod> _consumptionPeriod;
  @override
  List<MedicationConsumptionPeriod> get consumptionPeriod {
    if (_consumptionPeriod is EqualUnmodifiableListView)
      return _consumptionPeriod;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumptionPeriod);
  }

  @override
  String toString() {
    return 'Medication(id: $id, name: $name, dosage: $dosage, frequency: $frequency, consumptionPeriod: $consumptionPeriod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MedicationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dosage, dosage) || other.dosage == dosage) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            const DeepCollectionEquality()
                .equals(other._consumptionPeriod, _consumptionPeriod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, dosage, frequency,
      const DeepCollectionEquality().hash(_consumptionPeriod));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      __$$MedicationImplCopyWithImpl<_$MedicationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MedicationImplToJson(
      this,
    );
  }
}

abstract class _Medication extends Medication {
  factory _Medication(
          {required final String id,
          required final String name,
          required final String dosage,
          required final String frequency,
          required final List<MedicationConsumptionPeriod> consumptionPeriod}) =
      _$MedicationImpl;
  _Medication._() : super._();

  factory _Medication.fromJson(Map<String, dynamic> json) =
      _$MedicationImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get dosage;
  @override
  String get frequency;
  @override
  List<MedicationConsumptionPeriod> get consumptionPeriod;
  @override
  @JsonKey(ignore: true)
  _$$MedicationImplCopyWith<_$MedicationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
