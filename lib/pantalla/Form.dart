import 'package:flutter/material.dart';
import 'login_page.dart'; // 📌 Importamos la pantalla de login

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  String selectedRole = "Jugador"; // Valor inicial del dropdown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 📌 Imagen de fondo
          Positioned.fill(
            child: Image.network(
              "https://i.pinimg.com/736x/ba/fb/aa/bafbaa9766ecf329a7b20ca9816ab330.jpg",
              fit: BoxFit.cover,
            ),
          ),

          // 📌 Capa oscura para mejorar el contraste
          Container(
            color: Colors.black.withOpacity(0.6),
          ),

          // 📌 Título centrado al inicio y luego arriba
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top +
                    20, // No tocar la barra de notificaciones
              ),
              child: Text(
                "Registro",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'SportsWorld',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),

          // 📌 Formulario de Registro
          Align(
            alignment: Alignment.bottomCenter,
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
                  _buildTextField("Nombre", Icons.person, nameController),
                  SizedBox(height: 15),
                  _buildTextField(
                      "Apellido", Icons.person_outline, lastNameController),
                  SizedBox(height: 15),
                  _buildTextField("Teléfono", Icons.phone, phoneController,
                      isNumber: true),
                  SizedBox(height: 15),
                  _buildTextField(
                      "Correo Electrónico", Icons.email, emailController),
                  SizedBox(height: 15),

                  // 📌 Select para elegir el rol
                  _buildDropdown(),

                  SizedBox(height: 20),
                  _buildRegisterButton(),
                  SizedBox(height: 10),
                  _buildLoginOption(context), // 📌 Corregido para navegar
                  SizedBox(height: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 📌 Campo de texto reutilizable
  Widget _buildTextField(
      String hintText, IconData icon, TextEditingController controller,
      {bool isNumber = false}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
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

  // 📌 Select de "Jugador" o "Creador de Torneo"
  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white38),
      ),
      child: DropdownButtonFormField<String>(
        value: selectedRole,
        dropdownColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(Icons.sports_volleyball, color: Colors.white),
        ),
        style: TextStyle(color: Colors.white, fontSize: 16),
        items: ["Jugador", "Creador de Torneo"].map((String role) {
          return DropdownMenuItem<String>(
            value: role,
            child: Text(role, style: TextStyle(color: Colors.white)),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedRole = value!;
          });
        },
      ),
    );
  }

  // 📌 Botón de Registro
  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: () {
        print("Nombre: ${nameController.text}");
        print("Apellido: ${lastNameController.text}");
        print("Teléfono: ${phoneController.text}");
        print("Correo: ${emailController.text}");
        print("Rol: $selectedRole");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6C5ECF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
      ),
      child: Text(
        "Registrarse",
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }

  // 📌 Opción para iniciar sesión (ahora con navegación a LoginScreen)
  Widget _buildLoginOption(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "¿Ya tienes una cuenta?",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        TextButton(
          onPressed: () {
            // 📌 Navega a LoginScreen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          child: Text(
            "Iniciar Sesión",
            style: TextStyle(color: Color(0xFF6C5ECF), fontSize: 14),
          ),
        ),
      ],
    );
  }
}
