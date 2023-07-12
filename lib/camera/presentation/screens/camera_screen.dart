import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.camera),
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.7,
            child: imageFile != null
                ? Image.file(File(imageFile!.path), width: 500, height: 500)
                : Center(child: Text(context.l10n.selectSource)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                heroTag: 'camera_button',
                onPressed: () async {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    setState(() {
                      imageFile = image;
                    });
                  }
                },
                child: const Icon(Icons.camera_alt_outlined),
              ),
              FloatingActionButton(
                backgroundColor: colors.error,
                heroTag: 'cancel_button',
                onPressed: () async {
                  context.popRoute();
                },
                child: const Icon(Icons.cancel_outlined),
              ),
              FloatingActionButton(
                heroTag: 'galery_button',
                onPressed: () async {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      imageFile = image;
                    });
                  }
                },
                child: const Icon(Icons.photo_camera_back_rounded),
              ),
            ],
          )
        ],
      ),
    );
  }
}
