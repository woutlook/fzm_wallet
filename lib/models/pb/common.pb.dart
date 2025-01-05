//
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class Reply extends $pb.GeneratedMessage {
  factory Reply({
    $core.bool? isOk,
    $core.List<$core.int>? msg,
  }) {
    final $result = create();
    if (isOk != null) {
      $result.isOk = isOk;
    }
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  Reply._() : super();
  factory Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isOk', protoName: 'isOk')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'msg', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Reply clone() => Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Reply copyWith(void Function(Reply) updates) => super.copyWith((message) => updates(message as Reply)) as Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Reply create() => Reply._();
  Reply createEmptyInstance() => create();
  static $pb.PbList<Reply> createRepeated() => $pb.PbList<Reply>();
  @$core.pragma('dart2js:noInline')
  static Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Reply>(create);
  static Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isOk => $_getBF(0);
  @$pb.TagNumber(1)
  set isOk($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsOk() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsOk() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get msg => $_getN(1);
  @$pb.TagNumber(2)
  set msg($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class ReqString extends $pb.GeneratedMessage {
  factory ReqString({
    $core.String? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  ReqString._() : super();
  factory ReqString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqString', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqString clone() => ReqString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqString copyWith(void Function(ReqString) updates) => super.copyWith((message) => updates(message as ReqString)) as ReqString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqString create() => ReqString._();
  ReqString createEmptyInstance() => create();
  static $pb.PbList<ReqString> createRepeated() => $pb.PbList<ReqString>();
  @$core.pragma('dart2js:noInline')
  static ReqString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqString>(create);
  static ReqString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class ReqMultiStrings extends $pb.GeneratedMessage {
  factory ReqMultiStrings({
    $core.Iterable<$core.String>? datas,
  }) {
    final $result = create();
    if (datas != null) {
      $result.datas.addAll(datas);
    }
    return $result;
  }
  ReqMultiStrings._() : super();
  factory ReqMultiStrings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqMultiStrings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqMultiStrings', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'datas')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqMultiStrings clone() => ReqMultiStrings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqMultiStrings copyWith(void Function(ReqMultiStrings) updates) => super.copyWith((message) => updates(message as ReqMultiStrings)) as ReqMultiStrings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqMultiStrings create() => ReqMultiStrings._();
  ReqMultiStrings createEmptyInstance() => create();
  static $pb.PbList<ReqMultiStrings> createRepeated() => $pb.PbList<ReqMultiStrings>();
  @$core.pragma('dart2js:noInline')
  static ReqMultiStrings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqMultiStrings>(create);
  static ReqMultiStrings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get datas => $_getList(0);
}

class ReplyString extends $pb.GeneratedMessage {
  factory ReplyString({
    $core.String? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  ReplyString._() : super();
  factory ReplyString.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyString.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyString', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyString clone() => ReplyString()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyString copyWith(void Function(ReplyString) updates) => super.copyWith((message) => updates(message as ReplyString)) as ReplyString;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyString create() => ReplyString._();
  ReplyString createEmptyInstance() => create();
  static $pb.PbList<ReplyString> createRepeated() => $pb.PbList<ReplyString>();
  @$core.pragma('dart2js:noInline')
  static ReplyString getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyString>(create);
  static ReplyString? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get data => $_getSZ(0);
  @$pb.TagNumber(1)
  set data($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class ReplyStrings extends $pb.GeneratedMessage {
  factory ReplyStrings({
    $core.Iterable<$core.String>? datas,
  }) {
    final $result = create();
    if (datas != null) {
      $result.datas.addAll(datas);
    }
    return $result;
  }
  ReplyStrings._() : super();
  factory ReplyStrings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyStrings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyStrings', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'datas')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyStrings clone() => ReplyStrings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyStrings copyWith(void Function(ReplyStrings) updates) => super.copyWith((message) => updates(message as ReplyStrings)) as ReplyStrings;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyStrings create() => ReplyStrings._();
  ReplyStrings createEmptyInstance() => create();
  static $pb.PbList<ReplyStrings> createRepeated() => $pb.PbList<ReplyStrings>();
  @$core.pragma('dart2js:noInline')
  static ReplyStrings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyStrings>(create);
  static ReplyStrings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get datas => $_getList(0);
}

class ReqInt extends $pb.GeneratedMessage {
  factory ReqInt({
    $fixnum.Int64? height,
  }) {
    final $result = create();
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  ReqInt._() : super();
  factory ReqInt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqInt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqInt', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'height')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqInt clone() => ReqInt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqInt copyWith(void Function(ReqInt) updates) => super.copyWith((message) => updates(message as ReqInt)) as ReqInt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqInt create() => ReqInt._();
  ReqInt createEmptyInstance() => create();
  static $pb.PbList<ReqInt> createRepeated() => $pb.PbList<ReqInt>();
  @$core.pragma('dart2js:noInline')
  static ReqInt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqInt>(create);
  static ReqInt? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);
}

class Int64 extends $pb.GeneratedMessage {
  factory Int64({
    $fixnum.Int64? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Int64._() : super();
  factory Int64.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Int64.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Int64', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'data')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Int64 clone() => Int64()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Int64 copyWith(void Function(Int64) updates) => super.copyWith((message) => updates(message as Int64)) as Int64;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Int64 create() => Int64._();
  Int64 createEmptyInstance() => create();
  static $pb.PbList<Int64> createRepeated() => $pb.PbList<Int64>();
  @$core.pragma('dart2js:noInline')
  static Int64 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Int64>(create);
  static Int64? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get data => $_getI64(0);
  @$pb.TagNumber(1)
  set data($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class ReqHash extends $pb.GeneratedMessage {
  factory ReqHash({
    $core.List<$core.int>? hash,
    $core.bool? upgrade,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (upgrade != null) {
      $result.upgrade = upgrade;
    }
    return $result;
  }
  ReqHash._() : super();
  factory ReqHash.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqHash.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqHash', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aOB(2, _omitFieldNames ? '' : 'upgrade')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqHash clone() => ReqHash()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqHash copyWith(void Function(ReqHash) updates) => super.copyWith((message) => updates(message as ReqHash)) as ReqHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqHash create() => ReqHash._();
  ReqHash createEmptyInstance() => create();
  static $pb.PbList<ReqHash> createRepeated() => $pb.PbList<ReqHash>();
  @$core.pragma('dart2js:noInline')
  static ReqHash getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqHash>(create);
  static ReqHash? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get upgrade => $_getBF(1);
  @$pb.TagNumber(2)
  set upgrade($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUpgrade() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpgrade() => clearField(2);
}

class ReplyHash extends $pb.GeneratedMessage {
  factory ReplyHash({
    $core.List<$core.int>? hash,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    return $result;
  }
  ReplyHash._() : super();
  factory ReplyHash.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyHash.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyHash', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyHash clone() => ReplyHash()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyHash copyWith(void Function(ReplyHash) updates) => super.copyWith((message) => updates(message as ReplyHash)) as ReplyHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyHash create() => ReplyHash._();
  ReplyHash createEmptyInstance() => create();
  static $pb.PbList<ReplyHash> createRepeated() => $pb.PbList<ReplyHash>();
  @$core.pragma('dart2js:noInline')
  static ReplyHash getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyHash>(create);
  static ReplyHash? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);
}

class ReqNil extends $pb.GeneratedMessage {
  factory ReqNil() => create();
  ReqNil._() : super();
  factory ReqNil.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqNil.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqNil', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqNil clone() => ReqNil()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqNil copyWith(void Function(ReqNil) updates) => super.copyWith((message) => updates(message as ReqNil)) as ReqNil;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqNil create() => ReqNil._();
  ReqNil createEmptyInstance() => create();
  static $pb.PbList<ReqNil> createRepeated() => $pb.PbList<ReqNil>();
  @$core.pragma('dart2js:noInline')
  static ReqNil getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqNil>(create);
  static ReqNil? _defaultInstance;
}

class ReqBytes extends $pb.GeneratedMessage {
  factory ReqBytes({
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  ReqBytes._() : super();
  factory ReqBytes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqBytes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqBytes', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqBytes clone() => ReqBytes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqBytes copyWith(void Function(ReqBytes) updates) => super.copyWith((message) => updates(message as ReqBytes)) as ReqBytes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqBytes create() => ReqBytes._();
  ReqBytes createEmptyInstance() => create();
  static $pb.PbList<ReqBytes> createRepeated() => $pb.PbList<ReqBytes>();
  @$core.pragma('dart2js:noInline')
  static ReqBytes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqBytes>(create);
  static ReqBytes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class ReqHashes extends $pb.GeneratedMessage {
  factory ReqHashes({
    $core.Iterable<$core.List<$core.int>>? hashes,
  }) {
    final $result = create();
    if (hashes != null) {
      $result.hashes.addAll(hashes);
    }
    return $result;
  }
  ReqHashes._() : super();
  factory ReqHashes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqHashes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqHashes', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hashes', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqHashes clone() => ReqHashes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqHashes copyWith(void Function(ReqHashes) updates) => super.copyWith((message) => updates(message as ReqHashes)) as ReqHashes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqHashes create() => ReqHashes._();
  ReqHashes createEmptyInstance() => create();
  static $pb.PbList<ReqHashes> createRepeated() => $pb.PbList<ReqHashes>();
  @$core.pragma('dart2js:noInline')
  static ReqHashes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqHashes>(create);
  static ReqHashes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get hashes => $_getList(0);
}

class ReplyHashes extends $pb.GeneratedMessage {
  factory ReplyHashes({
    $core.Iterable<$core.List<$core.int>>? hashes,
  }) {
    final $result = create();
    if (hashes != null) {
      $result.hashes.addAll(hashes);
    }
    return $result;
  }
  ReplyHashes._() : super();
  factory ReplyHashes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyHashes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyHashes', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hashes', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyHashes clone() => ReplyHashes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyHashes copyWith(void Function(ReplyHashes) updates) => super.copyWith((message) => updates(message as ReplyHashes)) as ReplyHashes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyHashes create() => ReplyHashes._();
  ReplyHashes createEmptyInstance() => create();
  static $pb.PbList<ReplyHashes> createRepeated() => $pb.PbList<ReplyHashes>();
  @$core.pragma('dart2js:noInline')
  static ReplyHashes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyHashes>(create);
  static ReplyHashes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get hashes => $_getList(0);
}

class KeyValue extends $pb.GeneratedMessage {
  factory KeyValue({
    $core.List<$core.int>? key,
    $core.List<$core.int>? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  KeyValue._() : super();
  factory KeyValue.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyValue.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'KeyValue', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'value', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyValue clone() => KeyValue()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyValue copyWith(void Function(KeyValue) updates) => super.copyWith((message) => updates(message as KeyValue)) as KeyValue;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static KeyValue create() => KeyValue._();
  KeyValue createEmptyInstance() => create();
  static $pb.PbList<KeyValue> createRepeated() => $pb.PbList<KeyValue>();
  @$core.pragma('dart2js:noInline')
  static KeyValue getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyValue>(create);
  static KeyValue? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get key => $_getN(0);
  @$pb.TagNumber(1)
  set key($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get value => $_getN(1);
  @$pb.TagNumber(2)
  set value($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}

class TxHash extends $pb.GeneratedMessage {
  factory TxHash({
    $core.String? hash,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    return $result;
  }
  TxHash._() : super();
  factory TxHash.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxHash.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TxHash', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxHash clone() => TxHash()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxHash copyWith(void Function(TxHash) updates) => super.copyWith((message) => updates(message as TxHash)) as TxHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxHash create() => TxHash._();
  TxHash createEmptyInstance() => create();
  static $pb.PbList<TxHash> createRepeated() => $pb.PbList<TxHash>();
  @$core.pragma('dart2js:noInline')
  static TxHash getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxHash>(create);
  static TxHash? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hash => $_getSZ(0);
  @$pb.TagNumber(1)
  set hash($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);
}

class TimeStatus extends $pb.GeneratedMessage {
  factory TimeStatus({
    $core.String? ntpTime,
    $core.String? localTime,
    $fixnum.Int64? diff,
  }) {
    final $result = create();
    if (ntpTime != null) {
      $result.ntpTime = ntpTime;
    }
    if (localTime != null) {
      $result.localTime = localTime;
    }
    if (diff != null) {
      $result.diff = diff;
    }
    return $result;
  }
  TimeStatus._() : super();
  factory TimeStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TimeStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TimeStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ntpTime', protoName: 'ntpTime')
    ..aOS(2, _omitFieldNames ? '' : 'localTime', protoName: 'localTime')
    ..aInt64(3, _omitFieldNames ? '' : 'diff')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TimeStatus clone() => TimeStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TimeStatus copyWith(void Function(TimeStatus) updates) => super.copyWith((message) => updates(message as TimeStatus)) as TimeStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TimeStatus create() => TimeStatus._();
  TimeStatus createEmptyInstance() => create();
  static $pb.PbList<TimeStatus> createRepeated() => $pb.PbList<TimeStatus>();
  @$core.pragma('dart2js:noInline')
  static TimeStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TimeStatus>(create);
  static TimeStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ntpTime => $_getSZ(0);
  @$pb.TagNumber(1)
  set ntpTime($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNtpTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearNtpTime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get localTime => $_getSZ(1);
  @$pb.TagNumber(2)
  set localTime($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalTime() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get diff => $_getI64(2);
  @$pb.TagNumber(3)
  set diff($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDiff() => $_has(2);
  @$pb.TagNumber(3)
  void clearDiff() => clearField(3);
}

class ReqKey extends $pb.GeneratedMessage {
  factory ReqKey({
    $core.List<$core.int>? key,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  ReqKey._() : super();
  factory ReqKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqKey', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'key', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqKey clone() => ReqKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqKey copyWith(void Function(ReqKey) updates) => super.copyWith((message) => updates(message as ReqKey)) as ReqKey;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqKey create() => ReqKey._();
  ReqKey createEmptyInstance() => create();
  static $pb.PbList<ReqKey> createRepeated() => $pb.PbList<ReqKey>();
  @$core.pragma('dart2js:noInline')
  static ReqKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqKey>(create);
  static ReqKey? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get key => $_getN(0);
  @$pb.TagNumber(1)
  set key($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);
}

class ReqRandHash extends $pb.GeneratedMessage {
  factory ReqRandHash({
    $core.String? execName,
    $fixnum.Int64? height,
    $fixnum.Int64? blockNum,
    $core.List<$core.int>? hash,
  }) {
    final $result = create();
    if (execName != null) {
      $result.execName = execName;
    }
    if (height != null) {
      $result.height = height;
    }
    if (blockNum != null) {
      $result.blockNum = blockNum;
    }
    if (hash != null) {
      $result.hash = hash;
    }
    return $result;
  }
  ReqRandHash._() : super();
  factory ReqRandHash.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqRandHash.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqRandHash', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'execName', protoName: 'execName')
    ..aInt64(2, _omitFieldNames ? '' : 'height')
    ..aInt64(3, _omitFieldNames ? '' : 'blockNum', protoName: 'blockNum')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqRandHash clone() => ReqRandHash()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqRandHash copyWith(void Function(ReqRandHash) updates) => super.copyWith((message) => updates(message as ReqRandHash)) as ReqRandHash;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqRandHash create() => ReqRandHash._();
  ReqRandHash createEmptyInstance() => create();
  static $pb.PbList<ReqRandHash> createRepeated() => $pb.PbList<ReqRandHash>();
  @$core.pragma('dart2js:noInline')
  static ReqRandHash getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqRandHash>(create);
  static ReqRandHash? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get execName => $_getSZ(0);
  @$pb.TagNumber(1)
  set execName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExecName() => $_has(0);
  @$pb.TagNumber(1)
  void clearExecName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get blockNum => $_getI64(2);
  @$pb.TagNumber(3)
  set blockNum($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBlockNum() => $_has(2);
  @$pb.TagNumber(3)
  void clearBlockNum() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get hash => $_getN(3);
  @$pb.TagNumber(4)
  set hash($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHash() => $_has(3);
  @$pb.TagNumber(4)
  void clearHash() => clearField(4);
}

/// *
/// 当前软件版本信息
class VersionInfo extends $pb.GeneratedMessage {
  factory VersionInfo({
    $core.String? title,
    $core.String? app,
    $core.String? chain33,
    $core.String? localDb,
    $core.int? chainID,
  }) {
    final $result = create();
    if (title != null) {
      $result.title = title;
    }
    if (app != null) {
      $result.app = app;
    }
    if (chain33 != null) {
      $result.chain33 = chain33;
    }
    if (localDb != null) {
      $result.localDb = localDb;
    }
    if (chainID != null) {
      $result.chainID = chainID;
    }
    return $result;
  }
  VersionInfo._() : super();
  factory VersionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VersionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VersionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'title')
    ..aOS(2, _omitFieldNames ? '' : 'app')
    ..aOS(3, _omitFieldNames ? '' : 'chain33')
    ..aOS(4, _omitFieldNames ? '' : 'localDb', protoName: 'localDb')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'chainID', $pb.PbFieldType.O3, protoName: 'chainID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VersionInfo clone() => VersionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VersionInfo copyWith(void Function(VersionInfo) updates) => super.copyWith((message) => updates(message as VersionInfo)) as VersionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VersionInfo create() => VersionInfo._();
  VersionInfo createEmptyInstance() => create();
  static $pb.PbList<VersionInfo> createRepeated() => $pb.PbList<VersionInfo>();
  @$core.pragma('dart2js:noInline')
  static VersionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VersionInfo>(create);
  static VersionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get title => $_getSZ(0);
  @$pb.TagNumber(1)
  set title($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTitle() => $_has(0);
  @$pb.TagNumber(1)
  void clearTitle() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get app => $_getSZ(1);
  @$pb.TagNumber(2)
  set app($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasApp() => $_has(1);
  @$pb.TagNumber(2)
  void clearApp() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get chain33 => $_getSZ(2);
  @$pb.TagNumber(3)
  set chain33($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasChain33() => $_has(2);
  @$pb.TagNumber(3)
  void clearChain33() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get localDb => $_getSZ(3);
  @$pb.TagNumber(4)
  set localDb($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLocalDb() => $_has(3);
  @$pb.TagNumber(4)
  void clearLocalDb() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get chainID => $_getIZ(4);
  @$pb.TagNumber(5)
  set chainID($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChainID() => $_has(4);
  @$pb.TagNumber(5)
  void clearChainID() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
