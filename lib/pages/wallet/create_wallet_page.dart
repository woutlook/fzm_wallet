import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fzm_wallet/models/store.dart';
import 'package:fzm_wallet/pages/wallet/create_mnem_page.dart';
import 'package:fzm_wallet/provider/p.dart';
import 'package:fzm_wallet/widget/widgets.dart';
import 'package:fzm_wallet/utils/app_utils.dart';

class CreateWalletPage extends ConsumerStatefulWidget {
  const CreateWalletPage({super.key});

  @override
  ConsumerState<CreateWalletPage> createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends ConsumerState<CreateWalletPage> {
  final TextEditingController _nameController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, '创建钱包'),
      body: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            normalInput(_nameController, '设置钱包名称', labelText: '钱包名称'),
            const SizedBox(height: 20),
            const Spacer(),
            blackButton('创建钱包', () async {
              if (!mounted) {
                return;
              }
              final name = checkName();
              if (name == null) {
                return;
              }
              final value = await showPasswordDialog(context);
              if (value != null) {
                final password = value;
                ref.read(createWalletParameterProvider.notifier).state = {
                  "name": name,
                  "password": password,
                };
                // ignore: use_build_context_synchronously
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CreateMnemPage();
                }));
              } else {
                toast('请输入正确的密码');
              }
            }),
          ],
        ),
      ),
    );
  }

  String? checkName() {
    String ntxt = _nameController.text;
    String name = ntxt.trim();
    if (name.isEmpty) {
      toast("请输入钱包名称");
      return null;
    }
    final wlist = store.getWalletList();
    for (var w in wlist) {
      if (w == name) {
        toast("钱包名称已存在");
        return null;
      }
    }
    return name;
  }
}
