import '../models/activity_model.dart';
import '../models/city_model.dart';

List<City> cities = [
  City(
    name: 'Paris',
    image: 'assets/images/paris.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/louvre.jpg',
        name: 'Musée du Louvre',
        id: 'a1',
        city: 'Paris',
        price: 12.00,
      ),
      Activity(
        image: 'assets/images/activities/chaumont.jpg',
        name: 'Buttes-Chaumont',
        id: 'a2',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/dame.jpg',
        name: 'Notre-Dame',
        id: 'a3',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/defense.jpg',
        name: 'La Défense',
        id: 'a4',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/effeil.jpg',
        name: 'Tour Eiffel',
        id: 'a5',
        city: 'Paris',
        price: 15.00,
      ),
      Activity(
        image: 'assets/images/activities/luxembourg.jpg',
        name: 'Jardin du Luxembourg',
        id: 'a6',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/mitterrand.jpg',
        name: 'Bibliothèque Mitterrand',
        id: 'a7',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/montmartre.jpg',
        name: 'Montmartre',
        id: 'a8',
        city: 'Paris',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/catacombe.jpg',
        name: 'Catacombes',
        id: 'a9',
        city: 'Paris',
        price: 10.00,
      ),
    ],
  ),
  City(
    name: 'Lyon',
    image: 'assets/images/lyon.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/lyon_opera.jpg',
        name: 'Opéra',
        id: 'l1',
        city: 'Lyon',
        price: 100.00,
      ),
      Activity(
        image: 'assets/images/activities/lyon_bellecour.jpg',
        name: 'Place Bellecour',
        id: 'l2',
        city: 'Lyon',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/lyon_basilique.jpg',
        name: 'Basilique St-Pierre',
        id: 'l3',
        city: 'Lyon',
        price: 10.00,
      ),
      Activity(
        image: 'assets/images/activities/lyon_mairie.jpg',
        name: 'Mairie',
        id: 'l4',
        city: 'Lyon',
        price: 0.00,
      ),
    ],
  ),
  City(
    name: 'Nice',
    image: 'assets/images/nice.jpg',
    activities: [
      Activity(
        image: 'assets/images/activities/nice_orthodox.jpg',
        name: 'Eglise orthodoxe',
        id: 'n1',
        city: 'Nice',
        price: 5.00,
      ),
      Activity(
        image: 'assets/images/activities/nice_riviera.jpg',
        name: 'Riviera',
        id: 'n2',
        city: 'Nice',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/nice_promenade.jpg',
        name: 'Promenade des Anglais',
        id: 'n3',
        city: 'Nice',
        price: 0.00,
      ),
      Activity(
        image: 'assets/images/activities/nice_opera.jpg',
        name: 'Opéra',
        id: 'n4',
        city: 'Nice',
        price: 100.00,
      ),
    ],
  ),
];