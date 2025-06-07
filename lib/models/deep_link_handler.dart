import 'dart:async';
import 'package:app_links/app_links.dart';

class DeepLinkHandler {
  static final DeepLinkHandler _instance = DeepLinkHandler._internal();
  factory DeepLinkHandler() => _instance;

  DeepLinkHandler._internal();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initUriHandler(Function(String uri) onUriReceived) async {
    try {
      // Cold start ke liye initial link check karna
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        onUriReceived(initialUri.toString());
      }

      // App running state mein link listen karna
      _linkSubscription = _appLinks.uriLinkStream.listen((Uri uri) {
        onUriReceived(uri.toString());
      }, onError: (err) {
        print('Deep link error: $err');
      });
    } catch (e) {
      print("Failed to get initial link: $e");
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
