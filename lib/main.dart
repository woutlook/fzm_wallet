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
    // 钱包状态初始化
    final passwordHash = store.getPasswordHash();
    if (passwordHash == null) {
      _home = const SetPasswordPage();
    } else {
      var currentWallet = store.getCurrentWallet();
      if (currentWallet == null) {
        final lists = store.getWalletList();
        if (lists.isNotEmpty) {
          currentWallet = store.getWallet(lists[0]);
          // 在 initState 中更新 provider
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(walletProvider.notifier).updateWallet(currentWallet!);
          });
        }
      }
      _home =
          currentWallet != null ? const MainTabPage() : const WalletIndexPage();
    }
  }

  // This widget is the root of your application.
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
          // 修改下划线的颜色
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        // 修改光标的颜色
        cardColor: Colors.green,
      ),
      home: _home,
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return HomePage();
      //     },
      //   );
      // },

      // routes: {
      //   MyRouter.DOWNLOAD_PAGE: (context) => const DownLoadPage(),
      //   MyRouter.LANG_PAGE: (context) => const LangPage(),
      //   MyRouter.WALLET_INDEX_PAGE: (context) => const WalletIndexPage(),
      //   MyRouter.CREATE_WALLET_PAGE: (context) => const CreateWalletPage(),
      //   MyRouter.IMPORT_WALLET_PAGE: (context) => const ImportWalletPage(),
      //   MyRouter.CREATE_MNEM_PAGE: (context) => const CreateMnemPage(),
      //   MyRouter.VIREFY_MNEM_PAGE: (context) => const VirefyMnemPage(),
      //   MyRouter.MY_WALLETS_PAGE: (context) => const MyWalletsPage(),
      //   MyRouter.MAIN_TAB_PAGE: (context) => const MainTabPage(),
      //   MyRouter.WALLET_DETAILS_PAGE: (context) => const WalletDetailsPage(),
      //   MyRouter.TRANS_PAGE: (context) => const TransPage(),
      //   MyRouter.WEB_PAGE: (context) => const WebPage(),
      //   MyRouter.ADD_TAB_PAGE: (context) => const AddCoinPage(),
      //   MyRouter.RECV_PAGE: (context) => const RecvPage(),
      //   MyRouter.SEND_PAGE: (context) => const SendPage(),
      //   // MyRouter.QR_PAGE: (context) => const MyQRPage(),
      //   MyRouter.RESET_PASSWD_PAGE: (context) => ResetPasswordPage(),
      //   MyRouter.CHANGE_PASSWD_PAGE: (context) => ChangePasswordPage(),
      //   MyRouter.CHECK_MNEM_PAGE: (context) => CheckMnemPage(),
      //   MyRouter.CONTECTS_PAGE: (context) => const MyContactsPage(),
      //   MyRouter.ABOUT_PAGE: (context) => const AboutPage(),
      // },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      // localeListResolutionCallback: (locales, supportedLocales) => _locale,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        child = EasyLoading.init()(context, child);
        return child;
      },
    );
  }
}
