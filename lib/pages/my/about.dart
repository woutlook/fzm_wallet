import 'package:flutter/material.dart';
import 'package:fwallet/widget/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        '关于我们',
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('images/ic_app.png', width: 100, height: 100),
            const SizedBox(height: 20),
            const Text('MyDao v1.0.0'),
          ],
        ),
      ),
    );
  }
}
