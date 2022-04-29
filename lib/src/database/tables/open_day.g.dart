// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_day.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetOpenDayCollection on Isar {
  IsarCollection<OpenDay> get openDays {
    return getCollection('OpenDay');
  }
}

final OpenDaySchema = CollectionSchema(
  name: 'OpenDay',
  schema:
      '{"name":"OpenDay","idName":"id","properties":[{"name":"active","type":"Bool"},{"name":"changeIndex","type":"Long"},{"name":"compIndex","type":"String"},{"name":"day","type":"String"},{"name":"locationId","type":"Long"},{"name":"year","type":"Long"}],"indexes":[{"name":"compIndex","unique":true,"properties":[{"name":"compIndex","type":"Value","caseSensitive":true}]},{"name":"day","unique":false,"properties":[{"name":"day","type":"Hash","caseSensitive":true}]},{"name":"locationId","unique":false,"properties":[{"name":"locationId","type":"Value","caseSensitive":false}]},{"name":"year","unique":false,"properties":[{"name":"year","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _OpenDayNativeAdapter(),
  webAdapter: const _OpenDayWebAdapter(),
  idName: 'id',
  propertyIds: {
    'active': 0,
    'changeIndex': 1,
    'compIndex': 2,
    'day': 3,
    'locationId': 4,
    'year': 5
  },
  listProperties: {},
  indexIds: {'compIndex': 0, 'day': 1, 'locationId': 2, 'year': 3},
  indexTypes: {
    'compIndex': [
      NativeIndexType.string,
    ],
    'day': [
      NativeIndexType.stringHash,
    ],
    'locationId': [
      NativeIndexType.long,
    ],
    'year': [
      NativeIndexType.long,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _OpenDayWebAdapter extends IsarWebTypeAdapter<OpenDay> {
  const _OpenDayWebAdapter();

  @override
  Object serialize(IsarCollection<OpenDay> collection, OpenDay object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'active', object.active);
    IsarNative.jsObjectSet(jsObj, 'changeIndex', object.changeIndex);
    IsarNative.jsObjectSet(jsObj, 'compIndex', object.compIndex);
    IsarNative.jsObjectSet(jsObj, 'day', object.day);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'locationId', object.locationId);
    IsarNative.jsObjectSet(jsObj, 'year', object.year);
    return jsObj;
  }

  @override
  OpenDay deserialize(IsarCollection<OpenDay> collection, dynamic jsObj) {
    final object = OpenDay();
    object.active = IsarNative.jsObjectGet(jsObj, 'active') ?? false;
    object.changeIndex =
        IsarNative.jsObjectGet(jsObj, 'changeIndex') ?? double.negativeInfinity;
    object.day = IsarNative.jsObjectGet(jsObj, 'day') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.locationId =
        IsarNative.jsObjectGet(jsObj, 'locationId') ?? double.negativeInfinity;
    object.year =
        IsarNative.jsObjectGet(jsObj, 'year') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'active':
        return (IsarNative.jsObjectGet(jsObj, 'active') ?? false) as P;
      case 'changeIndex':
        return (IsarNative.jsObjectGet(jsObj, 'changeIndex') ??
            double.negativeInfinity) as P;
      case 'compIndex':
        return (IsarNative.jsObjectGet(jsObj, 'compIndex') ?? '') as P;
      case 'day':
        return (IsarNative.jsObjectGet(jsObj, 'day') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'locationId':
        return (IsarNative.jsObjectGet(jsObj, 'locationId') ??
            double.negativeInfinity) as P;
      case 'year':
        return (IsarNative.jsObjectGet(jsObj, 'year') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, OpenDay object) {}
}

class _OpenDayNativeAdapter extends IsarNativeTypeAdapter<OpenDay> {
  const _OpenDayNativeAdapter();

  @override
  void serialize(IsarCollection<OpenDay> collection, IsarRawObject rawObj,
      OpenDay object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.active;
    final _active = value0;
    final value1 = object.changeIndex;
    final _changeIndex = value1;
    final value2 = object.compIndex;
    final _compIndex = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_compIndex.length) as int;
    final value3 = object.day;
    final _day = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_day.length) as int;
    final value4 = object.locationId;
    final _locationId = value4;
    final value5 = object.year;
    final _year = value5;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _active);
    writer.writeLong(offsets[1], _changeIndex);
    writer.writeBytes(offsets[2], _compIndex);
    writer.writeBytes(offsets[3], _day);
    writer.writeLong(offsets[4], _locationId);
    writer.writeLong(offsets[5], _year);
  }

  @override
  OpenDay deserialize(IsarCollection<OpenDay> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = OpenDay();
    object.active = reader.readBool(offsets[0]);
    object.changeIndex = reader.readLong(offsets[1]);
    object.day = reader.readString(offsets[3]);
    object.id = id;
    object.locationId = reader.readLong(offsets[4]);
    object.year = reader.readLong(offsets[5]);
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
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readLong(offset)) as P;
      case 5:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, OpenDay object) {}
}

