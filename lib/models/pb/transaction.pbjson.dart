//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use assetsGenesisDescriptor instead')
const AssetsGenesis$json = {
  '1': 'AssetsGenesis',
  '2': [
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'returnAddress', '3': 3, '4': 1, '5': 9, '10': 'returnAddress'},
  ],
};

/// Descriptor for `AssetsGenesis`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetsGenesisDescriptor = $convert.base64Decode(
    'Cg1Bc3NldHNHZW5lc2lzEhYKBmFtb3VudBgCIAEoA1IGYW1vdW50EiQKDXJldHVybkFkZHJlc3'
    'MYAyABKAlSDXJldHVybkFkZHJlc3M=');

@$core.Deprecated('Use assetsTransferToExecDescriptor instead')
const AssetsTransferToExec$json = {
  '1': 'AssetsTransferToExec',
  '2': [
    {'1': 'cointoken', '3': 1, '4': 1, '5': 9, '10': 'cointoken'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'note', '3': 3, '4': 1, '5': 12, '10': 'note'},
    {'1': 'execName', '3': 4, '4': 1, '5': 9, '10': 'execName'},
    {'1': 'to', '3': 5, '4': 1, '5': 9, '10': 'to'},
  ],
};

/// Descriptor for `AssetsTransferToExec`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetsTransferToExecDescriptor = $convert.base64Decode(
    'ChRBc3NldHNUcmFuc2ZlclRvRXhlYxIcCgljb2ludG9rZW4YASABKAlSCWNvaW50b2tlbhIWCg'
    'ZhbW91bnQYAiABKANSBmFtb3VudBISCgRub3RlGAMgASgMUgRub3RlEhoKCGV4ZWNOYW1lGAQg'
    'ASgJUghleGVjTmFtZRIOCgJ0bxgFIAEoCVICdG8=');

@$core.Deprecated('Use assetsWithdrawDescriptor instead')
const AssetsWithdraw$json = {
  '1': 'AssetsWithdraw',
  '2': [
    {'1': 'cointoken', '3': 1, '4': 1, '5': 9, '10': 'cointoken'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'note', '3': 3, '4': 1, '5': 12, '10': 'note'},
    {'1': 'execName', '3': 4, '4': 1, '5': 9, '10': 'execName'},
    {'1': 'to', '3': 5, '4': 1, '5': 9, '10': 'to'},
  ],
};

/// Descriptor for `AssetsWithdraw`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetsWithdrawDescriptor = $convert.base64Decode(
    'Cg5Bc3NldHNXaXRoZHJhdxIcCgljb2ludG9rZW4YASABKAlSCWNvaW50b2tlbhIWCgZhbW91bn'
    'QYAiABKANSBmFtb3VudBISCgRub3RlGAMgASgMUgRub3RlEhoKCGV4ZWNOYW1lGAQgASgJUghl'
    'eGVjTmFtZRIOCgJ0bxgFIAEoCVICdG8=');

@$core.Deprecated('Use assetsTransferDescriptor instead')
const AssetsTransfer$json = {
  '1': 'AssetsTransfer',
  '2': [
    {'1': 'cointoken', '3': 1, '4': 1, '5': 9, '10': 'cointoken'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'note', '3': 3, '4': 1, '5': 12, '10': 'note'},
    {'1': 'to', '3': 4, '4': 1, '5': 9, '10': 'to'},
  ],
};

/// Descriptor for `AssetsTransfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetsTransferDescriptor = $convert.base64Decode(
    'Cg5Bc3NldHNUcmFuc2ZlchIcCgljb2ludG9rZW4YASABKAlSCWNvaW50b2tlbhIWCgZhbW91bn'
    'QYAiABKANSBmFtb3VudBISCgRub3RlGAMgASgMUgRub3RlEg4KAnRvGAQgASgJUgJ0bw==');

@$core.Deprecated('Use assetDescriptor instead')
const Asset$json = {
  '1': 'Asset',
  '2': [
    {'1': 'exec', '3': 1, '4': 1, '5': 9, '10': 'exec'},
    {'1': 'symbol', '3': 2, '4': 1, '5': 9, '10': 'symbol'},
    {'1': 'amount', '3': 3, '4': 1, '5': 3, '10': 'amount'},
  ],
};

/// Descriptor for `Asset`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List assetDescriptor = $convert.base64Decode(
    'CgVBc3NldBISCgRleGVjGAEgASgJUgRleGVjEhYKBnN5bWJvbBgCIAEoCVIGc3ltYm9sEhYKBm'
    'Ftb3VudBgDIAEoA1IGYW1vdW50');

