import 'package:flutter/material.dart';
import 'package:housy_2task/constants.dart';
import 'package:housy_2task/presentation/screens/movies.dart';
import 'package:housy_2task/presentation/widgets/login_button.dart';
import 'package:housy_2task/presentation/widgets/text_field.dart';
import 'package:housy_2task/utils/user_secure_storage.dart';

class Login extends StatefulWidget {
  Login({Key? key, required this.isLogin}) : super(key: key);
  final bool isLogin;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _userNamController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  String dropDownValue = 'Student';

  @override
  void dispose() {
    _userNamController.dispose();
    _passwordController.dispose();
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 15.0),
                child: widget.isLogin
                    ? Text(
                        'Sign in',
                        style: kHeadingStyle,
                      )
                    : Text(
                        'Sign Up',
                        style: kHeadingStyle,
                      ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              textField(context, _userNamController, 'Username:',
                  TextInputType.text, false),
              SizedBox(
                height: widget.isLogin ? 20.0 : 10.0,
              ),
              textField(context, _passwordController, 'Password:',
                  TextInputType.visiblePassword, true),
              SizedBox(
                height: widget.isLogin ? 20.0 : 10.0,
              ),
              widget.isLogin
                  ? const SizedBox.shrink()
                  : textField(context, _mobileController, 'Mobile:',
                      TextInputType.number, false),
              const SizedBox(
                height: 10.0,
              ),
              widget.isLogin
                  ? const SizedBox.shrink()
                  : DropdownButton(
                      items: <String>[
                        'Student',
                        'Developer',
                        'Doctor',
                        'Manager'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      value: dropDownValue,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropDownValue = newvalue!;
                        });
                      }),
              LoginButton(
                label: widget.isLogin ? 'Sign in' : 'Sign Up',
                onPressed: widget.isLogin
                    ? () async {
                        final _pass = await UserSecureStorage.login(
                            _userNamController.text);

                        if (_pass == null) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('user not found'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('okay'))
                                  ],
                                );
                              });
                        } else {
                          if (_pass != _passwordController.text) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text('Wrong Password'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text('okay'))
                                    ],
                                  );
                                });
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Movies();
                            }));
                          }
                        }
                      }
                    : () async {
                        if (_userNamController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          UserSecureStorage.userSignUp(_userNamController.text,
                                  _passwordController.text)
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Login(isLogin: true);
                            }));
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'Email or pass can\'t be empty'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('okay'))
                                  ],
                                );
                              });
                        }
                      },
                color: Colors.lightBlueAccent,
              ),
              const SizedBox(
                height: 30.0,
              ),
              const SizedBox(
                height: 7.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
