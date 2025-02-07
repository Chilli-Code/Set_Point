import 'package:flutter/material.dart';

class FeaturedCard extends StatelessWidget {
  final bool isPrimary;
  FeaturedCard({this.isPrimary = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isPrimary ? Colors.blueAccent : Colors.orangeAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isPrimary
                ? 'Cómo hacer saltos básicos y aterrizar de forma segura'
                : 'Consejos de skate que debes saber',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(width: 10),
              Text(
                '53K vistas',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
