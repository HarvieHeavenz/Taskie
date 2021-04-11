import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taskie/data/models/task_model.dart';

class FirestoreService {
  static final FirestoreService _firestoreService = FirestoreService._();
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  FirestoreService._();
  factory FirestoreService() => _firestoreService;

  CollectionReference collection = _db.collection('task');

  Stream<List<TaskModel>> getTaskByUser(String userId) {
    return collection
        .where("userId", isEqualTo: userId)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              return TaskModel.fromMap(doc);
            },
          ).toList(),
        );
  }

  Stream<DocumentSnapshot> getTaskById(String id) =>
      collection.doc(id).snapshots();

  Stream<List<TaskModel>> getTaskByStatus(String userId,
      {bool isCompleted = true}) {
    return collection
        .where("userId", isEqualTo: userId)
        .where("isCompleted", isEqualTo: isCompleted)
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(
            (doc) {
              return TaskModel.fromMap(doc);
            },
          ).toList(),
        );
  }

  Future<DocumentReference> createTask(TaskModel task) async {
    DocumentReference ref = await collection.add(task.toMap());
    return ref;
  }

  Future<DocumentReference> deleteTask(String id) async {
    DocumentReference ref = collection.doc(id);
    await ref.delete();
    return ref;
  }

  Future<void> completeTask(String id, bool field) async {
    DocumentReference ref = collection.doc(id);
    await ref.update({"isCompleted": field});
    return ref;
  }

  Future<DocumentReference> setTaskReminder(String id, bool field) async {
    DocumentReference ref = collection.doc(id);
    await ref.update({"isReminderSet": field});
    return ref;
  }

  Future<DocumentReference> updateTask(String id, TaskModel task) async {
    DocumentReference ref = collection.doc(id);
    await ref.update(task.toMap());
    return ref;
  }
}
