// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetLocationCollection on Isar {
  IsarCollection<Location> get locations {
    return getCollection('Location');
  }
}

final LocationSchema = CollectionSchema(
  name: 'Location',
  schema:
      '{"name":"Location","idName":"id","properties":[{"name":"addressCity","type":"String"},{"name":"addressStreet","type":"String"},{"name":"addressZip","type":"String"},{"name":"apiId","type":"Long"},{"name":"badWeather","type":"Bool"},{"name":"bookletNumber","type":"Long"},{"name":"category","type":"Long"},{"name":"changeIndex","type":"Long"},{"name":"changedDate","type":"String"},{"name":"childFriendly","type":"Bool"},{"name":"description","type":"String"},{"name":"dogAllowed","type":"Bool"},{"name":"email","type":"String"},{"name":"entryText","type":"String"},{"name":"favorit","type":"Bool"},{"name":"fax","type":"String"},{"name":"groupsAccepted","type":"Bool"},{"name":"hint","type":"String"},{"name":"latitude","type":"Double"},{"name":"longitude","type":"Double"},{"name":"name","type":"String"},{"name":"openInWinter","type":"Bool"},{"name":"openText","type":"String"},{"name":"province","type":"Long"},{"name":"region","type":"Long"},{"name":"savingsAdult","type":"String"},{"name":"savingsChild","type":"String"},{"name":"strollerFriendly","type":"Bool"},{"name":"tavernNear","type":"Bool"},{"name":"telephone","type":"String"},{"name":"topLocation","type":"Bool"},{"name":"travelDirections","type":"String"},{"name":"website","type":"String"},{"name":"websiteId","type":"Long"},{"name":"wheelchairFriendly","type":"Bool"},{"name":"year","type":"Long"}],"indexes":[{"name":"year","unique":false,"properties":[{"name":"year","type":"Value","caseSensitive":false}]}],"links":[]}',
  nativeAdapter: const _LocationNativeAdapter(),
  webAdapter: const _LocationWebAdapter(),
  idName: 'id',
  propertyIds: {
    'addressCity': 0,
    'addressStreet': 1,
    'addressZip': 2,
    'apiId': 3,
    'badWeather': 4,
    'bookletNumber': 5,
    'category': 6,
    'changeIndex': 7,
    'changedDate': 8,
    'childFriendly': 9,
    'description': 10,
    'dogAllowed': 11,
    'email': 12,
    'entryText': 13,
    'favorit': 14,
    'fax': 15,
    'groupsAccepted': 16,
    'hint': 17,
    'latitude': 18,
    'longitude': 19,
    'name': 20,
    'openInWinter': 21,
    'openText': 22,
    'province': 23,
    'region': 24,
    'savingsAdult': 25,
    'savingsChild': 26,
    'strollerFriendly': 27,
    'tavernNear': 28,
    'telephone': 29,
    'topLocation': 30,
    'travelDirections': 31,
    'website': 32,
    'websiteId': 33,
    'wheelchairFriendly': 34,
    'year': 35
  },
  listProperties: {},
  indexIds: {'year': 0},
  indexTypes: {
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

class _LocationWebAdapter extends IsarWebTypeAdapter<Location> {
  const _LocationWebAdapter();

  @override
  Object serialize(IsarCollection<Location> collection, Location object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'addressCity', object.addressCity);
    IsarNative.jsObjectSet(jsObj, 'addressStreet', object.addressStreet);
    IsarNative.jsObjectSet(jsObj, 'addressZip', object.addressZip);
    IsarNative.jsObjectSet(jsObj, 'apiId', object.apiId);
    IsarNative.jsObjectSet(jsObj, 'badWeather', object.badWeather);
    IsarNative.jsObjectSet(jsObj, 'bookletNumber', object.bookletNumber);
    IsarNative.jsObjectSet(jsObj, 'category', object.category);
    IsarNative.jsObjectSet(jsObj, 'changeIndex', object.changeIndex);
    IsarNative.jsObjectSet(jsObj, 'changedDate', object.changedDate);
    IsarNative.jsObjectSet(jsObj, 'childFriendly', object.childFriendly);
    IsarNative.jsObjectSet(jsObj, 'description', object.description);
    IsarNative.jsObjectSet(jsObj, 'dogAllowed', object.dogAllowed);
    IsarNative.jsObjectSet(jsObj, 'email', object.email);
    IsarNative.jsObjectSet(jsObj, 'entryText', object.entryText);
    IsarNative.jsObjectSet(jsObj, 'favorit', object.favorit);
    IsarNative.jsObjectSet(jsObj, 'fax', object.fax);
    IsarNative.jsObjectSet(jsObj, 'groupsAccepted', object.groupsAccepted);
    IsarNative.jsObjectSet(jsObj, 'hint', object.hint);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'latitude', object.latitude);
    IsarNative.jsObjectSet(jsObj, 'longitude', object.longitude);
    IsarNative.jsObjectSet(jsObj, 'name', object.name);
    IsarNative.jsObjectSet(jsObj, 'openInWinter', object.openInWinter);
    IsarNative.jsObjectSet(jsObj, 'openText', object.openText);
    IsarNative.jsObjectSet(jsObj, 'province', object.province);
    IsarNative.jsObjectSet(jsObj, 'region', object.region);
    IsarNative.jsObjectSet(jsObj, 'savingsAdult', object.savingsAdult);
    IsarNative.jsObjectSet(jsObj, 'savingsChild', object.savingsChild);
    IsarNative.jsObjectSet(jsObj, 'strollerFriendly', object.strollerFriendly);
    IsarNative.jsObjectSet(jsObj, 'tavernNear', object.tavernNear);
    IsarNative.jsObjectSet(jsObj, 'telephone', object.telephone);
    IsarNative.jsObjectSet(jsObj, 'topLocation', object.topLocation);
    IsarNative.jsObjectSet(jsObj, 'travelDirections', object.travelDirections);
    IsarNative.jsObjectSet(jsObj, 'website', object.website);
    IsarNative.jsObjectSet(jsObj, 'websiteId', object.websiteId);
    IsarNative.jsObjectSet(
        jsObj, 'wheelchairFriendly', object.wheelchairFriendly);
    IsarNative.jsObjectSet(jsObj, 'year', object.year);
    return jsObj;
  }

  @override
  Location deserialize(IsarCollection<Location> collection, dynamic jsObj) {
    final object = Location();
    object.addressCity = IsarNative.jsObjectGet(jsObj, 'addressCity') ?? '';
    object.addressStreet = IsarNative.jsObjectGet(jsObj, 'addressStreet') ?? '';
    object.addressZip = IsarNative.jsObjectGet(jsObj, 'addressZip') ?? '';
    object.apiId =
        IsarNative.jsObjectGet(jsObj, 'apiId') ?? double.negativeInfinity;
    object.badWeather = IsarNative.jsObjectGet(jsObj, 'badWeather') ?? false;
    object.bookletNumber = IsarNative.jsObjectGet(jsObj, 'bookletNumber') ??
        double.negativeInfinity;
    object.category =
        IsarNative.jsObjectGet(jsObj, 'category') ?? double.negativeInfinity;
    object.changeIndex =
        IsarNative.jsObjectGet(jsObj, 'changeIndex') ?? double.negativeInfinity;
    object.changedDate = IsarNative.jsObjectGet(jsObj, 'changedDate') ?? '';
    object.childFriendly =
        IsarNative.jsObjectGet(jsObj, 'childFriendly') ?? false;
    object.description = IsarNative.jsObjectGet(jsObj, 'description') ?? '';
    object.dogAllowed = IsarNative.jsObjectGet(jsObj, 'dogAllowed') ?? false;
    object.email = IsarNative.jsObjectGet(jsObj, 'email') ?? '';
    object.entryText = IsarNative.jsObjectGet(jsObj, 'entryText') ?? '';
    object.favorit = IsarNative.jsObjectGet(jsObj, 'favorit') ?? false;
    object.fax = IsarNative.jsObjectGet(jsObj, 'fax') ?? '';
    object.groupsAccepted =
        IsarNative.jsObjectGet(jsObj, 'groupsAccepted') ?? false;
    object.hint = IsarNative.jsObjectGet(jsObj, 'hint') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
    object.latitude =
        IsarNative.jsObjectGet(jsObj, 'latitude') ?? double.negativeInfinity;
    object.longitude =
        IsarNative.jsObjectGet(jsObj, 'longitude') ?? double.negativeInfinity;
    object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
    object.openInWinter =
        IsarNative.jsObjectGet(jsObj, 'openInWinter') ?? false;
    object.openText = IsarNative.jsObjectGet(jsObj, 'openText') ?? '';
    object.province =
        IsarNative.jsObjectGet(jsObj, 'province') ?? double.negativeInfinity;
    object.region =
        IsarNative.jsObjectGet(jsObj, 'region') ?? double.negativeInfinity;
    object.savingsAdult = IsarNative.jsObjectGet(jsObj, 'savingsAdult') ?? '';
    object.savingsChild = IsarNative.jsObjectGet(jsObj, 'savingsChild') ?? '';
    object.strollerFriendly =
        IsarNative.jsObjectGet(jsObj, 'strollerFriendly') ?? false;
    object.tavernNear = IsarNative.jsObjectGet(jsObj, 'tavernNear') ?? false;
    object.telephone = IsarNative.jsObjectGet(jsObj, 'telephone') ?? '';
    object.topLocation = IsarNative.jsObjectGet(jsObj, 'topLocation') ?? false;
    object.travelDirections =
        IsarNative.jsObjectGet(jsObj, 'travelDirections') ?? '';
    object.website = IsarNative.jsObjectGet(jsObj, 'website') ?? '';
    object.websiteId =
        IsarNative.jsObjectGet(jsObj, 'websiteId') ?? double.negativeInfinity;
    object.wheelchairFriendly =
        IsarNative.jsObjectGet(jsObj, 'wheelchairFriendly') ?? false;
    object.year =
        IsarNative.jsObjectGet(jsObj, 'year') ?? double.negativeInfinity;
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'addressCity':
        return (IsarNative.jsObjectGet(jsObj, 'addressCity') ?? '') as P;
      case 'addressStreet':
        return (IsarNative.jsObjectGet(jsObj, 'addressStreet') ?? '') as P;
      case 'addressZip':
        return (IsarNative.jsObjectGet(jsObj, 'addressZip') ?? '') as P;
      case 'apiId':
        return (IsarNative.jsObjectGet(jsObj, 'apiId') ??
            double.negativeInfinity) as P;
      case 'badWeather':
        return (IsarNative.jsObjectGet(jsObj, 'badWeather') ?? false) as P;
      case 'bookletNumber':
        return (IsarNative.jsObjectGet(jsObj, 'bookletNumber') ??
            double.negativeInfinity) as P;
      case 'category':
        return (IsarNative.jsObjectGet(jsObj, 'category') ??
            double.negativeInfinity) as P;
      case 'changeIndex':
        return (IsarNative.jsObjectGet(jsObj, 'changeIndex') ??
            double.negativeInfinity) as P;
      case 'changedDate':
        return (IsarNative.jsObjectGet(jsObj, 'changedDate') ?? '') as P;
      case 'childFriendly':
        return (IsarNative.jsObjectGet(jsObj, 'childFriendly') ?? false) as P;
      case 'description':
        return (IsarNative.jsObjectGet(jsObj, 'description') ?? '') as P;
      case 'dogAllowed':
        return (IsarNative.jsObjectGet(jsObj, 'dogAllowed') ?? false) as P;
      case 'email':
        return (IsarNative.jsObjectGet(jsObj, 'email') ?? '') as P;
      case 'entryText':
        return (IsarNative.jsObjectGet(jsObj, 'entryText') ?? '') as P;
      case 'favorit':
        return (IsarNative.jsObjectGet(jsObj, 'favorit') ?? false) as P;
      case 'fax':
        return (IsarNative.jsObjectGet(jsObj, 'fax') ?? '') as P;
      case 'groupsAccepted':
        return (IsarNative.jsObjectGet(jsObj, 'groupsAccepted') ?? false) as P;
      case 'hint':
        return (IsarNative.jsObjectGet(jsObj, 'hint') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
            as P;
      case 'latitude':
        return (IsarNative.jsObjectGet(jsObj, 'latitude') ??
            double.negativeInfinity) as P;
      case 'longitude':
        return (IsarNative.jsObjectGet(jsObj, 'longitude') ??
            double.negativeInfinity) as P;
      case 'name':
        return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
      case 'openInWinter':
        return (IsarNative.jsObjectGet(jsObj, 'openInWinter') ?? false) as P;
      case 'openText':
        return (IsarNative.jsObjectGet(jsObj, 'openText') ?? '') as P;
      case 'province':
        return (IsarNative.jsObjectGet(jsObj, 'province') ??
            double.negativeInfinity) as P;
      case 'region':
        return (IsarNative.jsObjectGet(jsObj, 'region') ??
            double.negativeInfinity) as P;
      case 'savingsAdult':
        return (IsarNative.jsObjectGet(jsObj, 'savingsAdult') ?? '') as P;
      case 'savingsChild':
        return (IsarNative.jsObjectGet(jsObj, 'savingsChild') ?? '') as P;
      case 'strollerFriendly':
        return (IsarNative.jsObjectGet(jsObj, 'strollerFriendly') ?? false)
            as P;
      case 'tavernNear':
        return (IsarNative.jsObjectGet(jsObj, 'tavernNear') ?? false) as P;
      case 'telephone':
        return (IsarNative.jsObjectGet(jsObj, 'telephone') ?? '') as P;
      case 'topLocation':
        return (IsarNative.jsObjectGet(jsObj, 'topLocation') ?? false) as P;
      case 'travelDirections':
        return (IsarNative.jsObjectGet(jsObj, 'travelDirections') ?? '') as P;
      case 'website':
        return (IsarNative.jsObjectGet(jsObj, 'website') ?? '') as P;
      case 'websiteId':
        return (IsarNative.jsObjectGet(jsObj, 'websiteId') ??
            double.negativeInfinity) as P;
      case 'wheelchairFriendly':
        return (IsarNative.jsObjectGet(jsObj, 'wheelchairFriendly') ?? false)
            as P;
      case 'year':
        return (IsarNative.jsObjectGet(jsObj, 'year') ??
            double.negativeInfinity) as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Location object) {}
}

class _LocationNativeAdapter extends IsarNativeTypeAdapter<Location> {
  const _LocationNativeAdapter();

  @override
  void serialize(IsarCollection<Location> collection, IsarRawObject rawObj,
      Location object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.addressCity;
    final _addressCity = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_addressCity.length) as int;
    final value1 = object.addressStreet;
    final _addressStreet = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_addressStreet.length) as int;
    final value2 = object.addressZip;
    final _addressZip = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_addressZip.length) as int;
    final value3 = object.apiId;
    final _apiId = value3;
    final value4 = object.badWeather;
    final _badWeather = value4;
    final value5 = object.bookletNumber;
    final _bookletNumber = value5;
    final value6 = object.category;
    final _category = value6;
    final value7 = object.changeIndex;
    final _changeIndex = value7;
    final value8 = object.changedDate;
    final _changedDate = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_changedDate.length) as int;
    final value9 = object.childFriendly;
    final _childFriendly = value9;
    final value10 = object.description;
    final _description = IsarBinaryWriter.utf8Encoder.convert(value10);
    dynamicSize += (_description.length) as int;
    final value11 = object.dogAllowed;
    final _dogAllowed = value11;
    final value12 = object.email;
    final _email = IsarBinaryWriter.utf8Encoder.convert(value12);
    dynamicSize += (_email.length) as int;
    final value13 = object.entryText;
    final _entryText = IsarBinaryWriter.utf8Encoder.convert(value13);
    dynamicSize += (_entryText.length) as int;
    final value14 = object.favorit;
    final _favorit = value14;
    final value15 = object.fax;
    final _fax = IsarBinaryWriter.utf8Encoder.convert(value15);
    dynamicSize += (_fax.length) as int;
    final value16 = object.groupsAccepted;
    final _groupsAccepted = value16;
    final value17 = object.hint;
    final _hint = IsarBinaryWriter.utf8Encoder.convert(value17);
    dynamicSize += (_hint.length) as int;
    final value18 = object.latitude;
    final _latitude = value18;
    final value19 = object.longitude;
    final _longitude = value19;
    final value20 = object.name;
    final _name = IsarBinaryWriter.utf8Encoder.convert(value20);
    dynamicSize += (_name.length) as int;
    final value21 = object.openInWinter;
    final _openInWinter = value21;
    final value22 = object.openText;
    final _openText = IsarBinaryWriter.utf8Encoder.convert(value22);
    dynamicSize += (_openText.length) as int;
    final value23 = object.province;
    final _province = value23;
    final value24 = object.region;
    final _region = value24;
    final value25 = object.savingsAdult;
    final _savingsAdult = IsarBinaryWriter.utf8Encoder.convert(value25);
    dynamicSize += (_savingsAdult.length) as int;
    final value26 = object.savingsChild;
    final _savingsChild = IsarBinaryWriter.utf8Encoder.convert(value26);
    dynamicSize += (_savingsChild.length) as int;
    final value27 = object.strollerFriendly;
    final _strollerFriendly = value27;
    final value28 = object.tavernNear;
    final _tavernNear = value28;
    final value29 = object.telephone;
    final _telephone = IsarBinaryWriter.utf8Encoder.convert(value29);
    dynamicSize += (_telephone.length) as int;
    final value30 = object.topLocation;
    final _topLocation = value30;
    final value31 = object.travelDirections;
    final _travelDirections = IsarBinaryWriter.utf8Encoder.convert(value31);
    dynamicSize += (_travelDirections.length) as int;
    final value32 = object.website;
    final _website = IsarBinaryWriter.utf8Encoder.convert(value32);
    dynamicSize += (_website.length) as int;
    final value33 = object.websiteId;
    final _websiteId = value33;
    final value34 = object.wheelchairFriendly;
    final _wheelchairFriendly = value34;
    final value35 = object.year;
    final _year = value35;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _addressCity);
    writer.writeBytes(offsets[1], _addressStreet);
    writer.writeBytes(offsets[2], _addressZip);
    writer.writeLong(offsets[3], _apiId);
    writer.writeBool(offsets[4], _badWeather);
    writer.writeLong(offsets[5], _bookletNumber);
    writer.writeLong(offsets[6], _category);
    writer.writeLong(offsets[7], _changeIndex);
    writer.writeBytes(offsets[8], _changedDate);
    writer.writeBool(offsets[9], _childFriendly);
    writer.writeBytes(offsets[10], _description);
    writer.writeBool(offsets[11], _dogAllowed);
    writer.writeBytes(offsets[12], _email);
    writer.writeBytes(offsets[13], _entryText);
    writer.writeBool(offsets[14], _favorit);
    writer.writeBytes(offsets[15], _fax);
    writer.writeBool(offsets[16], _groupsAccepted);
    writer.writeBytes(offsets[17], _hint);
    writer.writeDouble(offsets[18], _latitude);
    writer.writeDouble(offsets[19], _longitude);
    writer.writeBytes(offsets[20], _name);
    writer.writeBool(offsets[21], _openInWinter);
    writer.writeBytes(offsets[22], _openText);
    writer.writeLong(offsets[23], _province);
    writer.writeLong(offsets[24], _region);
    writer.writeBytes(offsets[25], _savingsAdult);
    writer.writeBytes(offsets[26], _savingsChild);
    writer.writeBool(offsets[27], _strollerFriendly);
    writer.writeBool(offsets[28], _tavernNear);
    writer.writeBytes(offsets[29], _telephone);
    writer.writeBool(offsets[30], _topLocation);
    writer.writeBytes(offsets[31], _travelDirections);
    writer.writeBytes(offsets[32], _website);
    writer.writeLong(offsets[33], _websiteId);
    writer.writeBool(offsets[34], _wheelchairFriendly);
    writer.writeLong(offsets[35], _year);
  }

  @override
  Location deserialize(IsarCollection<Location> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Location();
    object.addressCity = reader.readString(offsets[0]);
    object.addressStreet = reader.readString(offsets[1]);
    object.addressZip = reader.readString(offsets[2]);
    object.apiId = reader.readLong(offsets[3]);
    object.badWeather = reader.readBool(offsets[4]);
    object.bookletNumber = reader.readLong(offsets[5]);
    object.category = reader.readLong(offsets[6]);
    object.changeIndex = reader.readLong(offsets[7]);
    object.changedDate = reader.readString(offsets[8]);
    object.childFriendly = reader.readBool(offsets[9]);
    object.description = reader.readString(offsets[10]);
    object.dogAllowed = reader.readBool(offsets[11]);
    object.email = reader.readString(offsets[12]);
    object.entryText = reader.readString(offsets[13]);
    object.favorit = reader.readBool(offsets[14]);
    object.fax = reader.readString(offsets[15]);
    object.groupsAccepted = reader.readBool(offsets[16]);
    object.hint = reader.readString(offsets[17]);
    object.id = id;
    object.latitude = reader.readDouble(offsets[18]);
    object.longitude = reader.readDouble(offsets[19]);
    object.name = reader.readString(offsets[20]);
    object.openInWinter = reader.readBool(offsets[21]);
    object.openText = reader.readString(offsets[22]);
    object.province = reader.readLong(offsets[23]);
    object.region = reader.readLong(offsets[24]);
    object.savingsAdult = reader.readString(offsets[25]);
    object.savingsChild = reader.readString(offsets[26]);
    object.strollerFriendly = reader.readBool(offsets[27]);
    object.tavernNear = reader.readBool(offsets[28]);
    object.telephone = reader.readString(offsets[29]);
    object.topLocation = reader.readBool(offsets[30]);
    object.travelDirections = reader.readString(offsets[31]);
    object.website = reader.readString(offsets[32]);
    object.websiteId = reader.readLong(offsets[33]);
    object.wheelchairFriendly = reader.readBool(offsets[34]);
    object.year = reader.readLong(offsets[35]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readBool(offset)) as P;
      case 5:
        return (reader.readLong(offset)) as P;
      case 6:
        return (reader.readLong(offset)) as P;
      case 7:
        return (reader.readLong(offset)) as P;
      case 8:
        return (reader.readString(offset)) as P;
      case 9:
        return (reader.readBool(offset)) as P;
      case 10:
        return (reader.readString(offset)) as P;
      case 11:
        return (reader.readBool(offset)) as P;
      case 12:
        return (reader.readString(offset)) as P;
      case 13:
        return (reader.readString(offset)) as P;
      case 14:
        return (reader.readBool(offset)) as P;
      case 15:
        return (reader.readString(offset)) as P;
      case 16:
        return (reader.readBool(offset)) as P;
      case 17:
        return (reader.readString(offset)) as P;
      case 18:
        return (reader.readDouble(offset)) as P;
      case 19:
        return (reader.readDouble(offset)) as P;
      case 20:
        return (reader.readString(offset)) as P;
      case 21:
        return (reader.readBool(offset)) as P;
      case 22:
        return (reader.readString(offset)) as P;
      case 23:
        return (reader.readLong(offset)) as P;
      case 24:
        return (reader.readLong(offset)) as P;
      case 25:
        return (reader.readString(offset)) as P;
      case 26:
        return (reader.readString(offset)) as P;
      case 27:
        return (reader.readBool(offset)) as P;
      case 28:
        return (reader.readBool(offset)) as P;
      case 29:
        return (reader.readString(offset)) as P;
      case 30:
        return (reader.readBool(offset)) as P;
      case 31:
        return (reader.readString(offset)) as P;
      case 32:
        return (reader.readString(offset)) as P;
      case 33:
        return (reader.readLong(offset)) as P;
      case 34:
        return (reader.readBool(offset)) as P;
      case 35:
        return (reader.readLong(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Location object) {}
}

extension LocationQueryWhereSort on QueryBuilder<Location, Location, QWhere> {
  QueryBuilder<Location, Location, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }

  QueryBuilder<Location, Location, QAfterWhere> anyYear() {
    return addWhereClauseInternal(const WhereClause(indexName: 'year'));
  }
}

