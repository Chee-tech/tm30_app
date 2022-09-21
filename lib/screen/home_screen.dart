import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.name});
  final String title;
  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //  storeName();
    super.initState();
  }

  // String name = "";
  // String email = "";
  // storeName() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = prefs.getString('name')!;
  //     email = prefs.getString('email')!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final key = GlobalKey<ScaffoldMessengerState>();

    return Container(
        height: height,
        width: width,
        color: const Color.fromRGBO(230, 207, 226, 1),
        child: Scaffold(
          key: key,
          backgroundColor: Colors.transparent,
          body: ListView(
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
                    "Home Page",
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
              SizedBox(
                height: width / 2,
              ),
              widget.name.isEmpty
                  ? Row(children: [
                      Expanded(
                        child: Text(
                          "Hello ${widget.title}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Rubik',
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/image/hello.png",
                      ),
                    ])
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Hello ${widget.name}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'Rubik',
                            color: Colors.black,
                          ),
                        ),
                        Image.asset(
                          "assets/image/hello.png",
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
              SizedBox(
                height: width / 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: const Text(
                          "Log Out",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black),
                        ),
                        content: const Text(
                          "Are you sure you want to logout?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Rubik',
                              color: Colors.black),
                        ),
                        actions: <Widget>[
                          CupertinoDialogAction(
                            child: const Text(
                              "cancel",
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(true),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("proceed"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(169, 119, 152, 1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Text(
                      "Log Out",
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
              ),
            ],
          ),
        ));
  }
}
