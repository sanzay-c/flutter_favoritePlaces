import 'package:favoriteplaces/main.dart';
import 'package:favoriteplaces/models/place.dart';
import 'package:favoriteplaces/screens/map.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({
    super.key,
    required this.place,
  });

  final Place place;

  // String get locationImage {
  //   final lat = place.location.latitude;
  //   final lng = place.location.longitude;
  //   return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng=&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:A%7C$lat,$lng&key=YOUR_API_KEY';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                GestureDetector(
                  //wrapping the CircleAvatar with GestureDetector for the ( onTap: ) eventListeners,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MapScreen(
                          // location: place.location,
                          isSelecting: false,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    // backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black54],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomLeft)),
                  // child: Text(place.location.address, textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  //   color: Theme.of(context).colorScheme.onBackground,
                  // ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
