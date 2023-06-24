import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dcp_movil/common/entities/diagnostic.dart';
import 'package:dcp_movil/common/service/firebase_service.dart';
import 'package:dcp_movil/common/service/model_api_service.dart';
import 'package:dcp_movil/common/widgets/flutter_toast.dart';
import 'package:dcp_movil/global.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Map<String, int> severity = {
  'lesiones benignas similares a queratosis': 1,
  'dermatofibroma': 1,
  'nevo melanocitico': 2,
  'vascular lesions': 2,
  'queratosis actinicas': 3,
  'carcinoma de celulas basales': 4,
  'melanoma': 5,
};

class HomeController {
  final BuildContext context;
  HomeController({required this.context});

  Future getImageFromCamera(int type) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
        source: type == 1 ? ImageSource.camera : ImageSource.gallery,
        maxHeight: 256,
        maxWidth: 256,
        imageQuality: 50);

    if (pickedFile != null) {
      await _uploadImageToFirebase(File(pickedFile.path));
    } else {
      toastInfo(msg: 'No se seleccionó ninguna imagen.');
    }
  }

  Future _uploadImageToFirebase(File image) async {
    try {
      String fileName = image.path.split("/").last;
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
      String imageUrl = await taskSnapshot.ref.getDownloadURL();

      await _predict(imageUrl);
      // Aquí puedes realizar cualquier acción necesaria con la URL de la imagen subida
      print('La imagen se subió correctamente. URL de la imagen: $imageUrl');
    } catch (e) {
      print('Error al subir la imagen: $e');
    }
  }

  Future _predict(String imageUrl) async {
    final FirebaseService _firebaseService = FirebaseService.instance;
    final ApiService _apiService = ApiService();

    dynamic result = await _apiService.predictImage(imageUrl);
    print("Empieza");
    print(result);
    String filename = result['filename'];
    String prediction = result['prediction'];
    double? probability = result['probability'];
    print(prediction);
    String userId = Global.storageService.getUserId();
    Diagnostic diagnostic = Diagnostic(
      createdAt: Timestamp.now(),
      photoURL: filename,
      probability: probability,
      result: prediction,
      severity: severity[prediction],
      state: 'Completado',
    );
    print("transformado");
    print(diagnostic.result);

    await _firebaseService.createDiagnostic(userId, diagnostic);
  }
}
