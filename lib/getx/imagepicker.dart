import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:image_cropper/image_cropper.dart';


class ImagePickerPage extends StatefulWidget{
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> { 

  ImagePicker picker = ImagePicker();
  XFile? image;
  File? imageFile;
  File? _image;

  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
         appBar: AppBar(
          backgroundColor: Color(0XFF307777),
          title: Text("Image Cropper"),
        ),
        body: Container(
            child: imageFile == null
                ? Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                         
                          onPressed: () {
                            _getFromGallery();
                          },
                          child: Text(
                            "PICK FROM GALLERY",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
                    ),
                  )));
  }

  
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    _cropImage(pickedFile?.path);
  }


 Future<void>_cropImage(filePath) async {
  try {
    File pickedFile = File(filePath);
    File? croppedImage = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      setState(() {});
    }
  } catch (e) {
    print("Error cropping image: $e");
  }
}


}
                        