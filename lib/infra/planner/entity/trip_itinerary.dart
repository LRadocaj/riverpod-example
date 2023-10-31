import 'package:cinnamon_riverpod_2/infra/planner/entity/trip_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripItineraryEntity {
  final String id;
  final String name;
  final String description;
  final String? imageUrl;
  final List<TripLocationEntity> locations;
  final List<String> ownerIds;
  final DateTime startDate;
  final DateTime endDate;

  const TripItineraryEntity({
    required this.id,
    required this.name,
    required this.description,
    this.imageUrl,
    required this.locations,
    required this.ownerIds,
    required this.startDate,
    required this.endDate,
  });

  factory TripItineraryEntity.fromDoc(DocumentSnapshot doc) {
    return TripItineraryEntity(
      id: doc.id,
      name: doc['name'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      locations: (doc['locations'] as List).map((e) => TripLocationEntity.fromMap(e)).toList(),
      ownerIds: (doc['ownerIds'] as List).map((e) => e.toString()).toList(),
      startDate: DateTime.parse(doc['startDate'] as String),
      endDate: DateTime.parse(doc['endDate'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'locations': locations.map((e) => e.toMap()).toList(),
      'ownerIds': ownerIds,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }
}
