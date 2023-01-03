import 'package:crm_projects/cu1_gestionar_estudiantes_nuevos/estudiante_view.dart';
import 'package:crm_projects/cu6_gestion_roles_usuarios/usuario_model.dart';
import 'package:crm_projects/global_services/show_snack_bar_widget.dart';
import 'package:crm_projects/global_services/validators.dart';
import 'package:crm_projects/global_styles/const_styles.dart';
import 'package:crm_projects/global_widgets/elevated_button_widget.dart';
import 'package:crm_projects/global_widgets/text_form_field_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final String routeName = 'Login';

  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> loginFormState = GlobalKey<FormState>();
  final TextEditingController correo = TextEditingController();
  final TextEditingController password = TextEditingController();

  final firebaseAuthInstance = FirebaseAuth.instance;
  final usuario = UsuarioModel();

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
                    return Validators().emailValidator(
                        value, 'No parece ser un correo valido');
                  },
                ),
                TextFormFieldWidget(
                  controller: password,
                  label: 'Ingrese Contraseña',
                  maxLine: 1,
                  validator: (value) => Validators().passwordValidator(value,
                      'la contraseña debe ser mayor o igual a 6 caracteres'),
                ),
                ElevatedButtonWidget(
                  label: '¡Entrar!',
                  onPressed: () {
                    if (!(loginFormState.currentState?.validate() ?? false)) {
                      return;
                    }
                    iniciarSesion(correo: correo.text, password: password.text)
                        .then((value) {
                      if (value == null) {
                        print('////////////////////////////$value');
                        Navigator.pushNamedAndRemoveUntil(context,
                            const EstudianteView().routeName, (route) => false);
                      } else {
                        Navigator.pop(context);
                        showSnackBarWidget(context: context, message: value);
                      }
                    });
                    showDialog(context: context, builder: (context) {
                      return const Dialog(child: Center(child: CircularProgressIndicator(),), );
                    },);
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

  Future<String?> crearCuenta(
      {required String correo, required String password}) async {
    try {
      final credential =
          await firebaseAuthInstance.createUserWithEmailAndPassword(
        email: correo,
        password: password,
      );
      authStateChangesInit();
      idTokenChangesInit();
      userChangesInit();
      usuario.uid = credential.user!.uid;
      usuario.nombre = credential.user!.displayName;
      usuario.dni = credential.user!.email;
      usuario.telefono = credential.user!.phoneNumber;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'La contraseña es demasiado debil';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
      return e.toString();
    }
    return null;
  }

  Future<String?> iniciarSesion(
      {required String correo, required String password}) async {
    try {
      print(
          'Inicio el proceso de inicio de sesion...................................');
      final credential = await firebaseAuthInstance.signInWithEmailAndPassword(
          email: correo, password: password);
      authStateChangesInit();
      idTokenChangesInit();
      userChangesInit();
      usuario.uid = credential.user!.uid;
      usuario.nombre = credential.user!.displayName;
      usuario.dni = credential.user!.email;
      usuario.telefono = credential.user!.phoneNumber;
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return await crearCuenta(correo: correo, password: password);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return 'Contraseña incorrecta proporcionada para ese usuario.';
      }
    }
    return null;
  }

  void authStateChangesInit() {
    firebaseAuthInstance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void idTokenChangesInit() {
    firebaseAuthInstance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void userChangesInit() {
    firebaseAuthInstance.userChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }
}
