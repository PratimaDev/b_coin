import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_flutter_v2/walletconnect_flutter_v2.dart';

class WalletConnectorV2 {
  static final WalletConnectorV2 _instance = WalletConnectorV2._internal();
  factory WalletConnectorV2() => _instance;

  WalletConnectorV2._internal();

  late Web3App web3App;
  bool initialized = false;

  final PairingMetadata metadata = const PairingMetadata(
    name: 'B-Coin App',
    description: 'Login with Wallet',
    url: 'https://bcoin.app',
    icons: ['https://bcoin.app/logo.png'],
  );

  Future<void> initWalletConnect() async {
    if (initialized) return;

    web3App = Web3App(
      projectId: 'YOUR_PROJECT_ID', // Replace with your real project ID
      metadata: metadata,
      relayUrl: 'wss://relay.walletconnect.com',
      storage: Web3AppFlutterSecureStorage(const FlutterSecureStorage()),
    );

    web3App.onSessionConnect.subscribe((SessionConnect event) {
      print("✅ Connected: ${event.session}");
    });

    web3App.onSessionDelete.subscribe((SessionDelete event) {
      print("❌ Session Deleted");
    });

    initialized = true;
  }

  Future<String?> connectWallet() async {
    try {
      final ConnectResponse response = await web3App.connect(
        requiredNamespaces: {
          'eip155': const RequiredNamespace(
            chains: ['eip155:1'],
            methods: ['eth_sendTransaction', 'personal_sign', 'eth_signTypedData'],
            events: ['chainChanged', 'accountsChanged'],
          ),
        },
      );

      final uri = response.uri;
      if (uri != null) {
        await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
      }

      final session = await response.session.future;
      return session.namespaces['eip155']?.accounts.firstOrNull?.split(':').last;
    } catch (e) {
      print("⚠️ Error during wallet connect: $e");
      return null;
    }
  }

  Future<void> disconnect() async {
    await web3App.disconnect();
  }

  bool get isConnected => web3App.sessions.isNotEmpty;
}
