import 'package:crm_projects/global_widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class VerReportesView extends StatelessWidget {
  final String routeName = 'VerReportesView';

  const VerReportesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ver Reportes View'),
        centerTitle: true,
      ),
      drawer: MenuWidget(),
      body: const Center(child: Text('CU8 Ver reportes y estadisticas')),
    );
  }
}
