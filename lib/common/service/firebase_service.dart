import 'package:dcp_movil/common/widgets/flutter_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/diagnostic.dart';

class FirebaseService {
  static FirebaseService? _instance;
  static FirebaseService get instance {
    _instance ??= FirebaseService._internal();
    return _instance!;
  }

  FirebaseService._internal();

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<User?> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print('Error al iniciar sesión con correo electrónico: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<DocumentSnapshot?> getUserById(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      return userSnapshot;
    } catch (e) {
      print('Error al obtener el usuario: $e');
      return null;
    }
  }

  Future<void> createDiagnostic(String userId, Diagnostic diagnostic) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference usersCollection = firestore.collection('users');
      DocumentReference userDocRef = usersCollection.doc(userId);

      await userDocRef.collection('diagnostics').add(diagnostic.toFirestore());
    } catch (e) {
      toastInfo(msg: 'Error al crear el diagnóstico: $e');
    }
  }

  Future<List<Diagnostic>> getDiagnosticsForUser(String userId) async {
    try {
      CollectionReference diagnosticsCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('diagnostics');

      QuerySnapshot querySnapshot = await diagnosticsCollection.get();

      List<Diagnostic> diagnostics = querySnapshot.docs.map((doc) {
        return Diagnostic.fromFirestore(
            doc as DocumentSnapshot<Map<String, dynamic>>);
      }).toList();

      return diagnostics;
    } catch (e) {
      print('Error al obtener los diagnósticos del usuario: $e');
      return [];
    }
  }

  // Otros métodos relacionados con Firebase
}
