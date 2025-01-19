import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fzm_wallet/models/tx.dart';
import 'package:fzm_wallet/models/contact.dart';
import 'package:fzm_wallet/pages/my/contacts.dart';
import 'package:fzm_wallet/pages/webview_page.dart';
import 'package:fzm_wallet/utils/app_utils.dart';
import 'package:fzm_wallet/widget/widgets.dart';

class TxDetailsPage extends StatelessWidget {
  const TxDetailsPage({
    super.key,
    required this.tx,
    required this.scanUrl,
    required this.chain,
  });
  final Tx tx;
  final String scanUrl;
  final String chain;

  @override
  Widget build(BuildContext context) {
    return buildLayout(context, child: _build(context));
  }

  Widget _build(BuildContext context) {
    return SingleChildScrollView(
      // 允许内容滚动
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
        children: <Widget>[
          const Center(
            // 金额和状态
            child: Column(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 64),
                Text('-1 BTY',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('完成'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _buildDetailRow(context,
              label: '转账地址', value: tx.from, isCopyable: true, isAddress: true),
          _buildDetailRow(context,
              label: '收款地址', value: tx.to, isCopyable: true, isAddress: true),
          _buildDetailRow(context, label: '矿工费', value: '${tx.fee}'),
          _buildDetailRow(context, label: '区块信息', value: '${tx.blockNumber}'),
          _buildDetailRow(
            context,
            label: '交易哈希',
            value: tx.hash,
            isCopyable: true,
            isTxHash: true,
          ),
          _buildDetailRow(
            context,
            label: '交易时间',
            value: DateTime.fromMillisecondsSinceEpoch(tx.timestamp! * 1000)
                .toString()
                .substring(0, 19),
          ),
          _buildDetailRow(context, label: '上链备注', value: tx.note ?? '无'),
          const SizedBox(height: 20),
          Center(
            child: blackButton('添加联系人', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                final c = Contact(
                  name: '',
                  phoneNum: '',
                  addressList: [ContactsAddress(address: tx.to, chain: chain)],
                );
                return EditContractsPage(isEdit: false, contect: c);
              }));
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context, {
    required String label,
    required String value,
    bool isCopyable = false,
    bool isAddress = false,
    bool isTxHash = false,
  }) {
    bool isLink = isAddress || isTxHash;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                if (isTxHash) {
                  final url = '${scanUrl}tradeHash?hash=${tx.hash}';
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WebPage(url: url);
                  }));
                } else if (isAddress) {
                  final url = '${scanUrl}address?address=$value';
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return WebPage(url: url);
                  }));
                }
              },
              child: Text(
                value,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                  color: isLink ? Colors.blue : Colors.black,
                ),
              ),
            ),
          ),
          isCopyable
              ? IconButton(
                  icon: const Icon(Icons.copy, size: 16),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: value));
                    toast('$label 已复制');
                  },
                )
              : const SizedBox(
                  width: 20,
                ),
        ],
      ),
    );
  }
}
