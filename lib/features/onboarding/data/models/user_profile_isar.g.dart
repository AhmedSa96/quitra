// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserProfileIsarCollection on Isar {
  IsarCollection<UserProfileIsar> get userProfileIsars => this.collection();
}

const UserProfileIsarSchema = CollectionSchema(
  name: r'UserProfileIsar',
  id: 8363191472987497192,
  properties: {
    r'cigarettesPerDay': PropertySchema(
      id: 0,
      name: r'cigarettesPerDay',
      type: IsarType.long,
    ),
    r'quitMethod': PropertySchema(
      id: 1,
      name: r'quitMethod',
      type: IsarType.string,
    ),
    r'quitStartDate': PropertySchema(
      id: 2,
      name: r'quitStartDate',
      type: IsarType.dateTime,
    ),
    r'yearsSmoking': PropertySchema(
      id: 3,
      name: r'yearsSmoking',
      type: IsarType.long,
    )
  },
  estimateSize: _userProfileIsarEstimateSize,
  serialize: _userProfileIsarSerialize,
  deserialize: _userProfileIsarDeserialize,
  deserializeProp: _userProfileIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userProfileIsarGetId,
  getLinks: _userProfileIsarGetLinks,
  attach: _userProfileIsarAttach,
  version: '3.1.0+1',
);

int _userProfileIsarEstimateSize(
  UserProfileIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.quitMethod.length * 3;
  return bytesCount;
}

void _userProfileIsarSerialize(
  UserProfileIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cigarettesPerDay);
  writer.writeString(offsets[1], object.quitMethod);
  writer.writeDateTime(offsets[2], object.quitStartDate);
  writer.writeLong(offsets[3], object.yearsSmoking);
}

UserProfileIsar _userProfileIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserProfileIsar();
  object.cigarettesPerDay = reader.readLong(offsets[0]);
  object.id = id;
  object.quitMethod = reader.readString(offsets[1]);
  object.quitStartDate = reader.readDateTime(offsets[2]);
  object.yearsSmoking = reader.readLong(offsets[3]);
  return object;
}

P _userProfileIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userProfileIsarGetId(UserProfileIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userProfileIsarGetLinks(UserProfileIsar object) {
  return [];
}

void _userProfileIsarAttach(
    IsarCollection<dynamic> col, Id id, UserProfileIsar object) {
  object.id = id;
}

extension UserProfileIsarQueryWhereSort
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QWhere> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserProfileIsarQueryWhere
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QWhereClause> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterWhereClause> idBetween(
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

extension UserProfileIsarQueryFilter
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      cigarettesPerDayEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cigarettesPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      cigarettesPerDayGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cigarettesPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      cigarettesPerDayLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cigarettesPerDay',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      cigarettesPerDayBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cigarettesPerDay',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
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

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quitMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quitMethod',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quitMethod',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quitMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitMethodIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quitMethod',
        value: '',
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitStartDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quitStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitStartDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quitStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitStartDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quitStartDate',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      quitStartDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quitStartDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      yearsSmokingEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearsSmoking',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      yearsSmokingGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearsSmoking',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      yearsSmokingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearsSmoking',
        value: value,
      ));
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterFilterCondition>
      yearsSmokingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearsSmoking',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserProfileIsarQueryObject
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {}

extension UserProfileIsarQueryLinks
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QFilterCondition> {}

extension UserProfileIsarQuerySortBy
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QSortBy> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByCigarettesPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesPerDay', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByCigarettesPerDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesPerDay', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByQuitMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitMethod', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByQuitMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitMethod', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByQuitStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByQuitStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByYearsSmoking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearsSmoking', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      sortByYearsSmokingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearsSmoking', Sort.desc);
    });
  }
}

extension UserProfileIsarQuerySortThenBy
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QSortThenBy> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByCigarettesPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesPerDay', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByCigarettesPerDayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesPerDay', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByQuitMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitMethod', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByQuitMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitMethod', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByQuitStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitStartDate', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByQuitStartDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quitStartDate', Sort.desc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByYearsSmoking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearsSmoking', Sort.asc);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QAfterSortBy>
      thenByYearsSmokingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearsSmoking', Sort.desc);
    });
  }
}

extension UserProfileIsarQueryWhereDistinct
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct> {
  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByCigarettesPerDay() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cigarettesPerDay');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByQuitMethod({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quitMethod', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByQuitStartDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quitStartDate');
    });
  }

  QueryBuilder<UserProfileIsar, UserProfileIsar, QDistinct>
      distinctByYearsSmoking() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearsSmoking');
    });
  }
}

extension UserProfileIsarQueryProperty
    on QueryBuilder<UserProfileIsar, UserProfileIsar, QQueryProperty> {
  QueryBuilder<UserProfileIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserProfileIsar, int, QQueryOperations>
      cigarettesPerDayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cigarettesPerDay');
    });
  }

  QueryBuilder<UserProfileIsar, String, QQueryOperations> quitMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quitMethod');
    });
  }

  QueryBuilder<UserProfileIsar, DateTime, QQueryOperations>
      quitStartDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quitStartDate');
    });
  }

  QueryBuilder<UserProfileIsar, int, QQueryOperations> yearsSmokingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearsSmoking');
    });
  }
}
