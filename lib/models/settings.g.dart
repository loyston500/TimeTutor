// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrentSettingsCollection on Isar {
  IsarCollection<CurrentSettings> get currentSettings => this.collection();
}

const CurrentSettingsSchema = CollectionSchema(
  name: r'CurrentSettings',
  id: 2579812674284097861,
  properties: {
    r'chatgptApiToken': PropertySchema(
      id: 0,
      name: r'chatgptApiToken',
      type: IsarType.string,
    ),
    r'chatgptString': PropertySchema(
      id: 1,
      name: r'chatgptString',
      type: IsarType.string,
    ),
    r'customThemeId': PropertySchema(
      id: 2,
      name: r'customThemeId',
      type: IsarType.string,
    ),
    r'darkMode': PropertySchema(
      id: 3,
      name: r'darkMode',
      type: IsarType.bool,
    ),
    r'displayPrevPeriod': PropertySchema(
      id: 4,
      name: r'displayPrevPeriod',
      type: IsarType.bool,
    ),
    r'enablePeriodNameShadow': PropertySchema(
      id: 5,
      name: r'enablePeriodNameShadow',
      type: IsarType.bool,
    ),
    r'mainBarGradient': PropertySchema(
      id: 6,
      name: r'mainBarGradient',
      type: IsarType.bool,
    ),
    r'themeColor': PropertySchema(
      id: 7,
      name: r'themeColor',
      type: IsarType.long,
    ),
    r'timetableAutoPlayInterval': PropertySchema(
      id: 8,
      name: r'timetableAutoPlayInterval',
      type: IsarType.long,
    ),
    r'timetableAutoPlayPeriodsAnimation': PropertySchema(
      id: 9,
      name: r'timetableAutoPlayPeriodsAnimation',
      type: IsarType.bool,
    ),
    r'timetableEnableInfiniteScroll': PropertySchema(
      id: 10,
      name: r'timetableEnableInfiniteScroll',
      type: IsarType.bool,
    )
  },
  estimateSize: _currentSettingsEstimateSize,
  serialize: _currentSettingsSerialize,
  deserialize: _currentSettingsDeserialize,
  deserializeProp: _currentSettingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _currentSettingsGetId,
  getLinks: _currentSettingsGetLinks,
  attach: _currentSettingsAttach,
  version: '3.1.0+1',
);

int _currentSettingsEstimateSize(
  CurrentSettings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.chatgptApiToken.length * 3;
  bytesCount += 3 + object.chatgptString.length * 3;
  bytesCount += 3 + object.customThemeId.length * 3;
  return bytesCount;
}

void _currentSettingsSerialize(
  CurrentSettings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.chatgptApiToken);
  writer.writeString(offsets[1], object.chatgptString);
  writer.writeString(offsets[2], object.customThemeId);
  writer.writeBool(offsets[3], object.darkMode);
  writer.writeBool(offsets[4], object.displayPrevPeriod);
  writer.writeBool(offsets[5], object.enablePeriodNameShadow);
  writer.writeBool(offsets[6], object.mainBarGradient);
  writer.writeLong(offsets[7], object.themeColor);
  writer.writeLong(offsets[8], object.timetableAutoPlayInterval);
  writer.writeBool(offsets[9], object.timetableAutoPlayPeriodsAnimation);
  writer.writeBool(offsets[10], object.timetableEnableInfiniteScroll);
}

CurrentSettings _currentSettingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrentSettings();
  object.chatgptApiToken = reader.readString(offsets[0]);
  object.chatgptString = reader.readString(offsets[1]);
  object.customThemeId = reader.readString(offsets[2]);
  object.darkMode = reader.readBool(offsets[3]);
  object.displayPrevPeriod = reader.readBool(offsets[4]);
  object.enablePeriodNameShadow = reader.readBool(offsets[5]);
  object.id = id;
  object.mainBarGradient = reader.readBool(offsets[6]);
  object.themeColor = reader.readLong(offsets[7]);
  object.timetableAutoPlayInterval = reader.readLong(offsets[8]);
  object.timetableAutoPlayPeriodsAnimation = reader.readBool(offsets[9]);
  object.timetableEnableInfiniteScroll = reader.readBool(offsets[10]);
  return object;
}

P _currentSettingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currentSettingsGetId(CurrentSettings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currentSettingsGetLinks(CurrentSettings object) {
  return [];
}

void _currentSettingsAttach(
    IsarCollection<dynamic> col, Id id, CurrentSettings object) {
  object.id = id;
}

extension CurrentSettingsQueryWhereSort
    on QueryBuilder<CurrentSettings, CurrentSettings, QWhere> {
  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrentSettingsQueryWhere
    on QueryBuilder<CurrentSettings, CurrentSettings, QWhereClause> {
  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterWhereClause> idBetween(
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

extension CurrentSettingsQueryFilter
    on QueryBuilder<CurrentSettings, CurrentSettings, QFilterCondition> {
  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatgptApiToken',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chatgptApiToken',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chatgptApiToken',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatgptApiToken',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptApiTokenIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chatgptApiToken',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'chatgptString',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'chatgptString',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'chatgptString',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'chatgptString',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      chatgptStringIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'chatgptString',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customThemeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customThemeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customThemeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      customThemeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customThemeId',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      darkModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      displayPrevPeriodEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'displayPrevPeriod',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      enablePeriodNameShadowEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enablePeriodNameShadow',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
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

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      mainBarGradientEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mainBarGradient',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      themeColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      themeColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      themeColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeColor',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      themeColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableAutoPlayIntervalEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timetableAutoPlayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableAutoPlayIntervalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timetableAutoPlayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableAutoPlayIntervalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timetableAutoPlayInterval',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableAutoPlayIntervalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timetableAutoPlayInterval',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableAutoPlayPeriodsAnimationEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timetableAutoPlayPeriodsAnimation',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterFilterCondition>
      timetableEnableInfiniteScrollEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timetableEnableInfiniteScroll',
        value: value,
      ));
    });
  }
}

