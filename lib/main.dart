import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fzm_wallet/models/coin.dart';
import 'package:bot_toast/bot_toast.dart';
// import 'package:permission_handler/permission_handler.dart';

import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/pages/password_page.dart';
import 'package:fzm_wallet/pages/wallet_index_page.dart';
import 'package:fzm_wallet/pages/main_tab_page.dart';
import 'package:fzm_wallet/provider/p.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await store.storeInit();
  // await store.clear(); // only for test
  await initCoinList();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state!.setLocale(newLocale);
  // }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale _locale = const Locale('en', 'US');
  Widget? _home;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    final code = store.getLanguage();
    _locale =
        code == 'zh' ? const Locale('zh', 'CN') : const Locale('en', 'US');
    // if (!Platform.isMacOS) {
    //   // Permission.camera.request();
    // }
    final passwordHash = store.getPasswordHash();
    if (passwordHash == null) {
      _home = const SetPasswordPage();
    } else {
      var currentWallet = store.getCurrentWallet();
      if (currentWallet == null) {
        final lists = store.getWalletList();
        if (lists.isNotEmpty) {
          currentWallet = store.getWallet(lists[0]);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(walletProvider.notifier).updateWallet(currentWallet!);
          });
        }
      }
      _home =
          currentWallet != null ? const MainTabPage() : const WalletIndexPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    return MaterialApp(
      title: 'FZM Wallet',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white30,
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        cardColor: Colors.green,
      ),
      home: _home,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        child = EasyLoading.init()(context, child);
        return child;
      },
    );
  }
}
