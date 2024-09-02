import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fwallet/bean/coin_bean.dart';
import 'package:fwallet/bean/pwallet_bean.dart';
import 'package:fwallet/pages/my/about.dart';
import 'package:fwallet/pages/my/contects.dart';
import 'package:fwallet/pages/wallet_index_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:fwallet/pages/main_tab_page.dart';
import 'package:fwallet/pages/my/lang_page.dart';
import 'package:fwallet/pages/qrscan_page.dart';
import 'package:fwallet/pages/wallet/backup_mnem_page.dart';
import 'package:fwallet/pages/wallet/create_mnem_page.dart';
import 'package:fwallet/pages/wallet/create_wallet_page.dart';
import 'package:fwallet/pages/wallet/import_wallet_page.dart';
import 'package:fwallet/pages/wallet/my_wallets_page.dart';
import 'package:fwallet/pages/wallet/recv_page.dart';
import 'package:fwallet/pages/wallet/send_page.dart';
import 'package:fwallet/pages/wallet/tx_page.dart';
import 'package:fwallet/pages/wallet/wallet_details_page.dart';
import 'package:fwallet/pages/webview_page.dart';
import 'package:fwallet/pages/wallet/add_coin_page.dart';
import 'package:fwallet/pages/wallet/reset_passwd.dart';
import 'package:fwallet/pages/wallet/change_passwd.dart';
import 'package:fwallet/pages/wallet/check_mnem.dart';
import 'package:fwallet/provider/p.dart';
import 'package:fwallet/const/my_routers.dart';
import 'package:fwallet/pages/my/download_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeSharedPreferences();
  await initDB();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  Locale _locale = const Locale('en', 'US');

  int _walletCount = 0;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();
    final code = SP.getLangCode();
    _locale =
        code == 'zh' ? const Locale('zh', 'CN') : const Locale('en', 'US');
    initWalletAndCoins();
  }

  void initWalletAndCoins() {
    getDB().query('Wallet').then((value) {
      setState(() {
        _walletCount = value.length;
        if (_walletCount == 0) {
          return;
        }
        final walletId = SP.getWalletId();
        final wallets = value.map((e) => PwalletBean.fromJson(e)).toList();
        PwalletBean wallet;
        try {
          wallet = wallets.firstWhere((element) => element.id == walletId);
        } catch (e) {
          wallet = wallets[0];
        }
        ref.read(walletProvider.notifier).updateWallet(wallet);
        final list = getDB()
            .query('Coin', where: 'pwalletId = ?', whereArgs: [walletId]);

        list.then((value) {
          final coins = value.map((e) => CoinBean.fromJson(e)).toList();
          ref.read(coinsProvider.notifier).updateCoins(coins);
        });
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final home =
        _walletCount > 0 ? const MainTabPage() : const WalletIndexPage();
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: home,
      routes: {
        MyRouter.DOWNLOAD_PAGE: (context) => const DownLoadPage(),
        MyRouter.LANG_PAGE: (context) => const LangPage(),
        MyRouter.CREATE_WALLET_PAGE: (context) => const CreateWalletPage(),
        MyRouter.IMPORT_WALLET_PAGE: (context) => const ImportWalletPage(),
        MyRouter.CREATE_MNEM_PAGE: (context) => const CreateMnemPage(),
        MyRouter.BACKUP_MNEM_PAGE: (context) => const BackUpMnemPage(),
        MyRouter.MY_WALLETS_PAGE: (context) => const MyWalletsPage(),
        MyRouter.MAIN_TAB_PAGE: (context) => const MainTabPage(),
        MyRouter.WALLET_DETAILS_PAGE: (context) => const WalletDetailsPage(),
        MyRouter.TRANS_PAGE: (context) => const TransPage(),
        MyRouter.WEB_PAGE: (context) => const WebPage(),
        MyRouter.ADD_TAB_PAGE: (context) => const AddCoinPage(),
        MyRouter.RECV_PAGE: (context) => const RecvPage(),
        MyRouter.SEND_PAGE: (context) => const SendPage(),
        MyRouter.QR_PAGE: (context) => const MyQRPage(),
        MyRouter.RESET_PASSWD_PAGE: (context) => ResetPasswordPage(),
        MyRouter.CHANGE_PASSWD_PAGE: (context) => ChangePasswordPage(),
        MyRouter.CHECK_MNEM_PAGE: (context) => CheckMnemPage(),
        MyRouter.CONTECTS_PAGE: (context) => const MyContactsPage(),
        MyRouter.ABOUT_PAGE: (context) => const AboutPage(),
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      // localeListResolutionCallback: (locales, supportedLocales) => _locale,
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> requestPermission() async {
    // 1、读取系统权限的弹框
    // 2、假如你点不同意后，下次点击不会在出现系统权限的弹框（系统权限的弹框只会出现一次），
    // 这时候需要你自己写一个弹框，然后去打开app权限的页面
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.requestInstallPackages,
    ].request();

    if (statuses[Permission.storage] == PermissionStatus.granted &&
        statuses[Permission.requestInstallPackages] ==
            PermissionStatus.granted) {
      return true;
    } else {
      if (!context.mounted) {
        return false;
      }
      showCupertinoDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text('您需要授予相册权限'),
              content: const Text('请转到您的手机设置打开相应相册的权限'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: const Text('取消'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('确定'),
                  onPressed: () {
                    Navigator.pop(context);
                    // 打开手机上该app权限的页面
                    openAppSettings();
                  },
                ),
              ],
            );
          });
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    var status = requestPermission();
    status.then((value) {
      if (value) {
        init();
      }
    });
  }

  void init() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, MyRouter.MAIN_TAB_PAGE);
    });
  }

  //每次调用setState时都会重新运行build方法
  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('images/bg_splash.png'),
      fit: BoxFit.cover,
    );
  }
}
