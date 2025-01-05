//
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use replyDescriptor instead')
const Reply$json = {
  '1': 'Reply',
  '2': [
    {'1': 'isOk', '3': 1, '4': 1, '5': 8, '10': 'isOk'},
    {'1': 'msg', '3': 2, '4': 1, '5': 12, '10': 'msg'},
  ],
};

/// Descriptor for `Reply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyDescriptor = $convert.base64Decode(
    'CgVSZXBseRISCgRpc09rGAEgASgIUgRpc09rEhAKA21zZxgCIAEoDFIDbXNn');

@$core.Deprecated('Use reqStringDescriptor instead')
const ReqString$json = {
  '1': 'ReqString',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `ReqString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqStringDescriptor = $convert.base64Decode(
    'CglSZXFTdHJpbmcSEgoEZGF0YRgBIAEoCVIEZGF0YQ==');

@$core.Deprecated('Use reqMultiStringsDescriptor instead')
const ReqMultiStrings$json = {
  '1': 'ReqMultiStrings',
  '2': [
    {'1': 'datas', '3': 1, '4': 3, '5': 9, '10': 'datas'},
  ],
};

/// Descriptor for `ReqMultiStrings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqMultiStringsDescriptor = $convert.base64Decode(
    'Cg9SZXFNdWx0aVN0cmluZ3MSFAoFZGF0YXMYASADKAlSBWRhdGFz');

@$core.Deprecated('Use replyStringDescriptor instead')
const ReplyString$json = {
  '1': 'ReplyString',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `ReplyString`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyStringDescriptor = $convert.base64Decode(
    'CgtSZXBseVN0cmluZxISCgRkYXRhGAEgASgJUgRkYXRh');

@$core.Deprecated('Use replyStringsDescriptor instead')
const ReplyStrings$json = {
  '1': 'ReplyStrings',
  '2': [
    {'1': 'datas', '3': 1, '4': 3, '5': 9, '10': 'datas'},
  ],
};

/// Descriptor for `ReplyStrings`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyStringsDescriptor = $convert.base64Decode(
    'CgxSZXBseVN0cmluZ3MSFAoFZGF0YXMYASADKAlSBWRhdGFz');

@$core.Deprecated('Use reqIntDescriptor instead')
const ReqInt$json = {
  '1': 'ReqInt',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `ReqInt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqIntDescriptor = $convert.base64Decode(
    'CgZSZXFJbnQSFgoGaGVpZ2h0GAEgASgDUgZoZWlnaHQ=');

@$core.Deprecated('Use int64Descriptor instead')
const Int64$json = {
  '1': 'Int64',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 3, '10': 'data'},
  ],
};

/// Descriptor for `Int64`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List int64Descriptor = $convert.base64Decode(
    'CgVJbnQ2NBISCgRkYXRhGAEgASgDUgRkYXRh');

@$core.Deprecated('Use reqHashDescriptor instead')
const ReqHash$json = {
  '1': 'ReqHash',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'upgrade', '3': 2, '4': 1, '5': 8, '10': 'upgrade'},
  ],
};

/// Descriptor for `ReqHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqHashDescriptor = $convert.base64Decode(
    'CgdSZXFIYXNoEhIKBGhhc2gYASABKAxSBGhhc2gSGAoHdXBncmFkZRgCIAEoCFIHdXBncmFkZQ'
    '==');

@$core.Deprecated('Use replyHashDescriptor instead')
const ReplyHash$json = {
  '1': 'ReplyHash',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `ReplyHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyHashDescriptor = $convert.base64Decode(
    'CglSZXBseUhhc2gSEgoEaGFzaBgBIAEoDFIEaGFzaA==');

@$core.Deprecated('Use reqNilDescriptor instead')
const ReqNil$json = {
  '1': 'ReqNil',
};

/// Descriptor for `ReqNil`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqNilDescriptor = $convert.base64Decode(
    'CgZSZXFOaWw=');

@$core.Deprecated('Use reqBytesDescriptor instead')
const ReqBytes$json = {
  '1': 'ReqBytes',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ReqBytes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqBytesDescriptor = $convert.base64Decode(
    'CghSZXFCeXRlcxISCgRkYXRhGAEgASgMUgRkYXRh');

@$core.Deprecated('Use reqHashesDescriptor instead')
const ReqHashes$json = {
  '1': 'ReqHashes',
  '2': [
    {'1': 'hashes', '3': 1, '4': 3, '5': 12, '10': 'hashes'},
  ],
};

/// Descriptor for `ReqHashes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqHashesDescriptor = $convert.base64Decode(
    'CglSZXFIYXNoZXMSFgoGaGFzaGVzGAEgAygMUgZoYXNoZXM=');

@$core.Deprecated('Use replyHashesDescriptor instead')
const ReplyHashes$json = {
  '1': 'ReplyHashes',
  '2': [
    {'1': 'hashes', '3': 1, '4': 3, '5': 12, '10': 'hashes'},
  ],
};

/// Descriptor for `ReplyHashes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyHashesDescriptor = $convert.base64Decode(
    'CgtSZXBseUhhc2hlcxIWCgZoYXNoZXMYASADKAxSBmhhc2hlcw==');

@$core.Deprecated('Use keyValueDescriptor instead')
const KeyValue$json = {
  '1': 'KeyValue',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 12, '10': 'value'},
  ],
};