@$core.Deprecated('Use createTxDescriptor instead')
const CreateTx$json = {
  '1': 'CreateTx',
  '2': [
    {'1': 'to', '3': 1, '4': 1, '5': 9, '10': 'to'},
    {'1': 'amount', '3': 2, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'fee', '3': 3, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'note', '3': 4, '4': 1, '5': 12, '10': 'note'},
    {'1': 'isWithdraw', '3': 5, '4': 1, '5': 8, '10': 'isWithdraw'},
    {'1': 'isToken', '3': 6, '4': 1, '5': 8, '10': 'isToken'},
    {'1': 'tokenSymbol', '3': 7, '4': 1, '5': 9, '10': 'tokenSymbol'},
    {'1': 'execName', '3': 8, '4': 1, '5': 9, '10': 'execName'},
    {'1': 'execer', '3': 9, '4': 1, '5': 9, '10': 'execer'},
  ],
};

/// Descriptor for `CreateTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTxDescriptor = $convert.base64Decode(
    'CghDcmVhdGVUeBIOCgJ0bxgBIAEoCVICdG8SFgoGYW1vdW50GAIgASgDUgZhbW91bnQSEAoDZm'
    'VlGAMgASgDUgNmZWUSEgoEbm90ZRgEIAEoDFIEbm90ZRIeCgppc1dpdGhkcmF3GAUgASgIUgpp'
    'c1dpdGhkcmF3EhgKB2lzVG9rZW4YBiABKAhSB2lzVG9rZW4SIAoLdG9rZW5TeW1ib2wYByABKA'
    'lSC3Rva2VuU3ltYm9sEhoKCGV4ZWNOYW1lGAggASgJUghleGVjTmFtZRIWCgZleGVjZXIYCSAB'
    'KAlSBmV4ZWNlcg==');

@$core.Deprecated('Use reWriteRawTxDescriptor instead')
const ReWriteRawTx$json = {
  '1': 'ReWriteRawTx',
  '2': [
    {'1': 'tx', '3': 1, '4': 1, '5': 9, '10': 'tx'},
    {'1': 'to', '3': 3, '4': 1, '5': 9, '10': 'to'},
    {'1': 'expire', '3': 4, '4': 1, '5': 9, '10': 'expire'},
    {'1': 'fee', '3': 5, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'index', '3': 6, '4': 1, '5': 5, '10': 'index'},
  ],
};

/// Descriptor for `ReWriteRawTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reWriteRawTxDescriptor = $convert.base64Decode(
    'CgxSZVdyaXRlUmF3VHgSDgoCdHgYASABKAlSAnR4Eg4KAnRvGAMgASgJUgJ0bxIWCgZleHBpcm'
    'UYBCABKAlSBmV4cGlyZRIQCgNmZWUYBSABKANSA2ZlZRIUCgVpbmRleBgGIAEoBVIFaW5kZXg=');

@$core.Deprecated('Use createTransactionGroupDescriptor instead')
const CreateTransactionGroup$json = {
  '1': 'CreateTransactionGroup',
  '2': [
    {'1': 'txs', '3': 1, '4': 3, '5': 9, '10': 'txs'},
  ],
};

/// Descriptor for `CreateTransactionGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTransactionGroupDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVUcmFuc2FjdGlvbkdyb3VwEhAKA3R4cxgBIAMoCVIDdHhz');

