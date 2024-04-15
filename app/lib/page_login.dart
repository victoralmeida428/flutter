import 'package:app/step_form.dart';
import 'package:flutter/material.dart';

List backgroudColor = [
  Color.fromARGB(255, 243, 243, 243),
  Color.fromARGB(255, 255, 255, 255)
];

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cool Finance")),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [backgroudColor[0], backgroudColor[1]])),
        ),
        Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(url_1),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                          label: const Text('Login'),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400))),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          label: const Text('Senha'),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide:
                                  BorderSide(color: Colors.grey.shade400))),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                      ElevatedButton.icon(
                        onPressed: () => {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black54),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        label: const Text('Login'),
                        icon: const Icon(Icons.login_outlined),
                      ),
                      ElevatedButton.icon(
                        onPressed: () => {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black54),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        label: const Text('Cadastro'),
                        icon: const Icon(Icons.create),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
