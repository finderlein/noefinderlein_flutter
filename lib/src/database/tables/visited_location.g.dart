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
      '{"name":"VisitedLocation","idName":"visitedId","properties":[{"name":"visitedAccepted","type":"Bool"},{"name":"visitedLatitude","type":"Double"},{"name":"visitedLocationId","type":"Long"},{"name":"visitedLoggedDay","type":"String"},{"name":"visitedLongitude","type":"Double"},{"name":"visitedSaved","type":"Double"},{"name":"visitedYear","type":"Long"}],"indexes":[],"links":[]}',
  nativeAdapter: const _VisitedLocationNativeAdapter(),
  webAdapter: const _VisitedLocationWebAdapter(),
  idName: 'visitedId',
  propertyIds: {
    'visitedAccepted': 0,
    'visitedLatitude': 1,
    'visitedLocationId': 2,
    'visitedLoggedDay': 3,
    'visitedLongitude': 4,
    'visitedSaved': 5,
    'visitedYear': 6
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
    IsarNative.jsObjectSet(jsObj, 'visitedAccepted', object.visitedAccepted);
    IsarNative.jsObjectSet(jsObj, 'visitedId', object.visitedId);
    IsarNative.jsObjectSet(jsObj, 'visitedLatitude', object.visitedLatitude);
    IsarNative.jsObjectSet(
        jsObj, 'visitedLocationId', object.visitedLocationId);
    IsarNative.jsObjectSet(jsObj, 'visitedLoggedDay', object.visitedLoggedDay);
    IsarNative.jsObjectSet(jsObj, 'visitedLongitude', object.visitedLongitude);
    IsarNative.jsObjectSet(jsObj, 'visitedSaved', object.visitedSaved);
    IsarNative.jsObjectSet(jsObj, 'visitedYear', object.visitedYear);
    return jsObj;
  }

  @override
  VisitedLocation deserialize(
      IsarCollection<VisitedLocation> collection, dynamic jsObj) {
    final object = VisitedLocation();
    object.visitedAccepted =
        IsarNative.jsObjectGet(jsObj, 'visitedAccepted') ?? false;
    object.visitedId =
        IsarNative.jsObjectGet(jsObj, 'visitedId') ?? double.negativeInfinity;
    object.visitedLatitude = IsarNative.jsObjectGet(jsObj, 'visitedLatitude') ??
        double.negativeInfinity;
    object.visitedLocationId =
        IsarNative.jsObjectGet(jsObj, 'visitedLocationId') ??
            double.negativeInfinity;
    object.visitedLoggedDay = IsarNative.jsObjectGet(jsObj, 'visitedLoggedDay');
    object.visitedLongitude =
        IsarNative.jsObjectGet(jsObj, 'visitedLongitude') ??
            double.negativeInfinity;
    object.visitedSaved = IsarNative.jsObjectGet(jsObj, 'visitedSaved') ??
        double.negativeInfinity;
    object.visitedYear =
        IsarNative.jsObjectGet(jsObj, 'visitedYear') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'visitedAccepted':
        return (IsarNative.jsObjectGet(jsObj, 'visitedAccepted') ?? false) as P;
      case 'visitedId':
        return (IsarNative.jsObjectGet(jsObj, 'visitedId') ??
            double.negativeInfinity) as P;
      case 'visitedLatitude':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLatitude') ??
            double.negativeInfinity) as P;
      case 'visitedLocationId':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLocationId') ??
            double.negativeInfinity) as P;
      case 'visitedLoggedDay':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLoggedDay')) as P;
      case 'visitedLongitude':
        return (IsarNative.jsObjectGet(jsObj, 'visitedLongitude') ??
            double.negativeInfinity) as P;
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
    final value0 = object.visitedAccepted;
    final _visitedAccepted = value0;
    final value1 = object.visitedLatitude;
    final _visitedLatitude = value1;
    final value2 = object.visitedLocationId;
    final _visitedLocationId = value2;
    final value3 = object.visitedLoggedDay;
    IsarUint8List? _visitedLoggedDay;
    if (value3 != null) {
      _visitedLoggedDay = IsarBinaryWriter.utf8Encoder.convert(value3);
    }
    dynamicSize += (_visitedLoggedDay?.length ?? 0) as int;
    final value4 = object.visitedLongitude;
    final _visitedLongitude = value4;
    final value5 = object.visitedSaved;
    final _visitedSaved = value5;
    final value6 = object.visitedYear;
    final _visitedYear = value6;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _visitedAccepted);
    writer.writeDouble(offsets[1], _visitedLatitude);
    writer.writeLong(offsets[2], _visitedLocationId);
    writer.writeBytes(offsets[3], _visitedLoggedDay);
    writer.writeDouble(offsets[4], _visitedLongitude);
    writer.writeDouble(offsets[5], _visitedSaved);
    writer.writeLong(offsets[6], _visitedYear);
  }

  @override
  VisitedLocation deserialize(IsarCollection<VisitedLocation> collection,
      int id, IsarBinaryReader reader, List<int> offsets) {
    final object = VisitedLocation();
    object.visitedAccepted = reader.readBool(offsets[0]);
    object.visitedId = id;
    object.visitedLatitude = reader.readDouble(offsets[1]);
    object.visitedLocationId = reader.readLong(offsets[2]);
    object.visitedLoggedDay = reader.readStringOrNull(offsets[3]);
    object.visitedLongitude = reader.readDouble(offsets[4]);
    object.visitedSaved = reader.readDouble(offsets[5]);
    object.visitedYear = reader.readLong(offsets[6]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readBool(offset)) as P;
      case 1:
        return (reader.readDouble(offset)) as P;
      case 2:
        return (reader.readLong(offset)) as P;
      case 3:
        return (reader.readStringOrNull(offset)) as P;
      case 4:
        return (reader.readDouble(offset)) as P;
      case 5:
        return (reader.readDouble(offset)) as P;
      case 6:
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
      visitedAcceptedEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'visitedAccepted',
      value: value,
    ));
  }

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
      visitedLatitudeGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'visitedLatitude',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLatitudeLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'visitedLatitude',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLatitudeBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedLatitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
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
      visitedLoggedDayIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'visitedLoggedDay',
      value: null,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLoggedDayEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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
      visitedLongitudeGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'visitedLongitude',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLongitudeLessThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'visitedLongitude',
      value: value,
    ));
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterFilterCondition>
      visitedLongitudeBetween(double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'visitedLongitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
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
      sortByVisitedAccepted() {
    return addSortByInternal('visitedAccepted', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedAcceptedDesc() {
    return addSortByInternal('visitedAccepted', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedId() {
    return addSortByInternal('visitedId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedIdDesc() {
    return addSortByInternal('visitedId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLatitude() {
    return addSortByInternal('visitedLatitude', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLatitudeDesc() {
    return addSortByInternal('visitedLatitude', Sort.desc);
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
      sortByVisitedLongitude() {
    return addSortByInternal('visitedLongitude', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      sortByVisitedLongitudeDesc() {
    return addSortByInternal('visitedLongitude', Sort.desc);
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
      thenByVisitedAccepted() {
    return addSortByInternal('visitedAccepted', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedAcceptedDesc() {
    return addSortByInternal('visitedAccepted', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedId() {
    return addSortByInternal('visitedId', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedIdDesc() {
    return addSortByInternal('visitedId', Sort.desc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLatitude() {
    return addSortByInternal('visitedLatitude', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLatitudeDesc() {
    return addSortByInternal('visitedLatitude', Sort.desc);
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
      thenByVisitedLongitude() {
    return addSortByInternal('visitedLongitude', Sort.asc);
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QAfterSortBy>
      thenByVisitedLongitudeDesc() {
    return addSortByInternal('visitedLongitude', Sort.desc);
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
      distinctByVisitedAccepted() {
    return addDistinctByInternal('visitedAccepted');
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedId() {
    return addDistinctByInternal('visitedId');
  }

  QueryBuilder<VisitedLocation, VisitedLocation, QDistinct>
      distinctByVisitedLatitude() {
    return addDistinctByInternal('visitedLatitude');
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
      distinctByVisitedLongitude() {
    return addDistinctByInternal('visitedLongitude');
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
  QueryBuilder<VisitedLocation, bool, QQueryOperations>
      visitedAcceptedProperty() {
    return addPropertyNameInternal('visitedAccepted');
  }

  QueryBuilder<VisitedLocation, int, QQueryOperations> visitedIdProperty() {
    return addPropertyNameInternal('visitedId');
  }

  QueryBuilder<VisitedLocation, double, QQueryOperations>
      visitedLatitudeProperty() {
    return addPropertyNameInternal('visitedLatitude');
  }

  QueryBuilder<VisitedLocation, int, QQueryOperations>
      visitedLocationIdProperty() {
    return addPropertyNameInternal('visitedLocationId');
  }

  QueryBuilder<VisitedLocation, String?, QQueryOperations>
      visitedLoggedDayProperty() {
    return addPropertyNameInternal('visitedLoggedDay');
  }

  QueryBuilder<VisitedLocation, double, QQueryOperations>
      visitedLongitudeProperty() {
    return addPropertyNameInternal('visitedLongitude');
  }

  QueryBuilder<VisitedLocation, double, QQueryOperations>
      visitedSavedProperty() {
    return addPropertyNameInternal('visitedSaved');
  }

  QueryBuilder<VisitedLocation, int, QQueryOperations> visitedYearProperty() {
    return addPropertyNameInternal('visitedYear');
  }
}
