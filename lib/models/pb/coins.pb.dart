//
//  Generated code. Do not modify.
//  source: coins.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'transaction.pb.dart' as $1;

enum CoinsAction_Value {
  transfer, 
  genesis, 
  withdraw, 
  transferToExec, 
  notSet
}

/// message for execs.coins
class CoinsAction extends $pb.GeneratedMessage {
  factory CoinsAction({
    $1.AssetsTransfer? transfer,
    $1.AssetsGenesis? genesis,
    $core.int? ty,
    $1.AssetsWithdraw? withdraw,
    $1.AssetsTransferToExec? transferToExec,
  }) {
    final $result = create();
    if (transfer != null) {
      $result.transfer = transfer;
    }
    if (genesis != null) {
      $result.genesis = genesis;
    }
    if (ty != null) {
      $result.ty = ty;
    }
    if (withdraw != null) {
      $result.withdraw = withdraw;
    }
    if (transferToExec != null) {
      $result.transferToExec = transferToExec;
    }
    return $result;
  }
  CoinsAction._() : super();
  factory CoinsAction.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CoinsAction.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, CoinsAction_Value> _CoinsAction_ValueByTag = {
    1 : CoinsAction_Value.transfer,
    2 : CoinsAction_Value.genesis,
    4 : CoinsAction_Value.withdraw,
    5 : CoinsAction_Value.transferToExec,
    0 : CoinsAction_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CoinsAction', package: const $pb.PackageName(_omitMessageNames ? '' : 'types'), createEmptyInstance: create)
    ..oo(0, [1, 2, 4, 5])
    ..aOM<$1.AssetsTransfer>(1, _omitFieldNames ? '' : 'transfer', subBuilder: $1.AssetsTransfer.create)
    ..aOM<$1.AssetsGenesis>(2, _omitFieldNames ? '' : 'genesis', subBuilder: $1.AssetsGenesis.create)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'ty', $pb.PbFieldType.O3)
    ..aOM<$1.AssetsWithdraw>(4, _omitFieldNames ? '' : 'withdraw', subBuilder: $1.AssetsWithdraw.create)
    ..aOM<$1.AssetsTransferToExec>(5, _omitFieldNames ? '' : 'transferToExec', protoName: 'transferToExec', subBuilder: $1.AssetsTransferToExec.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CoinsAction clone() => CoinsAction()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CoinsAction copyWith(void Function(CoinsAction) updates) => super.copyWith((message) => updates(message as CoinsAction)) as CoinsAction;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CoinsAction create() => CoinsAction._();
  CoinsAction createEmptyInstance() => create();
  static $pb.PbList<CoinsAction> createRepeated() => $pb.PbList<CoinsAction>();
  @$core.pragma('dart2js:noInline')
  static CoinsAction getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CoinsAction>(create);
  static CoinsAction? _defaultInstance;

  CoinsAction_Value whichValue() => _CoinsAction_ValueByTag[$_whichOneof(0)]!;
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $1.AssetsTransfer get transfer => $_getN(0);
  @$pb.TagNumber(1)
  set transfer($1.AssetsTransfer v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTransfer() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransfer() => clearField(1);
  @$pb.TagNumber(1)
  $1.AssetsTransfer ensureTransfer() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.AssetsGenesis get genesis => $_getN(1);
  @$pb.TagNumber(2)
  set genesis($1.AssetsGenesis v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGenesis() => $_has(1);
  @$pb.TagNumber(2)
  void clearGenesis() => clearField(2);
  @$pb.TagNumber(2)
  $1.AssetsGenesis ensureGenesis() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get ty => $_getIZ(2);
  @$pb.TagNumber(3)
  set ty($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTy() => $_has(2);
  @$pb.TagNumber(3)
  void clearTy() => clearField(3);

  @$pb.TagNumber(4)
  $1.AssetsWithdraw get withdraw => $_getN(3);
  @$pb.TagNumber(4)
  set withdraw($1.AssetsWithdraw v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWithdraw() => $_has(3);
  @$pb.TagNumber(4)
  void clearWithdraw() => clearField(4);
  @$pb.TagNumber(4)
  $1.AssetsWithdraw ensureWithdraw() => $_ensure(3);

  @$pb.TagNumber(5)
  $1.AssetsTransferToExec get transferToExec => $_getN(4);
  @$pb.TagNumber(5)
  set transferToExec($1.AssetsTransferToExec v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTransferToExec() => $_has(4);
  @$pb.TagNumber(5)
  void clearTransferToExec() => clearField(5);
  @$pb.TagNumber(5)
  $1.AssetsTransferToExec ensureTransferToExec() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
