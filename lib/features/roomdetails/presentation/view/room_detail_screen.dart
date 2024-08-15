import 'package:flutter/material.dart';
import 'package:hotel_book/app/constants/api_endpoint.dart';
import 'package:hotel_book/features/dashboard/data/model/room.dart';
import 'package:hotel_book/features/roomdetails/presentation/widget/form_widget.dart';

class RoomDetailsScreen extends StatelessWidget {
  final Room room;

  const RoomDetailsScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the room image
              if (room.images.isNotEmpty)
                Image.network(
                  '${ApiEndpoints.imageUrl}/${room.images}',
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16),
              Text(
                room.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Type: ${room.type}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Category: ${room.category}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Price: \$${room.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Description:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                room.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Amenities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                room.amenities.join(', '),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Availability: ${room.availability ? "Available" : "Unavailable"}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              Text(
                'Hotel Name: ${room.hotelName}',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 8),
              if (room.hotelPicture.isNotEmpty)
                Image.network(
                  '${ApiEndpoints.imageUrl}/${room.hotelPicture}',
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 16),
              Text(
                'Created At: ${room.createdAt}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Updated At: ${room.updatedAt}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Spacer to push the button to the bottom
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingForm(roomId: room.id),
                      ),
                    );
                  },
                  child: Text('Book Now'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
