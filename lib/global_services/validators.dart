class Validators{

  String? nombreValidator(String? value, String? message){
    return (value != null && value.isNotEmpty && value.length > 6)
        ? null
        : 'Ingrese su nombre Completo';
  }

  String? emailValidator(String? value, String? message){
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value ?? '')
        ? null
        : message;
  }

  String? telefonoValidator(String? value, String? message){
    return (value != null && value.isNotEmpty && value.length > 7 && !value.contains(RegExp(r'[A-Z,a-z]')))
        ? null
        : 'Ingrese un telefono valido';
  }

  String? carnetIdentidadValidator(String? value, String? message){
    return (value != null && value.isNotEmpty && value.length > 5 && !value.contains(RegExp(r'[A-Z,a-z]')))
        ? null
        : 'Ingrese un telefono valido';
  }

  String? passwordValidator(String? value, String? message){
    return (value != null && value.length > 5)
        ? null
        : message;
  }

  String? textValidator(String? value, String? message){
    if (value!.isEmpty) {
      return 'Por favor ingrese un valor';
    }
    return null;
  }

  String? numberValidator(String? value, String? message){
    if (value!.isEmpty) {
      return 'Por favor ingrese un número';
    }
    final number = int.tryParse(value);
    if (number == null) {
      return 'Por favor ingrese un número válido';
    }
    return null;
  }
}