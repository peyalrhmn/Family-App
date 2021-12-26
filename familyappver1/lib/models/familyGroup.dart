import 'package:cloud_firestore/cloud_firestore.dart';
class FamilyGroup{
  String? id;
  String? name;
  String? creator;
  List<String>? members;
  Timestamp? groupCreated;

  FamilyGroup({
    this.id,
    this.name,
    this.creator,
    this.members,
    this.groupCreated,
});
}