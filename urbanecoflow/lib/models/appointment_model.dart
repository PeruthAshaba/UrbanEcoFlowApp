// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:urbanecoflow/models/user_model.dart';

class AppointmentModel {
  final String id;
  final DateTime time;
  final bool picked;
  final UserModel createdBy;
  final String createdById;
  final String phoneNumber;
  final String email;
  final String location;
  final String? image;
  final double? latitude;
  final double? longitude;
  final DateTime createdAt;
  final File? file;
  AppointmentModel({
    required this.id,
    required this.time,
    required this.picked,
    required this.createdBy,
    required this.createdById,
    required this.phoneNumber,
    required this.email,
    required this.location,
    this.image,
    this.latitude,
    this.longitude,
    this.file,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'time': time.millisecondsSinceEpoch,
      'picked': picked,
      'createdBy': createdBy.toMap(),
      'createdById': createdById,
      'phoneNumber': phoneNumber,
      'email': email,
      'location': location,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'] as String,
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      picked: map['picked'] as bool,
      createdBy: UserModel.fromMap(map['createdBy'] as Map<String,dynamic>),
      createdById: map['createdById'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      location: map['location'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppointmentModel.fromJson(String source) => AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AppointmentModel copyWith({
    String? id,
    DateTime? time,
    bool? picked,
    UserModel? createdBy,
    String? createdById,
    String? phoneNumber,
    String? email,
    String? location,
    String? image,
    double? latitude,
    double? longitude,
    DateTime? createdAt,
  }) {
    return AppointmentModel(
      id: id ?? this.id,
      time: time ?? this.time,
      picked: picked ?? this.picked,
      createdBy: createdBy ?? this.createdBy,
      createdById: createdById ?? this.createdById,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      location: location ?? this.location,
      image: image ?? this.image,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
