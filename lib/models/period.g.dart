// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'period.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PeriodSchema = Schema(
  name: r'Period',
  id: 7289986870337649148,
  properties: {
    r'hashCode': PropertySchema(
      id: 0,
      name: r'hashCode',
      type: IsarType.long,
    ),
    r'subject': PropertySchema(
      id: 1,
      name: r'subject',
      type: IsarType.object,
      target: r'Subject',
    ),
    r'timing': PropertySchema(
      id: 2,
      name: r'timing',
      type: IsarType.object,
      target: r'Timing',
    )
  },
  estimateSize: _periodEstimateSize,
  serialize: _periodSerialize,
  deserialize: _periodDeserialize,
  deserializeProp: _periodDeserializeProp,
);

int _periodEstimateSize(
  Period object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      SubjectSchema.estimateSize(
          object.subject, allOffsets[Subject]!, allOffsets);
  bytesCount += 3 +
      TimingSchema.estimateSize(object.timing, allOffsets[Timing]!, allOffsets);
  return bytesCount;
}

void _periodSerialize(
  Period object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.hashCode);
  writer.writeObject<Subject>(
    offsets[1],
    allOffsets,
    SubjectSchema.serialize,
    object.subject,
  );
  writer.writeObject<Timing>(
    offsets[2],
    allOffsets,
    TimingSchema.serialize,
    object.timing,
  );
}

Period _periodDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Period();
  object.subject = reader.readObjectOrNull<Subject>(
        offsets[1],
        SubjectSchema.deserialize,
        allOffsets,
      ) ??
      Subject();
  object.timing = reader.readObjectOrNull<Timing>(
        offsets[2],
        TimingSchema.deserialize,
        allOffsets,
      ) ??
      Timing();
  return object;
}

P _periodDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<Subject>(
            offset,
            SubjectSchema.deserialize,
            allOffsets,
          ) ??
          Subject()) as P;
    case 2:
      return (reader.readObjectOrNull<Timing>(
            offset,
            TimingSchema.deserialize,
            allOffsets,
          ) ??
          Timing()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PeriodQueryFilter on QueryBuilder<Period, Period, QFilterCondition> {
  QueryBuilder<Period, Period, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Period, Period, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Period, Period, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<Period, Period, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PeriodQueryObject on QueryBuilder<Period, Period, QFilterCondition> {
  QueryBuilder<Period, Period, QAfterFilterCondition> subject(
      FilterQuery<Subject> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'subject');
    });
  }

  QueryBuilder<Period, Period, QAfterFilterCondition> timing(
      FilterQuery<Timing> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'timing');
    });
  }
}
