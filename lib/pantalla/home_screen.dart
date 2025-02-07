import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/widget/Menu.dart';
import 'package:flutter_application_3/widget/featured_card.dart';
import 'package:flutter_application_3/widget/header.dart';

class SetPointsHomePage extends StatefulWidget {
  @override
  _SetPointsHomePageState createState() => _SetPointsHomePageState();
}

class _SetPointsHomePageState extends State<SetPointsHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _expandAnimation;
  late Animation<double> _positionAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Color?> _colorAnimation; // Animación del color

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Rebote: Baja y luego vuelve al centro
    _positionAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0, end: 250)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 40), // Cae hasta abajo
      TweenSequenceItem(
          tween: Tween<double>(begin: 250, end: 0)
              .chain(CurveTween(curve: Curves.bounceOut)),
          weight: 60), // Rebota al centro
    ]).animate(_controller);

    // Expansión del círculo
    _expandAnimation = Tween<double>(begin: 150.0, end: 2200.0).animate(
      CurvedAnimation(
          parent: _controller,
          curve: Interval(0.6, 1.0, curve: Curves.easeInOut)),
    );

    // Cambio de color en la expansión
    _colorAnimation = ColorTween(
      begin: Colors.blueAccent, // Color inicial
      end: Color(0xFF252936), // Color final cuando se expande
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.easeInOut)));

    // Mostrar contenido después de la expansión
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _controller, curve: Interval(0.8, 1.0, curve: Curves.easeIn)),
    );

    Timer(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFF1F1D2B),
      appBar: Header(),
      drawer: Menu(),
      body: Stack(
        children: [
          // Animación del círculo
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Positioned(
                left: (screenWidth / 2) - (_expandAnimation.value / 2),
                top: (screenHeight / 2) -
                    (_expandAnimation.value / 2) +
                    _positionAnimation.value,
                child: Container(
                  width: _expandAnimation.value,
                  height: _expandAnimation.value,
                  decoration: BoxDecoration(
                    color: _colorAnimation
                        .value, // Aquí cambia el color dinámicamente
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),

          // Contenido con fade-in después de la animación
          FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(child: FeaturedCard()),
                        SizedBox(width: 10),
                        Expanded(child: FeaturedCard(isPrimary: false)),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Lo más visto',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
