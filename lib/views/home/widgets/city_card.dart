import 'package:flutter/material.dart';

import '../../../models/city_model.dart';

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
          height: 150,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Ink.image(
                image: AssetImage(city.image),
                fit: BoxFit.cover,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/city',
                      arguments: city,
                    );
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  color: Colors.black54,
                  child: Text(
                    city.name,
                    style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}