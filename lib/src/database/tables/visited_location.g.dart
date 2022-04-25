// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_location.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetVisitedLocationCollection on Isar {
  IsarCollection<VisitedLocation> get visitedLocations {
    return getCollection('VisitedLocation');
  }
}

final VisitedLocationSchema = CollectionSchema(
  name: 'VisitedLocation',
  schema:
      '{"name":"VisitedLocation","idName":"visitedId","properties":[{"name":"visitedLocationId","type":"Long"},{"name":"visitedLoggedDay","type":"String"},{"name":"visitedSaved","type":"Double"},{"name":"visitedYear","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _VisitedLocationNativeAdapter(),
  webAdapter: const _VisitedLocationWebAdapter(),
  idName: 'visitedId',
  propertyIds: {
    'visitedLocationId': 0,
    'visitedLoggedDay': 1,
    'visitedSaved': 2,
    'visitedYear': 3
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.visitedId == Isar.autoIncrement) {
      return null;
    } else {
      return obj.visitedId;
    }
  },
  setId: (obj, id) => obj.visitedId = id,
  getLinks: (obj) => [],
  version: 2,
);

class _VisitedLocationWebAdapter extends IsarWebTypeAdapter<VisitedLocation> {
  const _VisitedLocationWebAdapter();

  @override
  Object serialize(
      IsarCollection<VisitedLocation> collection, VisitedLocation object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'visitedId', object.visitedId);
    IsarNative.jsObjectSet(
        jsObj, 'visitedLocationId', object.visitedLocationId);
    IsarNative.jsObjectSet(jsObj, 'visitedLoggedDay', object.visitedLoggedDay);
    IsarNative.jsObjectSet(jsObj, 'visitedSaved', object.visitedSaved);
    IsarNative.jsObjectSet(jsObj, 'visitedYear', object.visitedYear);
    return jsObj;
  }

  @override
  VisitedLocation deserialize(
      IsarCollection<VisitedLocation> collection, dynamic jsObj) {
    final object = VisitedLocation();
    object.visitedId =
        IsarNative.jsObjectGet(jsObj, 'visitedId') ?? double.negativeInfinity;
    object.visitedLocationId =
        IsarNative.jsObjectGet(jsObj, 'visitedLocationId') ??
            double.negativeInfinity;
    object.visitedLoggedDay =
        IsarNative.jsObjectGet(jsObj, 'visitedLoggedDay') ?? '';
    object.visitedSaved = IsarNative.jsObjectGet(jsObj, 'visitedSaved') ??
        double.negativeInfinity;
    object.visitedYear =
        IsarNative.jsObjectGet(jsObj, 'visitedYear') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'visitedId':
        return (IsarNative.jsObjectGet(jsObj, 'visitedId') ??
            double.negativeInfinity) as P;
      case 'visitedLocationId':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLocationId') ??
            double.negativeInfinity) as P;
      case 'visitedLoggedDay':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLoggedDay') ?? '') as P;
      case 'visitedSaved':
        return (IsarNative.jsObjectGet(jsObj, 'visitedSaved') ??
            double.negativeInfinity) as P;
      case 'visitedYear':
        return (IsarNative.jsObjectGet(jsObj, 'visitedYear') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, VisitedLocation object) {}
}

class _VisitedLocationNativeAdapter
    extends IsarNativeTypeAdapter<VisitedLocation> {
  const _VisitedLocationNativeAdapter();

  @override
  void serialize(
      IsarCollection<VisitedLocation> collection,
      IsarRawObject rawObj,
      VisitedLocation object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.visitedLocationId;
    final _visitedLocationId = value0;
    final value1 = object.visitedLoggedDay;
    final _visitedLoggedDay = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_visitedLoggedDay.length) as int;
    final value2 = object.visitedSaved;
    final _visitedSaved = value2;
    final value3 = object.visitedYear;
    final _visitedYear = value3;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeLong(offsets[0], _visitedLocationId);
    writer.writeBytes(offsets[1], _visitedLoggedDay);
    writer.writeDouble(offsets[2], _visitedSaved);
    writer.writeLong(offsets[3], _visitedYear);
  }

  @override
  VisitedLocation deserialize(IsarCollection<VisitedLocation> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = VisitedLocation();
    object.visitedId = id;
    object.visitedLocationId = reader.readLong(offsets[0]);
    object.visitedLoggedDay = reader.readString(offsets[1]);
    object.visitedSaved = reader.readDouble(offsets[2]);
    object.visitedYear = reader.readLong(offsets[3]);
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
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readDouble(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, VisitedLocation object) {}
}