/// Descriptor for `KeyValue`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyValueDescriptor = $convert.base64Decode(
    'CghLZXlWYWx1ZRIQCgNrZXkYASABKAxSA2tleRIUCgV2YWx1ZRgCIAEoDFIFdmFsdWU=');

@$core.Deprecated('Use txHashDescriptor instead')
const TxHash$json = {
  '1': 'TxHash',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 9, '10': 'hash'},
  ],
};

/// Descriptor for `TxHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txHashDescriptor = $convert.base64Decode(
    'CgZUeEhhc2gSEgoEaGFzaBgBIAEoCVIEaGFzaA==');

@$core.Deprecated('Use timeStatusDescriptor instead')
const TimeStatus$json = {
  '1': 'TimeStatus',
  '2': [
    {'1': 'ntpTime', '3': 1, '4': 1, '5': 9, '10': 'ntpTime'},
    {'1': 'localTime', '3': 2, '4': 1, '5': 9, '10': 'localTime'},
    {'1': 'diff', '3': 3, '4': 1, '5': 3, '10': 'diff'},
  ],
};

/// Descriptor for `TimeStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List timeStatusDescriptor = $convert.base64Decode(
    'CgpUaW1lU3RhdHVzEhgKB250cFRpbWUYASABKAlSB250cFRpbWUSHAoJbG9jYWxUaW1lGAIgAS'
    'gJUglsb2NhbFRpbWUSEgoEZGlmZhgDIAEoA1IEZGlmZg==');

@$core.Deprecated('Use reqKeyDescriptor instead')
const ReqKey$json = {
  '1': 'ReqKey',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 12, '10': 'key'},
  ],
};

/// Descriptor for `ReqKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqKeyDescriptor = $convert.base64Decode(
    'CgZSZXFLZXkSEAoDa2V5GAEgASgMUgNrZXk=');

@$core.Deprecated('Use reqRandHashDescriptor instead')
const ReqRandHash$json = {
  '1': 'ReqRandHash',
  '2': [
    {'1': 'execName', '3': 1, '4': 1, '5': 9, '10': 'execName'},
    {'1': 'height', '3': 2, '4': 1, '5': 3, '10': 'height'},
    {'1': 'blockNum', '3': 3, '4': 1, '5': 3, '10': 'blockNum'},
    {'1': 'hash', '3': 4, '4': 1, '5': 12, '10': 'hash'},
  ],
};

/// Descriptor for `ReqRandHash`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqRandHashDescriptor = $convert.base64Decode(
    'CgtSZXFSYW5kSGFzaBIaCghleGVjTmFtZRgBIAEoCVIIZXhlY05hbWUSFgoGaGVpZ2h0GAIgAS'
    'gDUgZoZWlnaHQSGgoIYmxvY2tOdW0YAyABKANSCGJsb2NrTnVtEhIKBGhhc2gYBCABKAxSBGhh'
    'c2g=');

@$core.Deprecated('Use versionInfoDescriptor instead')
const VersionInfo$json = {
  '1': 'VersionInfo',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'app', '3': 2, '4': 1, '5': 9, '10': 'app'},
    {'1': 'chain33', '3': 3, '4': 1, '5': 9, '10': 'chain33'},
    {'1': 'localDb', '3': 4, '4': 1, '5': 9, '10': 'localDb'},
    {'1': 'chainID', '3': 5, '4': 1, '5': 5, '10': 'chainID'},
  ],
};

/// Descriptor for `VersionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionInfoDescriptor = $convert.base64Decode(
    'CgtWZXJzaW9uSW5mbxIUCgV0aXRsZRgBIAEoCVIFdGl0bGUSEAoDYXBwGAIgASgJUgNhcHASGA'
    'oHY2hhaW4zMxgDIAEoCVIHY2hhaW4zMxIYCgdsb2NhbERiGAQgASgJUgdsb2NhbERiEhgKB2No'
    'YWluSUQYBSABKAVSB2NoYWluSUQ=');

