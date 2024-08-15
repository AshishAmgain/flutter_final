// import 'package:flutter/material.dart';
// import 'package:hotel_book/features/dashboard/data/model/room.dart';
// import 'package:hotel_book/features/dashboard/presentation/view/screen/payment_screen.dart';

// class BookScreen extends StatefulWidget {
//   final Room hotel;

//   const BookScreen({Key? key, required this.hotel}) : super(key: key);

//   @override
//   _BookScreenState createState() => _BookScreenState();
// }

// class _BookScreenState extends State<BookScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   DateTime? _checkInDate;
//   DateTime? _checkOutDate;

//   void _submitBooking() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Perform booking logic, such as sending data to backend
//       // For now, just show a success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Booking Successful!')),
//       );

//       // Navigate to payment page or other actions
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => PaymentPage(
//             hotel: widget.hotel,
//             userName: _nameController.text,
//             userEmail: _emailController.text,
//             userPhone: _phoneController.text,
//             checkInDate: _checkInDate!,
//             checkOutDate: _checkOutDate!,
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book ${widget.hotel.name}'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Full Name'),
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Please enter your name' : null,
//               ),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(labelText: 'Email'),
//                 validator: (value) =>
//                     value?.isEmpty ?? true ? 'Please enter your email' : null,
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               TextFormField(
//                 controller: _phoneController,
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 validator: (value) => value?.isEmpty ?? true
//                     ? 'Please enter your phone number'
//                     : null,
//                 keyboardType: TextInputType.phone,
//               ),
//               // Add date pickers for check-in and check-out dates
//               // For simplicity, assuming you have date pickers implemented
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitBooking,
//                 child: Text('Submit Booking'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