@$core.Deprecated('Use unsignTxDescriptor instead')
const UnsignTx$json = {
  '1': 'UnsignTx',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `UnsignTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unsignTxDescriptor = $convert.base64Decode(
    'CghVbnNpZ25UeBISCgRkYXRhGAEgASgMUgRkYXRh');

@$core.Deprecated('Use noBalanceTxsDescriptor instead')
const NoBalanceTxs$json = {
  '1': 'NoBalanceTxs',
  '2': [
    {'1': 'txHexs', '3': 1, '4': 3, '5': 9, '10': 'txHexs'},
    {'1': 'payAddr', '3': 2, '4': 1, '5': 9, '10': 'payAddr'},
    {'1': 'privkey', '3': 3, '4': 1, '5': 9, '10': 'privkey'},
    {'1': 'expire', '3': 4, '4': 1, '5': 9, '10': 'expire'},
  ],
};

/// Descriptor for `NoBalanceTxs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noBalanceTxsDescriptor = $convert.base64Decode(
    'CgxOb0JhbGFuY2VUeHMSFgoGdHhIZXhzGAEgAygJUgZ0eEhleHMSGAoHcGF5QWRkchgCIAEoCV'
    'IHcGF5QWRkchIYCgdwcml2a2V5GAMgASgJUgdwcml2a2V5EhYKBmV4cGlyZRgEIAEoCVIGZXhw'
    'aXJl');

@$core.Deprecated('Use noBalanceTxDescriptor instead')
const NoBalanceTx$json = {
  '1': 'NoBalanceTx',
  '2': [
    {'1': 'txHex', '3': 1, '4': 1, '5': 9, '10': 'txHex'},
    {'1': 'payAddr', '3': 2, '4': 1, '5': 9, '10': 'payAddr'},
    {'1': 'privkey', '3': 3, '4': 1, '5': 9, '10': 'privkey'},
    {'1': 'expire', '3': 4, '4': 1, '5': 9, '10': 'expire'},
  ],
};

/// Descriptor for `NoBalanceTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List noBalanceTxDescriptor = $convert.base64Decode(
    'CgtOb0JhbGFuY2VUeBIUCgV0eEhleBgBIAEoCVIFdHhIZXgSGAoHcGF5QWRkchgCIAEoCVIHcG'
    'F5QWRkchIYCgdwcml2a2V5GAMgASgJUgdwcml2a2V5EhYKBmV4cGlyZRgEIAEoCVIGZXhwaXJl');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'execer', '3': 1, '4': 1, '5': 12, '10': 'execer'},
    {'1': 'payload', '3': 2, '4': 1, '5': 12, '10': 'payload'},
    {'1': 'signature', '3': 3, '4': 1, '5': 11, '6': '.types.Signature', '10': 'signature'},
    {'1': 'fee', '3': 4, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'expire', '3': 5, '4': 1, '5': 3, '10': 'expire'},
    {'1': 'nonce', '3': 6, '4': 1, '5': 3, '10': 'nonce'},
    {'1': 'to', '3': 7, '4': 1, '5': 9, '10': 'to'},
    {'1': 'groupCount', '3': 8, '4': 1, '5': 5, '10': 'groupCount'},
    {'1': 'header', '3': 9, '4': 1, '5': 12, '10': 'header'},
    {'1': 'next', '3': 10, '4': 1, '5': 12, '10': 'next'},
    {'1': 'chainID', '3': 11, '4': 1, '5': 5, '10': 'chainID'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIWCgZleGVjZXIYASABKAxSBmV4ZWNlchIYCgdwYXlsb2FkGAIgASgMUg'
    'dwYXlsb2FkEi4KCXNpZ25hdHVyZRgDIAEoCzIQLnR5cGVzLlNpZ25hdHVyZVIJc2lnbmF0dXJl'
    'EhAKA2ZlZRgEIAEoA1IDZmVlEhYKBmV4cGlyZRgFIAEoA1IGZXhwaXJlEhQKBW5vbmNlGAYgAS'
    'gDUgVub25jZRIOCgJ0bxgHIAEoCVICdG8SHgoKZ3JvdXBDb3VudBgIIAEoBVIKZ3JvdXBDb3Vu'
    'dBIWCgZoZWFkZXIYCSABKAxSBmhlYWRlchISCgRuZXh0GAogASgMUgRuZXh0EhgKB2NoYWluSU'
    'QYCyABKAVSB2NoYWluSUQ=');

@$core.Deprecated('Use transactionsDescriptor instead')
const Transactions$json = {
  '1': 'Transactions',
  '2': [
    {'1': 'txs', '3': 1, '4': 3, '5': 11, '6': '.types.Transaction', '10': 'txs'},
  ],
};

/// Descriptor for `Transactions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionsDescriptor = $convert.base64Decode(
    'CgxUcmFuc2FjdGlvbnMSJAoDdHhzGAEgAygLMhIudHlwZXMuVHJhbnNhY3Rpb25SA3R4cw==');

@$core.Deprecated('Use ringSignatureDescriptor instead')
const RingSignature$json = {
  '1': 'RingSignature',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.types.RingSignatureItem', '10': 'items'},
  ],
};

/// Descriptor for `RingSignature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ringSignatureDescriptor = $convert.base64Decode(
    'Cg1SaW5nU2lnbmF0dXJlEi4KBWl0ZW1zGAEgAygLMhgudHlwZXMuUmluZ1NpZ25hdHVyZUl0ZW'
    '1SBWl0ZW1z');

