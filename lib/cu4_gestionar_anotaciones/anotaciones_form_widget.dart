import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_controller.dart';
import 'package:crm_projects/cu4_gestionar_anotaciones/anotaciones_model.dart';
import 'package:crm_projects/global_services/show_date_picker_widget.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/global_services/validators.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:crm_projects/global_widgets/elevated_button_widget.dart';
import 'package:crm_projects/global_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnotacionesFormWidget extends StatefulWidget {
  AnotacionesFormWidget({Key? key, this.anotacionesModel, required this.option})
      : super(key: key) {
    if (anotacionesModel != null) {
      switch (option) {
        case 'Registrar':
          break;
        case 'Actualizar':
          nombre.text = anotacionesModel!.nombre!;
          text.text = anotacionesModel!.texto!;
          isRecordatorio = anotacionesModel!.isRecordatorio!;
          fechaRecordatorio = anotacionesModel!.fechaRecordatorio!;
          break;
        case 'Ver':
          nombre.text = anotacionesModel!.nombre!;
          text.text = anotacionesModel!.texto!;
          isRecordatorio = anotacionesModel!.isRecordatorio!;
          fechaRecordatorio = anotacionesModel!.fechaRecordatorio!;
          enabled = false;
      }
    }
  }
  ///Option1: Registrar.
  ///
  ///Option2: Actualizar, [anotacionesModel] no puede ser null.
  ///
  ///Option3: Ver, [anotacionesModel] no puede ser null
  final String option;
  final AnotacionModel? anotacionesModel;
  late bool? enabled = true;

  final TextEditingController nombre = TextEditingController();
  final TextEditingController text = TextEditingController();
  bool isRecordatorio = true;
  DateTime? fechaRecordatorio = DateTime.now();

  @override
  State<AnotacionesFormWidget> createState() => _AnotacionesFormWidgetState();
}

class _AnotacionesFormWidgetState extends State<AnotacionesFormWidget> {
  TextEditingController nombre = TextEditingController();
  TextEditingController text = TextEditingController();
  bool isRecordatorio = true;
  DateTime? fechaRecordatorio = DateTime.now();
  AnotacionModel? anotacionesModel;

  final GlobalKey<FormState> formStateRecord = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (widget.anotacionesModel != null) {
      anotacionesModel = widget.anotacionesModel;
      nombre = widget.nombre;
      text = widget.text;
      isRecordatorio = widget.isRecordatorio;
      fechaRecordatorio = widget.fechaRecordatorio;
    }
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(paddingContainer()),
      child: Form(
        key: formStateRecord,
        child: ListView(
          children: [
            Center(
              child: Text('${widget.option} Anotacion',
                  style: textStyleTitle()),
            ),
            TextFormFieldWidget(
              controller: nombre,
              enabled: widget.enabled,
              label: 'Titulo',
              maxLine: 1,
              validator: (value) => Validators()
                  .nombreValidator(value, 'Titulo debe ser mayor a 6 letras'),
            ),
            TextFormFieldWidget(
              controller: text,
              enabled: widget.enabled,
              maxLine: 5,
              label: 'Descripcion',
            ),
            Row(
              children: [
                const Text('¿Quieres Activar una Alarma?:'),
                Switch(
                  value: isRecordatorio,
                  onChanged: (value) => widget.enabled!
                      ? (setState(() {
                          isRecordatorio = !isRecordatorio;
                        }))
                      : null,
                ),
              ],
            ),
            const Divider(),
            if (isRecordatorio)
              Row(
                children: [
                  Text('Fecha de Alarma: $fechaRecordatorio'),
                  IconButton(
                      onPressed: widget.enabled!
                          ? () async {
                              var selectedDate =
                                  await showDatePickerWidget(context: context);
                              if (selectedDate != null) {
                                setState(
                                  () {
                                    fechaRecordatorio = selectedDate;
                                  },
                                );
                              }
                            }
                          : null,
                      icon: const Icon(Icons.date_range))
                ],
              )
            else
              const SizedBox(),
            const Divider(),
            ElevatedButtonWidget(
                onPressed: _onPressed(context), label: widget.option)
          ],
        ),
      ),
    );
  }

  VoidCallback _onPressed(BuildContext context) {
    switch (widget.option) {
      case 'Registrar':
        return () async {
          if (!(formStateRecord.currentState?.validate() ?? false)) {
            return;
          }
          //TODO: Registra un nuevo recordatorio
          showSnackBarWidget(
              context: context,
              message: (await AnotacionesController().registrarAnotacion(
                      nombre: nombre.text,
                      texto: text.text,
                      isRecordatorio: isRecordatorio,
                      fechaRecordatorio: fechaRecordatorio)) ??
                  'Registro Exitoso');
        };
      case 'Actualizar':
        return () async {
          if (!(formStateRecord.currentState?.validate() ?? false)) {
            return;
          }
          //TODO: actualizar un recordatorio : Falta actualizar los cambios al [recordatorioModel] local
          showSnackBarWidget(
              context: context,
              navigatorPop: true,
              message: (await AnotacionesController().actualizarAnotacion(
                      anotacionModel: anotacionesModel!)) ??
                  'Actualizacion Exitosa');
        };
      default:
        return () => Navigator.pop(context);
    }
  }
}
