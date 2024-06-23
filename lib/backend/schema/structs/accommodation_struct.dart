// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccommodationStruct extends BaseStruct {
  AccommodationStruct({
    String? name,
    String? description,
    String? cost,
  })  : _name = name,
        _description = description,
        _cost = cost;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "cost" field.
  String? _cost;
  String get cost => _cost ?? '';
  set cost(String? val) => _cost = val;

  bool hasCost() => _cost != null;

  static AccommodationStruct fromMap(Map<String, dynamic> data) =>
      AccommodationStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
        cost: data['cost'] as String?,
      );

  static AccommodationStruct? maybeFromMap(dynamic data) => data is Map
      ? AccommodationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
        'cost': _cost,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.String,
        ),
      }.withoutNulls;

  static AccommodationStruct fromSerializableMap(Map<String, dynamic> data) =>
      AccommodationStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        cost: deserializeParam(
          data['cost'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AccommodationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AccommodationStruct &&
        name == other.name &&
        description == other.description &&
        cost == other.cost;
  }

  @override
  int get hashCode => const ListEquality().hash([name, description, cost]);
}

AccommodationStruct createAccommodationStruct({
  String? name,
  String? description,
  String? cost,
}) =>
    AccommodationStruct(
      name: name,
      description: description,
      cost: cost,
    );
