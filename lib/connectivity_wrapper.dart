import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/main.dart';

class ConnectivityWrapper extends StatefulWidget {
  final Widget child;
  const ConnectivityWrapper({super.key, required this.child});

  @override
  State<ConnectivityWrapper> createState() => _ConnectivityWrapperState();
}

class _ConnectivityWrapperState extends State<ConnectivityWrapper> {
  late StreamSubscription<List<ConnectivityResult>> _subscription;
  final Connectivity _connectivity = Connectivity();
  bool _hasLostConnection = false;

  @override
  void initState() {
    super.initState();
    _subscription = _connectivity.onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        if (!_hasLostConnection) {
          _hasLostConnection = true;
          _showNoConnectionDialog();
          // navigatorKey.currentState?.push(MaterialPageRoute(
          //   builder: (_) => LostInternet(),
          // ));
        }
      } else {
        if (_hasLostConnection) {
          _hasLostConnection = false;
          // Close the dialog if it's open
          if (navigatorKey.currentContext != null) {
            Navigator.of(navigatorKey.currentContext!, rootNavigator: true).pop();
          }
          //navigatorKey.currentState?.popUntil((route) => route.isFirst);
        }
      }
    });
  }

  void _showNoConnectionDialog() {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => WillPopScope(
        onWillPop: () async => false, // Disable back button
        child: AlertDialog(
          title: Text('No internet connection'),
          content: Text('Please check your internet settings...'),
          actions: [
            TextButton(
              onPressed: () {
                // Optionally let user try again, or do nothing
              },
              child: Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
  
}
