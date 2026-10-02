// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'streak_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStreakIsarCollection on Isar {
  IsarCollection<StreakIsar> get streakIsars => this.collection();
}

const StreakIsarSchema = CollectionSchema(
  name: r'StreakIsar',
  id: 1950774003816431419,
  properties: {
    r'currentCount': PropertySchema(
      id: 0,
      name: r'currentCount',
      type: IsarType.long,
    ),
    r'forgivenessUsedThisWeek': PropertySchema(
      id: 1,
      name: r'forgivenessUsedThisWeek',
      type: IsarType.bool,
    ),
    r'lastCheckInDate': PropertySchema(
      id: 2,
      name: r'lastCheckInDate',
      type: IsarType.dateTime,
    ),
    r'longestCount': PropertySchema(
      id: 3,
      name: r'longestCount',
      type: IsarType.long,
    ),
    r'modeIndex': PropertySchema(
      id: 4,
      name: r'modeIndex',
      type: IsarType.long,
    ),
    r'weekStartDate': PropertySchema(
      id: 5,
      name: r'weekStartDate',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _streakIsarEstimateSize,
  serialize: _streakIsarSerialize,
  deserialize: _streakIsarDeserialize,
  deserializeProp: _streakIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _streakIsarGetId,
  getLinks: _streakIsarGetLinks,
  attach: _streakIsarAttach,
  version: '3.1.0+1',
);

int _streakIsarEstimateSize(
  StreakIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _streakIsarSerialize(
  StreakIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentCount);
  writer.writeBool(offsets[1], object.forgivenessUsedThisWeek);
  writer.writeDateTime(offsets[2], object.lastCheckInDate);
  writer.writeLong(offsets[3], object.longestCount);
  writer.writeLong(offsets[4], object.modeIndex);
  writer.writeDateTime(offsets[5], object.weekStartDate);
}

StreakIsar _streakIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StreakIsar();
  object.currentCount = reader.readLong(offsets[0]);
  object.forgivenessUsedThisWeek = reader.readBool(offsets[1]);
  object.id = id;
  object.lastCheckInDate = reader.readDateTimeOrNull(offsets[2]);
  object.longestCount = reader.readLong(offsets[3]);
  object.modeIndex = reader.readLong(offsets[4]);
  object.weekStartDate = reader.readDateTimeOrNull(offsets[5]);
  return object;
}

P _streakIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _streakIsarGetId(StreakIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _streakIsarGetLinks(StreakIsar object) {
  return [];
}

void _streakIsarAttach(IsarCollection<dynamic> col, Id id, StreakIsar object) {
  object.id = id;
}

extension StreakIsarQueryWhereSort
    on QueryBuilder<StreakIsar, StreakIsar, QWhere> {
  QueryBuilder<StreakIsar, StreakIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StreakIsarQueryWhere
    on QueryBuilder<StreakIsar, StreakIsar, QWhereClause> {
  QueryBuilder<StreakIsar, StreakIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<StreakIsar, StreakIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterWhereClause> idBetween(
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

extension StreakIsarQueryFilter
    on QueryBuilder<StreakIsar, StreakIsar, QFilterCondition> {
  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      currentCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      currentCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      currentCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      currentCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      forgivenessUsedThisWeekEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'forgivenessUsedThisWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastCheckInDate',
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastCheckInDate',
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCheckInDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCheckInDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCheckInDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      lastCheckInDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCheckInDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      longestCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      longestCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      longestCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longestCount',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      longestCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longestCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> modeIndexEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modeIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      modeIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modeIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> modeIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modeIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition> modeIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modeIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weekStartDate',
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weekStartDate',
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weekStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weekStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weekStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterFilterCondition>
      weekStartDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weekStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StreakIsarQueryObject
    on QueryBuilder<StreakIsar, StreakIsar, QFilterCondition> {}

extension StreakIsarQueryLinks
    on QueryBuilder<StreakIsar, StreakIsar, QFilterCondition> {}

extension StreakIsarQuerySortBy
    on QueryBuilder<StreakIsar, StreakIsar, QSortBy> {
  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCount', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByCurrentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCount', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      sortByForgivenessUsedThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forgivenessUsedThisWeek', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      sortByForgivenessUsedThisWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forgivenessUsedThisWeek', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByLastCheckInDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckInDate', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      sortByLastCheckInDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckInDate', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByLongestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestCount', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByLongestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestCount', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByModeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeIndex', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByModeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeIndex', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> sortByWeekStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.desc);
    });
  }
}

extension StreakIsarQuerySortThenBy
    on QueryBuilder<StreakIsar, StreakIsar, QSortThenBy> {
  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCount', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByCurrentCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentCount', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      thenByForgivenessUsedThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forgivenessUsedThisWeek', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      thenByForgivenessUsedThisWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'forgivenessUsedThisWeek', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByLastCheckInDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckInDate', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy>
      thenByLastCheckInDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCheckInDate', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByLongestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestCount', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByLongestCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestCount', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByModeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeIndex', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByModeIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'modeIndex', Sort.desc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.asc);
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QAfterSortBy> thenByWeekStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weekStartDate', Sort.desc);
    });
  }
}

extension StreakIsarQueryWhereDistinct
    on QueryBuilder<StreakIsar, StreakIsar, QDistinct> {
  QueryBuilder<StreakIsar, StreakIsar, QDistinct> distinctByCurrentCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentCount');
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QDistinct>
      distinctByForgivenessUsedThisWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'forgivenessUsedThisWeek');
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QDistinct> distinctByLastCheckInDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCheckInDate');
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QDistinct> distinctByLongestCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longestCount');
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QDistinct> distinctByModeIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'modeIndex');
    });
  }

  QueryBuilder<StreakIsar, StreakIsar, QDistinct> distinctByWeekStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weekStartDate');
    });
  }
}

extension StreakIsarQueryProperty
    on QueryBuilder<StreakIsar, StreakIsar, QQueryProperty> {
  QueryBuilder<StreakIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StreakIsar, int, QQueryOperations> currentCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentCount');
    });
  }

  QueryBuilder<StreakIsar, bool, QQueryOperations>
      forgivenessUsedThisWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'forgivenessUsedThisWeek');
    });
  }

  QueryBuilder<StreakIsar, DateTime?, QQueryOperations>
      lastCheckInDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCheckInDate');
    });
  }

  QueryBuilder<StreakIsar, int, QQueryOperations> longestCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longestCount');
    });
  }

  QueryBuilder<StreakIsar, int, QQueryOperations> modeIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'modeIndex');
    });
  }

  QueryBuilder<StreakIsar, DateTime?, QQueryOperations>
      weekStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weekStartDate');
    });
  }
}
