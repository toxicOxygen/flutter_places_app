import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;
import 'dart:io';

class ImageInputWidget extends StatefulWidget {
  @override
  _ImageInputWidgetState createState() => _ImageInputWidgetState();
}

class _ImageInputWidgetState extends State<ImageInputWidget> {
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 150,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "No Image selected",
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: _takeImage,
            icon: Icon(Icons.camera),
            label: Text('Take picture'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }

  Future<void> _takeImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile = await imagePicker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      _storedImage = File(pickedFile.path);
    });
    final appDir = await sysPath.getApplicationDocumentsDirectory();
    final fileName = path.basename(_storedImage.path);
    final newPath = "${appDir.path}/$fileName";
    print(newPath);
    _storedImage.copy(newPath);
  }
}
