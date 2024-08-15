import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotel_book/app/constants/api_endpoint.dart';
import 'package:hotel_book/core/shared_prefs/user_shared_prefs.dart';
import 'package:intl/intl.dart'; // Add this for formatting the date

class BookingForm extends StatefulWidget {
  final String roomId;

  const BookingForm({Key? key, required this.roomId}) : super(key: key);

  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  final Dio _dio = Dio();
  final UserSharedPrefs _userSharedPrefs =
      UserSharedPrefs(); // Initialize shared prefs

  String? _fullName;
  String? _email;
  String? _fathersName;
  String? _contactNumber;
  DateTime? _dob;
  final TextEditingController _dobController =
      TextEditingController(); // Controller for DOB field

  Future<void> _submitForm() async {
    final userId = await _userSharedPrefs.getUserId(); // Retrieve user ID

    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();

      final bookingData = {
        'fullName': _fullName,
        'email': _email,
        'fathersName': _fathersName,
        'contactNumber': _contactNumber,
        'dob': _dob?.toIso8601String(),
        'roomId': widget.roomId,
        'userId': userId, // Add the user ID to the booking data
      };

      try {
        final response = await _dio.post(
          'http://192.168.1.74:5000/api/bookings/booking', // Replace with your actual API endpoint
          data: bookingData,
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Booking Successful')),
          );
          Navigator.pop(context); // Go back to the previous screen
        } else {
          // Handle the error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Booking Failed: ${response.statusMessage}')),
          );
        }
      } catch (error) {
        // Handle the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('An error occurred: $error')),
        );
      }
    }
  }

  @override
  void dispose() {
    _dobController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Now'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _fullName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _email = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Father\'s Name'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _fathersName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact Number'),
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                onSaved: (value) => _contactNumber = value,
              ),
              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
                readOnly: true,
                validator: (value) =>
                    value?.isEmpty ?? true ? 'Required' : null,
                onTap: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      _dob = selectedDate;
                      _dobController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    });
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Book Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
