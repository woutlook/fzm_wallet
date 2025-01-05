//
//  Generated code. Do not modify.
//  source: coins.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use coinsActionDescriptor instead')
const CoinsAction$json = {
  '1': 'CoinsAction',
  '2': [
    {'1': 'transfer', '3': 1, '4': 1, '5': 11, '6': '.types.AssetsTransfer', '9': 0, '10': 'transfer'},
    {'1': 'withdraw', '3': 4, '4': 1, '5': 11, '6': '.types.AssetsWithdraw', '9': 0, '10': 'withdraw'},
    {'1': 'genesis', '3': 2, '4': 1, '5': 11, '6': '.types.AssetsGenesis', '9': 0, '10': 'genesis'},
    {'1': 'transferToExec', '3': 5, '4': 1, '5': 11, '6': '.types.AssetsTransferToExec', '9': 0, '10': 'transferToExec'},
    {'1': 'ty', '3': 3, '4': 1, '5': 5, '10': 'ty'},
  ],
  '8': [
    {'1': 'value'},
  ],
};

/// Descriptor for `CoinsAction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List coinsActionDescriptor = $convert.base64Decode(
    'CgtDb2luc0FjdGlvbhIzCgh0cmFuc2ZlchgBIAEoCzIVLnR5cGVzLkFzc2V0c1RyYW5zZmVySA'
    'BSCHRyYW5zZmVyEjMKCHdpdGhkcmF3GAQgASgLMhUudHlwZXMuQXNzZXRzV2l0aGRyYXdIAFII'
    'd2l0aGRyYXcSMAoHZ2VuZXNpcxgCIAEoCzIULnR5cGVzLkFzc2V0c0dlbmVzaXNIAFIHZ2VuZX'
    'NpcxJFCg50cmFuc2ZlclRvRXhlYxgFIAEoCzIbLnR5cGVzLkFzc2V0c1RyYW5zZmVyVG9FeGVj'
    'SABSDnRyYW5zZmVyVG9FeGVjEg4KAnR5GAMgASgFUgJ0eUIHCgV2YWx1ZQ==');

