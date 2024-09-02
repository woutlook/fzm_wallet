package com.f.wallet.flutter_wallet

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import org.json.JSONObject
import walletapi.*

class MainActivity : FlutterActivity() {
  private val CHANNEL_WALLET = "channel_wallet"
  private val GO_URL = "https://www.mydao.plus/549788"

  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL_WALLET)
            .setMethodCallHandler { call, result ->
              when (call.method) {
                "createMnem" -> {
                  var type = call.argument<Int>("mnemLangType")
                  when (type) {
                    // 英文
                    0 -> result.success(Walletapi.newMnemonicString(0, 128))
                    // 中文
                    1 -> result.success(Walletapi.newMnemonicString(1, 160))
                  }
                }
                "encMnem" -> {
                  val mnem = call.argument<String>("mnem")
                  val password = call.argument<String>("password")
                  var bPassword = Walletapi.encPasswd(password)
                  var seedEncKey =
                          Walletapi.byteTohex(
                                  Walletapi.seedEncKey(bPassword, Walletapi.stringTobyte(mnem))
                          )
                  var hashPassword = Walletapi.passwdHash(bPassword)
                  var jsonObject = JSONObject()
                  jsonObject.put("mnem", seedEncKey)
                  jsonObject.put("password", hashPassword)
                  result.success(jsonObject.toString())
                }
                "decryMnem" -> {
                  try {
                    var mnem = call.argument<String>("mnem")
                    var password = call.argument<String>("password")

                    var flutterResult =
                            Walletapi.byteTostring(
                                    Walletapi.seedDecKey(
                                            Walletapi.encPasswd(password),
                                            Walletapi.hexTobyte(mnem)
                                    )
                            )
                    result.success(flutterResult.toString())
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "getHDWallet" -> {
                  try {
                    var chain = call.argument<String>("chain")
                    var mnem = call.argument<String>("mnem")

                    var hdWallet = Walletapi.newWalletFromMnemonic_v2(chain, mnem)
                    var jsonObject = JSONObject()
                    jsonObject.put("pub", Walletapi.byteTohex(hdWallet.newKeyPub(0)))
                    jsonObject.put("address", hdWallet.newAddress_v2(0))
                    jsonObject.put("priv", Walletapi.byteTohex(hdWallet.newKeyPriv(0)))
                    result.success(jsonObject.toString())
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "getPriv" -> {
                  try {
                    var chain = call.argument<String>("chain")
                    var mnem = call.argument<String>("mnem")

                    var hdWallet = Walletapi.newWalletFromMnemonic_v2(chain, mnem)
                    var prikey = Walletapi.byteTohex(hdWallet.newKeyPriv(0))
                    result.success(prikey)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "encPriv" -> {
                  var priv = call.argument<String>("priv")
                  var password = call.argument<String>("password")
                  var encPasswd = Walletapi.encPasswd(password)
                  var encPriv = Walletapi.encKey(encPasswd, Walletapi.hexTobyte(priv))
                  result.success(Walletapi.byteTohex(encPriv))
                }
                "decPriv" -> {
                  try {
                    var encPriv = call.argument<String>("encPriv")
                    var password = call.argument<String>("password")

                    var encPasswd = Walletapi.encPasswd(password)
                    var priv = Walletapi.decKey(encPasswd, Walletapi.hexTobyte(encPriv))
                    result.success(Walletapi.byteTohex(priv))
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "getBalance" -> {
                  var address = call.argument<String>("address")
                  var chain = call.argument<String>("chain")
                  var tokenSymbol = call.argument<String>("tokenSymbol")
                  val balance = walletapi.WalletBalance()
                  var util = walletapi.Util()
                  util.node = GO_URL
                  balance.cointype = chain
                  balance.address = address
                  balance.tokenSymbol = tokenSymbol
                  balance.util = util

                  var b = Walletapi.getbalance(balance)
                  var str_balance = Walletapi.byteTostring(b)
                  result.success(str_balance)
                }
                "privToPub" -> {
                  try {
                    var chain = call.argument<String>("chain")
                    var priv = call.argument<String>("priv")

                    var pub = Walletapi.privkeyToPub_v2(chain, Walletapi.hexTobyte(priv))
                    var pubStr = Walletapi.byteTohex(pub)
                    result.success(pubStr)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "pubToAddr" -> {
                  try {
                    var chain = call.argument<String>("chain")
                    var pub = call.argument<String>("pub")

                    var address = Walletapi.pubToAddress_v2(chain, Walletapi.hexTobyte(pub))
                    result.success(address)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "getTxList" -> {
                  try {
                    val addr = call.argument<String>("addr")
                    val chain = call.argument<String>("chain")
                    val tokenSymbol = call.argument<String>("tokenSymbol")
                    val type = call.argument<Int>("type")!!.toLong()
                    val page = call.argument<Int>("page")!!.toLong()
                    val count = call.argument<Int>("count")!!.toLong()

                    val walletQueryByAddr = walletapi.WalletQueryByAddr()
                    val queryByPage =
                            walletapi.QueryByPage().apply {
                              cointype = chain
                              this.tokenSymbol = if (chain == tokenSymbol) "" else tokenSymbol
                              address = addr
                              this.count = count!!
                              direction = 0
                              index = page!!
                              if (type != 0L) {
                                this.type = type!!
                              }
                            }

                    walletQueryByAddr.queryByPage = queryByPage

                    val util = walletapi.Util().apply { node = GO_URL }

                    walletQueryByAddr.util = util

                    val transaction = Walletapi.queryTransactionsByaddress(walletQueryByAddr)
                    result.success(Walletapi.byteTostring(transaction))
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "getTxById" -> {
                  try {
                    val chain = call.argument<String>("chain")
                    val tokenSymbol = call.argument<String>("tokenSymbol")
                    val txid = call.argument<String>("txid")

                    val walletQueryByTxid =
                            walletapi.WalletQueryByTxid().apply {
                              cointype = chain
                              this.tokenSymbol = if (chain == tokenSymbol) "" else tokenSymbol
                              this.txid = txid
                            }

                    val util = walletapi.Util().apply { node = GO_URL }

                    walletQueryByTxid.util = util

                    val transaction = Walletapi.queryTransactionByTxid(walletQueryByTxid)
                    val transactionStr = Walletapi.byteTostring(transaction)

                    result.success(transactionStr)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "sendToken"-> {
                  try {
                    val chain = call.argument<String>("chain")
                    val fromAddr = call.argument<String>("fromAddr")
                    val toAddr = call.argument<String>("toAddr")
                    val amount = call.argument<Double>("amount")
                    val fee = call.argument<Double>("fee")
                    val note = call.argument<String>("note")
                    val tokenSymbol = call.argument<String>("tokenSymbol")
                    val priv = call.argument<String>("priv")

                    val walletTx =
                            walletapi.WalletTx().apply {
                              cointype = chain
                              this.tokenSymbol = if (chain == tokenSymbol) "" else tokenSymbol
                            }
                    val txdata =
                            walletapi.Txdata().apply {
                              this.amount = amount!!
                              this.fee = fee!!
                              from = fromAddr
                              this.note = note
                              to = toAddr
                            }
                    walletTx.tx = txdata
                    val util = walletapi.Util().apply { node = GO_URL }
                    walletTx.util = util

                    val rawTransaction = Walletapi.createRawTransaction(walletTx)

                    val signData =
                            walletapi.SignData().apply {
                              cointype = chain
                              data = rawTransaction
                              privKey = priv
                            }

                    val signedData = Walletapi.signRawTransaction(signData)
                    val sendTx =
                            walletapi.WalletSendTx().apply {
                              cointype = chain
                              signedTx = signedData
                              this.tokenSymbol = tokenSymbol
                              this.util = util
                            }

                    val sendRawTransaction =
                            Walletapi.byteTostring(Walletapi.sendRawTransaction(sendTx))
                    result.success(sendRawTransaction)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "createTx" -> {
                  try {
                    val chain = call.argument<String>("chain")
                    val fromAddr = call.argument<String>("fromAddr")
                    val toAddr = call.argument<String>("toAddr")
                    val amount = call.argument<Double>("amount")
                    val fee = call.argument<Double>("fee")
                    val note = call.argument<String>("note")
                    val tokenSymbol = call.argument<String>("tokenSymbol")

                    val walletTx =
                            walletapi.WalletTx().apply {
                              cointype = chain
                              this.tokenSymbol = if (chain == tokenSymbol) "" else tokenSymbol
                            }

                    val txdata =
                            walletapi.Txdata().apply {
                              this.amount = amount!!
                              this.fee = fee!!
                              from = fromAddr
                              this.note = note
                              to = toAddr
                            }

                    walletTx.tx = txdata

                    val util = walletapi.Util().apply { node = GO_URL }

                    walletTx.util = util

                    val createRawTransaction = Walletapi.createRawTransaction(walletTx)
                    val createRawTransactionStr = Walletapi.byteTostring(createRawTransaction)

                    result.success(createRawTransactionStr)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                // "signTx" -> {
                //     var chain = call.argument<String>("chain")
                //     var unSignData = call.argument<String>("unSignData")
                //     var priv = call.argument<String>("priv")
                //     var signData = Walletapi.SignData()
                //     signData.cointype = chain
                //     signData.data = Walletapi.stringTobyte(unSignData)
                //     signData.privKey = priv
                //     var signRawTransaction = Walletapi.signRawTransaction(signData)
                //     result.success(signRawTransaction)
                // }

                "signTx" -> {
                  try {
                    val chain = call.argument<String>("chain")
                    val tx = call.argument<String>("tx")
                    val priv = call.argument<String>("priv")

                    val signData =
                            walletapi.SignData().apply {
                              cointype = chain
                              data = Walletapi.stringTobyte(tx) 
                              privKey = priv
                            }

                    val signRawTransaction = Walletapi.signRawTransaction(signData)
                    result.success(signRawTransaction)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "signTxWithAddressId" -> {
                  var chain = call.argument<String>("chain")
                  var unSignData = call.argument<ByteArray>("unSignData")
                  var priv = call.argument<String>("priv")
                  var addressId = call.argument<Int>("addressId")
                  var signData = walletapi.SignData()
                  signData.cointype = chain
                  signData.data = unSignData
                  signData.privKey = priv
                  signData.addressID = addressId!!
                  var signRawTransaction = Walletapi.signRawTransaction(signData)
                  result.success(signRawTransaction)
                }
                "stringToByte" -> {
                  var str = call.argument<String>("str")
                  result.success(Walletapi.stringTobyte(str))
                }
                "byteToString" -> {
                  var byteArray = call.argument<ByteArray>("byteArray")
                  result.success(Walletapi.byteTostring(byteArray))
                }
                "byteToHex" -> {
                  var byteArray = call.argument<ByteArray>("byteArray")
                  result.success(Walletapi.byteTohex(byteArray))
                }
                "hexToByte" -> {
                  var hex = call.argument<String>("hex")
                  result.success(Walletapi.hexTobyte(hex))
                }
                "signTxGroup" -> {
                  var execer = call.argument<String>("execer")
                  var createTx = call.argument<String>("createTx")
                  var txPriv = call.argument<String>("txPriv")
                  var feePriv = call.argument<String>("feePriv")
                  var btyfee = call.argument<Double>("btyfee")
                  var addressId = call.argument<Int>("addressId")
                  var sysAddressid = call.argument<Int>("sysAddressid")
                  var gWithoutTx = walletapi.GWithoutTx()
                  gWithoutTx.noneExecer = execer
                  gWithoutTx.feepriv = feePriv
                  gWithoutTx.txpriv = txPriv
                  gWithoutTx.rawTx = createTx
                  gWithoutTx.fee = btyfee!!
                  if (addressId != -1) {
                    gWithoutTx.txAddressID = addressId!!
                    gWithoutTx.feeAddressID = addressId!!
                  }
                  gWithoutTx.execerAddressID = sysAddressid!!
                  var txResp = Walletapi.coinsWithoutTxGroup(gWithoutTx)
                  result.success(txResp.signedTx)
                }
                "sendTx" -> {
                  try {
                    val chain = call.argument<String>("chain")
                    val signData = call.argument<String>("signData")
                    val tokenSymbol = call.argument<String>("tokenSymbol")

                    val util = walletapi.Util().apply { node = GO_URL }
                    val sendTx =
                            walletapi.WalletSendTx().apply {
                              cointype = chain
                              signedTx = signData
                              this.tokenSymbol = tokenSymbol
                              this.util = util
                            }

                    val sendRawTransaction =
                            Walletapi.byteTostring(Walletapi.sendRawTransaction(sendTx))
                    result.success(sendRawTransaction)
                  } catch (e: Exception) {
                    result.error("ERROR", e.message, null)
                  }
                }
                "checkPasswd" -> {
                  var password = call.argument<String>("password")
                  var passwdHash = call.argument<String>("passwdHash")
                  var checked = Walletapi.checkPasswd(password, passwdHash)
                  result.success(checked)
                }
                "encPasswd" -> {
                  var password = call.argument<String>("password")
                  var encPasswd = Walletapi.encPasswd(password)
                  result.success(encPasswd)
                }
                "passwordHash" -> {
                  var passwordS = call.argument<String>("password")
                  var passwordB = Walletapi.stringTobyte(passwordS)
                  var passwordHash = Walletapi.passwdHash(passwordB)
                  result.success(passwordHash)
                }
              }
            }
  }
}