@$core.Deprecated('Use ringSignatureItemDescriptor instead')
const RingSignatureItem$json = {
  '1': 'RingSignatureItem',
  '2': [
    {'1': 'pubkey', '3': 1, '4': 3, '5': 12, '10': 'pubkey'},
    {'1': 'signature', '3': 2, '4': 3, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `RingSignatureItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ringSignatureItemDescriptor = $convert.base64Decode(
    'ChFSaW5nU2lnbmF0dXJlSXRlbRIWCgZwdWJrZXkYASADKAxSBnB1YmtleRIcCglzaWduYXR1cm'
    'UYAiADKAxSCXNpZ25hdHVyZQ==');

@$core.Deprecated('Use signatureDescriptor instead')
const Signature$json = {
  '1': 'Signature',
  '2': [
    {'1': 'ty', '3': 1, '4': 1, '5': 5, '10': 'ty'},
    {'1': 'pubkey', '3': 2, '4': 1, '5': 12, '10': 'pubkey'},
    {'1': 'signature', '3': 3, '4': 1, '5': 12, '10': 'signature'},
  ],
};

/// Descriptor for `Signature`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signatureDescriptor = $convert.base64Decode(
    'CglTaWduYXR1cmUSDgoCdHkYASABKAVSAnR5EhYKBnB1YmtleRgCIAEoDFIGcHVia2V5EhwKCX'
    'NpZ25hdHVyZRgDIAEoDFIJc2lnbmF0dXJl');

@$core.Deprecated('Use addrOverviewDescriptor instead')
const AddrOverview$json = {
  '1': 'AddrOverview',
  '2': [
    {'1': 'reciver', '3': 1, '4': 1, '5': 3, '10': 'reciver'},
    {'1': 'balance', '3': 2, '4': 1, '5': 3, '10': 'balance'},
    {'1': 'txCount', '3': 3, '4': 1, '5': 3, '10': 'txCount'},
  ],
};

/// Descriptor for `AddrOverview`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addrOverviewDescriptor = $convert.base64Decode(
    'CgxBZGRyT3ZlcnZpZXcSGAoHcmVjaXZlchgBIAEoA1IHcmVjaXZlchIYCgdiYWxhbmNlGAIgAS'
    'gDUgdiYWxhbmNlEhgKB3R4Q291bnQYAyABKANSB3R4Q291bnQ=');

@$core.Deprecated('Use reqAddrDescriptor instead')
const ReqAddr$json = {
  '1': 'ReqAddr',
  '2': [
    {'1': 'addr', '3': 1, '4': 1, '5': 9, '10': 'addr'},
    {'1': 'flag', '3': 2, '4': 1, '5': 5, '10': 'flag'},
    {'1': 'count', '3': 3, '4': 1, '5': 5, '10': 'count'},
    {'1': 'direction', '3': 4, '4': 1, '5': 5, '10': 'direction'},
    {'1': 'height', '3': 5, '4': 1, '5': 3, '10': 'height'},
    {'1': 'index', '3': 6, '4': 1, '5': 3, '10': 'index'},
    {'1': 'heightEnd', '3': 7, '4': 1, '5': 3, '10': 'heightEnd'},
  ],
};

/// Descriptor for `ReqAddr`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqAddrDescriptor = $convert.base64Decode(
    'CgdSZXFBZGRyEhIKBGFkZHIYASABKAlSBGFkZHISEgoEZmxhZxgCIAEoBVIEZmxhZxIUCgVjb3'
    'VudBgDIAEoBVIFY291bnQSHAoJZGlyZWN0aW9uGAQgASgFUglkaXJlY3Rpb24SFgoGaGVpZ2h0'
    'GAUgASgDUgZoZWlnaHQSFAoFaW5kZXgYBiABKANSBWluZGV4EhwKCWhlaWdodEVuZBgHIAEoA1'
    'IJaGVpZ2h0RW5k');

@$core.Deprecated('Use hexTxDescriptor instead')
const HexTx$json = {
  '1': 'HexTx',
  '2': [
    {'1': 'tx', '3': 1, '4': 1, '5': 9, '10': 'tx'},
  ],
};

/// Descriptor for `HexTx`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hexTxDescriptor = $convert.base64Decode(
    'CgVIZXhUeBIOCgJ0eBgBIAEoCVICdHg=');

@$core.Deprecated('Use replyTxInfoDescriptor instead')
const ReplyTxInfo$json = {
  '1': 'ReplyTxInfo',
  '2': [
    {'1': 'hash', '3': 1, '4': 1, '5': 12, '10': 'hash'},
    {'1': 'height', '3': 2, '4': 1, '5': 3, '10': 'height'},
    {'1': 'index', '3': 3, '4': 1, '5': 3, '10': 'index'},
    {'1': 'assets', '3': 4, '4': 3, '5': 11, '6': '.types.Asset', '10': 'assets'},
  ],
};

/// Descriptor for `ReplyTxInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyTxInfoDescriptor = $convert.base64Decode(
    'CgtSZXBseVR4SW5mbxISCgRoYXNoGAEgASgMUgRoYXNoEhYKBmhlaWdodBgCIAEoA1IGaGVpZ2'
    'h0EhQKBWluZGV4GAMgASgDUgVpbmRleBIkCgZhc3NldHMYBCADKAsyDC50eXBlcy5Bc3NldFIG'
    'YXNzZXRz');

@$core.Deprecated('Use reqTxListDescriptor instead')
const ReqTxList$json = {
  '1': 'ReqTxList',
  '2': [
    {'1': 'count', '3': 1, '4': 1, '5': 3, '10': 'count'},
  ],
};

/// Descriptor for `ReqTxList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqTxListDescriptor = $convert.base64Decode(
    'CglSZXFUeExpc3QSFAoFY291bnQYASABKANSBWNvdW50');

@$core.Deprecated('Use replyTxListDescriptor instead')
const ReplyTxList$json = {
  '1': 'ReplyTxList',
  '2': [
    {'1': 'txs', '3': 1, '4': 3, '5': 11, '6': '.types.Transaction', '10': 'txs'},
  ],
};

/// Descriptor for `ReplyTxList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyTxListDescriptor = $convert.base64Decode(
    'CgtSZXBseVR4TGlzdBIkCgN0eHMYASADKAsyEi50eXBlcy5UcmFuc2FjdGlvblIDdHhz');

@$core.Deprecated('Use reqGetMempoolDescriptor instead')
const ReqGetMempool$json = {
  '1': 'ReqGetMempool',
  '2': [
    {'1': 'isAll', '3': 1, '4': 1, '5': 8, '10': 'isAll'},
  ],
};

/// Descriptor for `ReqGetMempool`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqGetMempoolDescriptor = $convert.base64Decode(
    'Cg1SZXFHZXRNZW1wb29sEhQKBWlzQWxsGAEgASgIUgVpc0FsbA==');