extension OpenDayByIndex on IsarCollection<OpenDay> {
  Future<OpenDay?> getByCompIndex(String compIndex) {
    return getByIndex('compIndex', [compIndex]);
  }

  OpenDay? getByCompIndexSync(String compIndex) {
    return getByIndexSync('compIndex', [compIndex]);
  }

  Future<bool> deleteByCompIndex(String compIndex) {
    return deleteByIndex('compIndex', [compIndex]);
  }

  bool deleteByCompIndexSync(String compIndex) {
    return deleteByIndexSync('compIndex', [compIndex]);
  }

  Future<List<OpenDay?>> getAllByCompIndex(List<String> compIndexValues) {
    final values = compIndexValues.map((e) => [e]).toList();
    return getAllByIndex('compIndex', values);
  }

  List<OpenDay?> getAllByCompIndexSync(List<String> compIndexValues) {
    final values = compIndexValues.map((e) => [e]).toList();
    return getAllByIndexSync('compIndex', values);
  }

  Future<int> deleteAllByCompIndex(List<String> compIndexValues) {
    final values = compIndexValues.map((e) => [e]).toList();
    return deleteAllByIndex('compIndex', values);
  }

  int deleteAllByCompIndexSync(List<String> compIndexValues) {
    final values = compIndexValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('compIndex', values);
  }
}

