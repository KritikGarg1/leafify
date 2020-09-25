import 'package:fast_qr_reader_view_example/product.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/services.dart';
import 'package:airplane_mode_detection/airplane_mode_detection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'airQualityProvider.dart';
import 'package:geolocator/geolocator.dart';

List<CameraDescription> cameras;
Timer timer;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  // Fetch the available cameras before initializing the app.
  try {
    cameras = await availableCameras();
  } on QRReaderException catch (e) {
    logError(e.code, e.description);
  }
  runApp(new MyApp());
}

void logError(String code, String message) =>
    print('Error: $code\nError Message: $message');

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  QRReaderController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController animationController;
  int _airplane = 0;

  Position _currentPosition;
  String _currentAddress;
 // final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  @override
  void initState() {
//    geolocator
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//        .then((Position position) {
//      setState(() {
//        _currentPosition = position;
//      });
//    });
    //String lat = _currentPosition.latitude.toString();
    //String long = _currentPosition.longitude.toString();
   // print(_currentPosition);
    //getAirQuality("30", "50");
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => detectAirplaneMode());
    super.initState();

//    getPositionStream().listen((position) {
//      var speedInMps = position.speed;
//      print(speedInMps);// this is your speed
//    });
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 3),
    );

    animationController.addListener(() {
      this.setState(() {});
    });
    animationController.forward();
    verticalPosition = Tween<double>(begin: 0.0, end: 300.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else if (state == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });

    // pick the first available camera
    onNewCameraSelected(cameras[0]);
  }

  int flag = 0;

  Future<String> detectAirplaneMode() async {
    String state = await AirplaneModeDetection.detectAirplaneMode();
    print(state);
    if (state == "ON" && flag == 0) {
      setState(() {
        _airplane = 1;
        flag = 1;
      });
      Future.delayed(const Duration(seconds: 8), () {
        setState(() {
          _airplane = 0;
        });
      });
    } else if (state == "OFF") {
      setState(() {
        _airplane = 0;
        flag = 0;
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Animation<double> verticalPosition;

  String isbn = "x";
  int _isVisible = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        key: _scaffoldKey,
//        floatingActionButton: FloatingActionButton(
//          child: new Icon(Icons.check),
//          onPressed: () {
//            showInSnackBar(
//                "Just proving you can put anything on top of the scanner");
//          },
//        ),
        body: Stack(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  color: Color.fromRGBO(10, 10, 10, 1),
                  child: Center(child: _cameraPreviewWidget()),
                ),
                Row(
                  children: [
                    Container(
                      width: 630,
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(10, 10, 10, 1),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 60,
                              blurRadius: 40,
                              color: Color.fromRGBO(10, 10, 10, 1),
                            )
                          ]),
                      height: double.infinity,
                      width: 60,
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 300.0,
                    width: 300.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border:
                              Border.all(color: Colors.white54, width: 2.0)),
                    ),
                  ),
                  Positioned(
                    top: verticalPosition.value,
                    child: Container(
                      width: 300.0,
                      height: 2.0,
                      color: Colors.white54,
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 25),
                  child: AnimatedOpacity(
                    opacity: _airplane.roundToDouble(),
                    duration: Duration(seconds: 1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Center(
                          child: Text("Airplane Mode On",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black87)),
                        ),
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 255, 255, 0.85),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: _airplane.roundToDouble(),
                  duration: Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 10),
                    child: Container(
                        width: 200, child: Image.asset("assets/flight.png")),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedOpacity(
                opacity: _isVisible.roundToDouble(),
                duration: Duration(seconds: 1),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Product(
                        isbn,
                        2.4,
                        "https://i.ibb.co/6XjvnSV/kisspng-chocolate-bar-cadbury-dairy-milk-nut-dairy-5ad037c29ecdd5-1.png",
                        "CadburyWN-02")),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'No camera selected',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return Container(
        child: new AspectRatio(
          aspectRatio: 1 / controller.value.aspectRatio,
          child: new QRReaderPreview(controller),
        ),
      );
    }
  }

  void onCodeRead(dynamic value) {
    setState(() {
      isbn = value.toString();
      _isVisible = 1;
    });
    // ... do something
    // wait 5 seconds then start scanning again.
    new Future.delayed(const Duration(seconds: 2), controller.startScanning);
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        _isVisible = 0;
      });
    });
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = new QRReaderController(
        cameraDescription, ResolutionPreset.low, CodeFormat.values, onCodeRead);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on QRReaderException catch (e) {
      logError(e.code, e.description);
      showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
      controller.startScanning();
    }
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(message)));
  }
}
