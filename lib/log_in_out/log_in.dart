import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/global_services/validators.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:crm_projects/global_widgets/elevated_button_widget.dart';
import 'package:crm_projects/global_widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final String routeName = 'Login';

  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> loginFormState = GlobalKey<FormState>();
  final TextEditingController correo = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 400,
          padding: EdgeInsets.all(paddingContainer()),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Form(
            key: loginFormState,
            child: ListView(
              children: [
                Center(
                    child: Text(
                  'Universidad Privada Cumbre',
                  style: textStyleTitle(),
                )),
                TextFormFieldWidget(
                  controller: correo,
                  label: 'Ingrese correo Electronico',
                  keyboardType: TextInputType.emailAddress,
                  maxLine: 1,
                  validator: (value) {
                    return Validators().emailValidator(value, 'No parece ser un correo valido');
                  },
                ),
                TextFormFieldWidget(
                  controller: password,
                  label: 'Ingrese Contraseña',
                  maxLine: 1,
                  validator: (value) => Validators().passwordValidator(value, 'la contraseña debe ser mayor o igual a 6 caracteres'),
                ),
                ElevatedButtonWidget(
                  label: '¡Entrar!',
                  onPressed: () async {
                    if (!(loginFormState.currentState?.validate() ?? false)) {
                      return;
                    }
                    try {
                      showSnackBarWidget(context: context, message: 'Correo: ${correo.text} \nContraseña${password.text}');
                      //TODO: Iniciar Sesion
                      Navigator.pushNamedAndRemoveUntil(context,
                          const EstudianteView().routeName, (route) => false);
                    } catch (e) {
                      throw Exception('log_in: $e');
                    }
                  },
                ),

                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                        'Olvido su contraseña?, contactese con el Administrador',
                        style: TextStyle(color: Colors.blue, fontSize: 12)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
