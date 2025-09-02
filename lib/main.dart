import 'package:flutter/material.dart';
import 'package:weather_app/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      theme: ThemeData(colorSchemeSeed: Colors.brown[50]),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isPasswordVisible = true;
  bool _isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _email;
  late final TextEditingController _password;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
        ).then((_) {
          _email.clear();
          _password.clear();
        });
      });
    }
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 120,
                  backgroundImage: NetworkImage(
                    "https://cdn.pixabay.com/animation/2025/06/03/13/03/"
                    "13-03-18-587_512.gif",
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Weather App",
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    wordSpacing: 10,
                    letterSpacing: 2,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 350,
                    height: 400,
                    decoration: BoxDecoration(
                      // color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(color: Colors.lime.shade200, blurRadius: 20),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 40,
                        left: 40,
                        top: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 30,
                          children: [
                            Icon(
                              Icons.person_3,
                              color: Colors.deepPurple,
                              size: 70,
                            ),
                            TextFormField(
                              controller: _email,
                              decoration: InputDecoration(
                                labelText: "Email",
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.deepPurple,
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.auto,
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                ),

                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter Email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter valid Email';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: _password,
                              obscureText: _isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible ? Icons
                                      .visibility_off : Icons.visibility),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.deepPurple,
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.auto,
                                labelStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.deepPurple,
                                ),

                                // suffixIcon:Icon(Icon,color:Colors.deepPurple)
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                }
                                if (value.length < 6) {
                                  return 'Password should be at least 6 '
                                      'Characters';
                                }
                                return null;
                              },
                            ),
                            // SizedBox(height: 5,),
                            _isLoading
                                ? SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(),
                            )
                                : ElevatedButton(
                              onPressed: _isLoading ? null : _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurple[400],
                                elevation: 7,
                                shadowColor: Colors.deepPurple,
                              ),
                              child: Text(
                                      "Login",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
