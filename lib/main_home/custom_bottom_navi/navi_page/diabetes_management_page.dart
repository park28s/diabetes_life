import 'package:diabetes_life/main_config/google_admob/google_admob_config.dart';
import 'package:diabetes_life/main_home/main_home.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class diabetesManagement extends StatelessWidget {
  const diabetesManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    adCount++;
    print('adCounter = ${adCount}');
    adCount == 5 || adCount == 10 ? showInterstitialAd2() : null;
    return Scaffold(
      body: WebView(
        initialUrl:
            'https://park28s.notion.site/0efd58f1c2e2477daf2e292e2185e2f5',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