@$core.Deprecated('Use reqProperFeeDescriptor instead')
const ReqProperFee$json = {
  '1': 'ReqProperFee',
  '2': [
    {'1': 'txCount', '3': 1, '4': 1, '5': 5, '10': 'txCount'},
    {'1': 'txSize', '3': 2, '4': 1, '5': 5, '10': 'txSize'},
  ],
};

/// Descriptor for `ReqProperFee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqProperFeeDescriptor = $convert.base64Decode(
    'CgxSZXFQcm9wZXJGZWUSGAoHdHhDb3VudBgBIAEoBVIHdHhDb3VudBIWCgZ0eFNpemUYAiABKA'
    'VSBnR4U2l6ZQ==');

@$core.Deprecated('Use replyProperFeeDescriptor instead')
const ReplyProperFee$json = {
  '1': 'ReplyProperFee',
  '2': [
    {'1': 'properFee', '3': 1, '4': 1, '5': 3, '10': 'properFee'},
  ],
};

/// Descriptor for `ReplyProperFee`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyProperFeeDescriptor = $convert.base64Decode(
    'Cg5SZXBseVByb3BlckZlZRIcCglwcm9wZXJGZWUYASABKANSCXByb3BlckZlZQ==');

@$core.Deprecated('Use txHashListDescriptor instead')
const TxHashList$json = {
  '1': 'TxHashList',
  '2': [
    {'1': 'hashes', '3': 1, '4': 3, '5': 12, '10': 'hashes'},
    {'1': 'count', '3': 2, '4': 1, '5': 3, '10': 'count'},
    {'1': 'expire', '3': 3, '4': 3, '5': 3, '10': 'expire'},
  ],
};

/// Descriptor for `TxHashList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txHashListDescriptor = $convert.base64Decode(
    'CgpUeEhhc2hMaXN0EhYKBmhhc2hlcxgBIAMoDFIGaGFzaGVzEhQKBWNvdW50GAIgASgDUgVjb3'
    'VudBIWCgZleHBpcmUYAyADKANSBmV4cGlyZQ==');

@$core.Deprecated('Use replyTxInfosDescriptor instead')
const ReplyTxInfos$json = {
  '1': 'ReplyTxInfos',
  '2': [
    {'1': 'txInfos', '3': 1, '4': 3, '5': 11, '6': '.types.ReplyTxInfo', '10': 'txInfos'},
  ],
};

/// Descriptor for `ReplyTxInfos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyTxInfosDescriptor = $convert.base64Decode(
    'CgxSZXBseVR4SW5mb3MSLAoHdHhJbmZvcxgBIAMoCzISLnR5cGVzLlJlcGx5VHhJbmZvUgd0eE'
    'luZm9z');

@$core.Deprecated('Use addrTxFeeInfoDescriptor instead')
const AddrTxFeeInfo$json = {
  '1': 'AddrTxFeeInfo',
  '2': [
    {'1': 'fromAddr', '3': 1, '4': 1, '5': 9, '10': 'fromAddr'},
    {'1': 'toAddr', '3': 2, '4': 1, '5': 9, '10': 'toAddr'},
    {'1': 'txHash', '3': 3, '4': 1, '5': 9, '10': 'txHash'},
    {'1': 'exec', '3': 4, '4': 1, '5': 9, '10': 'exec'},
    {'1': 'fee', '3': 5, '4': 1, '5': 3, '10': 'fee'},
    {'1': 'height', '3': 6, '4': 1, '5': 3, '10': 'height'},
    {'1': 'index', '3': 7, '4': 1, '5': 3, '10': 'index'},
    {'1': 'txStatus', '3': 8, '4': 1, '5': 5, '10': 'txStatus'},
  ],
};

