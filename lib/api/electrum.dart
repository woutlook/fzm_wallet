import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'dart:html';

import 'package:bitcoin_base/bitcoin_base.dart';
// import 'package:example/services_examples/cross_platform_websocket/core.dart';
// import 'package:example/services_examples/electrum/request_completer.dart';

// import 'cross.dart'
//     if (dart.library.html) 'web.dart'
//     if (dart.library.io) 'io.dart';

abstract class WebSocketCore {
  void close({int? code});
  void sink(List<int> message);
  Stream<dynamic> get stream;
  bool get isConnected;
  static Future<WebSocketCore> connect(String url,
          {List<String>? protocols}) async =>
      connectSoc(url, protocols: protocols);
}

/*
Future<WebSocketCore> connectSoc(String url, {List<String>? protocols}) =>
    throw UnsupportedError(
        'Cannot create a instance without dart:html or dart:io.');


Future<WebSocketCore> connectSoc(String url, {List<String>? protocols}) async =>
    await WebsocketWeb.connect(url);

class WebsocketWeb implements WebSocketCore {
  final WebSocket _socket;
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>();
  final Completer<void> _connectedCompleter = Completer<void>();

  WebsocketWeb._(this._socket) {
    _socket.onOpen.listen((Event event) {
      _connectedCompleter.complete();
    });

    _socket.onMessage.listen((MessageEvent event) {
      _streamController.add(event.data);
    });

    _socket.onClose.listen((CloseEvent event) {
      _streamController.close();
    });
  }

  @override
  void close({int? code}) {
    _socket.close(code, '');
  }

  @override
  bool get isConnected => _socket.readyState == WebSocket.OPEN;
  @override
  Stream<dynamic> get stream => _streamController.stream;

  static Future<WebsocketWeb> connect(String url,
      {List<String>? protocols}) async {
    final completer = Completer<WebsocketWeb>();
    final socket = WebSocket(url, protocols);
    WebsocketWeb._(socket)._connectedCompleter.future.then((_) {
      completer.complete(WebsocketWeb._(socket));
    });
    return completer.future;
  }

  @override
  void sink(List<int> message) {
    _socket.send(message);
  }
}
*/

Future<WebSocketCore> connectSoc(String url, {List<String>? protocols}) async =>
    await WebsocketIO.connect(url);

class WebsocketIO implements WebSocketCore {
  final WebSocket _socket;
  final StreamController<dynamic> _streamController =
      StreamController<dynamic>();
  @override
  bool get isConnected => _socket.readyState == WebSocket.open;
  WebsocketIO._(this._socket) {
    _socket.listen(
      (dynamic data) {
        _streamController.add(data);
      },
      onDone: () {
        _streamController.close();
      },
      onError: (dynamic error) {
        // Handle errors as needed
        _streamController.addError(error);
      },
    );
  }

  @override
  void close({int? code}) {
    _socket.close(code, 'Closed by client.');
  }

  @override
  Stream<dynamic> get stream => _streamController.stream;

  static Future<WebsocketIO> connect(String url,
      {List<String>? protocols}) async {
    final completer = Completer<WebsocketIO>();
    final socket = await WebSocket.connect(url, protocols: protocols);
    completer.complete(WebsocketIO._(socket));

    return completer.future;
  }

  @override
  void sink(List<int> message) {
    _socket.add(message);
  }
}

class AsyncRequestCompleter {
  AsyncRequestCompleter(this.params);
  final Completer<Map<String, dynamic>> completer = Completer();
  final Map<String, dynamic> params;
}

class ElectrumWebSocketService with BitcoinBaseElectrumRPCService {
  ElectrumWebSocketService._(
    this.url,
    WebSocketCore channel, {
    this.defaultRequestTimeOut = const Duration(seconds: 30),
  }) : _socket = channel {
    _subscription = channel.stream
        .cast<String>()
        .listen(_onMessge, onError: _onClose, onDone: _onDone);
  }
  WebSocketCore? _socket;
  StreamSubscription<String>? _subscription;
  final Duration defaultRequestTimeOut;

  Map<int, AsyncRequestCompleter> requests = {};
  bool _isDiscounnect = false;

  bool get isConnected => _isDiscounnect;

  @override
  final String url;

  void add(List<int> params) {
    if (_isDiscounnect) {
      throw StateError("socket has been discounected");
    }
    _socket?.sink(params);
  }

  void _onClose(Object? error) {
    _isDiscounnect = true;

    _socket = null;
    _subscription?.cancel().catchError((e) {});
    _subscription = null;
  }

  void _onDone() {
    _onClose(null);
  }

  void discounnect() {
    _onClose(null);
  }

  static Future<ElectrumWebSocketService> connect(
    String url, {
    Iterable<String>? protocols,
    Duration defaultRequestTimeOut = const Duration(seconds: 30),
    final Duration connectionTimeOut = const Duration(seconds: 30),
  }) async {
    final channel =
        await WebSocketCore.connect(url, protocols: protocols?.toList());

    return ElectrumWebSocketService._(url, channel,
        defaultRequestTimeOut: defaultRequestTimeOut);
  }

  void _onMessge(String event) {
    final Map<String, dynamic> decode = json.decode(event);
    if (decode.containsKey("id")) {
      final int id = int.parse(decode["id"]!.toString());
      final request = requests.remove(id);
      request?.completer.complete(decode);
    }
  }

  @override
  Future<Map<String, dynamic>> call(ElectrumRequestDetails params,
      [Duration? timeout]) async {
    final AsyncRequestCompleter compeleter =
        AsyncRequestCompleter(params.params);

    try {
      requests[params.id] = compeleter;
      add(params.toWebSocketParams());
      final result = await compeleter.completer.future
          .timeout(timeout ?? defaultRequestTimeOut);
      return result;
    } finally {
      requests.remove(params.id);
    }
  }
}
