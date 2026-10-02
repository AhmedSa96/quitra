// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'milestone_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMilestoneIsarCollection on Isar {
  IsarCollection<MilestoneIsar> get milestoneIsars => this.collection();
}

const MilestoneIsarSchema = CollectionSchema(
  name: r'MilestoneIsar',
  id: -6851481986680535749,
  properties: {
    r'isUnlocked': PropertySchema(
      id: 0,
      name: r'isUnlocked',
      type: IsarType.bool,
    ),
    r'milestoneId': PropertySchema(
      id: 1,
      name: r'milestoneId',
      type: IsarType.string,
    ),
    r'unlockedAt': PropertySchema(
      id: 2,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _milestoneIsarEstimateSize,
  serialize: _milestoneIsarSerialize,
  deserialize: _milestoneIsarDeserialize,
  deserializeProp: _milestoneIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'milestoneId': IndexSchema(
      id: 6650917624138872266,
      name: r'milestoneId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'milestoneId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _milestoneIsarGetId,
  getLinks: _milestoneIsarGetLinks,
  attach: _milestoneIsarAttach,
  version: '3.1.0+1',
);

int _milestoneIsarEstimateSize(
  MilestoneIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.milestoneId.length * 3;
  return bytesCount;
}

void _milestoneIsarSerialize(
  MilestoneIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isUnlocked);
  writer.writeString(offsets[1], object.milestoneId);
  writer.writeDateTime(offsets[2], object.unlockedAt);
}

MilestoneIsar _milestoneIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MilestoneIsar();
  object.id = id;
  object.isUnlocked = reader.readBool(offsets[0]);
  object.milestoneId = reader.readString(offsets[1]);
  object.unlockedAt = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _milestoneIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _milestoneIsarGetId(MilestoneIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _milestoneIsarGetLinks(MilestoneIsar object) {
  return [];
}

void _milestoneIsarAttach(
    IsarCollection<dynamic> col, Id id, MilestoneIsar object) {
  object.id = id;
}

extension MilestoneIsarByIndex on IsarCollection<MilestoneIsar> {
  Future<MilestoneIsar?> getByMilestoneId(String milestoneId) {
    return getByIndex(r'milestoneId', [milestoneId]);
  }

  MilestoneIsar? getByMilestoneIdSync(String milestoneId) {
    return getByIndexSync(r'milestoneId', [milestoneId]);
  }

  Future<bool> deleteByMilestoneId(String milestoneId) {
    return deleteByIndex(r'milestoneId', [milestoneId]);
  }

  bool deleteByMilestoneIdSync(String milestoneId) {
    return deleteByIndexSync(r'milestoneId', [milestoneId]);
  }

  Future<List<MilestoneIsar?>> getAllByMilestoneId(
      List<String> milestoneIdValues) {
    final values = milestoneIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'milestoneId', values);
  }

  List<MilestoneIsar?> getAllByMilestoneIdSync(List<String> milestoneIdValues) {
    final values = milestoneIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'milestoneId', values);
  }

  Future<int> deleteAllByMilestoneId(List<String> milestoneIdValues) {
    final values = milestoneIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'milestoneId', values);
  }

  int deleteAllByMilestoneIdSync(List<String> milestoneIdValues) {
    final values = milestoneIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'milestoneId', values);
  }

  Future<Id> putByMilestoneId(MilestoneIsar object) {
    return putByIndex(r'milestoneId', object);
  }

  Id putByMilestoneIdSync(MilestoneIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'milestoneId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMilestoneId(List<MilestoneIsar> objects) {
    return putAllByIndex(r'milestoneId', objects);
  }

  List<Id> putAllByMilestoneIdSync(List<MilestoneIsar> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'milestoneId', objects, saveLinks: saveLinks);
  }
}

extension MilestoneIsarQueryWhereSort
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QWhere> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MilestoneIsarQueryWhere
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QWhereClause> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause>
      milestoneIdEqualTo(String milestoneId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'milestoneId',
        value: [milestoneId],
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterWhereClause>
      milestoneIdNotEqualTo(String milestoneId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'milestoneId',
              lower: [],
              upper: [milestoneId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'milestoneId',
              lower: [milestoneId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'milestoneId',
              lower: [milestoneId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'milestoneId',
              lower: [],
              upper: [milestoneId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MilestoneIsarQueryFilter
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QFilterCondition> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
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

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      isUnlockedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnlocked',
        value: value,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'milestoneId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'milestoneId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'milestoneId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'milestoneId',
        value: '',
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      milestoneIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'milestoneId',
        value: '',
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedAt',
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedAt',
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterFilterCondition>
      unlockedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MilestoneIsarQueryObject
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QFilterCondition> {}

extension MilestoneIsarQueryLinks
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QFilterCondition> {}

extension MilestoneIsarQuerySortBy
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QSortBy> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> sortByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      sortByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> sortByMilestoneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneId', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      sortByMilestoneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneId', Sort.desc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension MilestoneIsarQuerySortThenBy
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QSortThenBy> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> thenByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      thenByIsUnlockedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnlocked', Sort.desc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> thenByMilestoneId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneId', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      thenByMilestoneIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'milestoneId', Sort.desc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy> thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QAfterSortBy>
      thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension MilestoneIsarQueryWhereDistinct
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QDistinct> {
  QueryBuilder<MilestoneIsar, MilestoneIsar, QDistinct> distinctByIsUnlocked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnlocked');
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QDistinct> distinctByMilestoneId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'milestoneId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MilestoneIsar, MilestoneIsar, QDistinct> distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }
}

extension MilestoneIsarQueryProperty
    on QueryBuilder<MilestoneIsar, MilestoneIsar, QQueryProperty> {
  QueryBuilder<MilestoneIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MilestoneIsar, bool, QQueryOperations> isUnlockedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnlocked');
    });
  }

  QueryBuilder<MilestoneIsar, String, QQueryOperations> milestoneIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'milestoneId');
    });
  }

  QueryBuilder<MilestoneIsar, DateTime?, QQueryOperations>
      unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }
}
