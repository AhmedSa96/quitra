// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craving_event_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCravingEventIsarCollection on Isar {
  IsarCollection<CravingEventIsar> get cravingEventIsars => this.collection();
}

const CravingEventIsarSchema = CollectionSchema(
  name: r'CravingEventIsar',
  id: 7665493175425564296,
  properties: {
    r'timestamp': PropertySchema(
      id: 0,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'wasSmoked': PropertySchema(
      id: 1,
      name: r'wasSmoked',
      type: IsarType.bool,
    )
  },
  estimateSize: _cravingEventIsarEstimateSize,
  serialize: _cravingEventIsarSerialize,
  deserialize: _cravingEventIsarDeserialize,
  deserializeProp: _cravingEventIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _cravingEventIsarGetId,
  getLinks: _cravingEventIsarGetLinks,
  attach: _cravingEventIsarAttach,
  version: '3.1.0+1',
);

int _cravingEventIsarEstimateSize(
  CravingEventIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _cravingEventIsarSerialize(
  CravingEventIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.timestamp);
  writer.writeBool(offsets[1], object.wasSmoked);
}

CravingEventIsar _cravingEventIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CravingEventIsar();
  object.id = id;
  object.timestamp = reader.readDateTime(offsets[0]);
  object.wasSmoked = reader.readBool(offsets[1]);
  return object;
}

P _cravingEventIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _cravingEventIsarGetId(CravingEventIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _cravingEventIsarGetLinks(CravingEventIsar object) {
  return [];
}

void _cravingEventIsarAttach(
    IsarCollection<dynamic> col, Id id, CravingEventIsar object) {
  object.id = id;
}

extension CravingEventIsarQueryWhereSort
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QWhere> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CravingEventIsarQueryWhere
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QWhereClause> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhereClause>
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

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterWhereClause> idBetween(
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

extension CravingEventIsarQueryFilter
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QFilterCondition> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
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

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
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

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
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

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      timestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterFilterCondition>
      wasSmokedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wasSmoked',
        value: value,
      ));
    });
  }
}

extension CravingEventIsarQueryObject
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QFilterCondition> {}

extension CravingEventIsarQueryLinks
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QFilterCondition> {}

extension CravingEventIsarQuerySortBy
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QSortBy> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      sortByWasSmoked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSmoked', Sort.asc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      sortByWasSmokedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSmoked', Sort.desc);
    });
  }
}

extension CravingEventIsarQuerySortThenBy
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QSortThenBy> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      thenByWasSmoked() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSmoked', Sort.asc);
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QAfterSortBy>
      thenByWasSmokedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wasSmoked', Sort.desc);
    });
  }
}

extension CravingEventIsarQueryWhereDistinct
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QDistinct> {
  QueryBuilder<CravingEventIsar, CravingEventIsar, QDistinct>
      distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<CravingEventIsar, CravingEventIsar, QDistinct>
      distinctByWasSmoked() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wasSmoked');
    });
  }
}

extension CravingEventIsarQueryProperty
    on QueryBuilder<CravingEventIsar, CravingEventIsar, QQueryProperty> {
  QueryBuilder<CravingEventIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CravingEventIsar, DateTime, QQueryOperations>
      timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<CravingEventIsar, bool, QQueryOperations> wasSmokedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wasSmoked');
    });
  }
}
