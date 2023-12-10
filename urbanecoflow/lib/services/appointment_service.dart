import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../main.dart';
import '../models/appointment_model.dart';

class AppointmentService {
  static Future<Either<String, List<AppointmentModel>>>
      getAppointments() async {
    try {
      List<AppointmentModel> dataList = [];
      var response = await fireStore
          .collection('Appointments')
          .where('createdById', isEqualTo: auth.currentUser?.uid)
          .get();
      for (var element in response.docs) {
        dataList.add(AppointmentModel.fromMap(element.data()));
      }
      return Right(dataList);
    } on FirebaseException catch (e) {
      return Left(e.message ?? e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> deleteAppointment(String id) async {
    try {
      await fireStore.collection('Appointments').doc(id).delete();
      return const Right('Appointment deleted successfully');
    } on FirebaseException catch (e) {
      return Left(e.message ?? e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<String, String>> addAppointment(
      AppointmentModel appointmentModel) async {
    try {
      String? url;
      if (appointmentModel.file != null) {
        Reference storageReference =
            firebaseStorage.ref().child(appointmentModel.id);
        UploadTask uploadTask = storageReference.putFile(appointmentModel.file!);

        await uploadTask.whenComplete(() => print('File Uploaded'));

        // Get the download URL
         url = await storageReference.getDownloadURL();
      }
      await fireStore
          .collection('Appointments')
          .doc(appointmentModel.id)
          .set(appointmentModel.copyWith(image: url).toMap());
      return const Right('Appointment created successfully');
    } on FirebaseException catch (e) {
      return Left(e.message ?? e.toString());
    } catch (e) {
      return Left(e.toString());
    }
  }
}
