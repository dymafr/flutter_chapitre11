import 'package:flutter/material.dart';
import 'models/city_model.dart';
import 'models/trip_model.dart';
import 'views/city/city_view.dart';
import 'views/home/home_view.dart';
import 'views/404/not_found.dart';
import 'views/trips/trips_view.dart';
import './data/data.dart' as data;

void main() => runApp(DymaTrip());

class DymaTrip extends StatefulWidget {
  final List<City> cities = data.cities;

  DymaTrip({super.key});

  @override
  State<DymaTrip> createState() => _DymaTripState();
}

class _DymaTripState extends State<DymaTrip> {
  List<Trip> trips = [
    Trip(
        activities: [],
        city: 'Paris',
        date: DateTime.now().add(const Duration(days: 1))),
    Trip(
        activities: [],
        city: 'Lyon',
        date: DateTime.now().add(const Duration(days: 2))),
    Trip(
        activities: [],
        city: 'Nice',
        date: DateTime.now().subtract(const Duration(days: 1))),
  ];

  void addTrip(Trip trip) {
    setState(() {
      trips.add((trip));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.routeName: (context) => HomeView(cities: widget.cities),
        },
        // ignore: missing_return
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case CityView.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  final City city = settings.arguments as City;
                  return CityView(
                    city: city,
                    addTrip: addTrip,
                  );
                });
              }
            case TripsView.routeName:
              {
                return MaterialPageRoute(builder: (context) {
                  return TripsView(trips: trips);
                });
              }
          }
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => const NotFound());
        });
  }
}