/// Descriptor for `AddrTxFeeInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addrTxFeeInfoDescriptor = $convert.base64Decode(
    'Cg1BZGRyVHhGZWVJbmZvEhoKCGZyb21BZGRyGAEgASgJUghmcm9tQWRkchIWCgZ0b0FkZHIYAi'
    'ABKAlSBnRvQWRkchIWCgZ0eEhhc2gYAyABKAlSBnR4SGFzaBISCgRleGVjGAQgASgJUgRleGVj'
    'EhAKA2ZlZRgFIAEoA1IDZmVlEhYKBmhlaWdodBgGIAEoA1IGaGVpZ2h0EhQKBWluZGV4GAcgAS'
    'gDUgVpbmRleBIaCgh0eFN0YXR1cxgIIAEoBVIIdHhTdGF0dXM=');

@$core.Deprecated('Use addrTxFeeInfosDescriptor instead')
const AddrTxFeeInfos$json = {
  '1': 'AddrTxFeeInfos',
  '2': [
    {'1': 'txInfos', '3': 1, '4': 3, '5': 11, '6': '.types.AddrTxFeeInfo', '10': 'txInfos'},
  ],
};

/// Descriptor for `AddrTxFeeInfos`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addrTxFeeInfosDescriptor = $convert.base64Decode(
    'Cg5BZGRyVHhGZWVJbmZvcxIuCgd0eEluZm9zGAEgAygLMhQudHlwZXMuQWRkclR4RmVlSW5mb1'
    'IHdHhJbmZvcw==');

@$core.Deprecated('Use receiptLogDescriptor instead')
const ReceiptLog$json = {
  '1': 'ReceiptLog',
  '2': [
    {'1': 'ty', '3': 1, '4': 1, '5': 5, '10': 'ty'},
    {'1': 'log', '3': 2, '4': 1, '5': 12, '10': 'log'},
  ],
};

/// Descriptor for `ReceiptLog`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiptLogDescriptor = $convert.base64Decode(
    'CgpSZWNlaXB0TG9nEg4KAnR5GAEgASgFUgJ0eRIQCgNsb2cYAiABKAxSA2xvZw==');

@$core.Deprecated('Use receiptDescriptor instead')
const Receipt$json = {
  '1': 'Receipt',
  '2': [
    {'1': 'ty', '3': 1, '4': 1, '5': 5, '10': 'ty'},
    {'1': 'KV', '3': 2, '4': 3, '5': 11, '6': '.types.KeyValue', '10': 'KV'},
    {'1': 'logs', '3': 3, '4': 3, '5': 11, '6': '.types.ReceiptLog', '10': 'logs'},
  ],
};

/// Descriptor for `Receipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiptDescriptor = $convert.base64Decode(
    'CgdSZWNlaXB0Eg4KAnR5GAEgASgFUgJ0eRIfCgJLVhgCIAMoCzIPLnR5cGVzLktleVZhbHVlUg'
    'JLVhIlCgRsb2dzGAMgAygLMhEudHlwZXMuUmVjZWlwdExvZ1IEbG9ncw==');

@$core.Deprecated('Use receiptDataDescriptor instead')
const ReceiptData$json = {
  '1': 'ReceiptData',
  '2': [
    {'1': 'ty', '3': 1, '4': 1, '5': 5, '10': 'ty'},
    {'1': 'logs', '3': 3, '4': 3, '5': 11, '6': '.types.ReceiptLog', '10': 'logs'},
  ],
};

/// Descriptor for `ReceiptData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiptDataDescriptor = $convert.base64Decode(
    'CgtSZWNlaXB0RGF0YRIOCgJ0eRgBIAEoBVICdHkSJQoEbG9ncxgDIAMoCzIRLnR5cGVzLlJlY2'
    'VpcHRMb2dSBGxvZ3M=');

@$core.Deprecated('Use txResultDescriptor instead')
const TxResult$json = {
  '1': 'TxResult',
  '2': [
    {'1': 'height', '3': 1, '4': 1, '5': 3, '10': 'height'},
    {'1': 'index', '3': 2, '4': 1, '5': 5, '10': 'index'},
    {'1': 'tx', '3': 3, '4': 1, '5': 11, '6': '.types.Transaction', '10': 'tx'},
    {'1': 'receiptdate', '3': 4, '4': 1, '5': 11, '6': '.types.ReceiptData', '10': 'receiptdate'},
    {'1': 'blocktime', '3': 5, '4': 1, '5': 3, '10': 'blocktime'},
    {'1': 'actionName', '3': 6, '4': 1, '5': 9, '10': 'actionName'},
  ],
};

