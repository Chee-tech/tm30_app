// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:tm30_app/screen/sign_up_screen.dart';

import 'home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _email;
  late TextEditingController _password;
  bool isProcessing = false;
  bool obscureText = true;
  bool loading = false;
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    // storeName();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  // storeName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setString('email', _email.text);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final key = GlobalKey<ScaffoldMessengerState>();
    Pattern pattern = '@';
    RegExp regex = RegExp(pattern.toString());
    return Container(
        height: height,
        width: width,
        color: const Color.fromRGBO(230, 207, 226, 1),
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            onTap: () {
              _focusEmail.unfocus();
              _focusPassword.unfocus();
            },
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: width / 10,
                ),
                Center(
                    child: Text(
                  "Log In",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width / 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'Rubik',
                  ),
                )),
                SizedBox(
                  height: width / 14,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding:
                      EdgeInsets.only(top: width / 11, left: 20, right: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Email Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusEmail,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty Field';
                                } else if (!regex.hasMatch(value)) {
                                  return 'Enter valid email';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: true,
                              enableSuggestions: true,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: const InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                contentPadding: EdgeInsets.only(
                                    top: 0, left: 10, right: 10),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: 'example@gmail.com',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(199, 199, 199, 1)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          TextFormField(
                            focusNode: _focusPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscureText,
                            controller: _password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty field";
                              } else {
                                return null;
                              }
                            },
                            style: const TextStyle(
                              // textStyle: textTheme.bodyText1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                            ),
                            decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(
                                  top: 0, left: 10, right: 10),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                borderSide: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () => setState(() {
                                  obscureText = !obscureText;
                                }),
                                child: Icon(
                                  obscureText
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color:
                                      obscureText ? Colors.grey : Colors.pink,
                                ),
                              ),
                              labelText: 'Password',
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(
                                  color: Color.fromRGBO(199, 199, 199, 1)),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                'Forgotten Password ?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width / 12,
                          ),
                          GestureDetector(
                            onTap: () async {
                              _focusEmail.unfocus();
                              _focusPassword.unfocus();
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  isProcessing = true;
                                });
                                debugPrint("Email: ${_email.text}");
                                debugPrint("Password: ${_password.text}");

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                              title: _email.text,
                                              name: "",
                                            )));
                              }
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(169, 119, 152, 1),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: const Text(
                                "Log in",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Rubik',
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: width / 6.5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Or continue with",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset("assets/image/google.png")),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset("assets/image/facebook.png")),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                      "assets/image/instagram.png")),
                            ],
                          ),
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontFamily: 'Rubik',
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Rubik',
                                      color: Color.fromRGBO(169, 119, 152, 1)),
                                ),
                              )
                            ],
                          )),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
