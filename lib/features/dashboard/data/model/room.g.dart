// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => Room(
      id: json['_id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      category: json['category'] as String,
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      amenities:
          (json['amenities'] as List<dynamic>).map((e) => e as String).toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      availability: json['availability'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'category': instance.category,
      'price': instance.price,
      'description': instance.description,
      'amenities': instance.amenities,
      'images': instance.images,
      'availability': instance.availability,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
