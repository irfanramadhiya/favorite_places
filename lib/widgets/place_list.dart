import 'package:favourite_places/models/place.dart';
import 'package:favourite_places/screens/place_detail.dart';
import 'package:flutter/material.dart';

Widget placesList(
    {required List<Place> places, required BuildContext context}) {
  if (places.isEmpty) {
    return Center(
      child: Text(
        'No place added yet',
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }

  return ListView.builder(
    itemCount: places.length,
    itemBuilder: (context, index) => ListTile(
      leading: Hero(
        tag: "image",
        child: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
      ),
      title: Text(
        places[index].title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      subtitle: Text(
        places[index].location.address,
        style: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlaceDetailScreen(place: places[index])));
      },
    ),
  );
}
