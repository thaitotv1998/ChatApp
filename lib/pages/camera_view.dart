import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  static Route route(String path) => MaterialPageRoute(
      builder: (context) => CameraViewPage(
            path: path,
          ));
  const CameraViewPage({Key? key, required this.path}) : super(key: key);

  final String path;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardColor,
        leading: CupertinoButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.grey,
            size: 28,
          ),
        ),
        actions: [],
      ),
      body: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                color: Colors.black87,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type message...',
                    hintMaxLines: 1,
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 26,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4),
                      child: FloatingActionButton(
                        child: const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              //   Ink(
              //     decoration: const BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: AppColors.accent,
              //     ),
              //     child: IconButton(
              //       icon: const Icon(Icons.send_rounded),
              //       color: Colors.white,
              //       splashColor: AppColors.accent,
              //       onPressed: () {},
              //     ),
              //   ),
            ),
          ],
        ),
      ),
    );
  }
}
