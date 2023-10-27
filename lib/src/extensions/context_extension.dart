import 'package:flutter/material.dart';

/// Extension for app
class AppContextExtension {
  /// Extension for app
  AppContextExtension(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  /// Extension for app
  late GlobalKey<NavigatorState> _navigatorKey;
}

/// Extension for app
extension AppContextExtensionNavigator on AppContextExtension {
  /// get navigator key
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