extension OpenDayQueryWhereSort on QueryBuilder<OpenDay, OpenDay, QWhere> {
  QueryBuilder<OpenDay, OpenDay, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhere> anyCompIndex() {
    return addWhereClauseInternal(const WhereClause(indexName: 'compIndex'));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhere> anyDay() {
    return addWhereClauseInternal(const WhereClause(indexName: 'day'));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhere> anyLocationId() {
    return addWhereClauseInternal(const WhereClause(indexName: 'locationId'));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhere> anyYear() {
    return addWhereClauseInternal(const WhereClause(indexName: 'year'));
  }
}

extension OpenDayQueryWhere on QueryBuilder<OpenDay, OpenDay, QWhereClause> {
  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexEqualTo(
      String compIndex) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'compIndex',
      lower: [compIndex],
      includeLower: true,
      upper: [compIndex],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexNotEqualTo(
      String compIndex) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'compIndex',
        upper: [compIndex],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'compIndex',
        lower: [compIndex],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'compIndex',
        lower: [compIndex],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'compIndex',
        upper: [compIndex],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexGreaterThan(
    String compIndex, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'compIndex',
      lower: [compIndex],
      includeLower: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexLessThan(
    String compIndex, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'compIndex',
      upper: [compIndex],
      includeUpper: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexBetween(
    String lowerCompIndex,
    String upperCompIndex, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'compIndex',
      lower: [lowerCompIndex],
      includeLower: includeLower,
      upper: [upperCompIndex],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> compIndexStartsWith(
      String CompIndexPrefix) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'compIndex',
      lower: [CompIndexPrefix],
      includeLower: true,
      upper: ['$CompIndexPrefix\u{FFFFF}'],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> dayEqualTo(String day) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'day',
      lower: [day],
      includeLower: true,
      upper: [day],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> dayNotEqualTo(String day) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'day',
        upper: [day],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'day',
        lower: [day],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'day',
        lower: [day],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'day',
        upper: [day],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> locationIdEqualTo(
      int locationId) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'locationId',
      lower: [locationId],
      includeLower: true,
      upper: [locationId],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> locationIdNotEqualTo(
      int locationId) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'locationId',
        upper: [locationId],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'locationId',
        lower: [locationId],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'locationId',
        lower: [locationId],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'locationId',
        upper: [locationId],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> locationIdGreaterThan(
    int locationId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'locationId',
      lower: [locationId],
      includeLower: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> locationIdLessThan(
    int locationId, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'locationId',
      upper: [locationId],
      includeUpper: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> locationIdBetween(
    int lowerLocationId,
    int upperLocationId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'locationId',
      lower: [lowerLocationId],
      includeLower: includeLower,
      upper: [upperLocationId],
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> yearEqualTo(int year) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      lower: [year],
      includeLower: true,
      upper: [year],
      includeUpper: true,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> yearNotEqualTo(int year) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: 'year',
        upper: [year],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'year',
        lower: [year],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: 'year',
        lower: [year],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: 'year',
        upper: [year],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> yearGreaterThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      lower: [year],
      includeLower: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> yearLessThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      upper: [year],
      includeUpper: include,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterWhereClause> yearBetween(
    int lowerYear,
    int upperYear, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      lower: [lowerYear],
      includeLower: includeLower,
      upper: [upperYear],
      includeUpper: includeUpper,
    ));
  }
}

extension OpenDayQueryFilter
    on QueryBuilder<OpenDay, OpenDay, QFilterCondition> {
  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> activeEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'active',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> changeIndexEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'changeIndex',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> changeIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'changeIndex',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> changeIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'changeIndex',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> changeIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'changeIndex',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'compIndex',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'compIndex',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> compIndexMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'compIndex',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'day',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'day',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> dayMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'day',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> locationIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'locationId',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> locationIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'locationId',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> locationIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'locationId',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> locationIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'locationId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> yearEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'year',
      value: value,
    ));
  }

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<OpenDay, OpenDay, QAfterFilterCondition> yearBetween(
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

extension OpenDayQueryLinks
    on QueryBuilder<OpenDay, OpenDay, QFilterCondition> {}

extension OpenDayQueryWhereSortBy on QueryBuilder<OpenDay, OpenDay, QSortBy> {
  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByActive() {
    return addSortByInternal('active', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByActiveDesc() {
    return addSortByInternal('active', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByChangeIndex() {
    return addSortByInternal('changeIndex', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByChangeIndexDesc() {
    return addSortByInternal('changeIndex', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByCompIndex() {
    return addSortByInternal('compIndex', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByCompIndexDesc() {
    return addSortByInternal('compIndex', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByLocationId() {
    return addSortByInternal('locationId', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByLocationIdDesc() {
    return addSortByInternal('locationId', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> sortByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension OpenDayQueryWhereSortThenBy
    on QueryBuilder<OpenDay, OpenDay, QSortThenBy> {
  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByActive() {
    return addSortByInternal('active', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByActiveDesc() {
    return addSortByInternal('active', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByChangeIndex() {
    return addSortByInternal('changeIndex', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByChangeIndexDesc() {
    return addSortByInternal('changeIndex', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByCompIndex() {
    return addSortByInternal('compIndex', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByCompIndexDesc() {
    return addSortByInternal('compIndex', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByDay() {
    return addSortByInternal('day', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByDayDesc() {
    return addSortByInternal('day', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByLocationId() {
    return addSortByInternal('locationId', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByLocationIdDesc() {
    return addSortByInternal('locationId', Sort.desc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<OpenDay, OpenDay, QAfterSortBy> thenByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension OpenDayQueryWhereDistinct
    on QueryBuilder<OpenDay, OpenDay, QDistinct> {
  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByActive() {
    return addDistinctByInternal('active');
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByChangeIndex() {
    return addDistinctByInternal('changeIndex');
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByCompIndex(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('compIndex', caseSensitive: caseSensitive);
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByDay(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('day', caseSensitive: caseSensitive);
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByLocationId() {
    return addDistinctByInternal('locationId');
  }

  QueryBuilder<OpenDay, OpenDay, QDistinct> distinctByYear() {
    return addDistinctByInternal('year');
  }
}

extension OpenDayQueryProperty
    on QueryBuilder<OpenDay, OpenDay, QQueryProperty> {
  QueryBuilder<OpenDay, bool, QQueryOperations> activeProperty() {
    return addPropertyNameInternal('active');
  }

  QueryBuilder<OpenDay, int, QQueryOperations> changeIndexProperty() {
    return addPropertyNameInternal('changeIndex');
  }

  QueryBuilder<OpenDay, String, QQueryOperations> compIndexProperty() {
    return addPropertyNameInternal('compIndex');
  }

  QueryBuilder<OpenDay, String, QQueryOperations> dayProperty() {
    return addPropertyNameInternal('day');
  }

  QueryBuilder<OpenDay, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<OpenDay, int, QQueryOperations> locationIdProperty() {
    return addPropertyNameInternal('locationId');
  }

  QueryBuilder<OpenDay, int, QQueryOperations> yearProperty() {
    return addPropertyNameInternal('year');
  }
}
