import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_view.dart';
import 'package:crm_projects/cu5_listas_estudiantes_registrados_asignaciones_promotores/lista_estudiantes_view.dart';
import 'package:crm_projects/cu6_gestion_roles_usuarios/lista_usuarios_view.dart';
import 'package:crm_projects/cu6_gestion_roles_usuarios/usuario_model.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carreras_view.dart';
import 'package:crm_projects/cu8_ver_reportes_estadisticas/ver_reportes_view.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/log_in_out/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);
  final usuario = UsuarioModel();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              child: Icon(Icons.person_outline, size: 50),
            ),
            otherAccountsPictures: [
              IconButton(
                  color: Colors.white,
                  onPressed: () {
                    FirebaseAuth.instance.signOut().then((value) {
                      showSnackBarWidget(
                          context: context,
                          message: 'Sesion cerrada con exito');
                      Navigator.pushNamedAndRemoveUntil(
                          context, Login().routeName, (route) => false);
                    });
                  },
                  icon: const Icon(Icons.power_settings_new))
            ],
            accountName: Text('Nombre: ${usuario.nombre}'),
            accountEmail: Text('Correo: ${usuario.dni}'),
          ),
          ListTile(
            title: const Text('cu1 Estudiantes '),
            leading: const Icon(Icons.people_alt_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, const EstudianteView().routeName, (route) => false),
          ),
          ListTile(
            title: const Text('cu4 Anotaciones '),
            leading: const Icon(Icons.people_alt_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, const AnotacionesView().routeName, (route) => false),
          ),
          ListTile(
            title: const Text('cu5 Listas y asignaciones'),
            leading: const Icon(Icons.list_alt_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(context,
                const ListaEstudiantesView().routeName, (route) => false),
          ),
          ListTile(
            title: const Text('cu6 Roles '),
            leading: const Icon(Icons.assignment_ind_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, const ListaUsuariosView().routeName, (route) => false),
          ),
          ListTile(
            title: const Text('cu7 Carreras '),
            leading: const Icon(Icons.school_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, const CarrerasView().routeName, (route) => false),
          ),
          ListTile(
            title: const Text('cu8 Reportes '),
            leading: const Icon(Icons.query_stats_outlined),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, const VerReportesView().routeName, (route) => false),
          ),
        ],
      ),
    );
  }
}