/// Descriptor for `TxResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txResultDescriptor = $convert.base64Decode(
    'CghUeFJlc3VsdBIWCgZoZWlnaHQYASABKANSBmhlaWdodBIUCgVpbmRleBgCIAEoBVIFaW5kZX'
    'gSIgoCdHgYAyABKAsyEi50eXBlcy5UcmFuc2FjdGlvblICdHgSNAoLcmVjZWlwdGRhdGUYBCAB'
    'KAsyEi50eXBlcy5SZWNlaXB0RGF0YVILcmVjZWlwdGRhdGUSHAoJYmxvY2t0aW1lGAUgASgDUg'
    'libG9ja3RpbWUSHgoKYWN0aW9uTmFtZRgGIAEoCVIKYWN0aW9uTmFtZQ==');

@$core.Deprecated('Use transactionDetailDescriptor instead')
const TransactionDetail$json = {
  '1': 'TransactionDetail',
  '2': [
    {'1': 'tx', '3': 1, '4': 1, '5': 11, '6': '.types.Transaction', '10': 'tx'},
    {'1': 'receipt', '3': 2, '4': 1, '5': 11, '6': '.types.ReceiptData', '10': 'receipt'},
    {'1': 'proofs', '3': 3, '4': 3, '5': 12, '10': 'proofs'},
    {'1': 'height', '3': 4, '4': 1, '5': 3, '10': 'height'},
    {'1': 'index', '3': 5, '4': 1, '5': 3, '10': 'index'},
    {'1': 'blocktime', '3': 6, '4': 1, '5': 3, '10': 'blocktime'},
    {'1': 'amount', '3': 7, '4': 1, '5': 3, '10': 'amount'},
    {'1': 'fromaddr', '3': 8, '4': 1, '5': 9, '10': 'fromaddr'},
    {'1': 'actionName', '3': 9, '4': 1, '5': 9, '10': 'actionName'},
    {'1': 'assets', '3': 10, '4': 3, '5': 11, '6': '.types.Asset', '10': 'assets'},
    {'1': 'txProofs', '3': 11, '4': 3, '5': 11, '6': '.types.TxProof', '10': 'txProofs'},
    {'1': 'fullHash', '3': 12, '4': 1, '5': 12, '10': 'fullHash'},
  ],
};

/// Descriptor for `TransactionDetail`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDetailDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvbkRldGFpbBIiCgJ0eBgBIAEoCzISLnR5cGVzLlRyYW5zYWN0aW9uUgJ0eB'
    'IsCgdyZWNlaXB0GAIgASgLMhIudHlwZXMuUmVjZWlwdERhdGFSB3JlY2VpcHQSFgoGcHJvb2Zz'
    'GAMgAygMUgZwcm9vZnMSFgoGaGVpZ2h0GAQgASgDUgZoZWlnaHQSFAoFaW5kZXgYBSABKANSBW'
    'luZGV4EhwKCWJsb2NrdGltZRgGIAEoA1IJYmxvY2t0aW1lEhYKBmFtb3VudBgHIAEoA1IGYW1v'
    'dW50EhoKCGZyb21hZGRyGAggASgJUghmcm9tYWRkchIeCgphY3Rpb25OYW1lGAkgASgJUgphY3'
    'Rpb25OYW1lEiQKBmFzc2V0cxgKIAMoCzIMLnR5cGVzLkFzc2V0UgZhc3NldHMSKgoIdHhQcm9v'
    'ZnMYCyADKAsyDi50eXBlcy5UeFByb29mUgh0eFByb29mcxIaCghmdWxsSGFzaBgMIAEoDFIIZn'
    'VsbEhhc2g=');

@$core.Deprecated('Use transactionDetailsDescriptor instead')
const TransactionDetails$json = {
  '1': 'TransactionDetails',
  '2': [
    {'1': 'txs', '3': 1, '4': 3, '5': 11, '6': '.types.TransactionDetail', '10': 'txs'},
  ],
};

/// Descriptor for `TransactionDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDetailsDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvbkRldGFpbHMSKgoDdHhzGAEgAygLMhgudHlwZXMuVHJhbnNhY3Rpb25EZX'
    'RhaWxSA3R4cw==');

@$core.Deprecated('Use reqAddrsDescriptor instead')
const ReqAddrs$json = {
  '1': 'ReqAddrs',
  '2': [
    {'1': 'addrs', '3': 1, '4': 3, '5': 9, '10': 'addrs'},
  ],
};

/// Descriptor for `ReqAddrs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqAddrsDescriptor = $convert.base64Decode(
    'CghSZXFBZGRycxIUCgVhZGRycxgBIAMoCVIFYWRkcnM=');

@$core.Deprecated('Use reqDecodeRawTransactionDescriptor instead')
const ReqDecodeRawTransaction$json = {
  '1': 'ReqDecodeRawTransaction',
  '2': [
    {'1': 'txHex', '3': 1, '4': 1, '5': 9, '10': 'txHex'},
  ],
};

