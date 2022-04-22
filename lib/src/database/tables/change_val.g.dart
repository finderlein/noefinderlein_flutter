// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_val.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetChangeValCollection on Isar {
  IsarCollection<ChangeVal> get changeVals {
    return getCollection('ChangeVal');
  }
}

final ChangeValSchema = CollectionSchema(
  name: 'ChangeVal',
  schema:
      '{"name":"ChangeVal","idName":"year","properties":[{"name":"changeCount","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _ChangeValNativeAdapter(),
  webAdapter: const _ChangeValWebAdapter(),
  idName: 'year',
  propertyIds: {'changeCount': 0},
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.year == Isar.autoIncrement) {
      return null;
    } else {
      return obj.year;
    }
  },
  setId: (obj, id) => obj.year = id,
  getLinks: (obj) => [],
  version: 2,
);

class _ChangeValWebAdapter extends IsarWebTypeAdapter<ChangeVal> {
  const _ChangeValWebAdapter();

  @override
  Object serialize(IsarCollection<ChangeVal> collection, ChangeVal object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'changeCount', object.changeCount);
    IsarNative.jsObjectSet(jsObj, 'year', object.year);
    return jsObj;
  }

  @override
  ChangeVal deserialize(IsarCollection<ChangeVal> collection, dynamic jsObj) {
    final object = ChangeVal();
    object.changeCount =
        IsarNative.jsObjectGet(jsObj, 'changeCount') ?? double.negativeInfinity;
    object.year =
        IsarNative.jsObjectGet(jsObj, 'year') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'changeCount':
        return (IsarNative.jsObjectGet(jsObj, 'changeCount') ??
            double.negativeInfinity) as P;
      case 'year':
        return (IsarNative.jsObjectGet(jsObj, 'year') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, ChangeVal object) {}
}

class _ChangeValNativeAdapter extends IsarNativeTypeAdapter<ChangeVal> {
  const _ChangeValNativeAdapter();

  @override
  void serialize(IsarCollection<ChangeVal> collection, IsarRawObject rawObj,
      ChangeVal object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.changeCount;
    final _changeCount = value0;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _changeCount);
  }

  @override
  ChangeVal deserialize(IsarCollection<ChangeVal> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = ChangeVal();
    object.changeCount = reader.readLong(offsets[0]);
    object.year = id;
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, ChangeVal object) {}
}

extension ChangeValQueryWhereSort
    on QueryBuilder<ChangeVal, ChangeVal, QWhere> {
  QueryBuilder<ChangeVal, ChangeVal, QAfterWhere> anyYear() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension ChangeValQueryWhere
    on QueryBuilder<ChangeVal, ChangeVal, QWhereClause> {
  QueryBuilder<ChangeVal, ChangeVal, QAfterWhereClause> yearEqualTo(int year) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [year],
      includeLower: true,
      upper: [year],
      includeUpper: true,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterWhereClause> yearNotEqualTo(
      int year) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [year],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [year],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [year],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [year],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterWhereClause> yearGreaterThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [year],
      includeLower: include,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterWhereClause> yearLessThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [year],
      includeUpper: include,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterWhereClause> yearBetween(
    int lowerYear,
    int upperYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerYear],
      includeLower: includeLower,
      upper: [upperYear],
      includeUpper: includeUpper,
    ));
  }
}

extension ChangeValQueryFilter
    on QueryBuilder<ChangeVal, ChangeVal, QFilterCondition> {
  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> changeCountEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'changeCount',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition>
      changeCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'changeCount',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> changeCountLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'changeCount',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> changeCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'changeCount',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> yearEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'year',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> yearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'year',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> yearLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'year',
      value: value,
    ));
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterFilterCondition> yearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'year',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension ChangeValQueryLinks
    on QueryBuilder<ChangeVal, ChangeVal, QFilterCondition> {}

extension ChangeValQueryWhereSortBy
    on QueryBuilder<ChangeVal, ChangeVal, QSortBy> {
  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> sortByChangeCount() {
    return addSortByInternal('changeCount', Sort.asc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> sortByChangeCountDesc() {
    return addSortByInternal('changeCount', Sort.desc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> sortByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> sortByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension ChangeValQueryWhereSortThenBy
    on QueryBuilder<ChangeVal, ChangeVal, QSortThenBy> {
  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> thenByChangeCount() {
    return addSortByInternal('changeCount', Sort.asc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> thenByChangeCountDesc() {
    return addSortByInternal('changeCount', Sort.desc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> thenByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<ChangeVal, ChangeVal, QAfterSortBy> thenByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension ChangeValQueryWhereDistinct
    on QueryBuilder<ChangeVal, ChangeVal, QDistinct> {
  QueryBuilder<ChangeVal, ChangeVal, QDistinct> distinctByChangeCount() {
    return addDistinctByInternal('changeCount');
  }

  QueryBuilder<ChangeVal, ChangeVal, QDistinct> distinctByYear() {
    return addDistinctByInternal('year');
  }
}

extension ChangeValQueryProperty
    on QueryBuilder<ChangeVal, ChangeVal, QQueryProperty> {
  QueryBuilder<ChangeVal, int, QQueryOperations> changeCountProperty() {
    return addPropertyNameInternal('changeCount');
  }

  QueryBuilder<ChangeVal, int, QQueryOperations> yearProperty() {
    return addPropertyNameInternal('year');
  }
}
