import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_model.dart';
import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_controller.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/global_services/validators.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:crm_projects/global_widgets/elevated_button_widget.dart';
import 'package:crm_projects/global_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EstudianteFormWidget extends StatelessWidget {
  EstudianteFormWidget({Key? key, this.estudianteModel, required this.option})
      : super(key: key) {
    if (estudianteModel != null) {
      switch (option) {
        case 'Registrar':
          break;
        case 'Actualizar':
          nombre.text = estudianteModel!.nombre!;
          correo.text = estudianteModel!.correo!;
          telefono.text = estudianteModel!.telefono!;
          carnetIdentidad.text = estudianteModel!.dni!;
          telefonoReferencia.text = estudianteModel!.refTelefono!;
          break;
        case 'Ver':
          nombre.text = estudianteModel!.nombre!;
          correo.text = estudianteModel!.correo!;
          telefono.text = estudianteModel!.telefono!;
          carnetIdentidad.text = estudianteModel!.dni!;
          telefonoReferencia.text = estudianteModel!.refTelefono!;
          enabled = false;
          break;
      }
    }
  }

  ///Option1: Registrar.
  ///
  ///Option2: Actualizar, [estudianteModel] no puede ser null.
  ///
  ///Option3: Ver, [estudianteModel] no puede ser null
  final String option;
  late bool? enabled = true;
  final EstudianteModel? estudianteModel;

  final GlobalKey<FormState> formStateRegisterStudent = GlobalKey<FormState>();

  final TextEditingController nombre = TextEditingController();
  final TextEditingController correo = TextEditingController();
  final TextEditingController telefono = TextEditingController();
  final TextEditingController carnetIdentidad = TextEditingController();
  final TextEditingController telefonoReferencia = TextEditingController();

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
              child: Text('$option Estudiante', style: textStyleTitle()),
            ),
            TextFormFieldWidget(
              controller: nombre,
              enabled: enabled,
              label: 'Nombre Completo',
              maxLine: 1,
              validator: (value) => Validators()
                  .nombreValidator(value, 'Ingrese su nombre Completo'),
            ),
            TextFormFieldWidget(
              controller: correo,
              enabled: enabled,
              label: 'Correo',
              maxLine: 1,
              keyboardType: TextInputType.emailAddress,
              validator: (value) => Validators()
                  .emailValidator(value, 'Ingrese un correo valido'),
            ),
            TextFormFieldWidget(
                controller: telefono,
                enabled: enabled,
                label: 'Telefono',
                maxLine: 1,
                validator: (value) => Validators()
                    .telefonoValidator(value, 'Ingrese un telefono valido')),
            TextFormFieldWidget(
              controller: carnetIdentidad,
              enabled: enabled,
              label: 'Carnet de identidad',
              maxLine: 1,
              validator: (value) => Validators()
                  .carnetIdentidadValidator(value, 'Ingrese un CI valido'),
            ),
            TextFormFieldWidget(
                controller: telefonoReferencia,
                enabled: enabled,
                label: 'Telefono de Referencia',
                maxLine: 1,
                validator: (value) => Validators()
                    .telefonoValidator(value, 'Ingrese un telefono valido')),
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
          //TODO: Registrar Nuevo estudiante
          showSnackBarWidget(
            context: context,
            navigatorPop: true,
            message: (await EstudianteController().registrarEstudiante(
                  nombre: nombre.text,
                  correo: correo.text,
                  telefono: telefono.text,
                  carnetIdentidad: carnetIdentidad.text,
                  telefonoReferencia: telefonoReferencia.text,
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
          estudianteModel!.nombre = nombre.text;
          estudianteModel!.dni = carnetIdentidad.text;
          estudianteModel!.telefono = telefono.text;
          estudianteModel!.correo = correo.text;
          estudianteModel!.refTelefono = telefonoReferencia.text;
          showSnackBarWidget(
            context: context,
            navigatorPop: true,
            message: (await EstudianteController().actualizarEstudiante(estudianteModel: estudianteModel!)) ?? //si es null, guardó con exito : si no manda un <String>errorMessage
                'Actualizacion Exitosa'
          );
        };
      default:
        return () {
          Navigator.pop(context);
        };
    }
  }
}