extension CurrentSettingsQueryObject
    on QueryBuilder<CurrentSettings, CurrentSettings, QFilterCondition> {}

extension CurrentSettingsQueryLinks
    on QueryBuilder<CurrentSettings, CurrentSettings, QFilterCondition> {}

extension CurrentSettingsQuerySortBy
    on QueryBuilder<CurrentSettings, CurrentSettings, QSortBy> {
  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByChatgptApiToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptApiToken', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByChatgptApiTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptApiToken', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByChatgptString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptString', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByChatgptStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptString', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByCustomThemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customThemeId', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByCustomThemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customThemeId', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByDisplayPrevPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrevPeriod', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByDisplayPrevPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrevPeriod', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByEnablePeriodNameShadow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePeriodNameShadow', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByEnablePeriodNameShadowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePeriodNameShadow', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByMainBarGradient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainBarGradient', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByMainBarGradientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainBarGradient', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableAutoPlayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayInterval', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableAutoPlayIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayInterval', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableAutoPlayPeriodsAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayPeriodsAnimation', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableAutoPlayPeriodsAnimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayPeriodsAnimation', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableEnableInfiniteScroll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableEnableInfiniteScroll', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      sortByTimetableEnableInfiniteScrollDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableEnableInfiniteScroll', Sort.desc);
    });
  }
}

extension CurrentSettingsQuerySortThenBy
    on QueryBuilder<CurrentSettings, CurrentSettings, QSortThenBy> {
  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByChatgptApiToken() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptApiToken', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByChatgptApiTokenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptApiToken', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByChatgptString() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptString', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByChatgptStringDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'chatgptString', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByCustomThemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customThemeId', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByCustomThemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customThemeId', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByDisplayPrevPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrevPeriod', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByDisplayPrevPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'displayPrevPeriod', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByEnablePeriodNameShadow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePeriodNameShadow', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByEnablePeriodNameShadowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enablePeriodNameShadow', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByMainBarGradient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainBarGradient', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByMainBarGradientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mainBarGradient', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByThemeColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeColor', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableAutoPlayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayInterval', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableAutoPlayIntervalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayInterval', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableAutoPlayPeriodsAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayPeriodsAnimation', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableAutoPlayPeriodsAnimationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableAutoPlayPeriodsAnimation', Sort.desc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableEnableInfiniteScroll() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableEnableInfiniteScroll', Sort.asc);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QAfterSortBy>
      thenByTimetableEnableInfiniteScrollDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timetableEnableInfiniteScroll', Sort.desc);
    });
  }
}

extension CurrentSettingsQueryWhereDistinct
    on QueryBuilder<CurrentSettings, CurrentSettings, QDistinct> {
  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByChatgptApiToken({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatgptApiToken',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByChatgptString({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'chatgptString',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByCustomThemeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customThemeId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByDisplayPrevPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'displayPrevPeriod');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByEnablePeriodNameShadow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enablePeriodNameShadow');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByMainBarGradient() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mainBarGradient');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByThemeColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeColor');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByTimetableAutoPlayInterval() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timetableAutoPlayInterval');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByTimetableAutoPlayPeriodsAnimation() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timetableAutoPlayPeriodsAnimation');
    });
  }

  QueryBuilder<CurrentSettings, CurrentSettings, QDistinct>
      distinctByTimetableEnableInfiniteScroll() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timetableEnableInfiniteScroll');
    });
  }
}

extension CurrentSettingsQueryProperty
    on QueryBuilder<CurrentSettings, CurrentSettings, QQueryProperty> {
  QueryBuilder<CurrentSettings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrentSettings, String, QQueryOperations>
      chatgptApiTokenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatgptApiToken');
    });
  }

  QueryBuilder<CurrentSettings, String, QQueryOperations>
      chatgptStringProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'chatgptString');
    });
  }

  QueryBuilder<CurrentSettings, String, QQueryOperations>
      customThemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customThemeId');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations>
      displayPrevPeriodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'displayPrevPeriod');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations>
      enablePeriodNameShadowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enablePeriodNameShadow');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations>
      mainBarGradientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mainBarGradient');
    });
  }

  QueryBuilder<CurrentSettings, int, QQueryOperations> themeColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeColor');
    });
  }

  QueryBuilder<CurrentSettings, int, QQueryOperations>
      timetableAutoPlayIntervalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timetableAutoPlayInterval');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations>
      timetableAutoPlayPeriodsAnimationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timetableAutoPlayPeriodsAnimation');
    });
  }

  QueryBuilder<CurrentSettings, bool, QQueryOperations>
      timetableEnableInfiniteScrollProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timetableEnableInfiniteScroll');
    });
  }
}
