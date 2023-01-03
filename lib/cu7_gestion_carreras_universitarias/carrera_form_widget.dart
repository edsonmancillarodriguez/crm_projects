import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_controller.dart';
import 'package:crm_projects/cu7_gestion_carreras_universitarias/carrera_model.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/global_services/validators.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:crm_projects/global_widgets/elevated_button_widget.dart';
import 'package:crm_projects/global_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CarreraFormWidget extends StatelessWidget {
  CarreraFormWidget({Key? key, this.carreraModel, required this.option})
      : super(key: key) {
    if (carreraModel != null) {
      switch (option) {
        case 'Registrar':
          break;
        case 'Actualizar':
          nombre.text = carreraModel!.nombre!;
          sigla.text = carreraModel!.sigla!;
          nModulos.text = carreraModel!.nModulos!.toString();
          modalidad.text = carreraModel!.modalidad!;
          break;
        case 'Ver':
          nombre.text = carreraModel!.nombre!;
          sigla.text = carreraModel!.sigla!;
          nModulos.text = carreraModel!.nModulos!.toString();
          modalidad.text = carreraModel!.modalidad!;
          enabled = false;
          break;
      }
    }
  }

  ///Option1: Registrar.
  ///
  ///Option2: Actualizar, [carreraModel] no puede ser null.
  ///
  ///Option3: Ver, [carreraModel] no puede ser null
  final String option;
  late bool? enabled = true;
  final CarreraModel? carreraModel;

  final GlobalKey<FormState> formStateRegisterStudent = GlobalKey<FormState>();

  final TextEditingController nombre = TextEditingController();
  final TextEditingController sigla = TextEditingController();
  final TextEditingController nModulos = TextEditingController();
  final TextEditingController modalidad = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.all(paddingContainer()),
      child: Form(
        key: formStateRegisterStudent,
        child: ListView(
          children: [
            Center(
              child: Text('$option Carrera', style: textStyleTitle()),
            ),
            TextFormFieldWidget(
              controller: nombre,
              enabled: enabled,
              label: 'Nombre Completo',
              maxLine: 1,
              validator: (value) => Validators()
                  .textValidator(value, 'Ingrese su nombre Completo'),
            ),
            TextFormFieldWidget(
              controller: sigla,
              enabled: enabled,
              label: 'Siglas',
              maxLine: 1,
              keyboardType: TextInputType.text,
              validator: (value) => Validators()
                  .textValidator(value, 'Ingrese un Codigo de Sigla'),
            ),
            TextFormFieldWidget(
                controller: nModulos,
                enabled: enabled,
                label: 'Numero de modulos',
                maxLine: 1,
                validator: (value) => Validators().numberValidator(value,
                    'Ingrese la cantidad de modulos que tendra la carrera')),
            TextFormFieldWidget(
              controller: modalidad,
              enabled: enabled,
              label: 'Modalidad Virtual o Presencial',
              maxLine: 1,
              validator: (value) => Validators()
                  .textValidator(value, 'Opciones: Virtual o Presencial'),
            ),
            ElevatedButtonWidget(onPressed: _onPressed(context), label: option),
          ],
        ),
      ),
    );
  }

  //option 1 = registrar, no se recibe nada y llama al metodo EstudianteController.Registrar
  //option 2 = actualizar, Recibe un objeto de tipo EstudianteModel, muestra los campos, permite editarlos y llama al metodo EstudianteController.Actualizar
  //option 3 = ver , recibe un objeto de tipo EstudianteModel, muestra los campos, y llama a Navigator.pop(context)

  VoidCallback _onPressed(BuildContext context) {
    switch (option) {
      case 'Registrar':
        return () async {
          if (!(formStateRegisterStudent.currentState?.validate() ?? false)) {
            return;
          }
          //si se registra correctamente, se muestra un snackbarMessage = Registro Exitoso y hace Navigator.pop: si no, se muestra un error
          //TODO: Registrar Nueva Carrera
          showSnackBarWidget(
            context: context,
            navigatorPop: true,
            message: (await CarreraController().registrarCarrera(
                  nombre: nombre.text,
                  sigla: sigla.text,
                  nModulos: int.parse(nModulos.text),
                  modalidad: modalidad.text,
                )) ??
                'Registro Exitoso',
          );
        };
      case 'Actualizar':
        return () async {
          if (!(formStateRegisterStudent.currentState?.validate() ?? false)) {
            return;
          }
          //TODO: Actualizar Estudiante : Falta actualizar los cambios al [estudianteModel] local
          showSnackBarWidget(
              context: context,
              navigatorPop: true,
              message: (await CarreraController().actualizarCarrera(
                      carreraModel:
                          carreraModel!)) ?? //si es null, guardó con exito : si no manda un <String>errorMessage
                  'Actualizacion Exitosa');
        };
      default:
        return () {
          // if (!(formStateRegisterStudent.currentState?.validate() ?? false)) {
          //   return;
          // }
          // showSnackBarWidget(
          //   context: context,
          //   message:
          //       'VIENDO UN ESTUDIANTE:\nNombre: ${nombre.text}\nCorreo: ${correo.text}\nTelefono: ${telefono.text}\n Carnet de Identidad: ${carnetIdentidad.text}\nTelefono de Referencia: ${telefonoReferencia.text}',
          // );
          Navigator.pop(context);
        };
    }
  }
}