/// Descriptor for `ReqDecodeRawTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqDecodeRawTransactionDescriptor = $convert.base64Decode(
    'ChdSZXFEZWNvZGVSYXdUcmFuc2FjdGlvbhIUCgV0eEhleBgBIAEoCVIFdHhIZXg=');

@$core.Deprecated('Use userWriteDescriptor instead')
const UserWrite$json = {
  '1': 'UserWrite',
  '2': [
    {'1': 'topic', '3': 1, '4': 1, '5': 9, '10': 'topic'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UserWrite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userWriteDescriptor = $convert.base64Decode(
    'CglVc2VyV3JpdGUSFAoFdG9waWMYASABKAlSBXRvcGljEhgKB2NvbnRlbnQYAiABKAlSB2Nvbn'
    'RlbnQ=');

@$core.Deprecated('Use upgradeMetaDescriptor instead')
const UpgradeMeta$json = {
  '1': 'UpgradeMeta',
  '2': [
    {'1': 'starting', '3': 1, '4': 1, '5': 8, '10': 'starting'},
    {'1': 'version', '3': 2, '4': 1, '5': 9, '10': 'version'},
    {'1': 'height', '3': 3, '4': 1, '5': 3, '10': 'height'},
  ],
};

/// Descriptor for `UpgradeMeta`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List upgradeMetaDescriptor = $convert.base64Decode(
    'CgtVcGdyYWRlTWV0YRIaCghzdGFydGluZxgBIAEoCFIIc3RhcnRpbmcSGAoHdmVyc2lvbhgCIA'
    'EoCVIHdmVyc2lvbhIWCgZoZWlnaHQYAyABKANSBmhlaWdodA==');

@$core.Deprecated('Use reqTxHashListDescriptor instead')
const ReqTxHashList$json = {
  '1': 'ReqTxHashList',
  '2': [
    {'1': 'hashes', '3': 1, '4': 3, '5': 9, '10': 'hashes'},
    {'1': 'isShortHash', '3': 2, '4': 1, '5': 8, '10': 'isShortHash'},
  ],
};

/// Descriptor for `ReqTxHashList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqTxHashListDescriptor = $convert.base64Decode(
    'Cg1SZXFUeEhhc2hMaXN0EhYKBmhhc2hlcxgBIAMoCVIGaGFzaGVzEiAKC2lzU2hvcnRIYXNoGA'
    'IgASgIUgtpc1Nob3J0SGFzaA==');

@$core.Deprecated('Use txProofDescriptor instead')
const TxProof$json = {
  '1': 'TxProof',
  '2': [
    {'1': 'proofs', '3': 1, '4': 3, '5': 12, '10': 'proofs'},
    {'1': 'index', '3': 2, '4': 1, '5': 13, '10': 'index'},
    {'1': 'rootHash', '3': 3, '4': 1, '5': 12, '10': 'rootHash'},
  ],
};

/// Descriptor for `TxProof`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List txProofDescriptor = $convert.base64Decode(
    'CgdUeFByb29mEhYKBnByb29mcxgBIAMoDFIGcHJvb2ZzEhQKBWluZGV4GAIgASgNUgVpbmRleB'
    'IaCghyb290SGFzaBgDIAEoDFIIcm9vdEhhc2g=');

@$core.Deprecated('Use reqCheckTxsExistDescriptor instead')
const ReqCheckTxsExist$json = {
  '1': 'ReqCheckTxsExist',
  '2': [
    {'1': 'txHashes', '3': 1, '4': 3, '5': 12, '10': 'txHashes'},
  ],
};

/// Descriptor for `ReqCheckTxsExist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List reqCheckTxsExistDescriptor = $convert.base64Decode(
    'ChBSZXFDaGVja1R4c0V4aXN0EhoKCHR4SGFzaGVzGAEgAygMUgh0eEhhc2hlcw==');

@$core.Deprecated('Use replyCheckTxsExistDescriptor instead')
const ReplyCheckTxsExist$json = {
  '1': 'ReplyCheckTxsExist',
  '2': [
    {'1': 'existFlags', '3': 1, '4': 3, '5': 8, '10': 'existFlags'},
    {'1': 'existCount', '3': 2, '4': 1, '5': 13, '10': 'existCount'},
  ],
};

/// Descriptor for `ReplyCheckTxsExist`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyCheckTxsExistDescriptor = $convert.base64Decode(
    'ChJSZXBseUNoZWNrVHhzRXhpc3QSHgoKZXhpc3RGbGFncxgBIAMoCFIKZXhpc3RGbGFncxIeCg'
    'pleGlzdENvdW50GAIgASgNUgpleGlzdENvdW50');

