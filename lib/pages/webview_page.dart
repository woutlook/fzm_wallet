import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class WebPage extends ConsumerStatefulWidget {
  final String url;
  const WebPage({super.key, required this.url});

  @override
  ConsumerState<WebPage> createState() => _WebPageState();
}

class _WebPageState extends ConsumerState<WebPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    final url = widget.url;
    return Scaffold(
      appBar: appBar(context, '网页'),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          // _controller = controller;
        },
        initialUrlRequest: URLRequest(url: WebUri(url)),
      ),
    );
  }
}
