import 'package:flutter/material.dart';

class settings_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Done", style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // 📌 Avatar, Nombre y Email
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "John Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "john.doe@email.com",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // 📌 Lista de opciones
            _buildProfileOption(Icons.notifications, "Notification settings"),
            _buildProfileOption(Icons.category, "Explore templates"),
            _buildProfileOption(Icons.play_arrow, "Video tutorials"),
            _buildProfileOption(Icons.account_circle, "Help center"),
            _buildProfileOption(Icons.message, "Contact support"),
            _buildProfileOption(Icons.star, "Acknowledgements"),

            // 📌 Opción de eliminar cuenta y cerrar sesión
            Divider(),
            _buildProfileOption(Icons.restore_from_trash, "Delete user account",
                color: Colors.red),
            _buildProfileOption(Icons.logout, "Sign out", color: Colors.red),

            SizedBox(height: 20),
            Text(
              "v7.1.1 (7191)",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 📌 Método para construir las opciones del perfil
  Widget _buildProfileOption(IconData icon, String title, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(title, style: TextStyle(color: color ?? Colors.black)),
      trailing: Icon(Icons.arrow_right, color: Colors.grey),
      onTap: () {
        // Acción al presionar cada opción
      },
    );
  }
}
