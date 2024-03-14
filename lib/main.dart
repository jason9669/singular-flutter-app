import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_testing_app/deeplink.dart';
import 'package:flutter_testing_app/custom_event.dart';
import 'package:flutter_testing_app/identity.dart';
import 'package:flutter_testing_app/revenue.dart';
import 'package:flutter_testing_app/skan.dart';

import 'package:singular_flutter_sdk/singular.dart';
import 'package:singular_flutter_sdk/singular_config.dart';
import 'package:singular_flutter_sdk/singular_link_params.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_set_id/app_set_id.dart';

import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await initPlatformState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Singular Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Singular Flutter App'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key? key, required this.title}) : super(key: key);
  final Map<String, dynamic> deeplinkParams = {};

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final Map<String, dynamic> deeplinkParams = {};
  String _authStatus = 'Unknown';

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    if (Platform.isIOS) {
      WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) => initPlugin());
    }
    initPlatformState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const Image(
            //   image: AssetImage('images/singular.png'),
            //   fit: BoxFit.fill,
            // ),
            elevation: 0,
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.blueGrey,
              tabs:[
                Tab(text: "Custom Events", icon: Icon(Icons.create_rounded)),
                Tab(text: "Revenue", icon: Icon(Icons.monetization_on)),
                Tab(text: "Identity", icon: Icon(Icons.person)),
                Tab(text: "Deep Links", icon: Icon(Icons.insert_link)),
                Tab(text: "SKAN", icon: Icon(Icons.bar_chart))
              ]
            ),
          ),
          body: TabBarView(
            children:
              <Widget>[
                CustomEvent(),
                Revenue(),
                Identity(),
                Deeplink(deeplinkParams),
                Skan(),
              ],
          ),
        ),
    );
  }

  Future<void> initPlugin() async {
    final TrackingStatus status = await AppTrackingTransparency.trackingAuthorizationStatus;
    setState(() {
      _authStatus = '$status';
    });
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
      setState(() => _authStatus = '$status');
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");
    final idfv = await AppSetId().getIdentifier();
    print("IDFV: $idfv");
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
            'We care about your privacy and data security. We keep this app free by showing ads. '
                'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
                'Our partners will collect data and use a unique identifier on your device to show you ads.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      );

  initPlatformState() async {
    SingularConfig config = SingularConfig('<SDK_KEY>', '<SDK_SECRET>');
    config.waitForTrackingAuthorizationWithTimeoutInterval = 300;
    config.skAdNetworkEnabled = true;
    config.clipboardAttribution = true;
    config.singularLinksHandler = (SingularLinkParams params) {
      print('Received deferred deeplink: ' + params.deeplink.toString());

      deeplinkParams['deeplink'] = params.deeplink;
      deeplinkParams['passthrough'] = params.passthrough;
      deeplinkParams['isDeferred'] = params.isDeferred;
    };

    config.conversionValueUpdatedCallback = (int conversionValue) {
      print('Received conversionValueUpdatedCallback: ' + conversionValue.toString());
    };

    config.conversionValuesUpdatedCallback = (int conversionValue, int coarse, bool lock) {
      print('Received conversionValueUpdatedCallback: ' +
        conversionValue.toString() + ' coarse: ' + coarse.toString() + ' lock: ' + (lock ? 'true' : 'false'));
    };

    // config.manualSkanConversionManagement = true;
    Singular.setGlobalProperty("age_group", "10", true);
    Singular.start(config);
  }
}
