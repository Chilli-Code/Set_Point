import 'package:flutter/material.dart';
import '../pantalla/Form.dart'; // 📌 Importamos la pantalla Form.dart
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _titleAnimation;
  late Animation<double> _fadeAnimation;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool titleAtTop = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _titleAnimation = Tween<double>(begin: 0.0, end: -0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            titleAtTop = true;
          });
        }
      });

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );

    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Fondo_Login.jpg",
              width: double.infinity, // ✅ Asegura que ocupe todo el ancho
              height: double.infinity, // ✅ Asegura que ocupe toda la altura
              fit: BoxFit.cover, // ✅ Cubre toda la pantalla sin distorsión
            ),
          ),

          // 🔹 Capa oscura para mejorar el contraste
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // 🔹 Animación del título con colorize al llegar arriba
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Align(
                alignment:
                    Alignment(0.0, _titleAnimation.value.clamp(-0.9, 0.0)),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 5),
                  child: titleAtTop
                      ? _animatedTitleText() // 🔹 Animación de colores cuando está arriba
                      : _staticTitleText(), // 🔹 Texto estático antes de llegar arriba
                ),
              );
            },
          ),

          // 🔹 Formulario con animación de Fade-In
          Align(
            alignment: Alignment.bottomCenter,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    _buildTextField(
                        "Email", Icons.email, emailController, false),
                    SizedBox(height: 15),
                    _buildTextField(
                        "Password", Icons.lock, passwordController, true),
                    SizedBox(height: 20),
                    _buildLoginButton(),
                    SizedBox(height: 10),
                    _buildRegisterOption(context), // 🔹 Agregado contexto
                    SizedBox(height: 2),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 📌 Texto estático antes de llegar arriba
  Widget _staticTitleText() {
    return Text(
      "Set Points",
      style: TextStyle(
        fontSize: 50,
        fontFamily: 'SportsWorld',
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }

  // 📌 Animación de colores cuando el título llega arriba
  Widget _animatedTitleText() {
    return SizedBox(
      width: 350.0, // 🔹 Asegurar ancho suficiente
      child: AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            'Set Points',
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontSize: 50.0,
              fontFamily: 'SportsWorld',
              fontWeight: FontWeight.bold,
            ),
            colors: [
              Color(0xFF6C5ECF),
              Colors.blue, // Azul - color principal del voleibol
              Colors.yellow, // Amarillo - contraste y balón de voleibol
              Colors.white, // Blanco - acentos y detalles
            ],
          ),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  // 📌 Método para construir los TextFields
  Widget _buildTextField(String hintText, IconData icon,
      TextEditingController controller, bool isObscure) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white38),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF6C5ECF), width: 2),
        ),
      ),
    );
  }

  // 📌 Botón de Login
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        print("Email: ${emailController.text}");
        print("Password: ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6C5ECF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text(
        "Login",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  Widget _buildRegisterOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        TextButton(
          onPressed: () {
            // 📌 Navegar a la pantalla de registro
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterScreen()),
            );
          },
          child: Text(
            "Register",
            style: TextStyle(color: Color(0xFF6C5ECF), fontSize: 14),
          ),
        ),
      ],
    );
  }
}
