// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserStatsIsarCollection on Isar {
  IsarCollection<UserStatsIsar> get userStatsIsars => this.collection();
}

const UserStatsIsarSchema = CollectionSchema(
  name: r'UserStatsIsar',
  id: 5426799194484748685,
  properties: {
    r'cigarettesAvoided': PropertySchema(
      id: 0,
      name: r'cigarettesAvoided',
      type: IsarType.long,
    ),
    r'cravingsLogged': PropertySchema(
      id: 1,
      name: r'cravingsLogged',
      type: IsarType.long,
    ),
    r'daysSmokeFree': PropertySchema(
      id: 2,
      name: r'daysSmokeFree',
      type: IsarType.long,
    ),
    r'lastUpdated': PropertySchema(
      id: 3,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'moneySaved': PropertySchema(
      id: 4,
      name: r'moneySaved',
      type: IsarType.double,
    )
  },
  estimateSize: _userStatsIsarEstimateSize,
  serialize: _userStatsIsarSerialize,
  deserialize: _userStatsIsarDeserialize,
  deserializeProp: _userStatsIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userStatsIsarGetId,
  getLinks: _userStatsIsarGetLinks,
  attach: _userStatsIsarAttach,
  version: '3.1.0+1',
);

int _userStatsIsarEstimateSize(
  UserStatsIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _userStatsIsarSerialize(
  UserStatsIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cigarettesAvoided);
  writer.writeLong(offsets[1], object.cravingsLogged);
  writer.writeLong(offsets[2], object.daysSmokeFree);
  writer.writeDateTime(offsets[3], object.lastUpdated);
  writer.writeDouble(offsets[4], object.moneySaved);
}

UserStatsIsar _userStatsIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserStatsIsar();
  object.cigarettesAvoided = reader.readLong(offsets[0]);
  object.cravingsLogged = reader.readLong(offsets[1]);
  object.daysSmokeFree = reader.readLong(offsets[2]);
  object.id = id;
  object.lastUpdated = reader.readDateTimeOrNull(offsets[3]);
  object.moneySaved = reader.readDouble(offsets[4]);
  return object;
}

P _userStatsIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userStatsIsarGetId(UserStatsIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userStatsIsarGetLinks(UserStatsIsar object) {
  return [];
}

void _userStatsIsarAttach(
    IsarCollection<dynamic> col, Id id, UserStatsIsar object) {
  object.id = id;
}

extension UserStatsIsarQueryWhereSort
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QWhere> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserStatsIsarQueryWhere
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QWhereClause> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterWhereClause> idBetween(
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

extension UserStatsIsarQueryFilter
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QFilterCondition> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cigarettesAvoidedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cigarettesAvoided',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cigarettesAvoidedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cigarettesAvoided',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cigarettesAvoidedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cigarettesAvoided',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cigarettesAvoidedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cigarettesAvoided',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cravingsLoggedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cravingsLogged',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cravingsLoggedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cravingsLogged',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cravingsLoggedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cravingsLogged',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      cravingsLoggedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cravingsLogged',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      daysSmokeFreeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daysSmokeFree',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      daysSmokeFreeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daysSmokeFree',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      daysSmokeFreeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daysSmokeFree',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      daysSmokeFreeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daysSmokeFree',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
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

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastUpdated',
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      moneySavedEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'moneySaved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      moneySavedGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'moneySaved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      moneySavedLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'moneySaved',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterFilterCondition>
      moneySavedBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'moneySaved',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension UserStatsIsarQueryObject
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QFilterCondition> {}

extension UserStatsIsarQueryLinks
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QFilterCondition> {}

extension UserStatsIsarQuerySortBy
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QSortBy> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByCigarettesAvoided() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesAvoided', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByCigarettesAvoidedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesAvoided', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByCravingsLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsLogged', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByCravingsLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsLogged', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByDaysSmokeFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysSmokeFree', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByDaysSmokeFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysSmokeFree', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> sortByMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneySaved', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      sortByMoneySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneySaved', Sort.desc);
    });
  }
}

extension UserStatsIsarQuerySortThenBy
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QSortThenBy> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByCigarettesAvoided() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesAvoided', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByCigarettesAvoidedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cigarettesAvoided', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByCravingsLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsLogged', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByCravingsLoggedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cravingsLogged', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByDaysSmokeFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysSmokeFree', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByDaysSmokeFreeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daysSmokeFree', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy> thenByMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneySaved', Sort.asc);
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QAfterSortBy>
      thenByMoneySavedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'moneySaved', Sort.desc);
    });
  }
}

extension UserStatsIsarQueryWhereDistinct
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct> {
  QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct>
      distinctByCigarettesAvoided() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cigarettesAvoided');
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct>
      distinctByCravingsLogged() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cravingsLogged');
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct>
      distinctByDaysSmokeFree() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daysSmokeFree');
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }

  QueryBuilder<UserStatsIsar, UserStatsIsar, QDistinct> distinctByMoneySaved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'moneySaved');
    });
  }
}

extension UserStatsIsarQueryProperty
    on QueryBuilder<UserStatsIsar, UserStatsIsar, QQueryProperty> {
  QueryBuilder<UserStatsIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserStatsIsar, int, QQueryOperations>
      cigarettesAvoidedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cigarettesAvoided');
    });
  }

  QueryBuilder<UserStatsIsar, int, QQueryOperations> cravingsLoggedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cravingsLogged');
    });
  }

  QueryBuilder<UserStatsIsar, int, QQueryOperations> daysSmokeFreeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daysSmokeFree');
    });
  }

  QueryBuilder<UserStatsIsar, DateTime?, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<UserStatsIsar, double, QQueryOperations> moneySavedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'moneySaved');
    });
  }
}
