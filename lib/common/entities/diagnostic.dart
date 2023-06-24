import 'package:cloud_firestore/cloud_firestore.dart';

class Diagnostic {
  final Timestamp? createdAt;
  final String? photoURL;
  final double? probability;
  final String? result;
  final int? severity;
  final String? state;

  Diagnostic({
    this.createdAt,
    this.photoURL,
    this.probability,
    this.result,
    this.severity,
    this.state,
  });

  factory Diagnostic.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    return Diagnostic(
      createdAt: data?['created_at'],
      photoURL: data?['photo_url'],
      probability: data?['probability'],
      result: data?['result'],
      severity: data?['severity'],
      state: data?['state'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (createdAt != null) "created_at": createdAt,
      if (photoURL != null) "photo_url": photoURL,
      if (probability != null) "probability": probability,
      if (result != null) "result": result,
      if (severity != null) "severity": severity,
      if (state != null) "state": state,
    };
  }
}
