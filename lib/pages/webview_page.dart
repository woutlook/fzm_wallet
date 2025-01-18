import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class WebPage extends ConsumerStatefulWidget {
  const WebPage({super.key});

  @override
  ConsumerState<WebPage> createState() => _WebPageState();
}

class _WebPageState extends ConsumerState<WebPage> {
  // InAppWebViewController? _controller;
  // String? url;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    // Map<String, dynamic>? arguments =
    //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // url = arguments?["url"];
    // if (defaultTargetPlatform == TargetPlatform.macOS) {
    //   InAppBrowser().openUrlRequest(urlRequest: URLRequest(url: WebUri(url!)));
    //   return Scaffold(
    //     appBar: appBar(context, '网页'),
    //     body: const Center(
    //       child: Text("macOS不支持WebView"),
    //     ),
    //   );
    // } else {
    final url = ref.watch(urlProvider);
    return Scaffold(
      appBar: appBar(context, '网页'),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          // _controller = controller;
        },
        initialUrlRequest: URLRequest(url: WebUri(url!)),
      ),
      // body: const Center(
      //   child: Text("不支持WebView"),
      // ),
    );
    // }

    // body: WebViewWidget(controller: WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setBackgroundColor(const Color(0x00000000))
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Update loading bar.
    //       },
    //       onPageStarted: (String url) {},
    //       onPageFinished: (String url) {},
    //       onWebResourceError: (WebResourceError error) {},
    //       onNavigationRequest: (NavigationRequest request) {
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           //NavigationDecision.prevent 表示WebView应该阻止导航
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //     ),
    //   )
    // ..loadRequest(Uri.parse(url!)),),);
  }
}
