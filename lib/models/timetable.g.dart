// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserTimetableCollection on Isar {
  IsarCollection<UserTimetable> get userTimetables => this.collection();
}

const UserTimetableSchema = CollectionSchema(
  name: r'UserTimetable',
  id: -8350924043708187524,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'friday': PropertySchema(
      id: 1,
      name: r'friday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'monday': PropertySchema(
      id: 2,
      name: r'monday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'saturday': PropertySchema(
      id: 4,
      name: r'saturday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'sunday': PropertySchema(
      id: 5,
      name: r'sunday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'thursday': PropertySchema(
      id: 6,
      name: r'thursday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'tuesday': PropertySchema(
      id: 7,
      name: r'tuesday',
      type: IsarType.objectList,
      target: r'Period',
    ),
    r'version': PropertySchema(
      id: 8,
      name: r'version',
      type: IsarType.long,
    ),
    r'wednesday': PropertySchema(
      id: 9,
      name: r'wednesday',
      type: IsarType.objectList,
      target: r'Period',
    )
  },
  estimateSize: _userTimetableEstimateSize,
  serialize: _userTimetableSerialize,
  deserialize: _userTimetableDeserialize,
  deserializeProp: _userTimetableDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Period': PeriodSchema,
    r'Subject': SubjectSchema,
    r'Timing': TimingSchema
  },
  getId: _userTimetableGetId,
  getLinks: _userTimetableGetLinks,
  attach: _userTimetableAttach,
  version: '3.1.0+1',
);

int _userTimetableEstimateSize(
  UserTimetable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.friday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.friday.length; i++) {
      final value = object.friday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.monday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.monday.length; i++) {
      final value = object.monday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.saturday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.saturday.length; i++) {
      final value = object.saturday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.sunday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.sunday.length; i++) {
      final value = object.sunday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.thursday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.thursday.length; i++) {
      final value = object.thursday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.tuesday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.tuesday.length; i++) {
      final value = object.tuesday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.wednesday.length * 3;
  {
    final offsets = allOffsets[Period]!;
    for (var i = 0; i < object.wednesday.length; i++) {
      final value = object.wednesday[i];
      bytesCount += PeriodSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _userTimetableSerialize(
  UserTimetable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeObjectList<Period>(
    offsets[1],
    allOffsets,
    PeriodSchema.serialize,
    object.friday,
  );
  writer.writeObjectList<Period>(
    offsets[2],
    allOffsets,
    PeriodSchema.serialize,
    object.monday,
  );
  writer.writeString(offsets[3], object.name);
  writer.writeObjectList<Period>(
    offsets[4],
    allOffsets,
    PeriodSchema.serialize,
    object.saturday,
  );
  writer.writeObjectList<Period>(
    offsets[5],
    allOffsets,
    PeriodSchema.serialize,
    object.sunday,
  );
  writer.writeObjectList<Period>(
    offsets[6],
    allOffsets,
    PeriodSchema.serialize,
    object.thursday,
  );
  writer.writeObjectList<Period>(
    offsets[7],
    allOffsets,
    PeriodSchema.serialize,
    object.tuesday,
  );
  writer.writeLong(offsets[8], object.version);
  writer.writeObjectList<Period>(
    offsets[9],
    allOffsets,
    PeriodSchema.serialize,
    object.wednesday,
  );
}

UserTimetable _userTimetableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserTimetable(
    description: reader.readStringOrNull(offsets[0]),
    friday: reader.readObjectList<Period>(
          offsets[1],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    monday: reader.readObjectList<Period>(
          offsets[2],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    name: reader.readStringOrNull(offsets[3]),
    saturday: reader.readObjectList<Period>(
          offsets[4],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    sunday: reader.readObjectList<Period>(
          offsets[5],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    thursday: reader.readObjectList<Period>(
          offsets[6],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    tuesday: reader.readObjectList<Period>(
          offsets[7],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
    version: reader.readLong(offsets[8]),
    wednesday: reader.readObjectList<Period>(
          offsets[9],
          PeriodSchema.deserialize,
          allOffsets,
          Period(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _userTimetableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 2:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 5:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 6:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 7:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readObjectList<Period>(
            offset,
            PeriodSchema.deserialize,
            allOffsets,
            Period(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userTimetableGetId(UserTimetable object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userTimetableGetLinks(UserTimetable object) {
  return [];
}

void _userTimetableAttach(
    IsarCollection<dynamic> col, Id id, UserTimetable object) {
  object.id = id;
}

extension UserTimetableQueryWhereSort
    on QueryBuilder<UserTimetable, UserTimetable, QWhere> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserTimetableQueryWhere
    on QueryBuilder<UserTimetable, UserTimetable, QWhereClause> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserTimetableQueryFilter
    on QueryBuilder<UserTimetable, UserTimetable, QFilterCondition> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'friday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'monday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'saturday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sunday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'thursday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tuesday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      versionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      versionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      versionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'version',
        value: value,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      versionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'version',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'wednesday',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension UserTimetableQueryObject
    on QueryBuilder<UserTimetable, UserTimetable, QFilterCondition> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      fridayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'friday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      mondayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'monday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      saturdayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'saturday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      sundayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sunday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      thursdayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'thursday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      tuesdayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'tuesday');
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterFilterCondition>
      wednesdayElement(FilterQuery<Period> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'wednesday');
    });
  }
}

extension UserTimetableQueryLinks
    on QueryBuilder<UserTimetable, UserTimetable, QFilterCondition> {}

extension UserTimetableQuerySortBy
    on QueryBuilder<UserTimetable, UserTimetable, QSortBy> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy>
      sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> sortByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> sortByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension UserTimetableQuerySortThenBy
    on QueryBuilder<UserTimetable, UserTimetable, QSortThenBy> {
  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy>
      thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.asc);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QAfterSortBy> thenByVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'version', Sort.desc);
    });
  }
}

extension UserTimetableQueryWhereDistinct
    on QueryBuilder<UserTimetable, UserTimetable, QDistinct> {
  QueryBuilder<UserTimetable, UserTimetable, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserTimetable, UserTimetable, QDistinct> distinctByVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'version');
    });
  }
}

extension UserTimetableQueryProperty
    on QueryBuilder<UserTimetable, UserTimetable, QQueryProperty> {
  QueryBuilder<UserTimetable, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserTimetable, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations> fridayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'friday');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations> mondayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monday');
    });
  }

  QueryBuilder<UserTimetable, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations>
      saturdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'saturday');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations> sundayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sunday');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations>
      thursdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thursday');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations>
      tuesdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tuesday');
    });
  }

  QueryBuilder<UserTimetable, int, QQueryOperations> versionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'version');
    });
  }

  QueryBuilder<UserTimetable, List<Period>, QQueryOperations>
      wednesdayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wednesday');
    });
  }
}
