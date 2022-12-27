import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/cu3_gestionar_recordatorios/recordatorios_view.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/anotacionesView.dart';
import 'package:crm_projects/cu5_listas_estudiantes_registrados_asignaciones_promotores/lista_estudiantes_view.dart';
import 'package:crm_projects/cu6_gestion_roles_usuarios/lista_usuarios_view.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carreras_view.dart';
import 'package:crm_projects/cu8_ver_reportes_estadisticas/ver_reportes_view.dart';
import 'package:crm_projects/log_in_out/log_in.dart';
import 'package:flutter/material.dart';

class ListRoutes {
  Map<String, Widget Function(BuildContext)> routes = <String, WidgetBuilder>{
    //cu1 gestionar estudiantes nuevos
    const EstudianteView().routeName: (context) => const EstudianteView(),
    //cu3 gestionar recordatorios
    const RecordatoriosView().routeName: (context) => const RecordatoriosView(),
    //cu4 gestionar anotaciones
    const AnotacionesView().routeName: (context) => const AnotacionesView(),
    //cu5 lista de estudiantes registrados y asignaciones a promotores
    const ListaEstudiantesView().routeName: (context) => const ListaEstudiantesView(),
    // cu6 gestion de roles de usuarios
    const ListaUsuariosView().routeName: (context) => const ListaUsuariosView(),
    //cu7 gestion de carreras universitarias
    const CarrerasView().routeName: (context) => const CarrerasView(),
    //cu8 ver reportes y estadisticas
    const VerReportesView().routeName: (context) => const VerReportesView(),
    //Log in / out
    Login().routeName: (context)=> Login(),
  };
}
