import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/main.dart';
import 'package:mobile_shop/route_tracking_observer.dart';

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
          _showNoConnectionDialog('No internet connection');
        }
      } else {
        if (_hasLostConnection) {
          _hasLostConnection = false;
          _showNoConnectionDialog('Connected back',reload: true);
        }
      }
    });
  }

  void _showNoConnectionDialog(String text,{bool reload = false}) {
    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (context) => AlertDialog(
        content: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              if (reload) {
                final currentRoute = routeObserver.currentRoute;
                if (currentRoute != null) {
                  navigatorKey.currentState!.popAndPushNamed(currentRoute);
                  debugPrint("************************* PAGE $currentRoute RELOADED ****************************");
                }
              }
            },
            child: Text('Ok'),
          ),
        ],
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
