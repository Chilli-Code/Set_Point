import 'package:flutter/material.dart';
import 'package:flutter_application_3/pantalla/login_page.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Set Points',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              Text(
                'User0', // Nombre del usuario
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8), // Espaciado entre nombre e imagen

              // Avatar con menú en Bottom Sheet
              GestureDetector(
                onTap: () {
                  _showOptionsMenu(context);
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://i.geekflare.com/cdn-cgi/image/width=1200,height=630,fit=crop,quality=90,format=auto,onerror=redirect,metadata=none/wp-content/uploads/sites/24/2023/06/AI-avatar.jpg',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  // Función para mostrar el menú en un Bottom Sheet
  void _showOptionsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFF2A2D3E), // Color oscuro para el menú
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(context, Icons.account_circle, 'Perfil', () {
                print("Perfil seleccionado");
                Navigator.pop(context);
              }),
              _buildOption(context, Icons.logout, 'Cerrar sesión', () {
                print("Cerrar sesión seleccionada");

                // Cierra el modal
                Navigator.pop(context);

                // Redirige a la pantalla de login y elimina la pila de navegación
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }),
            ],
          ),
        );
      },
    );
  }

  // Widget reutilizable para cada opción del menú
  Widget _buildOption(
      BuildContext context, IconData icon, String text, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: onTap,
    );
  }
}
