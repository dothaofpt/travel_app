import 'package:flutter/material.dart';
import '../models/place_model.dart';

class PlaceCard extends StatelessWidget {
  final Place place;

  PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(place.imageUrl, width: 100, fit: BoxFit.cover),
        title: Text(place.name),
        subtitle: Text('Rating: ${place.rating} ★'),
        trailing: Icon(Icons.favorite, color: Colors.red),
      ),
    );
  }
}