import 'package:flutter/material.dart';
import '../../models/city_model.dart';
import '../../widgets/dyma_drawer.dart';
import '../home/home_view.dart';
import 'widgets/trip_activity_list.dart';
import 'widgets/activity_list.dart';
import 'widgets/trip_overview.dart';
import '../../models/activity_model.dart';
import '../../models/trip_model.dart';

class CityView extends StatefulWidget {
  static const String routeName = '/city';
  final City city;
  final Function addTrip;

  List<Activity> get activities {
    return city.activities;
  }

  const CityView({super.key, required this.city, required this.addTrip});

  @override
  State<CityView> createState() => _CityViewState();
}

class _CityViewState extends State<CityView> {
  late Trip mytrip;
  late int index;

  List<Activity> get tripActivities {
    return widget.activities
        .where((activity) => mytrip.activities.contains(activity.id))
        .toList();
  }

  double get amount {
    return mytrip.activities.fold(0.0, (acc, cur) {
      final activity =
      widget.activities.firstWhere((activity) => activity.id == cur);
      return acc + activity.price;
    });
  }

  @override
  void initState() {
    super.initState();
    mytrip = Trip(activities: [], city: 'Paris', date: null);
    index = 0;
  }

  void setDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime(2030),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          mytrip.date = newDate;
        });
      }
    });
  }

  void switchIndex(newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  void toggleActivity(String id) {
    setState(() {
      mytrip.activities.contains(id)
          ? mytrip.activities.remove(id)
          : mytrip.activities.add(id);
    });
  }

  void deleteTripActivity(String id) {
    setState(() {
      mytrip.activities.remove(id);
    });
  }

  void saveTrip() async {
    final result = await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Voulez-vous sauvegarder ?'),
        contentPadding: const EdgeInsets.all(20),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
                onPressed: () {
                  Navigator.pop(context, 'save');
                },
                child: const Text(
                  'Sauvegarder',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.pop(context, 'cancel');
                },
              )
            ],
          ),
        ],
      ),
    );
    if (result == 'save') {
      widget.addTrip(mytrip);
      if (mounted) Navigator.pushNamed(context, HomeView.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organisation du voyage'),
      ),
      drawer: const DymaDrawer(),
      body: Column(
        children: <Widget>[
          TripOverview(
              mytrip: mytrip,
              setDate: setDate,
              cityName: widget.city.name,
              amount: amount),
          Expanded(
            child: index == 0
                ? ActivityList(
              activities: widget.activities,
              selectedActivities: mytrip.activities,
              toggleActivity: toggleActivity,
            )
                : TripActivityList(
              activities: tripActivities,
              deleteTripActivity: deleteTripActivity,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: saveTrip,
        child: const Icon(Icons.forward),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Découverte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            label: 'Mes activités',
          )
        ],
        onTap: switchIndex,
      ),
    );
  }
}