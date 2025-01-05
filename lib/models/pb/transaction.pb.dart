//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $0;

/// assert transfer struct
class AssetsGenesis extends $pb.GeneratedMessage {
  factory AssetsGenesis({
    $fixnum.Int64? amount,
    $core.String? returnAddress,
  }) {
    final $result = create();
    if (amount != null) {
      $result.amount = amount;
    }
    if (returnAddress != null) {
      $result.returnAddress = returnAddress;
    }
    return $result;
  }
  AssetsGenesis._() : super();
  factory AssetsGenesis.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetsGenesis.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetsGenesis', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..aOS(3, _omitFieldNames ? '' : 'returnAddress', protoName: 'returnAddress')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetsGenesis clone() => AssetsGenesis()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetsGenesis copyWith(void Function(AssetsGenesis) updates) => super.copyWith((message) => updates(message as AssetsGenesis)) as AssetsGenesis;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetsGenesis create() => AssetsGenesis._();
  AssetsGenesis createEmptyInstance() => create();
  static $pb.PbList<AssetsGenesis> createRepeated() => $pb.PbList<AssetsGenesis>();
  @$core.pragma('dart2js:noInline')
  static AssetsGenesis getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetsGenesis>(create);
  static AssetsGenesis? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(0);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get returnAddress => $_getSZ(1);
  @$pb.TagNumber(3)
  set returnAddress($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasReturnAddress() => $_has(1);
  @$pb.TagNumber(3)
  void clearReturnAddress() => clearField(3);
}

class AssetsTransferToExec extends $pb.GeneratedMessage {
  factory AssetsTransferToExec({
    $core.String? cointoken,
    $fixnum.Int64? amount,
    $core.List<$core.int>? note,
    $core.String? execName,
    $core.String? to,
  }) {
    final $result = create();
    if (cointoken != null) {
      $result.cointoken = cointoken;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (note != null) {
      $result.note = note;
    }
    if (execName != null) {
      $result.execName = execName;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  AssetsTransferToExec._() : super();
  factory AssetsTransferToExec.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetsTransferToExec.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetsTransferToExec', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cointoken')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'execName', protoName: 'execName')
    ..aOS(5, _omitFieldNames ? '' : 'to')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetsTransferToExec clone() => AssetsTransferToExec()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetsTransferToExec copyWith(void Function(AssetsTransferToExec) updates) => super.copyWith((message) => updates(message as AssetsTransferToExec)) as AssetsTransferToExec;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetsTransferToExec create() => AssetsTransferToExec._();
  AssetsTransferToExec createEmptyInstance() => create();
  static $pb.PbList<AssetsTransferToExec> createRepeated() => $pb.PbList<AssetsTransferToExec>();
  @$core.pragma('dart2js:noInline')
  static AssetsTransferToExec getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetsTransferToExec>(create);
  static AssetsTransferToExec? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cointoken => $_getSZ(0);
  @$pb.TagNumber(1)
  set cointoken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCointoken() => $_has(0);
  @$pb.TagNumber(1)
  void clearCointoken() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get note => $_getN(2);
  @$pb.TagNumber(3)
  set note($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get execName => $_getSZ(3);
  @$pb.TagNumber(4)
  set execName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExecName() => $_has(3);
  @$pb.TagNumber(4)
  void clearExecName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get to => $_getSZ(4);
  @$pb.TagNumber(5)
  set to($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);
}

class AssetsWithdraw extends $pb.GeneratedMessage {
  factory AssetsWithdraw({
    $core.String? cointoken,
    $fixnum.Int64? amount,
    $core.List<$core.int>? note,
    $core.String? execName,
    $core.String? to,
  }) {
    final $result = create();
    if (cointoken != null) {
      $result.cointoken = cointoken;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (note != null) {
      $result.note = note;
    }
    if (execName != null) {
      $result.execName = execName;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  AssetsWithdraw._() : super();
  factory AssetsWithdraw.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetsWithdraw.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetsWithdraw', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cointoken')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'execName', protoName: 'execName')
    ..aOS(5, _omitFieldNames ? '' : 'to')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetsWithdraw clone() => AssetsWithdraw()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetsWithdraw copyWith(void Function(AssetsWithdraw) updates) => super.copyWith((message) => updates(message as AssetsWithdraw)) as AssetsWithdraw;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetsWithdraw create() => AssetsWithdraw._();
  AssetsWithdraw createEmptyInstance() => create();
  static $pb.PbList<AssetsWithdraw> createRepeated() => $pb.PbList<AssetsWithdraw>();
  @$core.pragma('dart2js:noInline')
  static AssetsWithdraw getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetsWithdraw>(create);
  static AssetsWithdraw? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cointoken => $_getSZ(0);
  @$pb.TagNumber(1)
  set cointoken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCointoken() => $_has(0);
  @$pb.TagNumber(1)
  void clearCointoken() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get note => $_getN(2);
  @$pb.TagNumber(3)
  set note($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get execName => $_getSZ(3);
  @$pb.TagNumber(4)
  set execName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExecName() => $_has(3);
  @$pb.TagNumber(4)
  void clearExecName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get to => $_getSZ(4);
  @$pb.TagNumber(5)
  set to($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTo() => $_has(4);
  @$pb.TagNumber(5)
  void clearTo() => clearField(5);
}

class AssetsTransfer extends $pb.GeneratedMessage {
  factory AssetsTransfer({
    $core.String? cointoken,
    $fixnum.Int64? amount,
    $core.List<$core.int>? note,
    $core.String? to,
  }) {
    final $result = create();
    if (cointoken != null) {
      $result.cointoken = cointoken;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (note != null) {
      $result.note = note;
    }
    if (to != null) {
      $result.to = to;
    }
    return $result;
  }
  AssetsTransfer._() : super();
  factory AssetsTransfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AssetsTransfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AssetsTransfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cointoken')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..aOS(4, _omitFieldNames ? '' : 'to')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AssetsTransfer clone() => AssetsTransfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AssetsTransfer copyWith(void Function(AssetsTransfer) updates) => super.copyWith((message) => updates(message as AssetsTransfer)) as AssetsTransfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssetsTransfer create() => AssetsTransfer._();
  AssetsTransfer createEmptyInstance() => create();
  static $pb.PbList<AssetsTransfer> createRepeated() => $pb.PbList<AssetsTransfer>();
  @$core.pragma('dart2js:noInline')
  static AssetsTransfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AssetsTransfer>(create);
  static AssetsTransfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cointoken => $_getSZ(0);
  @$pb.TagNumber(1)
  set cointoken($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCointoken() => $_has(0);
  @$pb.TagNumber(1)
  void clearCointoken() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get note => $_getN(2);
  @$pb.TagNumber(3)
  set note($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearNote() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get to => $_getSZ(3);
  @$pb.TagNumber(4)
  set to($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearTo() => clearField(4);
}

class Asset extends $pb.GeneratedMessage {
  factory Asset({
    $core.String? exec,
    $core.String? symbol,
    $fixnum.Int64? amount,
  }) {
    final $result = create();
    if (exec != null) {
      $result.exec = exec;
    }
    if (symbol != null) {
      $result.symbol = symbol;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    return $result;
  }
  Asset._() : super();
  factory Asset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Asset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Asset', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'exec')
    ..aOS(2, _omitFieldNames ? '' : 'symbol')
    ..aInt64(3, _omitFieldNames ? '' : 'amount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Asset clone() => Asset()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Asset copyWith(void Function(Asset) updates) => super.copyWith((message) => updates(message as Asset)) as Asset;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Asset create() => Asset._();
  Asset createEmptyInstance() => create();
  static $pb.PbList<Asset> createRepeated() => $pb.PbList<Asset>();
  @$core.pragma('dart2js:noInline')
  static Asset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Asset>(create);
  static Asset? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get exec => $_getSZ(0);
  @$pb.TagNumber(1)
  set exec($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExec() => $_has(0);
  @$pb.TagNumber(1)
  void clearExec() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get symbol => $_getSZ(1);
  @$pb.TagNumber(2)
  set symbol($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSymbol() => $_has(1);
  @$pb.TagNumber(2)
  void clearSymbol() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
}

class CreateTx extends $pb.GeneratedMessage {
  factory CreateTx({
    $core.String? to,
    $fixnum.Int64? amount,
    $fixnum.Int64? fee,
    $core.List<$core.int>? note,
    $core.bool? isWithdraw,
    $core.bool? isToken,
    $core.String? tokenSymbol,
    $core.String? execName,
    $core.String? execer,
  }) {
    final $result = create();
    if (to != null) {
      $result.to = to;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (note != null) {
      $result.note = note;
    }
    if (isWithdraw != null) {
      $result.isWithdraw = isWithdraw;
    }
    if (isToken != null) {
      $result.isToken = isToken;
    }
    if (tokenSymbol != null) {
      $result.tokenSymbol = tokenSymbol;
    }
    if (execName != null) {
      $result.execName = execName;
    }
    if (execer != null) {
      $result.execer = execer;
    }
    return $result;
  }
  CreateTx._() : super();
  factory CreateTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTx', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'to')
    ..aInt64(2, _omitFieldNames ? '' : 'amount')
    ..aInt64(3, _omitFieldNames ? '' : 'fee')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'note', $pb.PbFieldType.OY)
    ..aOB(5, _omitFieldNames ? '' : 'isWithdraw', protoName: 'isWithdraw')
    ..aOB(6, _omitFieldNames ? '' : 'isToken', protoName: 'isToken')
    ..aOS(7, _omitFieldNames ? '' : 'tokenSymbol', protoName: 'tokenSymbol')
    ..aOS(8, _omitFieldNames ? '' : 'execName', protoName: 'execName')
    ..aOS(9, _omitFieldNames ? '' : 'execer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTx clone() => CreateTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTx copyWith(void Function(CreateTx) updates) => super.copyWith((message) => updates(message as CreateTx)) as CreateTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTx create() => CreateTx._();
  CreateTx createEmptyInstance() => create();
  static $pb.PbList<CreateTx> createRepeated() => $pb.PbList<CreateTx>();
  @$core.pragma('dart2js:noInline')
  static CreateTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTx>(create);
  static CreateTx? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get to => $_getSZ(0);
  @$pb.TagNumber(1)
  set to($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTo() => $_has(0);
  @$pb.TagNumber(1)
  void clearTo() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get amount => $_getI64(1);
  @$pb.TagNumber(2)
  set amount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get fee => $_getI64(2);
  @$pb.TagNumber(3)
  set fee($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFee() => $_has(2);
  @$pb.TagNumber(3)
  void clearFee() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get note => $_getN(3);
  @$pb.TagNumber(4)
  set note($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNote() => $_has(3);
  @$pb.TagNumber(4)
  void clearNote() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isWithdraw => $_getBF(4);
  @$pb.TagNumber(5)
  set isWithdraw($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsWithdraw() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsWithdraw() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isToken => $_getBF(5);
  @$pb.TagNumber(6)
  set isToken($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsToken() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsToken() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get tokenSymbol => $_getSZ(6);
  @$pb.TagNumber(7)
  set tokenSymbol($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTokenSymbol() => $_has(6);
  @$pb.TagNumber(7)
  void clearTokenSymbol() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get execName => $_getSZ(7);
  @$pb.TagNumber(8)
  set execName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExecName() => $_has(7);
  @$pb.TagNumber(8)
  void clearExecName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get execer => $_getSZ(8);
  @$pb.TagNumber(9)
  set execer($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExecer() => $_has(8);
  @$pb.TagNumber(9)
  void clearExecer() => clearField(9);
}

class ReWriteRawTx extends $pb.GeneratedMessage {
  factory ReWriteRawTx({
    $core.String? tx,
    $core.String? to,
    $core.String? expire,
    $fixnum.Int64? fee,
    $core.int? index,
  }) {
    final $result = create();
    if (tx != null) {
      $result.tx = tx;
    }
    if (to != null) {
      $result.to = to;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (index != null) {
      $result.index = index;
    }
    return $result;
  }
  ReWriteRawTx._() : super();
  factory ReWriteRawTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReWriteRawTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReWriteRawTx', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tx')
    ..aOS(3, _omitFieldNames ? '' : 'to')
    ..aOS(4, _omitFieldNames ? '' : 'expire')
    ..aInt64(5, _omitFieldNames ? '' : 'fee')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReWriteRawTx clone() => ReWriteRawTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReWriteRawTx copyWith(void Function(ReWriteRawTx) updates) => super.copyWith((message) => updates(message as ReWriteRawTx)) as ReWriteRawTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReWriteRawTx create() => ReWriteRawTx._();
  ReWriteRawTx createEmptyInstance() => create();
  static $pb.PbList<ReWriteRawTx> createRepeated() => $pb.PbList<ReWriteRawTx>();
  @$core.pragma('dart2js:noInline')
  static ReWriteRawTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReWriteRawTx>(create);
  static ReWriteRawTx? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tx => $_getSZ(0);
  @$pb.TagNumber(1)
  set tx($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearTx() => clearField(1);

  /// bytes  execer = 2;
  @$pb.TagNumber(3)
  $core.String get to => $_getSZ(1);
  @$pb.TagNumber(3)
  set to($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasTo() => $_has(1);
  @$pb.TagNumber(3)
  void clearTo() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get expire => $_getSZ(2);
  @$pb.TagNumber(4)
  set expire($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpire() => $_has(2);
  @$pb.TagNumber(4)
  void clearExpire() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(3);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(3);
  @$pb.TagNumber(5)
  void clearFee() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get index => $_getIZ(4);
  @$pb.TagNumber(6)
  set index($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(6)
  void clearIndex() => clearField(6);
}

class CreateTransactionGroup extends $pb.GeneratedMessage {
  factory CreateTransactionGroup({
    $core.Iterable<$core.String>? txs,
  }) {
    final $result = create();
    if (txs != null) {
      $result.txs.addAll(txs);
    }
    return $result;
  }
  CreateTransactionGroup._() : super();
  factory CreateTransactionGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTransactionGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTransactionGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'txs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTransactionGroup clone() => CreateTransactionGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTransactionGroup copyWith(void Function(CreateTransactionGroup) updates) => super.copyWith((message) => updates(message as CreateTransactionGroup)) as CreateTransactionGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTransactionGroup create() => CreateTransactionGroup._();
  CreateTransactionGroup createEmptyInstance() => create();
  static $pb.PbList<CreateTransactionGroup> createRepeated() => $pb.PbList<CreateTransactionGroup>();
  @$core.pragma('dart2js:noInline')
  static CreateTransactionGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTransactionGroup>(create);
  static CreateTransactionGroup? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get txs => $_getList(0);
}

class UnsignTx extends $pb.GeneratedMessage {
  factory UnsignTx({
    $core.List<$core.int>? data,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  UnsignTx._() : super();
  factory UnsignTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UnsignTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UnsignTx', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UnsignTx clone() => UnsignTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UnsignTx copyWith(void Function(UnsignTx) updates) => super.copyWith((message) => updates(message as UnsignTx)) as UnsignTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnsignTx create() => UnsignTx._();
  UnsignTx createEmptyInstance() => create();
  static $pb.PbList<UnsignTx> createRepeated() => $pb.PbList<UnsignTx>();
  @$core.pragma('dart2js:noInline')
  static UnsignTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UnsignTx>(create);
  static UnsignTx? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

/// 支持构造多笔nobalance的交易 payAddr 可以支持 1. 地址 2. 私钥
class NoBalanceTxs extends $pb.GeneratedMessage {
  factory NoBalanceTxs({
    $core.Iterable<$core.String>? txHexs,
    $core.String? payAddr,
    $core.String? privkey,
    $core.String? expire,
  }) {
    final $result = create();
    if (txHexs != null) {
      $result.txHexs.addAll(txHexs);
    }
    if (payAddr != null) {
      $result.payAddr = payAddr;
    }
    if (privkey != null) {
      $result.privkey = privkey;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    return $result;
  }
  NoBalanceTxs._() : super();
  factory NoBalanceTxs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NoBalanceTxs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NoBalanceTxs', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'txHexs', protoName: 'txHexs')
    ..aOS(2, _omitFieldNames ? '' : 'payAddr', protoName: 'payAddr')
    ..aOS(3, _omitFieldNames ? '' : 'privkey')
    ..aOS(4, _omitFieldNames ? '' : 'expire')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NoBalanceTxs clone() => NoBalanceTxs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NoBalanceTxs copyWith(void Function(NoBalanceTxs) updates) => super.copyWith((message) => updates(message as NoBalanceTxs)) as NoBalanceTxs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NoBalanceTxs create() => NoBalanceTxs._();
  NoBalanceTxs createEmptyInstance() => create();
  static $pb.PbList<NoBalanceTxs> createRepeated() => $pb.PbList<NoBalanceTxs>();
  @$core.pragma('dart2js:noInline')
  static NoBalanceTxs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NoBalanceTxs>(create);
  static NoBalanceTxs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get txHexs => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get payAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set payAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get privkey => $_getSZ(2);
  @$pb.TagNumber(3)
  set privkey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrivkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrivkey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get expire => $_getSZ(3);
  @$pb.TagNumber(4)
  set expire($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpire() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpire() => clearField(4);
}

/// payAddr 可以支持 1. 地址 2. 私钥
class NoBalanceTx extends $pb.GeneratedMessage {
  factory NoBalanceTx({
    $core.String? txHex,
    $core.String? payAddr,
    $core.String? privkey,
    $core.String? expire,
  }) {
    final $result = create();
    if (txHex != null) {
      $result.txHex = txHex;
    }
    if (payAddr != null) {
      $result.payAddr = payAddr;
    }
    if (privkey != null) {
      $result.privkey = privkey;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    return $result;
  }
  NoBalanceTx._() : super();
  factory NoBalanceTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NoBalanceTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NoBalanceTx', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHex', protoName: 'txHex')
    ..aOS(2, _omitFieldNames ? '' : 'payAddr', protoName: 'payAddr')
    ..aOS(3, _omitFieldNames ? '' : 'privkey')
    ..aOS(4, _omitFieldNames ? '' : 'expire')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NoBalanceTx clone() => NoBalanceTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NoBalanceTx copyWith(void Function(NoBalanceTx) updates) => super.copyWith((message) => updates(message as NoBalanceTx)) as NoBalanceTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NoBalanceTx create() => NoBalanceTx._();
  NoBalanceTx createEmptyInstance() => create();
  static $pb.PbList<NoBalanceTx> createRepeated() => $pb.PbList<NoBalanceTx>();
  @$core.pragma('dart2js:noInline')
  static NoBalanceTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NoBalanceTx>(create);
  static NoBalanceTx? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHex => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHex($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHex() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHex() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get payAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set payAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get privkey => $_getSZ(2);
  @$pb.TagNumber(3)
  set privkey($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrivkey() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrivkey() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get expire => $_getSZ(3);
  @$pb.TagNumber(4)
  set expire($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExpire() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpire() => clearField(4);
}

class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.List<$core.int>? execer,
    $core.List<$core.int>? payload,
    Signature? signature,
    $fixnum.Int64? fee,
    $fixnum.Int64? expire,
    $fixnum.Int64? nonce,
    $core.String? to,
    $core.int? groupCount,
    $core.List<$core.int>? header,
    $core.List<$core.int>? next,
    $core.int? chainID,
  }) {
    final $result = create();
    if (execer != null) {
      $result.execer = execer;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (expire != null) {
      $result.expire = expire;
    }
    if (nonce != null) {
      $result.nonce = nonce;
    }
    if (to != null) {
      $result.to = to;
    }
    if (groupCount != null) {
      $result.groupCount = groupCount;
    }
    if (header != null) {
      $result.header = header;
    }
    if (next != null) {
      $result.next = next;
    }
    if (chainID != null) {
      $result.chainID = chainID;
    }
    return $result;
  }
  Transaction._() : super();
  factory Transaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'execer', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'payload', $pb.PbFieldType.OY)
    ..aOM<Signature>(3, _omitFieldNames ? '' : 'signature', subBuilder: Signature.create)
    ..aInt64(4, _omitFieldNames ? '' : 'fee')
    ..aInt64(5, _omitFieldNames ? '' : 'expire')
    ..aInt64(6, _omitFieldNames ? '' : 'nonce')
    ..aOS(7, _omitFieldNames ? '' : 'to')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'groupCount', $pb.PbFieldType.O3, protoName: 'groupCount')
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'header', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(10, _omitFieldNames ? '' : 'next', $pb.PbFieldType.OY)
    ..a<$core.int>(11, _omitFieldNames ? '' : 'chainID', $pb.PbFieldType.O3, protoName: 'chainID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transaction copyWith(void Function(Transaction) updates) => super.copyWith((message) => updates(message as Transaction)) as Transaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get execer => $_getN(0);
  @$pb.TagNumber(1)
  set execer($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExecer() => $_has(0);
  @$pb.TagNumber(1)
  void clearExecer() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get payload => $_getN(1);
  @$pb.TagNumber(2)
  set payload($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPayload() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayload() => clearField(2);

  @$pb.TagNumber(3)
  Signature get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature(Signature v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => clearField(3);
  @$pb.TagNumber(3)
  Signature ensureSignature() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get fee => $_getI64(3);
  @$pb.TagNumber(4)
  set fee($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFee() => $_has(3);
  @$pb.TagNumber(4)
  void clearFee() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get expire => $_getI64(4);
  @$pb.TagNumber(5)
  set expire($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasExpire() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpire() => clearField(5);

  /// 随机ID，可以防止payload 相同的时候，交易重复
  @$pb.TagNumber(6)
  $fixnum.Int64 get nonce => $_getI64(5);
  @$pb.TagNumber(6)
  set nonce($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNonce() => $_has(5);
  @$pb.TagNumber(6)
  void clearNonce() => clearField(6);

  /// 对方地址，如果没有对方地址，可以为空
  @$pb.TagNumber(7)
  $core.String get to => $_getSZ(6);
  @$pb.TagNumber(7)
  set to($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTo() => $_has(6);
  @$pb.TagNumber(7)
  void clearTo() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get groupCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set groupCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasGroupCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearGroupCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<$core.int> get header => $_getN(8);
  @$pb.TagNumber(9)
  set header($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHeader() => $_has(8);
  @$pb.TagNumber(9)
  void clearHeader() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.int> get next => $_getN(9);
  @$pb.TagNumber(10)
  set next($core.List<$core.int> v) { $_setBytes(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasNext() => $_has(9);
  @$pb.TagNumber(10)
  void clearNext() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get chainID => $_getIZ(10);
  @$pb.TagNumber(11)
  set chainID($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasChainID() => $_has(10);
  @$pb.TagNumber(11)
  void clearChainID() => clearField(11);
}

class Transactions extends $pb.GeneratedMessage {
  factory Transactions({
    $core.Iterable<Transaction>? txs,
  }) {
    final $result = create();
    if (txs != null) {
      $result.txs.addAll(txs);
    }
    return $result;
  }
  Transactions._() : super();
  factory Transactions.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transactions.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transactions', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<Transaction>(1, _omitFieldNames ? '' : 'txs', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transactions clone() => Transactions()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transactions copyWith(void Function(Transactions) updates) => super.copyWith((message) => updates(message as Transactions)) as Transactions;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transactions create() => Transactions._();
  Transactions createEmptyInstance() => create();
  static $pb.PbList<Transactions> createRepeated() => $pb.PbList<Transactions>();
  @$core.pragma('dart2js:noInline')
  static Transactions getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transactions>(create);
  static Transactions? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get txs => $_getList(0);
}

/// 环签名类型时，签名字段存储的环签名信息
class RingSignature extends $pb.GeneratedMessage {
  factory RingSignature({
    $core.Iterable<RingSignatureItem>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  RingSignature._() : super();
  factory RingSignature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RingSignature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RingSignature', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<RingSignatureItem>(1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM, subBuilder: RingSignatureItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RingSignature clone() => RingSignature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RingSignature copyWith(void Function(RingSignature) updates) => super.copyWith((message) => updates(message as RingSignature)) as RingSignature;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RingSignature create() => RingSignature._();
  RingSignature createEmptyInstance() => create();
  static $pb.PbList<RingSignature> createRepeated() => $pb.PbList<RingSignature>();
  @$core.pragma('dart2js:noInline')
  static RingSignature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RingSignature>(create);
  static RingSignature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RingSignatureItem> get items => $_getList(0);
}

/// 环签名中的一组签名数据
class RingSignatureItem extends $pb.GeneratedMessage {
  factory RingSignatureItem({
    $core.Iterable<$core.List<$core.int>>? pubkey,
    $core.Iterable<$core.List<$core.int>>? signature,
  }) {
    final $result = create();
    if (pubkey != null) {
      $result.pubkey.addAll(pubkey);
    }
    if (signature != null) {
      $result.signature.addAll(signature);
    }
    return $result;
  }
  RingSignatureItem._() : super();
  factory RingSignatureItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RingSignatureItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RingSignatureItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'pubkey', $pb.PbFieldType.PY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RingSignatureItem clone() => RingSignatureItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RingSignatureItem copyWith(void Function(RingSignatureItem) updates) => super.copyWith((message) => updates(message as RingSignatureItem)) as RingSignatureItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RingSignatureItem create() => RingSignatureItem._();
  RingSignatureItem createEmptyInstance() => create();
  static $pb.PbList<RingSignatureItem> createRepeated() => $pb.PbList<RingSignatureItem>();
  @$core.pragma('dart2js:noInline')
  static RingSignatureItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RingSignatureItem>(create);
  static RingSignatureItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get pubkey => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get signature => $_getList(1);
}

/// 对于一个交易组中的交易，要么全部成功，要么全部失败
/// 这个要好好设计一下
/// 最好交易构成一个链条[prevhash].独立的交易构成链条
/// 只要这个组中有一个执行是出错的，那么就执行不成功
/// 三种签名支持
///  ty = 1 -> secp256k1
///  ty = 2 -> ed25519
///  ty = 3 -> sm2
///  ty = 4 -> OnetimeED25519
///  ty = 5 -> RingBaseonED25519
class Signature extends $pb.GeneratedMessage {
  factory Signature({
    $core.int? ty,
    $core.List<$core.int>? pubkey,
    $core.List<$core.int>? signature,
  }) {
    final $result = create();
    if (ty != null) {
      $result.ty = ty;
    }
    if (pubkey != null) {
      $result.pubkey = pubkey;
    }
    if (signature != null) {
      $result.signature = signature;
    }
    return $result;
  }
  Signature._() : super();
  factory Signature.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Signature.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Signature', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ty', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'pubkey', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'signature', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Signature clone() => Signature()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Signature copyWith(void Function(Signature) updates) => super.copyWith((message) => updates(message as Signature)) as Signature;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Signature create() => Signature._();
  Signature createEmptyInstance() => create();
  static $pb.PbList<Signature> createRepeated() => $pb.PbList<Signature>();
  @$core.pragma('dart2js:noInline')
  static Signature getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Signature>(create);
  static Signature? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ty => $_getIZ(0);
  @$pb.TagNumber(1)
  set ty($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTy() => $_has(0);
  @$pb.TagNumber(1)
  void clearTy() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get pubkey => $_getN(1);
  @$pb.TagNumber(2)
  set pubkey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPubkey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPubkey() => clearField(2);

  /// 当ty为5时，格式应该用RingSignature去解析
  @$pb.TagNumber(3)
  $core.List<$core.int> get signature => $_getN(2);
  @$pb.TagNumber(3)
  set signature($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSignature() => $_has(2);
  @$pb.TagNumber(3)
  void clearSignature() => clearField(3);
}

class AddrOverview extends $pb.GeneratedMessage {
  factory AddrOverview({
    $fixnum.Int64? reciver,
    $fixnum.Int64? balance,
    $fixnum.Int64? txCount,
  }) {
    final $result = create();
    if (reciver != null) {
      $result.reciver = reciver;
    }
    if (balance != null) {
      $result.balance = balance;
    }
    if (txCount != null) {
      $result.txCount = txCount;
    }
    return $result;
  }
  AddrOverview._() : super();
  factory AddrOverview.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddrOverview.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddrOverview', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'reciver')
    ..aInt64(2, _omitFieldNames ? '' : 'balance')
    ..aInt64(3, _omitFieldNames ? '' : 'txCount', protoName: 'txCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddrOverview clone() => AddrOverview()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddrOverview copyWith(void Function(AddrOverview) updates) => super.copyWith((message) => updates(message as AddrOverview)) as AddrOverview;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddrOverview create() => AddrOverview._();
  AddrOverview createEmptyInstance() => create();
  static $pb.PbList<AddrOverview> createRepeated() => $pb.PbList<AddrOverview>();
  @$core.pragma('dart2js:noInline')
  static AddrOverview getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddrOverview>(create);
  static AddrOverview? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get reciver => $_getI64(0);
  @$pb.TagNumber(1)
  set reciver($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasReciver() => $_has(0);
  @$pb.TagNumber(1)
  void clearReciver() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get balance => $_getI64(1);
  @$pb.TagNumber(2)
  set balance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get txCount => $_getI64(2);
  @$pb.TagNumber(3)
  set txCount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxCount() => clearField(3);
}

class ReqAddr extends $pb.GeneratedMessage {
  factory ReqAddr({
    $core.String? addr,
    $core.int? flag,
    $core.int? count,
    $core.int? direction,
    $fixnum.Int64? height,
    $fixnum.Int64? index,
    $fixnum.Int64? heightEnd,
  }) {
    final $result = create();
    if (addr != null) {
      $result.addr = addr;
    }
    if (flag != null) {
      $result.flag = flag;
    }
    if (count != null) {
      $result.count = count;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (height != null) {
      $result.height = height;
    }
    if (index != null) {
      $result.index = index;
    }
    if (heightEnd != null) {
      $result.heightEnd = heightEnd;
    }
    return $result;
  }
  ReqAddr._() : super();
  factory ReqAddr.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqAddr.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqAddr', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'addr')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'flag', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'count', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.O3)
    ..aInt64(5, _omitFieldNames ? '' : 'height')
    ..aInt64(6, _omitFieldNames ? '' : 'index')
    ..aInt64(7, _omitFieldNames ? '' : 'heightEnd', protoName: 'heightEnd')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqAddr clone() => ReqAddr()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqAddr copyWith(void Function(ReqAddr) updates) => super.copyWith((message) => updates(message as ReqAddr)) as ReqAddr;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqAddr create() => ReqAddr._();
  ReqAddr createEmptyInstance() => create();
  static $pb.PbList<ReqAddr> createRepeated() => $pb.PbList<ReqAddr>();
  @$core.pragma('dart2js:noInline')
  static ReqAddr getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqAddr>(create);
  static ReqAddr? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get addr => $_getSZ(0);
  @$pb.TagNumber(1)
  set addr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddr() => clearField(1);

  /// 表示取所有/from/to/其他的hash列表
  @$pb.TagNumber(2)
  $core.int get flag => $_getIZ(1);
  @$pb.TagNumber(2)
  set flag($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFlag() => $_has(1);
  @$pb.TagNumber(2)
  void clearFlag() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get count => $_getIZ(2);
  @$pb.TagNumber(3)
  set count($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get direction => $_getIZ(3);
  @$pb.TagNumber(4)
  set direction($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDirection() => $_has(3);
  @$pb.TagNumber(4)
  void clearDirection() => clearField(4);

  /// height start
  @$pb.TagNumber(5)
  $fixnum.Int64 get height => $_getI64(4);
  @$pb.TagNumber(5)
  set height($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get index => $_getI64(5);
  @$pb.TagNumber(6)
  set index($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIndex() => $_has(5);
  @$pb.TagNumber(6)
  void clearIndex() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get heightEnd => $_getI64(6);
  @$pb.TagNumber(7)
  set heightEnd($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasHeightEnd() => $_has(6);
  @$pb.TagNumber(7)
  void clearHeightEnd() => clearField(7);
}

class HexTx extends $pb.GeneratedMessage {
  factory HexTx({
    $core.String? tx,
  }) {
    final $result = create();
    if (tx != null) {
      $result.tx = tx;
    }
    return $result;
  }
  HexTx._() : super();
  factory HexTx.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HexTx.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HexTx', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'tx')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HexTx clone() => HexTx()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HexTx copyWith(void Function(HexTx) updates) => super.copyWith((message) => updates(message as HexTx)) as HexTx;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HexTx create() => HexTx._();
  HexTx createEmptyInstance() => create();
  static $pb.PbList<HexTx> createRepeated() => $pb.PbList<HexTx>();
  @$core.pragma('dart2js:noInline')
  static HexTx getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HexTx>(create);
  static HexTx? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get tx => $_getSZ(0);
  @$pb.TagNumber(1)
  set tx($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearTx() => clearField(1);
}

class ReplyTxInfo extends $pb.GeneratedMessage {
  factory ReplyTxInfo({
    $core.List<$core.int>? hash,
    $fixnum.Int64? height,
    $fixnum.Int64? index,
    $core.Iterable<Asset>? assets,
  }) {
    final $result = create();
    if (hash != null) {
      $result.hash = hash;
    }
    if (height != null) {
      $result.height = height;
    }
    if (index != null) {
      $result.index = index;
    }
    if (assets != null) {
      $result.assets.addAll(assets);
    }
    return $result;
  }
  ReplyTxInfo._() : super();
  factory ReplyTxInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyTxInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyTxInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hash', $pb.PbFieldType.OY)
    ..aInt64(2, _omitFieldNames ? '' : 'height')
    ..aInt64(3, _omitFieldNames ? '' : 'index')
    ..pc<Asset>(4, _omitFieldNames ? '' : 'assets', $pb.PbFieldType.PM, subBuilder: Asset.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyTxInfo clone() => ReplyTxInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyTxInfo copyWith(void Function(ReplyTxInfo) updates) => super.copyWith((message) => updates(message as ReplyTxInfo)) as ReplyTxInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyTxInfo create() => ReplyTxInfo._();
  ReplyTxInfo createEmptyInstance() => create();
  static $pb.PbList<ReplyTxInfo> createRepeated() => $pb.PbList<ReplyTxInfo>();
  @$core.pragma('dart2js:noInline')
  static ReplyTxInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyTxInfo>(create);
  static ReplyTxInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get hash => $_getN(0);
  @$pb.TagNumber(1)
  set hash($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHash() => $_has(0);
  @$pb.TagNumber(1)
  void clearHash() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get height => $_getI64(1);
  @$pb.TagNumber(2)
  set height($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHeight() => $_has(1);
  @$pb.TagNumber(2)
  void clearHeight() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get index => $_getI64(2);
  @$pb.TagNumber(3)
  set index($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIndex() => $_has(2);
  @$pb.TagNumber(3)
  void clearIndex() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<Asset> get assets => $_getList(3);
}

class ReqTxList extends $pb.GeneratedMessage {
  factory ReqTxList({
    $fixnum.Int64? count,
  }) {
    final $result = create();
    if (count != null) {
      $result.count = count;
    }
    return $result;
  }
  ReqTxList._() : super();
  factory ReqTxList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqTxList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqTxList', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'count')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqTxList clone() => ReqTxList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqTxList copyWith(void Function(ReqTxList) updates) => super.copyWith((message) => updates(message as ReqTxList)) as ReqTxList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqTxList create() => ReqTxList._();
  ReqTxList createEmptyInstance() => create();
  static $pb.PbList<ReqTxList> createRepeated() => $pb.PbList<ReqTxList>();
  @$core.pragma('dart2js:noInline')
  static ReqTxList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqTxList>(create);
  static ReqTxList? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get count => $_getI64(0);
  @$pb.TagNumber(1)
  set count($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearCount() => clearField(1);
}

class ReplyTxList extends $pb.GeneratedMessage {
  factory ReplyTxList({
    $core.Iterable<Transaction>? txs,
  }) {
    final $result = create();
    if (txs != null) {
      $result.txs.addAll(txs);
    }
    return $result;
  }
  ReplyTxList._() : super();
  factory ReplyTxList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyTxList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyTxList', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<Transaction>(1, _omitFieldNames ? '' : 'txs', $pb.PbFieldType.PM, subBuilder: Transaction.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyTxList clone() => ReplyTxList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyTxList copyWith(void Function(ReplyTxList) updates) => super.copyWith((message) => updates(message as ReplyTxList)) as ReplyTxList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyTxList create() => ReplyTxList._();
  ReplyTxList createEmptyInstance() => create();
  static $pb.PbList<ReplyTxList> createRepeated() => $pb.PbList<ReplyTxList>();
  @$core.pragma('dart2js:noInline')
  static ReplyTxList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyTxList>(create);
  static ReplyTxList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Transaction> get txs => $_getList(0);
}

class ReqGetMempool extends $pb.GeneratedMessage {
  factory ReqGetMempool({
    $core.bool? isAll,
  }) {
    final $result = create();
    if (isAll != null) {
      $result.isAll = isAll;
    }
    return $result;
  }
  ReqGetMempool._() : super();
  factory ReqGetMempool.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqGetMempool.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqGetMempool', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAll', protoName: 'isAll')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqGetMempool clone() => ReqGetMempool()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqGetMempool copyWith(void Function(ReqGetMempool) updates) => super.copyWith((message) => updates(message as ReqGetMempool)) as ReqGetMempool;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqGetMempool create() => ReqGetMempool._();
  ReqGetMempool createEmptyInstance() => create();
  static $pb.PbList<ReqGetMempool> createRepeated() => $pb.PbList<ReqGetMempool>();
  @$core.pragma('dart2js:noInline')
  static ReqGetMempool getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqGetMempool>(create);
  static ReqGetMempool? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAll => $_getBF(0);
  @$pb.TagNumber(1)
  set isAll($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsAll() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAll() => clearField(1);
}

class ReqProperFee extends $pb.GeneratedMessage {
  factory ReqProperFee({
    $core.int? txCount,
    $core.int? txSize,
  }) {
    final $result = create();
    if (txCount != null) {
      $result.txCount = txCount;
    }
    if (txSize != null) {
      $result.txSize = txSize;
    }
    return $result;
  }
  ReqProperFee._() : super();
  factory ReqProperFee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqProperFee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqProperFee', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'txCount', $pb.PbFieldType.O3, protoName: 'txCount')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'txSize', $pb.PbFieldType.O3, protoName: 'txSize')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqProperFee clone() => ReqProperFee()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqProperFee copyWith(void Function(ReqProperFee) updates) => super.copyWith((message) => updates(message as ReqProperFee)) as ReqProperFee;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqProperFee create() => ReqProperFee._();
  ReqProperFee createEmptyInstance() => create();
  static $pb.PbList<ReqProperFee> createRepeated() => $pb.PbList<ReqProperFee>();
  @$core.pragma('dart2js:noInline')
  static ReqProperFee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqProperFee>(create);
  static ReqProperFee? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get txCount => $_getIZ(0);
  @$pb.TagNumber(1)
  set txCount($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxCount() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxCount() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get txSize => $_getIZ(1);
  @$pb.TagNumber(2)
  set txSize($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTxSize() => $_has(1);
  @$pb.TagNumber(2)
  void clearTxSize() => clearField(2);
}

class ReplyProperFee extends $pb.GeneratedMessage {
  factory ReplyProperFee({
    $fixnum.Int64? properFee,
  }) {
    final $result = create();
    if (properFee != null) {
      $result.properFee = properFee;
    }
    return $result;
  }
  ReplyProperFee._() : super();
  factory ReplyProperFee.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyProperFee.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyProperFee', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'properFee', protoName: 'properFee')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyProperFee clone() => ReplyProperFee()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyProperFee copyWith(void Function(ReplyProperFee) updates) => super.copyWith((message) => updates(message as ReplyProperFee)) as ReplyProperFee;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyProperFee create() => ReplyProperFee._();
  ReplyProperFee createEmptyInstance() => create();
  static $pb.PbList<ReplyProperFee> createRepeated() => $pb.PbList<ReplyProperFee>();
  @$core.pragma('dart2js:noInline')
  static ReplyProperFee getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyProperFee>(create);
  static ReplyProperFee? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get properFee => $_getI64(0);
  @$pb.TagNumber(1)
  set properFee($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProperFee() => $_has(0);
  @$pb.TagNumber(1)
  void clearProperFee() => clearField(1);
}

class TxHashList extends $pb.GeneratedMessage {
  factory TxHashList({
    $core.Iterable<$core.List<$core.int>>? hashes,
    $fixnum.Int64? count,
    $core.Iterable<$fixnum.Int64>? expire,
  }) {
    final $result = create();
    if (hashes != null) {
      $result.hashes.addAll(hashes);
    }
    if (count != null) {
      $result.count = count;
    }
    if (expire != null) {
      $result.expire.addAll(expire);
    }
    return $result;
  }
  TxHashList._() : super();
  factory TxHashList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxHashList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TxHashList', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'hashes', $pb.PbFieldType.PY)
    ..aInt64(2, _omitFieldNames ? '' : 'count')
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'expire', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxHashList clone() => TxHashList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxHashList copyWith(void Function(TxHashList) updates) => super.copyWith((message) => updates(message as TxHashList)) as TxHashList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxHashList create() => TxHashList._();
  TxHashList createEmptyInstance() => create();
  static $pb.PbList<TxHashList> createRepeated() => $pb.PbList<TxHashList>();
  @$core.pragma('dart2js:noInline')
  static TxHashList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxHashList>(create);
  static TxHashList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get hashes => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get count => $_getI64(1);
  @$pb.TagNumber(2)
  set count($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$fixnum.Int64> get expire => $_getList(2);
}

class ReplyTxInfos extends $pb.GeneratedMessage {
  factory ReplyTxInfos({
    $core.Iterable<ReplyTxInfo>? txInfos,
  }) {
    final $result = create();
    if (txInfos != null) {
      $result.txInfos.addAll(txInfos);
    }
    return $result;
  }
  ReplyTxInfos._() : super();
  factory ReplyTxInfos.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyTxInfos.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyTxInfos', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<ReplyTxInfo>(1, _omitFieldNames ? '' : 'txInfos', $pb.PbFieldType.PM, protoName: 'txInfos', subBuilder: ReplyTxInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyTxInfos clone() => ReplyTxInfos()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyTxInfos copyWith(void Function(ReplyTxInfos) updates) => super.copyWith((message) => updates(message as ReplyTxInfos)) as ReplyTxInfos;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyTxInfos create() => ReplyTxInfos._();
  ReplyTxInfos createEmptyInstance() => create();
  static $pb.PbList<ReplyTxInfos> createRepeated() => $pb.PbList<ReplyTxInfos>();
  @$core.pragma('dart2js:noInline')
  static ReplyTxInfos getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyTxInfos>(create);
  static ReplyTxInfos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ReplyTxInfo> get txInfos => $_getList(0);
}

/// 根据Addr查询和此Addr相关的交易费交易记录
class AddrTxFeeInfo extends $pb.GeneratedMessage {
  factory AddrTxFeeInfo({
    $core.String? fromAddr,
    $core.String? toAddr,
    $core.String? txHash,
    $core.String? exec,
    $fixnum.Int64? fee,
    $fixnum.Int64? height,
    $fixnum.Int64? index,
    $core.int? txStatus,
  }) {
    final $result = create();
    if (fromAddr != null) {
      $result.fromAddr = fromAddr;
    }
    if (toAddr != null) {
      $result.toAddr = toAddr;
    }
    if (txHash != null) {
      $result.txHash = txHash;
    }
    if (exec != null) {
      $result.exec = exec;
    }
    if (fee != null) {
      $result.fee = fee;
    }
    if (height != null) {
      $result.height = height;
    }
    if (index != null) {
      $result.index = index;
    }
    if (txStatus != null) {
      $result.txStatus = txStatus;
    }
    return $result;
  }
  AddrTxFeeInfo._() : super();
  factory AddrTxFeeInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddrTxFeeInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddrTxFeeInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromAddr', protoName: 'fromAddr')
    ..aOS(2, _omitFieldNames ? '' : 'toAddr', protoName: 'toAddr')
    ..aOS(3, _omitFieldNames ? '' : 'txHash', protoName: 'txHash')
    ..aOS(4, _omitFieldNames ? '' : 'exec')
    ..aInt64(5, _omitFieldNames ? '' : 'fee')
    ..aInt64(6, _omitFieldNames ? '' : 'height')
    ..aInt64(7, _omitFieldNames ? '' : 'index')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'txStatus', $pb.PbFieldType.O3, protoName: 'txStatus')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddrTxFeeInfo clone() => AddrTxFeeInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddrTxFeeInfo copyWith(void Function(AddrTxFeeInfo) updates) => super.copyWith((message) => updates(message as AddrTxFeeInfo)) as AddrTxFeeInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddrTxFeeInfo create() => AddrTxFeeInfo._();
  AddrTxFeeInfo createEmptyInstance() => create();
  static $pb.PbList<AddrTxFeeInfo> createRepeated() => $pb.PbList<AddrTxFeeInfo>();
  @$core.pragma('dart2js:noInline')
  static AddrTxFeeInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddrTxFeeInfo>(create);
  static AddrTxFeeInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toAddr => $_getSZ(1);
  @$pb.TagNumber(2)
  set toAddr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToAddr() => $_has(1);
  @$pb.TagNumber(2)
  void clearToAddr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get txHash => $_getSZ(2);
  @$pb.TagNumber(3)
  set txHash($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTxHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearTxHash() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get exec => $_getSZ(3);
  @$pb.TagNumber(4)
  set exec($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasExec() => $_has(3);
  @$pb.TagNumber(4)
  void clearExec() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get fee => $_getI64(4);
  @$pb.TagNumber(5)
  set fee($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFee() => $_has(4);
  @$pb.TagNumber(5)
  void clearFee() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get height => $_getI64(5);
  @$pb.TagNumber(6)
  set height($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearHeight() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get index => $_getI64(6);
  @$pb.TagNumber(7)
  set index($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIndex() => $_has(6);
  @$pb.TagNumber(7)
  void clearIndex() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get txStatus => $_getIZ(7);
  @$pb.TagNumber(8)
  set txStatus($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTxStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearTxStatus() => clearField(8);
}

class AddrTxFeeInfos extends $pb.GeneratedMessage {
  factory AddrTxFeeInfos({
    $core.Iterable<AddrTxFeeInfo>? txInfos,
  }) {
    final $result = create();
    if (txInfos != null) {
      $result.txInfos.addAll(txInfos);
    }
    return $result;
  }
  AddrTxFeeInfos._() : super();
  factory AddrTxFeeInfos.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddrTxFeeInfos.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddrTxFeeInfos', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<AddrTxFeeInfo>(1, _omitFieldNames ? '' : 'txInfos', $pb.PbFieldType.PM, protoName: 'txInfos', subBuilder: AddrTxFeeInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddrTxFeeInfos clone() => AddrTxFeeInfos()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddrTxFeeInfos copyWith(void Function(AddrTxFeeInfos) updates) => super.copyWith((message) => updates(message as AddrTxFeeInfos)) as AddrTxFeeInfos;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddrTxFeeInfos create() => AddrTxFeeInfos._();
  AddrTxFeeInfos createEmptyInstance() => create();
  static $pb.PbList<AddrTxFeeInfos> createRepeated() => $pb.PbList<AddrTxFeeInfos>();
  @$core.pragma('dart2js:noInline')
  static AddrTxFeeInfos getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddrTxFeeInfos>(create);
  static AddrTxFeeInfos? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AddrTxFeeInfo> get txInfos => $_getList(0);
}

class ReceiptLog extends $pb.GeneratedMessage {
  factory ReceiptLog({
    $core.int? ty,
    $core.List<$core.int>? log,
  }) {
    final $result = create();
    if (ty != null) {
      $result.ty = ty;
    }
    if (log != null) {
      $result.log = log;
    }
    return $result;
  }
  ReceiptLog._() : super();
  factory ReceiptLog.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiptLog.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiptLog', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ty', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'log', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiptLog clone() => ReceiptLog()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiptLog copyWith(void Function(ReceiptLog) updates) => super.copyWith((message) => updates(message as ReceiptLog)) as ReceiptLog;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiptLog create() => ReceiptLog._();
  ReceiptLog createEmptyInstance() => create();
  static $pb.PbList<ReceiptLog> createRepeated() => $pb.PbList<ReceiptLog>();
  @$core.pragma('dart2js:noInline')
  static ReceiptLog getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiptLog>(create);
  static ReceiptLog? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ty => $_getIZ(0);
  @$pb.TagNumber(1)
  set ty($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTy() => $_has(0);
  @$pb.TagNumber(1)
  void clearTy() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get log => $_getN(1);
  @$pb.TagNumber(2)
  set log($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLog() => $_has(1);
  @$pb.TagNumber(2)
  void clearLog() => clearField(2);
}

/// ty = 0 -> error Receipt
/// ty = 1 -> CutFee //cut fee ,bug exec not ok
/// ty = 2 -> exec ok
class Receipt extends $pb.GeneratedMessage {
  factory Receipt({
    $core.int? ty,
    $core.Iterable<$0.KeyValue>? kV,
    $core.Iterable<ReceiptLog>? logs,
  }) {
    final $result = create();
    if (ty != null) {
      $result.ty = ty;
    }
    if (kV != null) {
      $result.kV.addAll(kV);
    }
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    return $result;
  }
  Receipt._() : super();
  factory Receipt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Receipt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Receipt', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ty', $pb.PbFieldType.O3)
    ..pc<$0.KeyValue>(2, _omitFieldNames ? '' : 'KV', $pb.PbFieldType.PM, protoName: 'KV', subBuilder: $0.KeyValue.create)
    ..pc<ReceiptLog>(3, _omitFieldNames ? '' : 'logs', $pb.PbFieldType.PM, subBuilder: ReceiptLog.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Receipt clone() => Receipt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Receipt copyWith(void Function(Receipt) updates) => super.copyWith((message) => updates(message as Receipt)) as Receipt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Receipt create() => Receipt._();
  Receipt createEmptyInstance() => create();
  static $pb.PbList<Receipt> createRepeated() => $pb.PbList<Receipt>();
  @$core.pragma('dart2js:noInline')
  static Receipt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Receipt>(create);
  static Receipt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ty => $_getIZ(0);
  @$pb.TagNumber(1)
  set ty($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTy() => $_has(0);
  @$pb.TagNumber(1)
  void clearTy() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$0.KeyValue> get kV => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<ReceiptLog> get logs => $_getList(2);
}

class ReceiptData extends $pb.GeneratedMessage {
  factory ReceiptData({
    $core.int? ty,
    $core.Iterable<ReceiptLog>? logs,
  }) {
    final $result = create();
    if (ty != null) {
      $result.ty = ty;
    }
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    return $result;
  }
  ReceiptData._() : super();
  factory ReceiptData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReceiptData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReceiptData', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ty', $pb.PbFieldType.O3)
    ..pc<ReceiptLog>(3, _omitFieldNames ? '' : 'logs', $pb.PbFieldType.PM, subBuilder: ReceiptLog.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReceiptData clone() => ReceiptData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReceiptData copyWith(void Function(ReceiptData) updates) => super.copyWith((message) => updates(message as ReceiptData)) as ReceiptData;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceiptData create() => ReceiptData._();
  ReceiptData createEmptyInstance() => create();
  static $pb.PbList<ReceiptData> createRepeated() => $pb.PbList<ReceiptData>();
  @$core.pragma('dart2js:noInline')
  static ReceiptData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReceiptData>(create);
  static ReceiptData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get ty => $_getIZ(0);
  @$pb.TagNumber(1)
  set ty($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTy() => $_has(0);
  @$pb.TagNumber(1)
  void clearTy() => clearField(1);

  @$pb.TagNumber(3)
  $core.List<ReceiptLog> get logs => $_getList(1);
}

class TxResult extends $pb.GeneratedMessage {
  factory TxResult({
    $fixnum.Int64? height,
    $core.int? index,
    Transaction? tx,
    ReceiptData? receiptdate,
    $fixnum.Int64? blocktime,
    $core.String? actionName,
  }) {
    final $result = create();
    if (height != null) {
      $result.height = height;
    }
    if (index != null) {
      $result.index = index;
    }
    if (tx != null) {
      $result.tx = tx;
    }
    if (receiptdate != null) {
      $result.receiptdate = receiptdate;
    }
    if (blocktime != null) {
      $result.blocktime = blocktime;
    }
    if (actionName != null) {
      $result.actionName = actionName;
    }
    return $result;
  }
  TxResult._() : super();
  factory TxResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TxResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'height')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'index', $pb.PbFieldType.O3)
    ..aOM<Transaction>(3, _omitFieldNames ? '' : 'tx', subBuilder: Transaction.create)
    ..aOM<ReceiptData>(4, _omitFieldNames ? '' : 'receiptdate', subBuilder: ReceiptData.create)
    ..aInt64(5, _omitFieldNames ? '' : 'blocktime')
    ..aOS(6, _omitFieldNames ? '' : 'actionName', protoName: 'actionName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxResult clone() => TxResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxResult copyWith(void Function(TxResult) updates) => super.copyWith((message) => updates(message as TxResult)) as TxResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxResult create() => TxResult._();
  TxResult createEmptyInstance() => create();
  static $pb.PbList<TxResult> createRepeated() => $pb.PbList<TxResult>();
  @$core.pragma('dart2js:noInline')
  static TxResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxResult>(create);
  static TxResult? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get height => $_getI64(0);
  @$pb.TagNumber(1)
  set height($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHeight() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeight() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  Transaction get tx => $_getN(2);
  @$pb.TagNumber(3)
  set tx(Transaction v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasTx() => $_has(2);
  @$pb.TagNumber(3)
  void clearTx() => clearField(3);
  @$pb.TagNumber(3)
  Transaction ensureTx() => $_ensure(2);

  @$pb.TagNumber(4)
  ReceiptData get receiptdate => $_getN(3);
  @$pb.TagNumber(4)
  set receiptdate(ReceiptData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceiptdate() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiptdate() => clearField(4);
  @$pb.TagNumber(4)
  ReceiptData ensureReceiptdate() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get blocktime => $_getI64(4);
  @$pb.TagNumber(5)
  set blocktime($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBlocktime() => $_has(4);
  @$pb.TagNumber(5)
  void clearBlocktime() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get actionName => $_getSZ(5);
  @$pb.TagNumber(6)
  set actionName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasActionName() => $_has(5);
  @$pb.TagNumber(6)
  void clearActionName() => clearField(6);
}

class TransactionDetail extends $pb.GeneratedMessage {
  factory TransactionDetail({
    Transaction? tx,
    ReceiptData? receipt,
    $core.Iterable<$core.List<$core.int>>? proofs,
    $fixnum.Int64? height,
    $fixnum.Int64? index,
    $fixnum.Int64? blocktime,
    $fixnum.Int64? amount,
    $core.String? fromaddr,
    $core.String? actionName,
    $core.Iterable<Asset>? assets,
    $core.Iterable<TxProof>? txProofs,
    $core.List<$core.int>? fullHash,
  }) {
    final $result = create();
    if (tx != null) {
      $result.tx = tx;
    }
    if (receipt != null) {
      $result.receipt = receipt;
    }
    if (proofs != null) {
      $result.proofs.addAll(proofs);
    }
    if (height != null) {
      $result.height = height;
    }
    if (index != null) {
      $result.index = index;
    }
    if (blocktime != null) {
      $result.blocktime = blocktime;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (fromaddr != null) {
      $result.fromaddr = fromaddr;
    }
    if (actionName != null) {
      $result.actionName = actionName;
    }
    if (assets != null) {
      $result.assets.addAll(assets);
    }
    if (txProofs != null) {
      $result.txProofs.addAll(txProofs);
    }
    if (fullHash != null) {
      $result.fullHash = fullHash;
    }
    return $result;
  }
  TransactionDetail._() : super();
  factory TransactionDetail.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionDetail.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionDetail', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'tx', subBuilder: Transaction.create)
    ..aOM<ReceiptData>(2, _omitFieldNames ? '' : 'receipt', subBuilder: ReceiptData.create)
    ..p<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'proofs', $pb.PbFieldType.PY)
    ..aInt64(4, _omitFieldNames ? '' : 'height')
    ..aInt64(5, _omitFieldNames ? '' : 'index')
    ..aInt64(6, _omitFieldNames ? '' : 'blocktime')
    ..aInt64(7, _omitFieldNames ? '' : 'amount')
    ..aOS(8, _omitFieldNames ? '' : 'fromaddr')
    ..aOS(9, _omitFieldNames ? '' : 'actionName', protoName: 'actionName')
    ..pc<Asset>(10, _omitFieldNames ? '' : 'assets', $pb.PbFieldType.PM, subBuilder: Asset.create)
    ..pc<TxProof>(11, _omitFieldNames ? '' : 'txProofs', $pb.PbFieldType.PM, protoName: 'txProofs', subBuilder: TxProof.create)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'fullHash', $pb.PbFieldType.OY, protoName: 'fullHash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionDetail clone() => TransactionDetail()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionDetail copyWith(void Function(TransactionDetail) updates) => super.copyWith((message) => updates(message as TransactionDetail)) as TransactionDetail;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionDetail create() => TransactionDetail._();
  TransactionDetail createEmptyInstance() => create();
  static $pb.PbList<TransactionDetail> createRepeated() => $pb.PbList<TransactionDetail>();
  @$core.pragma('dart2js:noInline')
  static TransactionDetail getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionDetail>(create);
  static TransactionDetail? _defaultInstance;

  @$pb.TagNumber(1)
  Transaction get tx => $_getN(0);
  @$pb.TagNumber(1)
  set tx(Transaction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTx() => $_has(0);
  @$pb.TagNumber(1)
  void clearTx() => clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTx() => $_ensure(0);

  @$pb.TagNumber(2)
  ReceiptData get receipt => $_getN(1);
  @$pb.TagNumber(2)
  set receipt(ReceiptData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceipt() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceipt() => clearField(2);
  @$pb.TagNumber(2)
  ReceiptData ensureReceipt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.List<$core.int>> get proofs => $_getList(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get height => $_getI64(3);
  @$pb.TagNumber(4)
  set height($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get index => $_getI64(4);
  @$pb.TagNumber(5)
  set index($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIndex() => $_has(4);
  @$pb.TagNumber(5)
  void clearIndex() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get blocktime => $_getI64(5);
  @$pb.TagNumber(6)
  set blocktime($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBlocktime() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlocktime() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get amount => $_getI64(6);
  @$pb.TagNumber(7)
  set amount($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearAmount() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get fromaddr => $_getSZ(7);
  @$pb.TagNumber(8)
  set fromaddr($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFromaddr() => $_has(7);
  @$pb.TagNumber(8)
  void clearFromaddr() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get actionName => $_getSZ(8);
  @$pb.TagNumber(9)
  set actionName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasActionName() => $_has(8);
  @$pb.TagNumber(9)
  void clearActionName() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<Asset> get assets => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<TxProof> get txProofs => $_getList(10);

  @$pb.TagNumber(12)
  $core.List<$core.int> get fullHash => $_getN(11);
  @$pb.TagNumber(12)
  set fullHash($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasFullHash() => $_has(11);
  @$pb.TagNumber(12)
  void clearFullHash() => clearField(12);
}

class TransactionDetails extends $pb.GeneratedMessage {
  factory TransactionDetails({
    $core.Iterable<TransactionDetail>? txs,
  }) {
    final $result = create();
    if (txs != null) {
      $result.txs.addAll(txs);
    }
    return $result;
  }
  TransactionDetails._() : super();
  factory TransactionDetails.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionDetails.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionDetails', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pc<TransactionDetail>(1, _omitFieldNames ? '' : 'txs', $pb.PbFieldType.PM, subBuilder: TransactionDetail.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionDetails clone() => TransactionDetails()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionDetails copyWith(void Function(TransactionDetails) updates) => super.copyWith((message) => updates(message as TransactionDetails)) as TransactionDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionDetails create() => TransactionDetails._();
  TransactionDetails createEmptyInstance() => create();
  static $pb.PbList<TransactionDetails> createRepeated() => $pb.PbList<TransactionDetails>();
  @$core.pragma('dart2js:noInline')
  static TransactionDetails getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionDetails>(create);
  static TransactionDetails? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TransactionDetail> get txs => $_getList(0);
}

class ReqAddrs extends $pb.GeneratedMessage {
  factory ReqAddrs({
    $core.Iterable<$core.String>? addrs,
  }) {
    final $result = create();
    if (addrs != null) {
      $result.addrs.addAll(addrs);
    }
    return $result;
  }
  ReqAddrs._() : super();
  factory ReqAddrs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqAddrs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqAddrs', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'addrs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqAddrs clone() => ReqAddrs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqAddrs copyWith(void Function(ReqAddrs) updates) => super.copyWith((message) => updates(message as ReqAddrs)) as ReqAddrs;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqAddrs create() => ReqAddrs._();
  ReqAddrs createEmptyInstance() => create();
  static $pb.PbList<ReqAddrs> createRepeated() => $pb.PbList<ReqAddrs>();
  @$core.pragma('dart2js:noInline')
  static ReqAddrs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqAddrs>(create);
  static ReqAddrs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get addrs => $_getList(0);
}

class ReqDecodeRawTransaction extends $pb.GeneratedMessage {
  factory ReqDecodeRawTransaction({
    $core.String? txHex,
  }) {
    final $result = create();
    if (txHex != null) {
      $result.txHex = txHex;
    }
    return $result;
  }
  ReqDecodeRawTransaction._() : super();
  factory ReqDecodeRawTransaction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqDecodeRawTransaction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqDecodeRawTransaction', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'txHex', protoName: 'txHex')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqDecodeRawTransaction clone() => ReqDecodeRawTransaction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqDecodeRawTransaction copyWith(void Function(ReqDecodeRawTransaction) updates) => super.copyWith((message) => updates(message as ReqDecodeRawTransaction)) as ReqDecodeRawTransaction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqDecodeRawTransaction create() => ReqDecodeRawTransaction._();
  ReqDecodeRawTransaction createEmptyInstance() => create();
  static $pb.PbList<ReqDecodeRawTransaction> createRepeated() => $pb.PbList<ReqDecodeRawTransaction>();
  @$core.pragma('dart2js:noInline')
  static ReqDecodeRawTransaction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqDecodeRawTransaction>(create);
  static ReqDecodeRawTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get txHex => $_getSZ(0);
  @$pb.TagNumber(1)
  set txHex($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTxHex() => $_has(0);
  @$pb.TagNumber(1)
  void clearTxHex() => clearField(1);
}

class UserWrite extends $pb.GeneratedMessage {
  factory UserWrite({
    $core.String? topic,
    $core.String? content,
  }) {
    final $result = create();
    if (topic != null) {
      $result.topic = topic;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  UserWrite._() : super();
  factory UserWrite.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserWrite.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserWrite', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'topic')
    ..aOS(2, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserWrite clone() => UserWrite()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserWrite copyWith(void Function(UserWrite) updates) => super.copyWith((message) => updates(message as UserWrite)) as UserWrite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserWrite create() => UserWrite._();
  UserWrite createEmptyInstance() => create();
  static $pb.PbList<UserWrite> createRepeated() => $pb.PbList<UserWrite>();
  @$core.pragma('dart2js:noInline')
  static UserWrite getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserWrite>(create);
  static UserWrite? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get topic => $_getSZ(0);
  @$pb.TagNumber(1)
  set topic($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTopic() => $_has(0);
  @$pb.TagNumber(1)
  void clearTopic() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get content => $_getSZ(1);
  @$pb.TagNumber(2)
  set content($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
}

class UpgradeMeta extends $pb.GeneratedMessage {
  factory UpgradeMeta({
    $core.bool? starting,
    $core.String? version,
    $fixnum.Int64? height,
  }) {
    final $result = create();
    if (starting != null) {
      $result.starting = starting;
    }
    if (version != null) {
      $result.version = version;
    }
    if (height != null) {
      $result.height = height;
    }
    return $result;
  }
  UpgradeMeta._() : super();
  factory UpgradeMeta.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpgradeMeta.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpgradeMeta', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'starting')
    ..aOS(2, _omitFieldNames ? '' : 'version')
    ..aInt64(3, _omitFieldNames ? '' : 'height')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpgradeMeta clone() => UpgradeMeta()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpgradeMeta copyWith(void Function(UpgradeMeta) updates) => super.copyWith((message) => updates(message as UpgradeMeta)) as UpgradeMeta;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpgradeMeta create() => UpgradeMeta._();
  UpgradeMeta createEmptyInstance() => create();
  static $pb.PbList<UpgradeMeta> createRepeated() => $pb.PbList<UpgradeMeta>();
  @$core.pragma('dart2js:noInline')
  static UpgradeMeta getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpgradeMeta>(create);
  static UpgradeMeta? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get starting => $_getBF(0);
  @$pb.TagNumber(1)
  set starting($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStarting() => $_has(0);
  @$pb.TagNumber(1)
  void clearStarting() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get version => $_getSZ(1);
  @$pb.TagNumber(2)
  set version($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get height => $_getI64(2);
  @$pb.TagNumber(3)
  set height($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => clearField(3);
}

/// 通过交易hash获取交易列表，需要区分是短hash还是全hash值
class ReqTxHashList extends $pb.GeneratedMessage {
  factory ReqTxHashList({
    $core.Iterable<$core.String>? hashes,
    $core.bool? isShortHash,
  }) {
    final $result = create();
    if (hashes != null) {
      $result.hashes.addAll(hashes);
    }
    if (isShortHash != null) {
      $result.isShortHash = isShortHash;
    }
    return $result;
  }
  ReqTxHashList._() : super();
  factory ReqTxHashList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqTxHashList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqTxHashList', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'hashes')
    ..aOB(2, _omitFieldNames ? '' : 'isShortHash', protoName: 'isShortHash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqTxHashList clone() => ReqTxHashList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqTxHashList copyWith(void Function(ReqTxHashList) updates) => super.copyWith((message) => updates(message as ReqTxHashList)) as ReqTxHashList;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqTxHashList create() => ReqTxHashList._();
  ReqTxHashList createEmptyInstance() => create();
  static $pb.PbList<ReqTxHashList> createRepeated() => $pb.PbList<ReqTxHashList>();
  @$core.pragma('dart2js:noInline')
  static ReqTxHashList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqTxHashList>(create);
  static ReqTxHashList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get hashes => $_getList(0);

  @$pb.TagNumber(2)
  $core.bool get isShortHash => $_getBF(1);
  @$pb.TagNumber(2)
  set isShortHash($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsShortHash() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsShortHash() => clearField(2);
}

/// 使用多层merkle树之后的proof证明结构体
class TxProof extends $pb.GeneratedMessage {
  factory TxProof({
    $core.Iterable<$core.List<$core.int>>? proofs,
    $core.int? index,
    $core.List<$core.int>? rootHash,
  }) {
    final $result = create();
    if (proofs != null) {
      $result.proofs.addAll(proofs);
    }
    if (index != null) {
      $result.index = index;
    }
    if (rootHash != null) {
      $result.rootHash = rootHash;
    }
    return $result;
  }
  TxProof._() : super();
  factory TxProof.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TxProof.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TxProof', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'proofs', $pb.PbFieldType.PY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'index', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'rootHash', $pb.PbFieldType.OY, protoName: 'rootHash')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TxProof clone() => TxProof()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TxProof copyWith(void Function(TxProof) updates) => super.copyWith((message) => updates(message as TxProof)) as TxProof;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TxProof create() => TxProof._();
  TxProof createEmptyInstance() => create();
  static $pb.PbList<TxProof> createRepeated() => $pb.PbList<TxProof>();
  @$core.pragma('dart2js:noInline')
  static TxProof getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TxProof>(create);
  static TxProof? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get proofs => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get index => $_getIZ(1);
  @$pb.TagNumber(2)
  set index($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIndex() => $_has(1);
  @$pb.TagNumber(2)
  void clearIndex() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get rootHash => $_getN(2);
  @$pb.TagNumber(3)
  set rootHash($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRootHash() => $_has(2);
  @$pb.TagNumber(3)
  void clearRootHash() => clearField(3);
}

/// 指定交易哈希，查找是否存在
class ReqCheckTxsExist extends $pb.GeneratedMessage {
  factory ReqCheckTxsExist({
    $core.Iterable<$core.List<$core.int>>? txHashes,
  }) {
    final $result = create();
    if (txHashes != null) {
      $result.txHashes.addAll(txHashes);
    }
    return $result;
  }
  ReqCheckTxsExist._() : super();
  factory ReqCheckTxsExist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReqCheckTxsExist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReqCheckTxsExist', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'txHashes', $pb.PbFieldType.PY, protoName: 'txHashes')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReqCheckTxsExist clone() => ReqCheckTxsExist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReqCheckTxsExist copyWith(void Function(ReqCheckTxsExist) updates) => super.copyWith((message) => updates(message as ReqCheckTxsExist)) as ReqCheckTxsExist;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReqCheckTxsExist create() => ReqCheckTxsExist._();
  ReqCheckTxsExist createEmptyInstance() => create();
  static $pb.PbList<ReqCheckTxsExist> createRepeated() => $pb.PbList<ReqCheckTxsExist>();
  @$core.pragma('dart2js:noInline')
  static ReqCheckTxsExist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReqCheckTxsExist>(create);
  static ReqCheckTxsExist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.List<$core.int>> get txHashes => $_getList(0);
}

class ReplyCheckTxsExist extends $pb.GeneratedMessage {
  factory ReplyCheckTxsExist({
    $core.Iterable<$core.bool>? existFlags,
    $core.int? existCount,
  }) {
    final $result = create();
    if (existFlags != null) {
      $result.existFlags.addAll(existFlags);
    }
    if (existCount != null) {
      $result.existCount = existCount;
    }
    return $result;
  }
  ReplyCheckTxsExist._() : super();
  factory ReplyCheckTxsExist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyCheckTxsExist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyCheckTxsExist', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..p<$core.bool>(1, _omitFieldNames ? '' : 'existFlags', $pb.PbFieldType.KB, protoName: 'existFlags')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'existCount', $pb.PbFieldType.OU3, protoName: 'existCount')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyCheckTxsExist clone() => ReplyCheckTxsExist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyCheckTxsExist copyWith(void Function(ReplyCheckTxsExist) updates) => super.copyWith((message) => updates(message as ReplyCheckTxsExist)) as ReplyCheckTxsExist;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyCheckTxsExist create() => ReplyCheckTxsExist._();
  ReplyCheckTxsExist createEmptyInstance() => create();
  static $pb.PbList<ReplyCheckTxsExist> createRepeated() => $pb.PbList<ReplyCheckTxsExist>();
  @$core.pragma('dart2js:noInline')
  static ReplyCheckTxsExist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyCheckTxsExist>(create);
  static ReplyCheckTxsExist? _defaultInstance;

  /// 对应请求序列存在标识数组，存在则true，否则false
  @$pb.TagNumber(1)
  $core.List<$core.bool> get existFlags => $_getList(0);

  /// 存在情况的总个数
  @$pb.TagNumber(2)
  $core.int get existCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set existCount($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasExistCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearExistCount() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
