// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserSettingsIsarCollection on Isar {
  IsarCollection<UserSettingsIsar> get userSettingsIsars => this.collection();
}

const UserSettingsIsarSchema = CollectionSchema(
  name: r'UserSettingsIsar',
  id: -897199500488509727,
  properties: {
    r'dailyReminderEnabled': PropertySchema(
      id: 0,
      name: r'dailyReminderEnabled',
      type: IsarType.bool,
    ),
    r'dailyReminderTime': PropertySchema(
      id: 1,
      name: r'dailyReminderTime',
      type: IsarType.string,
    ),
    r'locale': PropertySchema(
      id: 2,
      name: r'locale',
      type: IsarType.string,
    ),
    r'milestoneCelebrationsEnabled': PropertySchema(
      id: 3,
      name: r'milestoneCelebrationsEnabled',
      type: IsarType.bool,
    )
  },
  estimateSize: _userSettingsIsarEstimateSize,
  serialize: _userSettingsIsarSerialize,
  deserialize: _userSettingsIsarDeserialize,
  deserializeProp: _userSettingsIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userSettingsIsarGetId,
  getLinks: _userSettingsIsarGetLinks,
  attach: _userSettingsIsarAttach,
  version: '3.1.0+1',
);

int _userSettingsIsarEstimateSize(
  UserSettingsIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.dailyReminderTime;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.locale;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userSettingsIsarSerialize(
  UserSettingsIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.dailyReminderEnabled);
  writer.writeString(offsets[1], object.dailyReminderTime);
  writer.writeString(offsets[2], object.locale);
  writer.writeBool(offsets[3], object.milestoneCelebrationsEnabled);
}

UserSettingsIsar _userSettingsIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UserSettingsIsar();
  object.dailyReminderEnabled = reader.readBool(offsets[0]);
  object.dailyReminderTime = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.locale = reader.readStringOrNull(offsets[2]);
  object.milestoneCelebrationsEnabled = reader.readBool(offsets[3]);
  return object;
}

P _userSettingsIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userSettingsIsarGetId(UserSettingsIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userSettingsIsarGetLinks(UserSettingsIsar object) {
  return [];
}

void _userSettingsIsarAttach(
    IsarCollection<dynamic> col, Id id, UserSettingsIsar object) {
  object.id = id;
}

extension UserSettingsIsarQueryWhereSort
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QWhere> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserSettingsIsarQueryWhere
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QWhereClause> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhereClause>
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

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterWhereClause> idBetween(
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

extension UserSettingsIsarQueryFilter
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QFilterCondition> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyReminderEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyReminderTime',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyReminderTime',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyReminderTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dailyReminderTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dailyReminderTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyReminderTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      dailyReminderTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dailyReminderTime',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
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

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'locale',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'locale',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'locale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'locale',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'locale',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'locale',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      localeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'locale',
        value: '',
      ));
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterFilterCondition>
      milestoneCelebrationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneCelebrationsEnabled',
        value: value,
      ));
    });
  }
}

extension UserSettingsIsarQueryObject
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QFilterCondition> {}

extension UserSettingsIsarQueryLinks
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QFilterCondition> {}

extension UserSettingsIsarQuerySortBy
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QSortBy> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByDailyReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByDailyReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByDailyReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderTime', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByDailyReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderTime', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByMilestoneCelebrationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneCelebrationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      sortByMilestoneCelebrationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneCelebrationsEnabled', Sort.desc);
    });
  }
}

extension UserSettingsIsarQuerySortThenBy
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QSortThenBy> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByDailyReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByDailyReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByDailyReminderTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderTime', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByDailyReminderTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyReminderTime', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByLocale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByLocaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'locale', Sort.desc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByMilestoneCelebrationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneCelebrationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QAfterSortBy>
      thenByMilestoneCelebrationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneCelebrationsEnabled', Sort.desc);
    });
  }
}

extension UserSettingsIsarQueryWhereDistinct
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QDistinct> {
  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QDistinct>
      distinctByDailyReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyReminderEnabled');
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QDistinct>
      distinctByDailyReminderTime({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyReminderTime',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QDistinct> distinctByLocale(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'locale', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<UserSettingsIsar, UserSettingsIsar, QDistinct>
      distinctByMilestoneCelebrationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milestoneCelebrationsEnabled');
    });
  }
}

extension UserSettingsIsarQueryProperty
    on QueryBuilder<UserSettingsIsar, UserSettingsIsar, QQueryProperty> {
  QueryBuilder<UserSettingsIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UserSettingsIsar, bool, QQueryOperations>
      dailyReminderEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyReminderEnabled');
    });
  }

  QueryBuilder<UserSettingsIsar, String?, QQueryOperations>
      dailyReminderTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyReminderTime');
    });
  }

  QueryBuilder<UserSettingsIsar, String?, QQueryOperations> localeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'locale');
    });
  }

  QueryBuilder<UserSettingsIsar, bool, QQueryOperations>
      milestoneCelebrationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milestoneCelebrationsEnabled');
    });
  }
}
