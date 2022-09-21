// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:tm30_app/screen/home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController _firstName;
  late TextEditingController _lastName;
  late TextEditingController _address;
  late TextEditingController _email;
  late TextEditingController _password;
  late TextEditingController _confirmPassword;
  bool isProcessing = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool loading = false;
  final _focusFirstName = FocusNode();
  final _focusLastName = FocusNode();
  final _focusAddress = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  @override
  void initState() {
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _address = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    // storeName();
    super.initState();
  }

  // String name = "";
  // storeName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     prefs.setString('name', _firstName.text);
  //   });
  // }

  @override
  void dispose() {
    _firstName.dispose();
    _lastName.dispose();
    _address.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])");
  double passStrength = 0;

  bool validatePassword(String pass) {
    String password = pass.trim();
    if (password.isEmpty) {
      setState(() {
        passStrength = 0;
      });
    } else if (password.length < 6) {
      passStrength = 1 / 4;
    } else if (password.length < 8) {
      passStrength = 2 / 4;
    } else {
      if (passValid.hasMatch(password)) {
        passStrength = 4 / 4;
        return true;
      } else {
        passStrength = 3 / 4;
        return false;
      }
    }
    return false;
  }

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
              _focusFirstName.unfocus();
              _focusLastName.unfocus();
              _focusAddress.unfocus();
              _focusEmail.unfocus();
              _focusPassword.unfocus();
              _focusConfirmPassword.unfocus();
            },
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: width / 20,
                ),
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: width / 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Rubik',
                      ),
                    ),
                  ],
                )),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  padding:
                      EdgeInsets.only(top: width / 40, left: 20, right: 20),
                  child: Form(
                    key: _formkey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "First Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusFirstName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _firstName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty Field';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                                labelText: 'Write your First Name ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(199, 199, 199, 1)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Last Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusLastName,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _lastName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty Field';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                                labelText: 'Write your Last Name ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(199, 199, 199, 1)),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              obscureText: false,
                              focusNode: _focusAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _address,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Empty Field';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                                labelText: 'Write your  Address ',
                                hintStyle: TextStyle(color: Colors.white),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(199, 199, 199, 1)),
                              )),
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
                          const SizedBox(
                            height: 10,
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
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: _focusPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscurePassword,
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
                                  obscurePassword = !obscurePassword;
                                }),
                                child: Icon(
                                  obscurePassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: obscurePassword
                                      ? Colors.grey
                                      : Colors.pink,
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
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Confirm Password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            focusNode: _focusConfirmPassword,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: obscureConfirmPassword,
                            controller: _confirmPassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Empty field";
                              } else if (value != _password.text) {
                                return 'Password did not match';
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
                                  obscureConfirmPassword =
                                      !obscureConfirmPassword;
                                }),
                                child: Icon(
                                  obscureConfirmPassword
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: obscureConfirmPassword
                                      ? Colors.grey
                                      : Colors.pink,
                                ),
                              ),
                              labelText: 'Confirm Your Password',
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              hintStyle: const TextStyle(color: Colors.white),
                              labelStyle: const TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: width / 20,
                          ),
                          GestureDetector(
                            onTap: () async {
                              _focusFirstName.unfocus();
                              _focusLastName.unfocus();
                              _focusAddress.unfocus();
                              _focusEmail.unfocus();
                              _focusPassword.unfocus();
                              _focusConfirmPassword.unfocus();
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  isProcessing = true;
                                });
                                debugPrint("FirstName: ${_firstName.text}");
                                debugPrint("LastName: ${_lastName.text}");
                                debugPrint("Address: ${_address.text}");
                                debugPrint("Email: ${_email.text}");
                                debugPrint("Password: ${_password.text}");
                                debugPrint(
                                    "ConfirmPassword: ${_confirmPassword.text}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHomePage(
                                              name: _firstName.text,
                                              title: "",
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
                                "Sign Up",
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
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
