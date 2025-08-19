import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // استيراد مكتبة الأنيميشن

import 'SendImageScreen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    if (_cameras == null || _cameras!.isEmpty) {
      return;
    }

    _controller = CameraController(
      _cameras![0], // الكاميرا الخلفية
      ResolutionPreset.medium,
    );

    await _controller!.initialize();
    if (!mounted) return;

    setState(() {
      _isCameraInitialized = true;
    });
  }

  Future<void> _captureImage() async {
    if (!_isCameraInitialized || _controller == null) {
      return;
    }

    try {
      final XFile image = await _controller!.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SendImageScreen(imagePath: image.path),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error capturing image: $e')),
      );
    }
  }

  void _sendMessageWithoutImage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SendImageScreen(imagePath: null),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    } else if (state == AppLifecycleState.paused) {
      _controller?.dispose();
      setState(() {
        _isCameraInitialized = false;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            if (_isCameraInitialized)
              Positioned.fill(
                child: CameraPreview(_controller!),
              )
            else
              Center(
                child: SpinKitFadingCube(
                  color: Colors.green,
                  size: screenWidth * 0.1,
                ),
              ),
            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.05,
              right: screenWidth * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: _captureImage,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.camera,
                      size: screenWidth * 0.08,
                      color: Colors.white,
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: _sendMessageWithoutImage,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.message,
                      size: screenWidth * 0.08,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}