extension VisitedLocationQueryWhereSort
    on QueryBuilder<VisitedLocation, VisitedLocation, QWhere> {
  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhere> anyVisitedId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension VisitedLocationQueryWhere
    on QueryBuilder<VisitedLocation, VisitedLocation, QWhereClause> {
  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhereClause>
      visitedIdEqualTo(int visitedId) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [visitedId],
      includeLower: true,
      upper: [visitedId],
      includeUpper: true,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhereClause>
      visitedIdNotEqualTo(int visitedId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [visitedId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [visitedId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [visitedId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [visitedId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhereClause>
      visitedIdGreaterThan(
    int visitedId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [visitedId],
      includeLower: include,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhereClause>
      visitedIdLessThan(
    int visitedId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [visitedId],
      includeUpper: include,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterWhereClause>
      visitedIdBetween(
    int lowerVisitedId,
    int upperVisitedId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerVisitedId],
      includeLower: includeLower,
      upper: [upperVisitedId],
      includeUpper: includeUpper,
    ));
  }
}

extension VisitedLocationQueryFilter
    on QueryBuilder<VisitedLocation, VisitedLocation, QFilterCondition> {
  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'visitedId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'visitedId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'visitedId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLocationIdEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'visitedLocationId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLocationIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'visitedLocationId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLocationIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'visitedLocationId',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLocationIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedLocationId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedLoggedDay',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'visitedLoggedDay',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'visitedLoggedDay',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedSavedGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'visitedSaved',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedSavedLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'visitedSaved',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedSavedBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedSaved',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedYearEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'visitedYear',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedYearGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'visitedYear',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedYearLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'visitedYear',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedYearBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedYear',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }
}

extension VisitedLocationQueryLinks
    on QueryBuilder<VisitedLocation, VisitedLocation, QFilterCondition> {}

extension VisitedLocationQueryWhereSortBy
    on QueryBuilder<VisitedLocation, VisitedLocation, QSortBy> {
  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedId() {
    return addSortByInternal('visitedId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedIdDesc() {
    return addSortByInternal('visitedId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLocationId() {
    return addSortByInternal('visitedLocationId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLocationIdDesc() {
    return addSortByInternal('visitedLocationId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLoggedDay() {
    return addSortByInternal('visitedLoggedDay', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLoggedDayDesc() {
    return addSortByInternal('visitedLoggedDay', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedSaved() {
    return addSortByInternal('visitedSaved', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedSavedDesc() {
    return addSortByInternal('visitedSaved', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedYear() {
    return addSortByInternal('visitedYear', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedYearDesc() {
    return addSortByInternal('visitedYear', Sort.desc);
  }
}

extension VisitedLocationQueryWhereSortThenBy
    on QueryBuilder<VisitedLocation, VisitedLocation, QSortThenBy> {
  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedId() {
    return addSortByInternal('visitedId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedIdDesc() {
    return addSortByInternal('visitedId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLocationId() {
    return addSortByInternal('visitedLocationId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLocationIdDesc() {
    return addSortByInternal('visitedLocationId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLoggedDay() {
    return addSortByInternal('visitedLoggedDay', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLoggedDayDesc() {
    return addSortByInternal('visitedLoggedDay', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedSaved() {
    return addSortByInternal('visitedSaved', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedSavedDesc() {
    return addSortByInternal('visitedSaved', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedYear() {
    return addSortByInternal('visitedYear', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedYearDesc() {
    return addSortByInternal('visitedYear', Sort.desc);
  }
}

extension VisitedLocationQueryWhereDistinct
    on QueryBuilder<VisitedLocation, VisitedLocation, QDistinct> {
  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedId() {
    return addDistinctByInternal('visitedId');
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedLocationId() {
    return addDistinctByInternal('visitedLocationId');
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedLoggedDay({bool caseSensitive = true}) {
    return addDistinctByInternal('visitedLoggedDay',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedSaved() {
    return addDistinctByInternal('visitedSaved');
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedYear() {
    return addDistinctByInternal('visitedYear');
  }
}

extension VisitedLocationQueryProperty
    on QueryBuilder<VisitedLocation, VisitedLocation, QQueryProperty> {
  QueryBuilder<VisitedLocation, int, QQueryOperations> visitedIdProperty() {
    return addPropertyNameInternal('visitedId');
  }

  QueryBuilder<VisitedLocation, int, QQueryOperations>
      visitedLocationIdProperty() {
    return addPropertyNameInternal('visitedLocationId');
  }

  QueryBuilder<VisitedLocation, String, QQueryOperations>
      visitedLoggedDayProperty() {
    return addPropertyNameInternal('visitedLoggedDay');
  }

  QueryBuilder<VisitedLocation, double, QQueryOperations>
      visitedSavedProperty() {
    return addPropertyNameInternal('visitedSaved');
  }

  QueryBuilder<VisitedLocation, int, QQueryOperations> visitedYearProperty() {
    return addPropertyNameInternal('visitedYear');
  }
}
