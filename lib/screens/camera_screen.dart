import 'package:camera/camera.dart';
import 'package:chatapp/theme.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../pages/pages.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (context) => const CameraScreen());
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  XFile? path;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraValue = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: cameraValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_cameraController);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                color: Colors.transparent,
                width: width,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.flash_auto,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.panorama_fish_eye_rounded,
                              size: 70,
                            ),
                          ),
                          onTap: () {
                            takePhoto(context);
                          },
                          onLongPress: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.flip_camera_ios,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Text(
                      'Hold for video, tap for photo',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textLigth,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final filePath = join(
      (await getTemporaryDirectory()).path,
      "${DateTime.now()}.png",
    );
    path = await _cameraController.takePicture();
    await path?.saveTo(filePath);
    Navigator.of(context).push(CameraViewPage.route(filePath));
  }
}
