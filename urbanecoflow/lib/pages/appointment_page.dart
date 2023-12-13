import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:urbanecoflow/controllers/appointments_controller.dart';
import 'package:urbanecoflow/controllers/user_controller.dart';
import 'package:urbanecoflow/models/appointment_model.dart';

import '../core/state.dart';
import '../utils/colors.dart';
import 'widgets/app_button_widget.dart';
import 'widgets/text_field_widget.dart';

class AppointmentListPage extends ConsumerWidget {
  const AppointmentListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allAppointmentsState = ref.watch(allAppointmentsProvider);
    final appointmentCRUDState = ref.watch(appointmentCRUDProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
        actions: [
          allAppointmentsState.status == Status.loading ||
                  appointmentCRUDState.status == Status.loading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: primaryColor,
          onPressed: () async {
            var pick = await Navigator.of(context).push<bool>(MaterialPageRoute(
                builder: (context) => const AddAppointmentPage()));
            print(pick);
            print('=====================================');
            if (pick == true) {
              _showMaterialBanner(context);
              //     Fluttertoast.cancel();
              // Fluttertoast.showToast(
              //     msg:
              //         'Thank you for choosing Urban Eco Flow App, we are going to contact you soon',
              //     timeInSecForIosWeb: 6);
            }
          },
          label: const Text('Schedule Pickup',
              style: TextStyle(color: whiteColor)),
          icon: const Icon(Icons.add, color: whiteColor)),
      body: ListView.builder(
        itemCount: allAppointmentsState.data!.length,
        itemBuilder: (context, index) {
          final appointment = allAppointmentsState.data![index];
          return ListTile(
            trailing: appointment.picked
                ? null
                : IconButton(
                    onPressed: () {
                      ref
                          .read(appointmentCRUDProvider.notifier)
                          .deleteAppointment(id: appointment.id);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red)),
            title: Text(DateFormat('dd-MM-yyyy').format(appointment.time)),
            subtitle: Text(appointment.location, maxLines: 1),
            onTap: () {
              // Navigate to a new page showing account details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      AppointmentDetailsPage(appointment: appointment),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showMaterialBanner(BuildContext context) {
    final banner = MaterialBanner(
      padding: const EdgeInsets.all(10),
      content: const Text(
          'Thank you for choosing Urban Eco Flow App, we are going to contact you soon',
          textAlign: TextAlign.center,
          style: TextStyle(color: whiteColor)),
      leading: const Icon(Icons.info, color: whiteColor),
      backgroundColor: primaryColor,
      actions: [
        TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: const Text('OK'),
        ),
      ],
    );

    // Show the material banner
    ScaffoldMessenger.of(context).showMaterialBanner(banner);
  }
}

class AppointmentDetailsPage extends StatelessWidget {
  final AppointmentModel appointment;

  const AppointmentDetailsPage({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (appointment.image != null)
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: CachedNetworkImage(imageUrl: appointment.image!),
              ),
            const SizedBox(height: 10),
            Text('Date : ${DateFormat('dd-MM-yyyy').format(appointment.time)}'),
            const SizedBox(height: 10),
            Text('Location : ${appointment.location}'),
            const SizedBox(height: 10),
            Text('Status : ${appointment.picked ? 'Picked' : 'Pending'}'),
            const SizedBox(height: 10),
            // const Text('Amount : UGX 2,000'),
            // const SizedBox(height: 10),
            const Text('Contact Information',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 20),
            Text('Phone : ${appointment.phoneNumber}'),
            const SizedBox(height: 10),
            Text('Email : ${appointment.email}'),
          ],
        ),
      ),
    );
  }
}

class AddAppointmentPage extends ConsumerStatefulWidget {
  const AddAppointmentPage({super.key});

  @override
  ConsumerState<AddAppointmentPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddAppointmentPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  DateTime dateController = DateTime.now();

  File? file;

  final TextEditingController addressController = TextEditingController();

  bool showPassword = true;
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appointmentCRUDState = ref.watch(appointmentCRUDProvider);
    ref.listen(appointmentCRUDProvider, (previous, next) async {
      if (next.status == Status.loaded) {
        ref.invalidate(allAppointmentsProvider);
        Navigator.of(context).pop(true);
      }
      if (next.status == Status.error) {
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: next.message ?? 'An error occurred !', timeInSecForIosWeb: 6);
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Pickup'),
        actions: [
          appointmentCRUDState.status == Status.loading
              ? const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  ),
                )
              : Container()
        ],
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   color: Color.fromRGBO(8, 8, 0,
        //       0.5), // Transparent white (adjust the alpha value as needed)
        // ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text('Add an image if available'),
                  Stack(
                    children: [
                      Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: file != null
                              ? Image.file(file!, fit: BoxFit.cover)
                              : Center(
                                  child: IconButton(
                                      onPressed: () async {
                                        final xfile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery,
                                                imageQuality: 30,
                                                maxHeight: 400,
                                                maxWidth: 400);
                                        if (xfile != null) {
                                          file = File(xfile.path);
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(Icons.add,
                                          color: whiteColor)),
                                )),
                      if (file != null)
                        IconButton(
                            onPressed: () {
                              file = null;
                              setState(() {});
                            },
                            icon: const Icon(Icons.cancel, color: Colors.red))
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: addressController,
                    label: 'Address',
                    prefixIcon: const Icon(Icons.add_location_rounded),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: emailController,
                    label: 'Email',
                    prefixIcon: const Icon(Icons.mail),
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    controller: phoneNumberController,
                    label: 'Phone',
                    prefixIcon: const Icon(Icons.phone),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    readOnly: true,
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 1000)));
                      if (date != null) {
                        dateController = date;
                        setState(() {});
                      }
                    },
                    label: 'Pickup date',
                    key: UniqueKey(),
                    initialValue:
                        DateFormat('dd-MM-yyyy').format(dateController),
                    prefixIcon: const Icon(Icons.calendar_month),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter pickup date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                      readOnly: true,
                      label: 'Payment Method',
                      initialValue: 'Cash',
                      key: UniqueKey(),
                      prefixIcon: const SizedBox(
                          width: 50,
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'UGX',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )))),
                  const SizedBox(height: 24.0),
                  AppButtonWidget(
                      borderRadius: 15,
                      onTap: appointmentCRUDState.status == Status.loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                // signUp(
                                //   bankNameController.text,
                                //   bankAccountNumberController.text,
                                //   nameController.text,
                                //   addressController.text,
                                // );
                                ref
                                    .read(appointmentCRUDProvider.notifier)
                                    .addAppointment(AppointmentModel(
                                        id: DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString(),
                                        time: dateController,
                                        file: file,
                                        picked: false,
                                        createdBy:
                                            ref.watch(userProvider).data!,
                                        createdById:
                                            ref.watch(userProvider).data!.id,
                                        phoneNumber: phoneNumberController.text,
                                        email: emailController.text,
                                        location: addressController.text,
                                        createdAt: DateTime.now()));
                              }
                            },
                      child: const Text('Schedule Pickup',
                          style: TextStyle(color: whiteColor))),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
