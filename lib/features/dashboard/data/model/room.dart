import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room.g.dart';

@JsonSerializable()
class Room extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String type;
  final String category;
  final double price;
  final String description;
  final List<String> amenities;
  final List<String> images;
  final bool availability;
  final DateTime createdAt;
  final DateTime updatedAt;

  Room({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.price,
    required this.description,
    required this.amenities,
    required this.images,
    required this.availability,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
  Map<String, dynamic> toJson() => _$RoomToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        category,
        price,
        description,
        amenities,
        images,
        availability,
        createdAt,
        updatedAt,
      ];
}