extension LocationQueryWhere on QueryBuilder<Location, Location, QWhereClause> {
  QueryBuilder<Location, Location, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Location, Location, QAfterWhereClause> idGreaterThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idLessThan(
    int id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> idBetween(
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

  QueryBuilder<Location, Location, QAfterWhereClause> yearEqualTo(int year) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      lower: [year],
      includeLower: true,
      upper: [year],
      includeUpper: true,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> yearNotEqualTo(int year) {
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

  QueryBuilder<Location, Location, QAfterWhereClause> yearGreaterThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      lower: [year],
      includeLower: include,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> yearLessThan(
    int year, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: 'year',
      upper: [year],
      includeUpper: include,
    ));
  }

  QueryBuilder<Location, Location, QAfterWhereClause> yearBetween(
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

extension LocationQueryFilter
    on QueryBuilder<Location, Location, QFilterCondition> {
  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      addressCityGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'addressCity',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressCity',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressCityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressCity',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      addressStreetGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'addressStreet',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      addressStreetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressStreet',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressStreetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressStreet',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'addressZip',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'addressZip',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> addressZipMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'addressZip',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> apiIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'apiId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> apiIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'apiId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> apiIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'apiId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> apiIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'apiId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> badWeatherEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'badWeather',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> bookletNumberEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bookletNumber',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      bookletNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bookletNumber',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> bookletNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bookletNumber',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> bookletNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bookletNumber',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> categoryEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'category',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> categoryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'category',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> categoryLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'category',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> categoryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'category',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changeIndexEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'changeIndex',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      changeIndexGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> changeIndexLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> changeIndexBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      changedDateGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'changedDate',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'changedDate',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> changedDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'changedDate',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> childFriendlyEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'childFriendly',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'description',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'description',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'description',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> dogAllowedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dogAllowed',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'entryText',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'entryText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> entryTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'entryText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> favoritEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'favorit',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fax',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fax',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> faxMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fax',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> groupsAcceptedEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'groupsAccepted',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hint',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hint',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> hintMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hint',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> latitudeGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'latitude',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latitudeLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'latitude',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> latitudeBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'latitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> longitudeGreaterThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'longitude',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> longitudeLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'longitude',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> longitudeBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'longitude',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openInWinterEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'openInWinter',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'openText',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'openText',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> openTextMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'openText',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> provinceEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'province',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> provinceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'province',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> provinceLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'province',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> provinceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'province',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> regionEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'region',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> regionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'region',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> regionLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'region',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> regionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'region',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      savingsAdultGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'savingsAdult',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      savingsAdultStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'savingsAdult',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsAdultMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'savingsAdult',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      savingsChildGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'savingsChild',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      savingsChildStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'savingsChild',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> savingsChildMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'savingsChild',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      strollerFriendlyEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'strollerFriendly',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> tavernNearEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tavernNear',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'telephone',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'telephone',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> telephoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'telephone',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> topLocationEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'topLocation',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'travelDirections',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'travelDirections',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      travelDirectionsMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'travelDirections',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'website',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'website',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'website',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteIdEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'websiteId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'websiteId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteIdLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'websiteId',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> websiteIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'websiteId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition>
      wheelchairFriendlyEqualTo(bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'wheelchairFriendly',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> yearEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'year',
      value: value,
    ));
  }

  QueryBuilder<Location, Location, QAfterFilterCondition> yearGreaterThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> yearLessThan(
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

  QueryBuilder<Location, Location, QAfterFilterCondition> yearBetween(
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

extension LocationQueryLinks
    on QueryBuilder<Location, Location, QFilterCondition> {}

extension LocationQueryWhereSortBy
    on QueryBuilder<Location, Location, QSortBy> {
  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressCity() {
    return addSortByInternal('addressCity', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressCityDesc() {
    return addSortByInternal('addressCity', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressStreet() {
    return addSortByInternal('addressStreet', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressStreetDesc() {
    return addSortByInternal('addressStreet', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressZip() {
    return addSortByInternal('addressZip', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByAddressZipDesc() {
    return addSortByInternal('addressZip', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByApiId() {
    return addSortByInternal('apiId', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByApiIdDesc() {
    return addSortByInternal('apiId', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByBadWeather() {
    return addSortByInternal('badWeather', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByBadWeatherDesc() {
    return addSortByInternal('badWeather', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByBookletNumber() {
    return addSortByInternal('bookletNumber', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByBookletNumberDesc() {
    return addSortByInternal('bookletNumber', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChangeIndex() {
    return addSortByInternal('changeIndex', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChangeIndexDesc() {
    return addSortByInternal('changeIndex', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChangedDate() {
    return addSortByInternal('changedDate', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChangedDateDesc() {
    return addSortByInternal('changedDate', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChildFriendly() {
    return addSortByInternal('childFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByChildFriendlyDesc() {
    return addSortByInternal('childFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByDogAllowed() {
    return addSortByInternal('dogAllowed', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByDogAllowedDesc() {
    return addSortByInternal('dogAllowed', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByEntryText() {
    return addSortByInternal('entryText', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByEntryTextDesc() {
    return addSortByInternal('entryText', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByFavorit() {
    return addSortByInternal('favorit', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByFavoritDesc() {
    return addSortByInternal('favorit', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByFax() {
    return addSortByInternal('fax', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByFaxDesc() {
    return addSortByInternal('fax', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByGroupsAccepted() {
    return addSortByInternal('groupsAccepted', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByGroupsAcceptedDesc() {
    return addSortByInternal('groupsAccepted', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByOpenInWinter() {
    return addSortByInternal('openInWinter', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByOpenInWinterDesc() {
    return addSortByInternal('openInWinter', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByOpenText() {
    return addSortByInternal('openText', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByOpenTextDesc() {
    return addSortByInternal('openText', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByProvince() {
    return addSortByInternal('province', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByProvinceDesc() {
    return addSortByInternal('province', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByRegion() {
    return addSortByInternal('region', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByRegionDesc() {
    return addSortByInternal('region', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortBySavingsAdult() {
    return addSortByInternal('savingsAdult', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortBySavingsAdultDesc() {
    return addSortByInternal('savingsAdult', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortBySavingsChild() {
    return addSortByInternal('savingsChild', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortBySavingsChildDesc() {
    return addSortByInternal('savingsChild', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByStrollerFriendly() {
    return addSortByInternal('strollerFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByStrollerFriendlyDesc() {
    return addSortByInternal('strollerFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTavernNear() {
    return addSortByInternal('tavernNear', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTavernNearDesc() {
    return addSortByInternal('tavernNear', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTelephone() {
    return addSortByInternal('telephone', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTelephoneDesc() {
    return addSortByInternal('telephone', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTopLocation() {
    return addSortByInternal('topLocation', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTopLocationDesc() {
    return addSortByInternal('topLocation', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTravelDirections() {
    return addSortByInternal('travelDirections', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByTravelDirectionsDesc() {
    return addSortByInternal('travelDirections', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByWebsite() {
    return addSortByInternal('website', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByWebsiteDesc() {
    return addSortByInternal('website', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByWebsiteId() {
    return addSortByInternal('websiteId', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByWebsiteIdDesc() {
    return addSortByInternal('websiteId', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByWheelchairFriendly() {
    return addSortByInternal('wheelchairFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy>
      sortByWheelchairFriendlyDesc() {
    return addSortByInternal('wheelchairFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> sortByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension LocationQueryWhereSortThenBy
    on QueryBuilder<Location, Location, QSortThenBy> {
  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressCity() {
    return addSortByInternal('addressCity', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressCityDesc() {
    return addSortByInternal('addressCity', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressStreet() {
    return addSortByInternal('addressStreet', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressStreetDesc() {
    return addSortByInternal('addressStreet', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressZip() {
    return addSortByInternal('addressZip', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByAddressZipDesc() {
    return addSortByInternal('addressZip', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByApiId() {
    return addSortByInternal('apiId', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByApiIdDesc() {
    return addSortByInternal('apiId', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByBadWeather() {
    return addSortByInternal('badWeather', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByBadWeatherDesc() {
    return addSortByInternal('badWeather', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByBookletNumber() {
    return addSortByInternal('bookletNumber', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByBookletNumberDesc() {
    return addSortByInternal('bookletNumber', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByCategory() {
    return addSortByInternal('category', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByCategoryDesc() {
    return addSortByInternal('category', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChangeIndex() {
    return addSortByInternal('changeIndex', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChangeIndexDesc() {
    return addSortByInternal('changeIndex', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChangedDate() {
    return addSortByInternal('changedDate', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChangedDateDesc() {
    return addSortByInternal('changedDate', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChildFriendly() {
    return addSortByInternal('childFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByChildFriendlyDesc() {
    return addSortByInternal('childFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByDescription() {
    return addSortByInternal('description', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('description', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByDogAllowed() {
    return addSortByInternal('dogAllowed', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByDogAllowedDesc() {
    return addSortByInternal('dogAllowed', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByEntryText() {
    return addSortByInternal('entryText', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByEntryTextDesc() {
    return addSortByInternal('entryText', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByFavorit() {
    return addSortByInternal('favorit', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByFavoritDesc() {
    return addSortByInternal('favorit', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByFax() {
    return addSortByInternal('fax', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByFaxDesc() {
    return addSortByInternal('fax', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByGroupsAccepted() {
    return addSortByInternal('groupsAccepted', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByGroupsAcceptedDesc() {
    return addSortByInternal('groupsAccepted', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByHint() {
    return addSortByInternal('hint', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByHintDesc() {
    return addSortByInternal('hint', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLatitude() {
    return addSortByInternal('latitude', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLatitudeDesc() {
    return addSortByInternal('latitude', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLongitude() {
    return addSortByInternal('longitude', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByLongitudeDesc() {
    return addSortByInternal('longitude', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByOpenInWinter() {
    return addSortByInternal('openInWinter', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByOpenInWinterDesc() {
    return addSortByInternal('openInWinter', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByOpenText() {
    return addSortByInternal('openText', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByOpenTextDesc() {
    return addSortByInternal('openText', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByProvince() {
    return addSortByInternal('province', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByProvinceDesc() {
    return addSortByInternal('province', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByRegion() {
    return addSortByInternal('region', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByRegionDesc() {
    return addSortByInternal('region', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenBySavingsAdult() {
    return addSortByInternal('savingsAdult', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenBySavingsAdultDesc() {
    return addSortByInternal('savingsAdult', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenBySavingsChild() {
    return addSortByInternal('savingsChild', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenBySavingsChildDesc() {
    return addSortByInternal('savingsChild', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByStrollerFriendly() {
    return addSortByInternal('strollerFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByStrollerFriendlyDesc() {
    return addSortByInternal('strollerFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTavernNear() {
    return addSortByInternal('tavernNear', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTavernNearDesc() {
    return addSortByInternal('tavernNear', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTelephone() {
    return addSortByInternal('telephone', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTelephoneDesc() {
    return addSortByInternal('telephone', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTopLocation() {
    return addSortByInternal('topLocation', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTopLocationDesc() {
    return addSortByInternal('topLocation', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTravelDirections() {
    return addSortByInternal('travelDirections', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByTravelDirectionsDesc() {
    return addSortByInternal('travelDirections', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByWebsite() {
    return addSortByInternal('website', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByWebsiteDesc() {
    return addSortByInternal('website', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByWebsiteId() {
    return addSortByInternal('websiteId', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByWebsiteIdDesc() {
    return addSortByInternal('websiteId', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByWheelchairFriendly() {
    return addSortByInternal('wheelchairFriendly', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy>
      thenByWheelchairFriendlyDesc() {
    return addSortByInternal('wheelchairFriendly', Sort.desc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByYear() {
    return addSortByInternal('year', Sort.asc);
  }

  QueryBuilder<Location, Location, QAfterSortBy> thenByYearDesc() {
    return addSortByInternal('year', Sort.desc);
  }
}

extension LocationQueryWhereDistinct
    on QueryBuilder<Location, Location, QDistinct> {
  QueryBuilder<Location, Location, QDistinct> distinctByAddressCity(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('addressCity', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByAddressStreet(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('addressStreet', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByAddressZip(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('addressZip', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByApiId() {
    return addDistinctByInternal('apiId');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByBadWeather() {
    return addDistinctByInternal('badWeather');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByBookletNumber() {
    return addDistinctByInternal('bookletNumber');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByCategory() {
    return addDistinctByInternal('category');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByChangeIndex() {
    return addDistinctByInternal('changeIndex');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByChangedDate(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('changedDate', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByChildFriendly() {
    return addDistinctByInternal('childFriendly');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('description', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByDogAllowed() {
    return addDistinctByInternal('dogAllowed');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByEntryText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('entryText', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByFavorit() {
    return addDistinctByInternal('favorit');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByFax(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fax', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByGroupsAccepted() {
    return addDistinctByInternal('groupsAccepted');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByHint(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hint', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByLatitude() {
    return addDistinctByInternal('latitude');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByLongitude() {
    return addDistinctByInternal('longitude');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByOpenInWinter() {
    return addDistinctByInternal('openInWinter');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByOpenText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('openText', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByProvince() {
    return addDistinctByInternal('province');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByRegion() {
    return addDistinctByInternal('region');
  }

  QueryBuilder<Location, Location, QDistinct> distinctBySavingsAdult(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('savingsAdult', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctBySavingsChild(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('savingsChild', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByStrollerFriendly() {
    return addDistinctByInternal('strollerFriendly');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByTavernNear() {
    return addDistinctByInternal('tavernNear');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByTelephone(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('telephone', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByTopLocation() {
    return addDistinctByInternal('topLocation');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByTravelDirections(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('travelDirections',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByWebsite(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('website', caseSensitive: caseSensitive);
  }

  QueryBuilder<Location, Location, QDistinct> distinctByWebsiteId() {
    return addDistinctByInternal('websiteId');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByWheelchairFriendly() {
    return addDistinctByInternal('wheelchairFriendly');
  }

  QueryBuilder<Location, Location, QDistinct> distinctByYear() {
    return addDistinctByInternal('year');
  }
}

extension LocationQueryProperty
    on QueryBuilder<Location, Location, QQueryProperty> {
  QueryBuilder<Location, String, QQueryOperations> addressCityProperty() {
    return addPropertyNameInternal('addressCity');
  }

  QueryBuilder<Location, String, QQueryOperations> addressStreetProperty() {
    return addPropertyNameInternal('addressStreet');
  }

  QueryBuilder<Location, String, QQueryOperations> addressZipProperty() {
    return addPropertyNameInternal('addressZip');
  }

  QueryBuilder<Location, int, QQueryOperations> apiIdProperty() {
    return addPropertyNameInternal('apiId');
  }

  QueryBuilder<Location, bool, QQueryOperations> badWeatherProperty() {
    return addPropertyNameInternal('badWeather');
  }

  QueryBuilder<Location, int, QQueryOperations> bookletNumberProperty() {
    return addPropertyNameInternal('bookletNumber');
  }

  QueryBuilder<Location, int, QQueryOperations> categoryProperty() {
    return addPropertyNameInternal('category');
  }

  QueryBuilder<Location, int, QQueryOperations> changeIndexProperty() {
    return addPropertyNameInternal('changeIndex');
  }

  QueryBuilder<Location, String, QQueryOperations> changedDateProperty() {
    return addPropertyNameInternal('changedDate');
  }

  QueryBuilder<Location, bool, QQueryOperations> childFriendlyProperty() {
    return addPropertyNameInternal('childFriendly');
  }

  QueryBuilder<Location, String, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('description');
  }

  QueryBuilder<Location, bool, QQueryOperations> dogAllowedProperty() {
    return addPropertyNameInternal('dogAllowed');
  }

  QueryBuilder<Location, String, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<Location, String, QQueryOperations> entryTextProperty() {
    return addPropertyNameInternal('entryText');
  }

  QueryBuilder<Location, bool, QQueryOperations> favoritProperty() {
    return addPropertyNameInternal('favorit');
  }

  QueryBuilder<Location, String, QQueryOperations> faxProperty() {
    return addPropertyNameInternal('fax');
  }

  QueryBuilder<Location, bool, QQueryOperations> groupsAcceptedProperty() {
    return addPropertyNameInternal('groupsAccepted');
  }

  QueryBuilder<Location, String, QQueryOperations> hintProperty() {
    return addPropertyNameInternal('hint');
  }

  QueryBuilder<Location, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Location, double, QQueryOperations> latitudeProperty() {
    return addPropertyNameInternal('latitude');
  }

  QueryBuilder<Location, double, QQueryOperations> longitudeProperty() {
    return addPropertyNameInternal('longitude');
  }

  QueryBuilder<Location, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Location, bool, QQueryOperations> openInWinterProperty() {
    return addPropertyNameInternal('openInWinter');
  }

  QueryBuilder<Location, String, QQueryOperations> openTextProperty() {
    return addPropertyNameInternal('openText');
  }

  QueryBuilder<Location, int, QQueryOperations> provinceProperty() {
    return addPropertyNameInternal('province');
  }

  QueryBuilder<Location, int, QQueryOperations> regionProperty() {
    return addPropertyNameInternal('region');
  }

  QueryBuilder<Location, String, QQueryOperations> savingsAdultProperty() {
    return addPropertyNameInternal('savingsAdult');
  }

  QueryBuilder<Location, String, QQueryOperations> savingsChildProperty() {
    return addPropertyNameInternal('savingsChild');
  }

  QueryBuilder<Location, bool, QQueryOperations> strollerFriendlyProperty() {
    return addPropertyNameInternal('strollerFriendly');
  }

  QueryBuilder<Location, bool, QQueryOperations> tavernNearProperty() {
    return addPropertyNameInternal('tavernNear');
  }

  QueryBuilder<Location, String, QQueryOperations> telephoneProperty() {
    return addPropertyNameInternal('telephone');
  }

  QueryBuilder<Location, bool, QQueryOperations> topLocationProperty() {
    return addPropertyNameInternal('topLocation');
  }

  QueryBuilder<Location, String, QQueryOperations> travelDirectionsProperty() {
    return addPropertyNameInternal('travelDirections');
  }

  QueryBuilder<Location, String, QQueryOperations> websiteProperty() {
    return addPropertyNameInternal('website');
  }

  QueryBuilder<Location, int, QQueryOperations> websiteIdProperty() {
    return addPropertyNameInternal('websiteId');
  }

  QueryBuilder<Location, bool, QQueryOperations> wheelchairFriendlyProperty() {
    return addPropertyNameInternal('wheelchairFriendly');
  }

  QueryBuilder<Location, int, QQueryOperations> yearProperty() {
    return addPropertyNameInternal('year');
  }
}
