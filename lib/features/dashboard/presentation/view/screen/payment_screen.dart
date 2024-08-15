// import 'package:flutter/material.dart';
// import 'package:hotel_book/features/dashboard/data/model/room.dart';
// import 'package:url_launcher/url_launcher.dart'; // To open URL

// class PaymentPage extends StatelessWidget {
//   final Room hotel;
//   final String userName;
//   final String userEmail;
//   final String userPhone;
//   final DateTime checkInDate;
//   final DateTime checkOutDate;

//   const PaymentPage({
//     Key? key,
//     required this.hotel,
//     required this.userName,
//     required this.userEmail,
//     required this.userPhone,
//     required this.checkInDate,
//     required this.checkOutDate,
//   }) : super(key: key);

//   Future<void> _makePayment() async {
//     final paymentUrl = 'https://your-server-endpoint/initialize-payment?'
//         'amount=${hotel.price}&'
//         'currency=INR&'
//         'callback_url=https://your-callback-url&'
//         'user_name=$userName&'
//         'user_email=$userEmail&'
//         'user_phone=$userPhone';

//     if (await canLaunch(paymentUrl)) {
//       await launch(paymentUrl);
//     } else {
//       throw 'Could not launch $paymentUrl';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text('Hotel: ${hotel.name}'),
//             Text('Check-in: ${checkInDate.toLocal()}'),
//             Text('Check-out: ${checkOutDate.toLocal()}'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _makePayment,
//               child: Text('Pay with Esewa'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
