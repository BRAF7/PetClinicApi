import 'package:flutter/material.dart';
import '../Proyecto Viejo/signin_signup.dart' as request;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

String dropdownValue = 'Dueño';
String getDropdownValue() {
  return dropdownValue;
}

class _Login extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      body: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(
                top: 70,
              ),
              child: Image.asset("assets/images/Logo.png")),
          Container(
            margin: const EdgeInsets.only(top: 50, left: 80),
            child: const Text(
              'Inicia sesión con tu cuenta para continuar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 30),
            child: const Text("Correo electrónico"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "email@example.com",
                focusedBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
              ), // decoration: ,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, left: 30),
            child: const Text("Contraseña"),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
            child: TextField(
              controller: password,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                hintText: "Contraseña",
                focusedBorder: outlineInputBorder,
                enabledBorder: outlineInputBorder,
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: _passwordVisible ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    _passwordVisible = !_passwordVisible;
                    setState(() {});
                  },
                ),
              ),
            ),
          ),
          SizedBox(
              width: 100,
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 40, right: 40),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 2,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 1,
                    color: Colors.blue,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Dueño', 'Empleado']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 60, right: 60),
            child: ElevatedButton(
              onPressed: () async {
                var token = await request.signIn(email.text, password.text);
                if (token != null) {
                  if (dropdownValue == "Empleado") {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    Navigator.pushReplacementNamed(context, '/home_mascotas');
                  }
                } else {
                  const snackBar = SnackBar(
                    content: Text('Usuario o contraseña incorrecta.'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                "Iniciar sesión",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
